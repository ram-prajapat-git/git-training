#!/bin/bash

if [[ ${#} -lt 2 ]]
then
	echo "Usage: ${0} SIGNAL PID"
	exit 1
fi

case $1 in

1) echo "Sending SIGHUP signal."
	kill -1 $2
	;;

2) echo "Sending SIGINT signal."
	kill -2 $2
	;;

3) echo "Sending SIGQUIT signal."
	kill -3 $2
	;;

9) echo "Sending SIGKILL signal."
	kill -9 $2
	;;

*) echo "Signal number $1 is not valid."
	;;
esac
