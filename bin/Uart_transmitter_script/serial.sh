code="firmware.hex"
while read -r ins; do
    hex=($(sed 's/../\\x& /g' <<< $ins))
    echo -en "${hex[7]}${hex[6]}${hex[5]}${hex[4]}${hex[3]}${hex[2]}${hex[1]}${hex[0]}" > /dev/ttyUSB1
done < "$code"
