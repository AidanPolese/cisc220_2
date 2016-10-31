#!/bin/bash
#Manvir Grewal : 10193283
#Aiden Polese : 10197342
#Kathleen Abols : 10179548

#delete rules for all 3 chains
sudo iptables -F

#allow SSH from 130.15.*.*
sudo iptables -A INPUT -p tcp --dport 22 -s 130.15.0.0/16 -j ACCEPT

#allow SSH from private networks
sudo iptables -A INPUT -p tcp --dport 22 -s 10.0.0.0/24 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -m iprange --src-range 172.16.0.0-172.31.255.255 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -s 192.168.0.0/16 -j ACCEPT

#enable http(s) from any IP  - ports 80 & 443
sudo iptables -A INPUT -p tcp -m multiport --dport 80,443 -j ACCEPT

#drop any other incoming tcp
sudo iptables -A INPUT -j DROP

#block connects from your computer to IPs 130.15.*.* /16
sudo iptables -A OUTPUT -d 130.15.0.0/16 -j DROP

#only allow IP 130.15.100.100 to connect to mysql on port 3306
sudo iptables -A INPUT -p tcp --dport 3306 -s 130.15.100.100 -j ACCEPT

#drop outgoing ssh to other computers
sudo iptables -A OUTPUT -p tcp --dport 22 -j DROP
