#!/bin/bash

# This script is to check the UID and username of the user executing this script

# Display UID
echo "Your UID is ${UID}."

# Display username
USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}."

#Display if user is the root or not.
if [[ "${UID}" -eq 0 ]]
then
	echo "You are root."
else
	echo "You are not root."
fi

# Check if the username matches with the executing user or not
TEST_USER="vagrant"
if [[ "${USER_NAME}" = "${TEST_USER}" ]]
then
	echo "Your username matches ${TEST_USER}."
else
	echo "Your username does not match ${TEST_USER}."
fi


# Check if the above command is executed successfully or not.
if [[ "${?}" -ne 0 ]]
then
	echo "Last command was successful"
else
	echo "Last command was not successful"
fi
