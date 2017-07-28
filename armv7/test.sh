#!/bin/sh

if [[ "$TRUST" = "YES" ]] || [[ "$TRUST" = "yes" ]] || [[ "$TRUST" = "ALL" ]] || [[ "$TRUST" = "all" ]]
then
	EXTRAOPTS="-o StrictHostKeyChecking=no"
fi

echo "Testing the connection"
if [[ -z $PORT ]]
then
	ssh $EXTRAOPTS $HOST -i ~/.ssh/id_rsa echo 'Can connect to $USER@$HOSTNAME' "via $HOST"
else
	ssh $EXTRAOPTS -p $PORT $HOST -i ~/.ssh/id_rsa echo 'Can connect to $USER@$HOSTNAME' "via $HOST:$PORT"
fi

