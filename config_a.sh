#!/bin/bash
# run in root mode
# configuration script at sender a
# command line parameters: 1. protocol 2. ecn(1/0)
# protocol selection
DATE=$(date "+%m%d%k%M%S")
echo "DATE @ a IS ${DATE}"
sysctl -w net.ipv4.tcp_congestion_control=$1
echo "=====PROTOCOL CONFIGURED TO $1====="
sysctl -w net.ipv4.tcp_ecn=$2
echo "=====ECN CONFIGURED TO $2====="
killall tcpdump
killall iperf3
# dump the sent pkts and received ACKs for RTT evaluation
if [ $1 = rtcp ]
then
echo "=====START NIC MONITORING!====="
sudo ./a.out &
fi
echo "=====START DUMPING!====="
tcpdump -i eth0 -w /home/a/"$1-$DATE-sent-packets-a.pcap"
echo "=====DUMPING DONE!====="
