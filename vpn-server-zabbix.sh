#!/bin/bash
#PREROUTING VPN-SERVER-ZABBIX

echo "1. Start PREROUTING end DNAT VPN"

iptables -t nat -A PREROUTING -d 217.16.29.2/32 -p tcp -m tcp --dport 1196 -j DNAT --to-destination 10.8.0.21:1196
iptables -t nat -A PREROUTING -s 217.16.29.2 -i tun0 -p tcp -m tcp --dport 1196 -j DNAT --to-destination 10.8.0.21:1196

exit
