#!/bin/bash
#
# This script created a new user on local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password and hostname for the account will be displayed.
# Pull testing from github to servers local repo.
# Make sure the script is being executed with superuser privilages.
if [[ "${UID}" -ne 0 ]]
then
	echo "Please run with sudo or as root."
	exit 1
fi

#Ask for the details of user to be created.
read -p "Enter the username to create: " USER_NAME
read -p "Enter the name of the person or application what will be using this account: " COMMENT
read -p "Enter the password to user for the account: " PASSWORD

#Create the new user as per the above details provided by user.
useradd -c "${COMMENT}" -m ${USER_NAME}

#Check to see if the useradd command succeeded.
#We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
	echo "The account could not be created."
	exit 1
fi
#Set the password for the account
echo "${PASSWORD}"|passwd --stdin ${USER_NAME}

# Check to see if password set was successful.
if [[ "${?}" -ne 0 ]]
then
	echo "The password for the account could not be set"
	exit 1
fi

# Force the password change on first login
passwd -e ${USER_NAME}

# Check if the user will be asked for the passord change on first login.
if [[ "${?}" -ne 0 ]]
then
	echo "Password was not forced to change on first login."
	exit 1
fi

#Display username, password and hostname of the newly created account
#echo "Newly created username is ${USER_NAME}."
#echo "Password of newly created account is ${PASSWORD}"
#echo "This account is created on ${HOSTNAME} hostname"

echo
echo "username:"
echo "${USER_NAME}"
echo
echo "password:"
echo "${PASSWORD}"
echo
echo "hostname:"
echo "${HOSTNAME}"

exit 0
