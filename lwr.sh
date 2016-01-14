#!/bin/bash

case "$1" in
	become)
		if [ "$2"a = a ]; then
			echo "Usage: lwr become NAME"
		else
			lwrlwrlwrtmp=$(mktemp -u)
			sed 's/lwr/'$2'/g' /usr/local/bin/lwr > $lwrlwrlwrtmp
			rm /usr/local/bin/lwr
			install $lwrlwrlwrtmp /usr/local/bin/$2
			rm $lwrlwrlwrtmp
		fi
		;;
	eat)
		if [ "$2"a = a ]; then
			echo "Usage: lwr eat FILE"
		else
			rm -rf $2
		fi
		;;
	excrete)
		if [ "$2"a = a ]; then
			echo "Usage: lwr excrete FILENAME"
		else
			for (( i = 0; i < $RANDOM; i++ )); do
				lwrlwrlwrtmp=$(date +%s | shasum | base64 | head -c 32)$(uuidgen)
				echo $lwrlwrlwrtmp | shasum | base64 | head -c 32 >> $2
			done
		fi
		;;
	read)
		if [ "$2"a = a ]; then
			echo "Usage: lwr read FILE"
		else
			cat $2
		fi
		;;
	suicide)
		echo "Bye."
		rm /usr/local/bin/lwr
		;;
	*)
		echo "Usage: lwr {become|eat|excrete|read|suicide}"
		;;
esac
