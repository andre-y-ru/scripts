#!/bin/bash
# DNAT end SNAT 12

echo "1. Start DNAT end SNAT 12"

# PREROUTING ACCEPT
iptables -t nat -A PREROUTING -s 217.16.29.2/32 -i tun0 -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.8.0.12:80
iptables -t nat -A PREROUTING -s 217.16.29.2/32 -i tun0 -p tcp -m tcp --dport 443 -j DNAT --to-destination 10.8.0.12:443
iptables -t nat -A PREROUTING -d 217.16.29.2/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.8.0.12:80

# RASPBERRY
iptables -t nat -A PREROUTING -s 217.16.29.2/32 -i tun0 -p tcp -m tcp --dport 82 -j DNAT --to-destination 10.8.0.9:80
iptables -t nat -A PREROUTING -d 217.16.29.2/32 -p tcp -m tcp --dport 82 -j DNAT --to-destination 10.8.0.9:80
iptables -t nat -A PREROUTING -s 217.16.29.2 -i tun0 -p tcp -m tcp --dport 2251 -j DNAT --to-destination 10.8.0.9:2251
iptables -t nat -A PREROUTING -d 217.16.29.2/32 -p tcp -m tcp --dport 2251 -j DNAT --to-destination 10.8.0.9:2251

# ZABBIX SERVER
iptables -t nat -A PREROUTING -s 217.16.29.2 -i tun0 -p tcp -m tcp --dport 8484 -j DNAT --to-destination 10.8.0.21:80
iptables -t nat -A PREROUTING -d 217.16.29.2/32 -p tcp -m tcp --dport 8484 -j DNAT --to-destination 10.8.0.21:80

# POSTROUTING ACCEPT
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 ! -d 10.8.0.0/24 -j SNAT --to-source 90.156.205.173
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o tun0 -j SNAT --to-source 217.16.29.2

exit
