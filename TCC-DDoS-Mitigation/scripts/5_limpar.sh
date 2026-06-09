#!/bin/bash
clear; sudo killall hping3 python3 2>/dev/null; sudo ip netns del atacante 2>/dev/null; sudo ip netns del servidor 2>/dev/null; sudo iptables -F; rm -f firewall.log server_access.log; echo "[+] Ambiente limpo!"
