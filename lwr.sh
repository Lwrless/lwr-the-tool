#!/bin/bash

case "$1" in
	eat)
		if [ "$2"a = a ]; then
			echo "Usage: lwr eat FILE"
		else
			rm $2
		fi
		;;
	excrete)
		if [ "$2"a = a ]; then
			echo "Usage: lwr excrete FILENAME"
		else
			touch $2
		fi
		;;
	suicide)
		echo "Bye."
		rm /usr/local/bin/lwr
		;;
	*)
		echo "Usage: lwr {eat|excrete|suicide}"
		;;
esac
