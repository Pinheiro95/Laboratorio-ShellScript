export HISTFILE=”/root/.bash_history_$(who am i | awk ‘{ print $1 
}’;exit)”

#!/bin/bash

#--------------------------------------------------------------------#
#Script Name: Historico.sh
#Description: Configura variaveis do kernel para armazenamento apropriado do histórico de comandos
#no terminal GNU/Linux. Testado no Debian 10 Buster
#Linkedin: https://www.linkedin.com/in/bruno-pinheiro-502796152
#Referencia: Hardening em Linux - Sandro Melo - RNP
#Escrito por: Bruno Pinheiro
#Manutenção: Bruno Pinheiro
#-------------------------------------------------------------------#
#Comando:
#	$ ./Historico.sh
#-------------------------------------------------------------------#
#Versão Bash
#	5.0.3
#-------------------------------------------------------------------#
#Historico
#	v1.0 23/01/2020, Bruno:
#	-Inicio do programa
#-------------------------------------------------------------------#
#Obs:
#	Execute o script como root para aplicar as opcoes
#       
#-------------------------------------------------------------------#
#variaveis para adaptar o armazenamento do historico
HISTFILESIZE=30000
HISTSIZE=20000
HISTTIMEFORMAT=”- %d/%m/%Y %H:%M:%S - “
RULES=’HISTTIMEFORMAT=”- %d/%m/%Y %H:%M:%S - “’
BASHRC_GERAL=”/etc/bashrc”
BASHRC_SKEL=”/etc/skel/.bashrc”
BASHRC_ROOT=”/root/.bash_history_$(who am i | awk ‘{ print $1 
}’;exit)”


func_readonly_hist()
{
_ARQ=”$1”
POLICE_RONLY=“readonly -n $VAR_HIST”
for VAR_HIST in HISTFILE HISTFILESIZE HISTSIZE HISTTIMEFORMAT
 do
grep $POLICE_RONLY “$_ARQ” || echo $POLICE_RONLY >> “$_ARQ”
done
}
func_files()
{
 for ARQ in $BASHRC_GERAL $BASHRC_SKEL $BASHRC_ROOT
 do
if [ -f $ARQ ]
 then
grep HISTTIMEFORMAT “$ARQ” || echo “$RULES” >> “$ARQ”
func_readonly_hist “$ARQ” 
fi
 done
}
func_user()
{
 for USER_HOME in $(cut -f 6 -d “:” /etc/passwd)
 do
if [ -f “$USER_HOME”/.bashrc ]
 then
grep HISTTIMEFORMAT “$USER_HOME”/.bashrc || echo “$RULES” >> 
“$USER_HOME”/.bashrc
. “$USER_HOME”/.bashrc
Fi
 done
}
func_files && func_user
