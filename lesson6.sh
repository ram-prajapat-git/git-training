#!/bin/bash

# This script generates a random password for each user specified on the command line.

# Display what the user typed on the command line.
echo "You entered the "${0}"."
# Display the path and filename of the script
echo "You entered $(dirname ${0}) path to the $(basename ${0}) script."
# Tell them how many arguments they passed in.
# (Inside the script they are parameters, outside the script they are arguments)
echo "You entered "${#}" parameteres to this script."
# Make sure they at least supply one argument.
PARAMETERS="${#}"
if [[ "${PARAMETERS}" -lt 1 ]]
then
	echo "Script needs at least one argument"
	exit 1
fi
# Generate & Display a password for each parameter.
for USER_NAME in "${@}"
do
	PASSWORD="$(date +%s%N${RANDOM} | sha256sum |head -c32)"
	useradd -m ${USER_NAME}
	echo "${USER_NAME} created successfully"
	echo "${PASSWORD}" | passwd --stdin ${USER_NAME}
	echo "password of ${USER_NAME} is: ${PASSWORD}"
	#userdel -r ${USER_NAME}
	#echo "${USER_NAME} deleted successfully."
done
exit 0
