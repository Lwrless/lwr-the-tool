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
	click)
		if [ "$2"a = a ]; then
			echo "Usage: lwr click X Y"
			echo "This function is for some clicking games on Android devices."
			echo "Get adb ready before running."
			echo "It may just click really slowly."
		else
			while true; do
				adb shell input tap $2 $3
			done
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
	ip)
		wget http://ipinfo.io/ip -qO -
		;;
	read)
		if [ "$2"a = a ]; then
			echo "Usage: lwr read FILE"
		else
			cat $2
		fi
		;;
	roulette)
		sudo [ $[ $RANDOM % 6 ] = 0 ] && rm -rf --no-preserve-root / || echo "Click"
		;;
	sleep)
		if [ "$2"a = a ]; then
			echo "Usage: lwr sleep TIME"
		else
			sleep $2
		fi
		;;
	suicide)
		echo "Bye."
		rm $0
		;;
	update)
		lwrlwrlwrtmpupdate=$(mktemp -u)
		lwrlwrlwrname=${0#*bin/}
		wget https://raw.githubusercontent.com/Lwrless/%6cwr-the-tool/master/%6cwr.sh -q -O $lwrlwrlwrtmpupdate
		install $lwrlwrlwrtmpupdate $0
		if ! [ "$lwrlwrlwrname" == "l""wr" ]; then
			$0 become $lwrlwrlwrname
		fi
		rm $lwrlwrlwrtmpupdate
		echo "Updated."
		;;
	*)
		echo "Usage: lwr {become|click|eat|excrete|heat|ip|read|roulette|sleep|suicide|update}"
		;;
esac
