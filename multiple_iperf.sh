# test script @ receiver x, tx b comm with rx x
# run in root mode
# command line parameters: 1. protocol 2. ecn(1/0)
# kill last connection
killall iperf3
#2 large flows
iperf3 -s -p 4000 &
iperf3 -s -p 4001 &
#3 short flows
iperf3 -s -p 6000 &
iperf3 -s -p 6001 &
iperf3 -s -p 6002 &
#5 queries
iperf3 -s -p 8000 &
iperf3 -s -p 8001 &
iperf3 -s -p 8002 &
iperf3 -s -p 8003 &
iperf3 -s -p 8004 &
