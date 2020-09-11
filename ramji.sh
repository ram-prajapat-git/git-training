#!/bin/bash

read -p "Enter your name: " NAME

#if [[ "${NAME}" = ram ]]
#then
#	echo "Are bhai hum Ram hai"
#elif [[ "${NAME}" = shyam ]]
#then
#	echo "Hamara naam shyam hai"
#else
#	echo "Sahi naam daalo na bhai"
#fi

#case "${NAME}" in
#	ram)
#	echo "Are bhai hum Ram hai"
#	;;
#	shyam)
#	echo "Hamara naam shyam hai"
#	;;
#	*)
#	echo "Sahi naam daalo na bhai"
#	;;
#esac


case "${NAME}" in
	ram)	echo "Are bhai hum Ram hai" ;;
	shyam)	echo "Hamara naam shyam hai" ;;
	*)	echo "Sahi naam daalo na bhai"
		exit 1
		;;
esac
