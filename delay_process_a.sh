# process delay for each flow from dumped data @ a
# run in root mode
# cmd line parameters: 1. protocol 2. date
# open a new file to save delay data
touch $1_$2_delay_4000.txt
touch $1_$2_delay_4001.txt

touch $1_$2_delay_6000.txt
touch $1_$2_delay_6001.txt
touch $1_$2_delay_6002.txt

touch $1_$2_delay_8000.txt
touch $1_$2_delay_8001.txt
touch $1_$2_delay_8002.txt
touch $1_$2_delay_8003.txt
touch $1_$2_delay_8004.txt


tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==4000' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_4000.txt
tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==4001' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_4001.txt

tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==6000' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_6000.txt
tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==6001' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_6001.txt
tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==6002' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_6002.txt

tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==8000' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_8000.txt
tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==8001' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_8001.txt
tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==8002' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_8002.txt
tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==8003' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_8003.txt
tshark -r $1-$2-sent-packets-a.pcap -Y 'tcp.srcport==8004' -T fields -e tcp.analysis.ack_rtt > $1_$2_delay_8004.txt
