#!/bin/bash
#set -x
. .config
for USER in $NAMES
do
#	useradd -m $USER
#	PASS=$(date +%s%N${RANDOM}|sha256sum|head -c48)
#	echo $PASS |passwd --stdin $USER
#	echo "Password of $USER is: $PASS"
#	passwd -e $USER
	userdel -r $USER
	echo "$USER deleted successfully"
sleep 1
done
