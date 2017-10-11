#!/bin/sh

if [[ "$VERBOSE" = "TRUE" ]] || [[ "$VERBOSE" = "true" ]]
then
	VERBOSE_FLAG="-vv"
fi

echo "Starting autossh tunnel"

autossh -M 0 -N $VERBOSE_FLAG -o "ExitOnForwardFailure yes" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" $FORWARD -i ~/.ssh/id_rsa -p $PORT $HOST
