#!/bin/bash
# Firewall

echo "1. Start My firewall"

iptables -A INPUT -s 10.8.0.0/24 -p tcp -m tcp --dport 3389 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3389 -j DROP
iptables -A INPUT -s 10.8.0.0/24 -p tcp -m tcp --dport 5222 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 5222 -j DROP
iptables -A INPUT -s 10.8.0.0/24 -p tcp -m tcp --dport 5269 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 5269 -j DROP
iptables -A INPUT -s 10.8.0.0/24 -p tcp -m tcp --dport 5269 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 5269 -j DROP
iptables -A INPUT -s 10.8.0.0/24 -p tcp -m tcp --dport 5280 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 5280 -j DROP
iptables -A INPUT -s 10.8.0.0/24 -p tcp -m tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8080 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 22 -j DROP

exit
