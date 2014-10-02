#!/bin/bash
iptables -A FORWARD -o eth1 -i wlan0 -s 192.168.42.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -A FORWARD -o eth1 -s 192.168.168.0/16 -m conntrack --ctstate NEW -j ACCEPT