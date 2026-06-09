# 🛡️ Laboratório de Defesa Cibernética: Mitigação DDoS (SYN Flood) no Kernel Linux

Este repositório contém o código-fonte e a documentação de um laboratório prático de Segurança da Informação, desenvolvido como Trabalho de Conclusão de Curso (TCC). O objetivo é demonstrar, em baixo nível, o impacto de um ataque volumétrico e a eficiência de um firewall de borda.

## 🏗️ Arquitetura do Laboratório

O ambiente foi construído utilizando **Linux Network Namespaces** para simular roteadores e hosts fisicamente isolados dentro da mesma máquina, conectados por links virtuais (`veth`).

* **Atacante:** `10.0.1.2` (Isolado no namespace `atacante`)
* **Servidor Web:** `10.0.2.2` (Isolado no namespace `servidor`)
* **Gateway/Firewall:** Roteamento e inspeção via `iptables`.

## ⚙️ Tecnologias Utilizadas
* **Bash Scripting:** Automação total da infraestrutura.
* **Linux Kernel (iproute2):** Criação de namespaces e links virtuais.
* **hping3:** Geração de pacotes TCP SYN para o ataque de estresse.
* **iptables:** Mitigação na camada de rede (Regras de DROP na chain FORWARD).
* **HTML5/JS:** Simulador de SOC/NOC gameficado para apresentação teórica.

## 🚀 Como Executar o Laboratório

### 1. Pré-requisitos
* Linux (Debian/Ubuntu) ou WSL no Windows.
* Pacotes necessários: `sudo apt install hping3 htop iptables curl -y`

### 2. Automação (Módulo Scripts)
Navegue até a pasta dos scripts e execute os painéis na seguinte ordem, dividindo a tela do seu terminal para monitoramento em tempo real:

```bash
cd TCC-DDoS-Mitigation/scripts
