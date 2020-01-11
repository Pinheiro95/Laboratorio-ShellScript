#!/bin/bash

#--------------------------------------------------------------------#
#Script Name: AudSecOps.sh
#Description: Executar auditoria de segurança em sistemas Debian com debsecan, chkrootkit e rkhunter
#Script escrito e testado no Debian 10 Buster
#Linkedin: https://www.linkedin.com/in/bruno-pinheiro-502796152
#Referencia: Hardening em Linux - Sandro Melo - RNP
#Escrito por: Bruno Pinheiro
#Manutenção: Bruno Pinheiro
#-------------------------------------------------------------------#
#Comando:
#	$ ./AudSecOps.sh
#-------------------------------------------------------------------#
#Versão Bash
#	5.0.3
#-------------------------------------------------------------------#
#Historico
#	v1.0 09/01/2020, Bruno:
#	-Inicio do programa
#-------------------------------------------------------------------#
#Obs:
#	Execute o script como root para aplicar as opcoes
#       É necessário ter os seguintes programas instalados previamente:
#	      debsecan, rkhunter, chkrootkit
#-------------------------------------------------------------------#

#verifica/cria diretorio que contem os arquivos criados pelo script

if [ -e "/var/log/audtoriaSecOps" ]
	then
		cd /var/log//audtoriaSecOps
	else
		mkdir /var/log/auditoriaSecOps
		cd /var/log/auditoriaSecOps
	fi

#auditoria com debsecan. Primeiro criando um arquivo reportando as vulnerabilidades encontradas
#depois atualiza os pacotes com brechas de segurança baseada na lista de vulnerabilidades do Mitre
# Do CVE https://cve.mitre.org/index.html
debsecan --format report > auditoria.txt
debsecan --format packages > AtualizaPacotes.txt
apt-get install $(cat AtualizaPacotes.txt)

#Procura por rootkit
rkhunter --cronjob --rwo > RkHunterResults.txt
exec /usr/sbin/chkrootkit > chkrootkitResults.txt

echo "Auditoria finalizada. Verifique os arquivos presentes na em /var/log/AuditoriaSecOps"
echo "auditoria.txt - vulnerabilidades encontradas (consulte o CVE)"
echo "AtualizaPacotes.txt - Pacotes que foram atualizados"
echo "RkhunterResults.txt - Resultado do buscador de rootkit"
echo "chkrootkitResults.txt - Resultado do segundo buscador de rootkit"

exit 0
