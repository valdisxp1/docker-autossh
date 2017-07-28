#!/bin/sh

if ! ls ~/.ssh/id_rsa 1> /dev/null 2>&1
then
	ssh-keygen -t rsa -b 4096 -N '' -C "generated key" -f ~/.ssh/id_rsa
fi
echo "-------- PUBLIC SSH KEY --------"
cat ~/.ssh/id_rsa.pub
echo "-------- PUBLIC SSH KEY END --------"
