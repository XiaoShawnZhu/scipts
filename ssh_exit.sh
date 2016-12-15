sysctl -w net.ipv4.tcp_congestion_control=reno
sshpass -p 'dell123.' ssh b@192.168.1.3 -f 'sudo sysctl -w net.ipv4.tcp_congestion_control=reno'
