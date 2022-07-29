`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2022 00:11:27
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
  parameter c_BIT_PERIOD      = 8400;
logic rst;
logic clk_led;
logic rst_led;
logic pin1,pin0,uart_rx_i,tx_o;
logic clk_in1=0;
logic programmed,inst_fetch_led;
logic [127:0] cycleCnt=0;
logic TIMER_irq_o;
  reg [63:0] INSTR[99:0];
integer instr_count = 0;
    
    initial begin
      $readmemh("firmware.hex",INSTR);
    end
    
//initial begin
//$readmemh("program.mif",fpga_top.imem.memory);
//$readmemh("program.mif",fpga_top.lmem.memory);
// uart_rx_i = 1'b1;
// #1000;
 
 // Byte 1
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
 
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
 
 
// // 2
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end

// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end


//// 3
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
 
 
// // 4
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
 
 
// // 5
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
 
// // 6
 
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
 
 
// // 7
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
 
 
 
// // 8
//  repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b0;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
// repeat(21) @(posedge clk_in1) begin
//  uart_rx_i = 1'b1;
// end
 
 

 
//    repeat(27) @(posedge clk_in1) begin
//    uart_rx_i = 1'b0;
//    end
//     repeat(27) @(posedge clk_in1) begin
//     uart_rx_i = 1'b0;
//     end
//      repeat(27) @(posedge clk_in1) begin
//      uart_rx_i = 1'b0;
//      end
//       repeat(27) @(posedge clk_in1) begin
//       uart_rx_i = 1'b0;
//       end repeat(27) @(posedge clk_in1) begin
//        uart_rx_i = 1'b0;
//        end
//         repeat(27) @(posedge clk_in1) begin
//         uart_rx_i = 1'b1;
//         end
//          repeat(27) @(posedge clk_in1) begin
//          uart_rx_i = 1'b1;
//          end
        
       
//// start bit byte2
////uart_rx_i = 1'b1;
////#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//// start bit byte3
////uart_rx_i = 1'b1;
////#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;

//// start bit byte4
////uart_rx_i = 1'b1;
////#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;

//// start bit byte5
////uart_rx_i = 1'b1;
////#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//// start bit byte6
////uart_rx_i = 1'b1;
////#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//// start  bit byte7
////uart_rx_i = 1'b1;
////#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;

//// start bit byte8
////uart_rx_i = 1'b1;
////#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b0;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//uart_rx_i = 1'b1;
//#10800;
//// stop bit byte8
//uart_rx_i = 1'b1;
//#10800;


//end
 // Takes in input byte and serializes it 
  task UART_WRITE_BYTE;
    input [7:0] i_Data;
    integer     ii;
    begin
      

      // Send Start Bit
      uart_rx_i <= 1'b0;
      #(c_BIT_PERIOD);
      #1000;
      
      // Send Data Byte
      for (ii=0; ii<8; ii=ii+1)
        begin
          uart_rx_i <= i_Data[ii];
          #(c_BIT_PERIOD);
        end
      
      // Send Stop Bit
      uart_rx_i <= 1'b1;
      #(c_BIT_PERIOD);
     end
  endtask // UART_WRITE_BYT

initial
    begin

      // Send a command to the UART (exercise Rx)
    while(instr_count<99 && INSTR[instr_count]!=64'h0000000000000FFF)begin
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][7:0]);
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][15:8]);
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][23:16]);
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][31:24]);
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][39:32]);
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][47:40]);
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][55:48]);
        @(posedge clk_in1);
        UART_WRITE_BYTE(INSTR[instr_count][63:56]);      
        @(posedge clk_in1);
        instr_count = instr_count + 1'b1;

    end      
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'hff);
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'h0f);
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'h00);
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'h00);
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'h00);
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'h00);
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'h00);
      @(posedge clk_in1);
      UART_WRITE_BYTE(8'h00);
      @(posedge clk_in1);
      
      // Check that the correct command was received

      $display("Executed");
            repeat (6) begin
			 repeat (1000) @(posedge clk_in1);
			 $display("+1000 cycles");
		end

    $finish();
    end


initial begin 
rst = 1'b0;
#500 rst = 1'b1;
#500 rst = 1'b0;
end

initial begin
forever #200 clk_in1 = ~clk_in1;

end



Rev_top fpga_top(.*);

endmodule
