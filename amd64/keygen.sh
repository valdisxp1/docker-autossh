#!/bin/sh

if ! ls ~/.ssh/id_rsa 1> /dev/null 2>&1
then
	ssh-keygen -t rsa -b 4096 -N '' -C "generated on $HOST at `date`" -f ~/.ssh/id_rsa
	GENERATED=true
fi
echo "-------- PUBLIC SSH KEY --------"
cat ~/.ssh/id_rsa.pub
echo "-------- PUBLIC SSH KEY END --------"

# also check if this is a terminal by -t 1
if [[ "$GENERATED" =  true ]] && [[ -t 1 ]]
then
	echo "Freshly generated key. Add it to authorized keys and press enter"	
	read ignored
fi
