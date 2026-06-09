#!/bin/bash
clear; echo "[*] Construindo Nova Rede Virtual Isolada..."; sudo killall hping3 python3 2>/dev/null; sudo ip netns del atacante 2>/dev/null; sudo ip netns del servidor 2>/dev/null; sudo iptables -F
sudo ip netns add atacante; sudo ip netns add servidor; sudo ip link add veth-ata type veth peer name vpeer-ata; sudo ip link add veth-srv type veth peer name vpeer-srv
sudo ip link set vpeer-ata netns atacante; sudo ip link set vpeer-srv netns servidor; sudo ip link set veth-ata up; sudo ip link set veth-srv up
sudo ip addr add 10.0.1.1/24 dev veth-ata; sudo ip addr add 10.0.2.1/24 dev veth-srv
sudo ip netns exec atacante ip link set lo up; sudo ip netns exec atacante ip link set vpeer-ata up; sudo ip netns exec atacante ip addr add 10.0.1.2/24 dev vpeer-ata; sudo ip netns exec atacante ip route add default via 10.0.1.1
sudo ip netns exec servidor ip link set lo up; sudo ip netns exec servidor ip link set vpeer-srv up; sudo ip netns exec servidor ip addr add 10.0.2.2/24 dev vpeer-srv; sudo ip netns exec servidor ip route add default via 10.0.2.1
sudo sysctl -w net.ipv4.ip_forward=1 > /dev/null; echo "[*] Subindo Servidor Web..."; sudo ip netns exec servidor python3 -m http.server 80 & sleep 2; sudo ip netns exec servidor htop
