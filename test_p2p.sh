# test script @ receiver x, tx a comm with rx x
# run in root mode
# command line parameters: 1. protocol 2. ecn(1/0)
# kill last connection
killall tcpdump
killall iperf3
# filename sort
DATE=$(date "+%m%d%k%M%S")
echo "=====DATE @ x IS $DATE====="
# protocol selection on local side
sysctl -w net.ipv4.tcp_congestion_control=$1
echo "=====PROTOCOL CONFIGURED TO $1====="
# ECN on/off
sysctl -w net.ipv4.tcp_ecn=$2
echo "=====ECN CONFIGURED TO $2====="
# dump the received packets for throughput evaluation
echo "=====START DUMPING!====="
tcpdump -i eth0 -w /home/xiao/RTCP_related5.5/data_process_scripts/"$1-$DATE-received-packets-x.pcap" &
# 2 large flows
for((port=4000; port<4002; port++));
do
iperf3 -s -p $port &
done
echo "=====START LISTENING @ PORT 4000+====="
# 3 short flows
for((port=6000; port<6003; port++));
do
iperf3 -s -p $port &
done
echo "=====START LISTENING @ PORT 6000+====="
# 5 queries
for((port=8000; port<8005; port++));
do
iperf3 -s -p $port &
done
echo "=====START LISTENING @ PORT 8000+====="
sleep 2
sshpass -p 'dell123.' ssh a@192.168.1.2 -f 'bash ssh_control_a.sh'
echo "=====PORT 8000+ CONNECTING====="
sleep 3
echo "=====CONNECTED @ 192.168.1.2====="
