#!/bin/bash

#--------------------------------------------------------------------#
#Script Name: removeSHELL.sh
#Description: Remove o shell válido de todos os usuários do ambiente GNU/Linux
#que não fazem parte dos grupos especificados: vshell, administrador e root
#Linkedin: https://www.linkedin.com/in/bruno-pinheiro-502796152
#Referencia: Hardening em Linux - Sandro Melo - RNP
#Escrito por: Bruno Pinheiro
#Manutenção: Bruno Pinheiro
#-------------------------------------------------------------------#
#Comando:
#	$ ./removeSHELL.sh
#-------------------------------------------------------------------#
#Versão Bash
#	5.0.3
#-------------------------------------------------------------------#
#Historico
#	v1.0 29/12/2019, Bruno:
#	-Inicio do programa
#-------------------------------------------------------------------#
#Obs:
#	Execute o script como root para aplicar as opcoes
#-------------------------------------------------------------------#

	for USER in $(cat /etc/passwd| cut -f 1 -d “:” | grep -v root | grep 
-v vshell | grep -v administrador)
	
	do
		usermod -s /bin/false $USER

done
