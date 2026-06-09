#!/bin/bash
clear; echo "[🛡️] ATIVANDO FIREWALL DE BORDA (IPTABLES DROP) [🛡️]"
sudo echo "$(date '+%Y-%m-%d %H:%M:%S') - ATIVAÇÃO DE REGRA: Bloqueio do IP 10.0.1.2 via DROP." >> firewall.log
sudo iptables -A FORWARD -s 10.0.1.2 -j DROP; sleep 2
while true; do echo "--- Auditoria em: $(date '+%H:%M:%S') ---" >> firewall.log; sudo iptables -nvL FORWARD >> firewall.log; clear; sudo iptables -nvL FORWARD; sleep 2; done
