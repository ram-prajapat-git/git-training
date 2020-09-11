#!/bin/bash

# This script is used to create new user as per the input entered by user and supress all commands output. Only output will be given is the username, pass, host.

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]]
then
	echo "This script requires root privilages." >&2
	exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
if [[ ${#} -lt 1 ]]
then
	echo "${0} requires at least one argument." >&2
	exit 1
fi
# The first parameter is the user name.
USER_NAME=$1
# The rest of the parameters are for the account comments.
shift
COMMENT=${@}
# Generate a password.
PASSWORD="$(date +%s%N${RANDOM} | sha256sum |head -c48)"
# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME} &> /dev/null
# Check to see if the useradd command succeeded.
if [[ ${?} -ne 0 ]]
then
	echo "User was not created successfully due to some reasons." >&2
	exit 1
fi
# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
	echo "Password was not set to user due to some reasons." >&2
	exit 1
fi
# Force password change on first login.
passwd -e ${USER_NAME} &> /dev/null
# Display the username, password, and the host where the user was created.
echo "Username: "
echo "${USER_NAME}"
echo
echo "Password: "
echo "${PASSWORD}"
echo
echo "Hostname: "
echo "${HOSTNAME}"
