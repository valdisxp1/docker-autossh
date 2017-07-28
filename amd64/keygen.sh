#!/bin/sh
ssh-keygen -t rsa -b 4096 -N '' -C "generated key" -f /root/.ssh/id_rsa
echo "-------- PUBLIC SSH KEY --------"
cat /root/.ssh/id_rsa.pub
echo "-------- PUBLIC SSH KEY END --------"
