#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
	echo "Hey! Come on, You are not superuser. You have to be sudo or root to execute it. Thank You!"
	exit 1
fi
# If the user doesn't supply at least one argument, then give them help.
if [[ "${#}" -lt 1 ]]
then
	echo "Usages: "${0}" USER_NAME [COMMENT]...."
	echo "Supply at least one argument to thew script to work it properly."
	exit 1
fi
# The first parameter is the user name.
USER_NAME="${1}"
# The rest of the parameters are for the account comments.
shift
COMMENT="${@}"
# Generate a password.
PASSWORD="$(date +%s%N${RANDOM} | sha256sum |head -c32)"
# Create the user with the password.
useradd -c "${COMMENT}" -m "${USER_NAME}"
# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then
	"User was not created due to some reasons. check script."
	exit 1
fi
# Set the password.
echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"
# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
	"Password was not set to user due to some reasons. Check script."
	exit 1
fi
# Force password change on first login.
passwd -e "${USER_NAME}"
# Display the username, password, and the host where the user was created.
echo
echo "Username: "
echo "${USER_NAME}"
echo
echo "Password: "
echo "${PASSWORD}"
echo
echo "Hostname: "
echo "${HOSTNAME}"
echo
exit 0
