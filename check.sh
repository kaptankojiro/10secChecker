while true ; do

clear   

uptime -p
echo ""

ips=($(hostname -I))
for ip in "${ips[@]}"
do

    echo "IP Address:" $ip
done

echo ""

nmcli device status

echo ""
echo "Cpu Status":
ps -axro pcpu | awk '{sum+=$1} END {print sum}'

echo  ""
echo "RAM Status"
free | awk '/Mem/{printf("used: %.2f%"), $3/$2*100} /buffers\/cache/{printf(", buffers: %.2f%"), $4/($3+$4)*100} /Swap/{printf(", swap: %.2f%"), $3/$2*100}'

sleep 10

done
