#!/bin/bash

case "$1" in
	become)
		if [ "$2"a = a ]; then
			echo "Usage: lwr become NAME"
		else
			sed 's/lwr/'$2'/g' /usr/local/bin/lwr > /usr/local/bin/$2
			install /usr/local/bin/$2 /usr/local/bin/
			rm /usr/local/bin/lwr
		fi
		;;
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
		echo "Usage: lwr {become|eat|excrete|suicide}"
		;;
esac
