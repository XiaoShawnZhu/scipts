# test script @ receiver x, 5 tx(a, b, c, d, e) comm with 1 rx(x)
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
tcpdump -i eth0 -w /home/xiao/RTCP_related5.8/data_process_scripts/"$1-$DATE-received-packets-x.pcap" &
echo "======start iperf client and tcpdump at local machine"
#2 large flows on each sending machine
for((port=4000;port<4004;port++));
do
iperf3 -s -p$port &
done
for((port=4006;port<4010;port++));
do
iperf3 -s -p$port &
done
echo "=====START LISTENING @ PORT 4000+====="
#3 large flows on each sending machine
for((port=6000;port<6006;port++));
do
iperf3 -s -p $port &
done
for((port=6009;port<6015;port++));
do
iperf3 -s -p $port &
done
echo "=====START LISTENING @ PORT 6000+====="
#5 queries on each sending machine
for((port=8000;port<8010;port++));
do
iperf3 -s -p $port &
done
for((port=8015;port<8025;port++));
do
iperf3 -s -p $port &
done
echo "=====START LISTENING @ PORT 8000+====="
sleep 2
#sshpass -p 'dell123.' ssh c@192.168.1.4 -f 'bash ssh_control_c.sh' &
sshpass -p 'dell123.' ssh a@192.168.1.2 -f 'bash ssh_control_a.sh' &
sshpass -p 'dell123.' ssh b@192.168.1.3 -f 'bash ssh_control_b.sh' &
sshpass -p 'dell123.' ssh d@192.168.1.5 -f 'bash ssh_control_d.sh' &
sshpass -p 'dell123.' ssh e@192.168.1.6 -f 'bash ssh_control_e.sh'
echo "=====PORT 8000+ CONNECTING====="
sleep 3
echo "=====CONNECTED====="
