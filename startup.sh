#!/bin/bash

# This is a startup script which will be used to start/stop/restart the system based on customer inputs.

while true
do
clear

echo -e '=======Startup Menu======='
echo -e ' 1) Start'
echo -e ' 2) Stop'
echo -e ' 3) Restart'
read -p 'Choose from above options or <Return> to quit:' OPT

case $OPT in

	1)	echo "Starting the server."
		echo "work in progress."
		;;
	2) 	echo "Stopping the server."
		/usr/sbin/shutdown --poweroff
		;;
	3) 	echo "Restarting the machine."
		/usr/sbin/shutdown --reboot
		;;
	*) 	echo "Choose correct option."
		exit 1
		;;
esac

read -p "Please enter to continue..." wait

done	
