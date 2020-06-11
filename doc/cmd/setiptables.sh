#/bin/sh
#iptables -t nat -A PREROUTING  -m mac --mac-source  D8:9E:F3:41:B2:9C  -d 192.168.192.88 -p udp --dport 53 -j DNAT --to-dest=192.168.192.165:53
for i in 192.168.192.165 192.168.192.166 192.168.190.11 192.168.192.103
do
	iptables -t nat -D PREROUTING  -m mac --mac-source  $1  -d $2 -p udp --dport 53 -j DNAT --to-dest=$i:53
done
iptables -t nat -A PREROUTING  -m mac --mac-source  $1  -d $2 -p udp --dport 53 -j DNAT --to-dest=$3:53
service iptables save
