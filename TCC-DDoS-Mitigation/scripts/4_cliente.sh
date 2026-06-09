#!/bin/bash
clear; LOG_CMD="sudo echo \$(date '+%Y-%m-%d %H:%M:%S') - USUÁRIO LEGÍTIMO: Tentativa de acesso."
eval "$LOG_CMD" >> server_access.log; RESPONSE=$(curl -s --connect-timeout 5 10.0.2.2)
if echo "$RESPONSE" | grep -q "Directory listing"; then echo "Servidor respondeu com sucesso!"; echo "$(date '+%Y-%m-%d %H:%M:%S') - RESPOSTA: OK (200)" >> server_access.log
else echo "Falha na conexão."; echo "$(date '+%Y-%m-%d %H:%M:%S') - RESPOSTA: ERRO" >> server_access.log; fi
