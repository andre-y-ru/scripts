#!/bin/bash
# Проверка OpenVPN соединения
ping -c 1 10.8.0.1 || service openvpn stop && service openvpn start
