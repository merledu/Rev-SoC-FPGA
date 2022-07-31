module fp_decoder 
  import fpnew_pkg::*;
  import fp_pkg::*;
  #(
    parameter fp_pkg::rvfloat_e RVF   = fp_pkg::RV64FDouble
  )
  (
    input  logic                 clk_i,
    input  logic                 rst_ni,
    output logic                 illegal_insn_o,
    input  logic [31:0]          instr_rdata_i,
    input  logic                  core_valid,
    output fpnew_pkg::roundmode_e fp_rounding_mode_o,  
    output logic [4:0]            fp_rf_raddr_a_o,
    output logic [4:0]            fp_rf_raddr_b_o,
    output logic [4:0]            fp_rf_raddr_c_o,
    output logic [4:0]            fp_rf_waddr_o,
    output fpnew_pkg::operation_e fp_alu_operator_o,
    output logic                  fp_alu_op_mod_o,
    output fpnew_pkg::fp_format_e fp_src_fmt_o,
    output fpnew_pkg::fp_format_e fp_dst_fmt_o,
    output logic                  fp_load_o,
    output logic                  fp_move_en,
    output logic                  fp_regwrite_o,
    output logic                  fpu_valid,
    output logic                  fp_store_en,
    output logic                  regread_en,
    output logic                  cvt_en,
    output logic                  int_reg_write
);
  
  logic        fp_invalid_rm;
  logic        fp_rm_dynamic_o;
  logic        illegal_insn;
  logic [6:0]   opcode_fpu;
  logic [31:0] instr;
  logic [4:0] instr_rs1;
  logic [4:0] instr_rs2;
  logic [4:0] instr_rs3;
  logic [4:0] instr_rd;
  logic [6:0]     opcode;

  always_comb begin
    if(core_valid == 1'b1) begin
      instr     = instr_rdata_i;
      // source registers
      instr_rs1 = instr[19:15];
      instr_rs2 = instr[24:20];
      instr_rs3 = instr[31:27];
      //destination register
      instr_rd   = instr[11:7];
    end
  end
  // fp source registers
  assign fp_rf_raddr_a_o = instr_rs1;
  assign fp_rf_raddr_b_o = instr_rs2;
  assign fp_rf_raddr_c_o = instr_rs3;
  // fp destination register
  assign fp_rf_waddr_o   = instr_rd;
  assign fp_rounding_mode_o = roundmode_e'(instr[14:12]);
  assign fp_invalid_rm      = (instr[14:12] == 3'b101) ? 1'b1 :
                              (instr[14:12] == 3'b110) ? 1'b1 : 1'b0;
  assign fp_rm_dynamic_o    = (instr[14:12] == 3'b111) ? 1'b1 : 1'b0;
  always_comb begin
    fp_load_o             = 1'b0;
    fp_src_fmt_o          = FP32; 
    fp_dst_fmt_o          = FP32;
    opcode                = opcode_e'(instr[6:0]);
    fp_regwrite_o         = 0;
    fp_move_en            = 1'b0;
    fp_store_en           = 1'b0;
    regread_en            = 1'b0;
    fp_alu_op_mod_o       = 1'b0;
    fp_alu_operator_o     = FMADD;
    fpu_valid             = 1'b0;
    cvt_en                = 1'b0;  
    int_reg_write         = 1'b0;

    unique case (opcode)
      OPCODE_STORE_FP: begin
        unique case(instr[14:12])
          3'b010: begin // FSW
            illegal_insn = (RVF == RV32FNone) ? 1'b1 : 1'b0;
            fp_src_fmt_o = FP32;  
            fp_store_en  = 1'b1;
            regread_en = 1'b1;
            fpu_valid  = 1'b1;
          end
          default: illegal_insn = 1'b1;
        endcase
      end
      OPCODE_LOAD_FP: begin
        unique case(instr[14:12])
          3'b010: begin // FLW
            illegal_insn = (RVF == RV32FNone) ? 1'b1 : 1'b0;
            fp_src_fmt_o = FP32; 
            fp_load_o = 1'b1;
            fp_regwrite_o = 1'b1;
            fpu_valid  = 1'b1;
          end
          default: illegal_insn = 1'b1;
        endcase
      end
      OPCODE_MADD_FP:  begin // FMADD.S
        fp_regwrite_o = 1'b1;
        unique case (instr[26:25])
          00: begin
            illegal_insn = ((RVF == RV32FNone) & (~fp_invalid_rm)) ? 1'b1 : 1'b0;
            fp_src_fmt_o = FP32;
            fp_alu_operator_o     = FMADD;
            fp_alu_op_mod_o       = 1'b0;
            fpu_valid             = 1'b1;
          end
          default: illegal_insn = 1'b1;
        endcase
      end
      OPCODE_MSUB_FP: begin // FMSUB.S
        fp_regwrite_o = 1'b1;
        unique case (instr[26:25])
          00: begin
            illegal_insn = ((RVF == RV32FNone) & (~fp_invalid_rm)) ? 1'b1 : 1'b0;
            fp_src_fmt_o = FP32;
            fp_alu_operator_o     = FMADD;
            fp_alu_op_mod_o       = 1'b1;
            fpu_valid             = 1'b1;
          end
          default: illegal_insn = 1'b1;
        endcase
      end
      OPCODE_NMSUB_FP: begin // FNMSUB.S
        fp_regwrite_o = 1'b1;
        unique case (instr[26:25])
          00: begin
            illegal_insn = ((RVF == RV32FNone) & (~fp_invalid_rm)) ? 1'b1 : 1'b0;
            fp_src_fmt_o = FP32;
            fp_alu_operator_o     = FNMSUB;
            fpu_valid             = 1'b1;
          end
          default: illegal_insn = 1'b1;
        endcase
      end
      OPCODE_NMADD_FP: begin //FNMADD.S
        fp_regwrite_o = 1'b1;
        unique case (instr[26:25])
          00: begin
            illegal_insn = ((RVF == RV32FNone) & (~fp_invalid_rm)) ? 1'b1 : 1'b0;
            fp_src_fmt_o = FP32;
            fp_alu_operator_o     = FNMSUB;
            fp_alu_op_mod_o       = 1'b1;
            fpu_valid             = 1'b1;
          end
          default: illegal_insn = 1'b1;
        endcase
      end
      OPCODE_OP_FP: begin
        fp_src_fmt_o       = FP32;
        illegal_insn = ((RVF == RV32FNone) & (~fp_invalid_rm)) ? 1'b1 : 1'b0;
        unique case (instr[31:25]) 
          7'b0000000: begin // FADD.S
            fp_alu_operator_o     = ADD;
            fpu_valid             = 1'b1;
            fp_regwrite_o         = 1'b1;
          end
          7'b0000100: begin // FSUB.S
            fp_alu_operator_o     = ADD;
            fp_alu_op_mod_o       = 1'b1;
            fpu_valid             = 1'b1;
            fp_regwrite_o = 1'b1;
          end
          7'b0001000: begin // FMUL.S
            fp_alu_operator_o     = MUL;
            fp_regwrite_o         = 1'b1;
            fpu_valid             = 1'b1;
          end
          7'b0001100: begin // FDIV.S
            fp_alu_operator_o     = DIV;
            fpu_valid             = 1'b1;
            fp_regwrite_o         = 1'b1;
          end
          7'b0101100: begin // FSQRT.S
            if (~|instr[24:20]) begin
              fp_alu_operator_o     = SQRT;
              fpu_valid             = 1'b1;
              fp_regwrite_o         = 1'b1;
            end
          end
          7'b0010000: begin // FSGNJ.S, FSGNJN.S, FSGNJX.S
            if (~(instr[14] | (&instr[13:12]))) begin
              fp_alu_operator_o     = SGNJ;
              fpu_valid             = 1'b1;
              fp_regwrite_o         = 1'b1;
            end
          end
          7'b0010100: begin // FMIN.S, FMAX.S
            if (~|instr[14:13]) begin
              fp_alu_operator_o     = MINMAX;
              fpu_valid             = 1'b1;
              fp_regwrite_o         = 1'b1;
            end
          end
          7'b1100000: begin // FCVT.W.S, FCVT.WU.S
            fp_alu_operator_o     = F2I;
            int_reg_write         = 1'b1;
            if (~|instr[24:21]) begin
              fpu_valid             = 1'b1;

              if (instr[20])
                fp_alu_op_mod_o       = 1'b1;
                fpu_valid             = 1'b1;
            end
          end
          7'b1110000: begin // FMV.X.W , FCLASS.S
            unique case ({instr[24:20],instr[14:12]})
              {5'b00000,3'b000}: begin
                fpu_valid             = 1'b1;
              end
              {5'b00000,3'b001}: begin
                fp_alu_operator_o     = CLASSIFY;
                fpu_valid             = 1'b1;
                int_reg_write         = 1'b1;
              end
              default: begin
                illegal_insn =1'b1;
              end
            endcase
          end
          7'b1010000: begin // FEQ.S, FLT.S, FLE.S
            fp_alu_operator_o     = CMP;
            if (~(instr[14]) | (&instr[13:12])) begin
              fpu_valid             = 1'b1;
              int_reg_write         = 1'b1;
            end
          end
          7'b1101000: begin // FCVT.S.W, FCVT.S.WU
            cvt_en = 1'b1;  
            fp_regwrite_o = 1'b1;
            if (~|instr[24:21]) begin
              fp_alu_operator_o     = I2F;
              fpu_valid    = 1'b1;    
                if (instr[20])
                  fp_alu_op_mod_o     = 1'b1;
                  fpu_valid    = 1'b1;  
            end
          end
          7'b1111000: begin // FMV.S.X
            fp_alu_operator_o     = ADD;
            if (~(|instr[24:20]) | (|instr[14:12])) begin
              fp_move_en    = 1'b1;
              fpu_valid   = 1'b1;
            end
          end
          default: illegal_insn = 1'b1;
        endcase
      end
    default: begin
      illegal_insn = 1'b1;
    end
    endcase
  end
  assign illegal_insn_o = illegal_insn ;
  endmodule 