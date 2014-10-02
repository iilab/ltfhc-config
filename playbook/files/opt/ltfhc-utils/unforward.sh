#!/bin/bash
iptables -D FORWARD -o eth1 -i wlan0 -s 192.168.42.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -D FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -D POSTROUTING -o eth1 -j MASQUERADE
iptables -D FORWARD -o eth1 -s 192.168.168.0/16 -m conntrack --ctstate NEW -j ACCEPT