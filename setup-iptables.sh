#!/bin/bash
# flush old/default rules
iptables -F
# configure firewall to handle request state
iptables -A INPUT -m state --state INVALID -j REJECT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# reject all connections on port 22
iptables -A INPUT -p tcp --dport 22 -j REJECT
iptables -A INPUT -p udp --dport 22 -j REJECT
# whitelist ips, in CIDR block form 
iptables -I INPUT -s $CIDRIP -p tcp --dport 22 -j ACCEPT
iptables -I INPUT -s $CIDRIP -p udp --dport 22 -j ACCEPT
#save changes
iptables-save