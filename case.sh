#!/bin/bash

# This script demonstrate the case statement.

#if [[ "${1}" = "ram" ]]
#then
#	echo "My full name is: Ram Singh Prajapat"
#elif [[ "${1}" = "roopa" ]]
#then
#	echo "My wife's name is: Roopa Prajapat"
#elif [[ "${1}" = "dev" ]]
#then
#	echo "My elder son's name is: Devendra Prajapat"
#elif [[ "${1}" = "laddu" ]]
#then
#	echo "My younger son's name is: Kiyansh Prajapat"
#else
#	echo "Enter valid input to get the family members name" >&2
#	exit 1
#fi

#case "${1}" in
#	ram)
#	echo "My full name is: Ram Singh Prajapat"
#	;;
#	roopa)
#	echo "My wife's name is: Roopa Prajapat"
#	;;
#	dev)
#	echo "My elder son's name is: Devendra Prajapat"
#	;;
#	laddu)
#	echo "My younger son's name is: Kiyansh Prajapat"
#	;;
#	*)
#	echo "Enter valid input to get the family members name" >&2
#	exit 1
#	;;
#esac


#case "${1}" in
#	ram)	echo "My full name is: Ram Singh Prajapat" ;;
#	roopa)	echo "My wife's name is: Roopa Prajapat" ;;
#	dev)	echo "My elder son's name is: Devendra Prajapat" ;;
#	laddu)	echo "My younger son's name is: Kiyansh Prajapat" ;;
#	*)
#	echo "Enter valid input to get the family members name" >&2
#	exit 1
#	;;
#esac

read -p "Enter Name: " NAME

case "${NAME}" in
	ram)	echo "My full name is: Ram Singh Prajapat" ;;
	roopa)	echo "My wife's name is: Roopa Prajapat" ;;
	dev)	echo "My elder son's name is: Devendra Prajapat" ;;
	laddu)	echo "My younger son's name is: Kiyansh Prajapat" ;;
	*)
	echo "Enter valid input to get the family members name" >&2
	exit 1
	;;
esac
