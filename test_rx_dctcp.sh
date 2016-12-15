#command line parameter: 1. protocol 2. ecn(1/0)
#kill last connection
kill $(pidof tcpdump)
kill $(pidof iperf3)
#file name sort 
DATE=$(date "+%m%d%k%M%S")
echo ${DATE}
#protocol selection
sudo -S sysctl -w net.ipv4.tcp_congestion_control=$1
#ECN on/off
echo "======configure ECN on both sides"
sudo -S sysctl -w net.ipv4.tcp_ecn=$2
# turn off your modification on both sides in the beginning
# dump the received packets for throughput evaluation
sudo tcpdump -i eth0 -w /home/xiao/"dctcp-dump_received_packets.pcap" &
echo "======start iperf client and tcpdump at local machine"
iperf3 -s -p 4000 &
iperf3 -s -p 4001 &
iperf3 -s -p 6000 &
iperf3 -s -p 6001 &
iperf3 -s -p 6002 &
iperf3 -s -p 8000 &
iperf3 -s -p 8001 &
iperf3 -s -p 8002 &
iperf3 -s -p 8003 &
iperf3 -s -p 8004 &
iperf3 -s -p 4500 &
iperf3 -s -p 4501 &
iperf3 -s -p 6500 &
iperf3 -s -p 6501 &
iperf3 -s -p 6502 &
iperf3 -s -p 8500 &
iperf3 -s -p 8501 &
iperf3 -s -p 8502 &
iperf3 -s -p 8503 &
iperf3 -s -p 8504 &
