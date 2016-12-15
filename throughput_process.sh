#process throughput for each flow from dumped data
#run in root mode
#cmd line parameters: 1. protocol 2. date
#open a new file to save throughput data
touch $1_$2_throughput_A.txt
touch $1_$2_throughput_B.txt
touch $1_$2_throughput_C.txt

tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4000' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4001' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4002' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4003' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4006' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4007' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4008' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==4009' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_A.txt

tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6000' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6001' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6002' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6003' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6004' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6005' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6009' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6010' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6011' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6012' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6013' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==6014' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_B.txt

tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8000' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8001' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8002' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8003' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8004' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8005' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8006' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8007' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8008' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8009' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8015' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8016' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8017' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8018' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8019' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8020' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8021' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8022' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8023' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
tshark -r $1-$2-received-packets-x.pcap -Y 'tcp.dstport==8024' -T fields -e frame.time_relative | tail -1 >> $1_$2_throughput_C.txt
