#!/bin/sh

if [[ -z $HOST ]]
then
	>&2 echo "ERROR: HOST not set"
	exit 1
fi

./keygen.sh

./test.sh

./tunnel.sh
