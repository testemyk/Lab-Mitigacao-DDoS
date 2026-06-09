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

---

## 🚀 Como Executar o Laboratório (Guia Passo a Passo)

Preparamos este guia detalhado para que qualquer pessoa consiga replicar o laboratório do zero, mesmo sem experiência prévia com infraestrutura Linux. 

### Passo 1: Preparando o Sistema Operacional (WSL)
O laboratório roda nativamente em Linux. Se você utiliza Windows, a forma mais rápida e oficial de emular o ambiente é através do **WSL (Windows Subsystem for Linux)**.

1. No Windows, clique no menu Iniciar, digite **PowerShell**, clique com o botão direito e selecione **"Executar como Administrador"**.
2. Cole o comando abaixo e aperte Enter:
   ```powershell
   wsl --install -d Ubuntu
   ```
3. O Windows fará o download do sistema. **Reinicie o computador** caso seja solicitado.
4. Após reiniciar, procure por "Ubuntu" no menu Iniciar e abra o terminal. Ele pedirá para você criar um nome de usuário e uma senha *(guarde bem essa senha, você usará ela nos próximos passos)*.

### Passo 2: Instalando as Ferramentas de Rede
Com o terminal do Ubuntu aberto, precisamos instalar os pacotes essenciais que farão o laboratório funcionar: o gerador de pacotes maliciosos, o firewall e o monitor de recursos.

1. No terminal do Ubuntu, copie e cole o comando abaixo:
   ```bash
   sudo apt update && sudo apt install hping3 htop iptables curl git -y
   ```
2. O sistema pedirá a senha que você acabou de criar. Digite *(ela não aparece na tela por segurança)* e dê Enter.

### Passo 3: Clonando o Repositório
Em vez de baixar os arquivos manualmente, utilizaremos o `git` para puxar toda a estrutura do laboratório diretamente para o seu terminal.

1. Execute o comando de clone:
   ```bash
   git clone [https://github.com/testemyk/Lab-Mitigacao-DDoS.git](https://github.com/testemyk/Lab-Mitigacao-DDoS.git)
   ```
2. Entre na pasta dos scripts que acabou de ser baixada:
   ```bash
   cd Lab-Mitigacao-DDoS/TCC-DDoS-Mitigation/scripts
   ```
3. Dê a permissão necessária para que o Linux transforme os arquivos de texto em programas executáveis:
   ```bash
   chmod +x *.sh
   ```

### Passo 4: A Hora do Show (Executando a Simulação)
Para a melhor experiência visual e compreensão da topologia, recomendamos que você abra **3 painéis** no seu terminal *(no Windows Terminal, use `Alt + Shift + +` para dividir a tela)* ou abra 3 janelas do Ubuntu lado a lado.

Execute os comandos abaixo, um em cada tela, na exata ordem:

* **[Painel 1 - O Servidor]** Inicia a rede isolada e o servidor web.
  ```bash
  ./1_preparar.sh
  ```
  *(O monitor verde do `htop` vai aparecer, mostrando a CPU tranquila).*

* **[Painel 2 - O Atacante]** Dispara o ataque SYN Flood (Botnet).
  ```bash
  ./2_atacar.sh
  ```
  *(Olhe para o Painel 1: A CPU vai travar em 100%. O servidor está fora do ar).*

* **[Painel 3 - O Firewall]** Ativa a mitigação na borda da rede.
  ```bash
  ./3_defender.sh
  ```
  *(Olhe para o Painel 1 novamente: A CPU voltará imediatamente para o estado normal (verde), pois os pacotes maliciosos estão sendo descartados antes de chegarem ao servidor).*

### Passo 5: Auditoria e Encerramento
Com o ataque sendo contido pelo firewall, você pode comprovar que usuários legítimos continuam acessando a empresa. Abra uma aba extra no terminal *(ou pare o Painel 3 com `Ctrl + C`)* e execute:

* **Para simular um cliente real tentando acessar o site:**
  ```bash
  ./4_cliente.sh
  ```
* **Para ler os relatórios de segurança (Auditoria):**
  ```bash
  ./6_ver_logs.sh
  ```
* **Para limpar a memória e resetar o computador:**
  ```bash
  ./5_limpar.sh
  ```
  *(Isso destrói as redes virtuais e limpa as regras de firewall, deixando sua máquina intacta).*

---
*Projeto desenvolvido para fins acadêmicos e de pesquisa em Segurança da Informação.*
