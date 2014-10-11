#!/bin/bash
iptables -A FORWARD -o eth1 -i wlan0 -s 192.168.42.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -A FORWARD -o eth1 -s 192.168.168.0/16 -m conntrack --ctstate NEW -j ACCEPT

#!/bin/bash
iptables -A FORWARD -o ppp0 -i wlan0 -s 192.168.42.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -A FORWARD -o ppp0 -s 10.108.2.0/16 -m conntrack --ctstate NEW -j ACCEPT