#!/bin/bash
#Last Edition 12/28/2015 Xiao Zhu
# parameter initialization
#@host a
DATE=$(date + "%F-%R:%S")
sudo -S sysctl -w net.ipv4.tcp_congestion_control=reno
# turn off ECN on both sides
echo "======configure ECN on both sides"
sudo -S sysctl -w net.ipv4.tcp_ecn=2
# turn off your modification on both sides in the beginning

# dump the received packets for throughput evaluation
sudo tcpdump -i eth0 -w /home/a/"dctcp-dump_sent_packets_a.pcap" &
echo "======start iperf client and tcpdump at local machine"
iperf3 -c 192.168.1.1 -p 4000 -n 100M -b 500M &
iperf3 -c 192.168.1.1 -p 4001 -n 100M -b 500M &
iperf3 -c 192.168.1.1 -p 6000 -n 10M -b 300M &
iperf3 -c 192.168.1.1 -p 6001 -n 10M -b 300M &
iperf3 -c 192.168.1.1 -p 6002 -n 10M -b 300M &
iperf3 -c 192.168.1.1 -p 8000 -n 1M -b 100M &
sleep 0.2
iperf3 -c 192.168.1.1 -p 8001 -n 1M -b 100M &
sleep 0.2
iperf3 -c 192.168.1.1 -p 8002 -n 1M -b 100M &
sleep 0.2
iperf3 -c 192.168.1.1 -p 8003 -n 1M -b 100M &
sleep 0.2
iperf3 -c 192.168.1.1 -p 8004 -n 1M -b 100M &
# turn on your modification half way
