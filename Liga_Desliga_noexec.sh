#!/bin/bash

#--------------------------------------------------------------------#
#Script Name: Liga_Desliga_noexec.sh
#Description: Habilita e desabilita a opção de montagem da partição noexec para permitir
#que programas sejam instalados corretamente no seu ambiente GNU/Linux
#Linkedin: https://www.linkedin.com/in/bruno-pinheiro-502796152
#Referencia: Hardening em Linux - Sandro Melo - RNP
#Escrito por: Bruno Pinheiro
#Manutenção: Bruno Pinheiro
#-------------------------------------------------------------------#
#Comando:
#	$ ./Liga_Desliga_noexec.sh
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

case $1 in
 	start)
 		mount -o remount,rw,noexec /var
 		mount -o remount,rw,noexec /tmp
	mount
 	echo “Partições SEM permissão de execução”
;;
 	stop)
 		mount -o remount,rw,exec /var
 		mount -o remount,rw,exec /tmp
	mount
 	echo “Partições COM permissão de execução”
;;
 	*) echo “erro use $0 {start|stop}”
	exit 0
;;
esac
exit 1
