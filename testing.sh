#!/bin/bash

USERS=karan, arjun, radha, rani
PASSWORD="$(date +%s%N${RANDOM}| sha256sum | head -c 48)"

for USER_NAME in "${USER_NAME}"
do
	#useradd -m ${USER_NAME}
	#echo "${PASSWORD}" | passwd --stdin ${USER_NAME}
	#echo "Password of ${USER_NAME} is: "
	echo "${USER_NAME}"
done 
