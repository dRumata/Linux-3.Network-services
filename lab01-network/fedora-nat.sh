#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.ip_forward=1
firewall-cmd --add-masquerade --permanent
firewall-cmd --add-forward --permanent
firewall-cmd --reload
