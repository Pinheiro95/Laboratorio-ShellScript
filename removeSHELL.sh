#!/bin/bash

	for USER in $(cat /etc/passwd| cut -f 1 -d “:” | grep -v root | grep 
-v vshell | grep -v administrador)
	
	do
		usermod -s /bin/false $USER

done