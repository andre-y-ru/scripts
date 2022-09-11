#!/bin/bash
# Dummy0

echo "1. Start dummy0 addr 4.4.4.4/24"

ip link add dummy0 type dummy
ip addr add 4.4.4.4/24 dev dummy0
ip link set dummy0 up

echo "2. Restart frr.servise"
systemctl restart frr.service

exit
