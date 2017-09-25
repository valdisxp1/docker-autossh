#!/bin/sh

echo "Starting autossh tunnel"

autossh -M 0 -N -vv -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" $FORWARD -i ~/.ssh/id_rsa -p $PORT $HOST
