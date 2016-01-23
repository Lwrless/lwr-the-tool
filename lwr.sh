#!/bin/bash

case "$1" in
	become)
		if [ "$2"a = a ]; then
			echo "Usage: lwr become NAME"
		else
			lwrlwrlwrtmp=$(mktemp -u)
			sed 's/lwr/'$2'/g' $0 > $lwrlwrlwrtmp
			rm $0
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
	heat)
		if [ "$2"a = a ]; then
			echo "Usage: lwr heat NUM_LEVEL"
			echo "To stop: lwr heat stop"
		elif [ "$2" = "stop" ]; then
			killall yes
		else
			for (( i = 0; i < $2; i++)); do
				yes > /dev/null &
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
		rm $0
		;;
	*)
		echo "Usage: lwr {become|eat|excrete|heat|read|suicide}"
		;;
esac
