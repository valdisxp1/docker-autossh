#!/bin/sh

echo "Starting autossh tunnel"

autossh -M 0 -f -N -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" $FORWARD -i ~/.ssh/id_rsa -p $PORT $HOST

while [[ 1 ]]
do
	sleep 60
done
