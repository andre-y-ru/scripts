#!/bin/bash
# VPN-Server

echo "1. Start My SNAT"

iptables -A FORWARD -s 172.16.0.0/24 -j ACCEPT
iptables -A FORWARD -d 172.16.0.0/24 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -s 172.16.0.0/24 -j SNAT --to-source 10.8.0.21

exit
