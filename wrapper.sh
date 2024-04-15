#!/bin/bash
vocab=$1
while true; do
	line=''
	while IFS= read -r -N 1 ch; do
		case "$ch" in 
			$'/04') got_eot=1	;&
			$'\n') break	;;
			*)	line="$line$ch"	;;
		esac
	done
	sugg=$(./autocomplete.sh $line $vocab)
	printf  "$line	$sugg\n"

	if (( got_eot)); then
		break
	fi
done
