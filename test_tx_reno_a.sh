#!/bin/bash
#Last Edition 12/28/2015 Xiao Zhu
# parameter initialization
#@host a
DATE=$(date + "%F-%R:%S")

sudo -S sysctl -w net.ipv4.tcp_congestion_control=reno
# turn off ECN on both sides
echo "======configure ECN on both sides"
sudo -S sysctl -w net.ipv4.tcp_ecn=0
# turn off your modification on both sides in the beginning

# dump the received packets for throughput evaluation
sudo tcpdump -i eth0 -w /home/a/"1-dump_sent_packets_a.pcap" &
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
# turn on your modification half way
