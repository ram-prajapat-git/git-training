#!/bin/bash

# This script is used to create multiple users in one go.

if [[ "${UID}" -ne 0 ]]
then
	echo "Please run with sudo or root."
	exit 1
fi

for users in karan arjun raja rani sandhya zara
do
	useradd $users
	echo "pass123" |passwd --stdin $users
done
