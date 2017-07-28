#!/bin/sh

echo "Testing the connection"
if [[ -z $PORT ]]
then
	ssh $HOST -i /root/.ssh/id_rsa echo 'Can connect to $USER@$HOSTNAME' "via $HOST"
else
	ssh -p $PORT $HOST -i /root/.ssh/id_rsa echo 'Can connect to $USER@$HOSTNAME' "via $HOST:$PORT"
fi

