#!/bin/bash
clear; echo "=== RELATÓRIO DE AUDITORIA ==="; echo -e "\n[1] FIREWALL:"; tail -n 10 firewall.log 2>/dev/null || echo "Sem logs."; echo -e "\n[2] SERVIDOR:"; tail -n 5 server_access.log 2>/dev/null || echo "Sem logs."
