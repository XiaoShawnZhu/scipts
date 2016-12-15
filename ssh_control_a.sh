#!/bin/bash
#test script at local x for sender a
#generate traffic remotely

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
