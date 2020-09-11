#!/bin/bash
#set -x

# This script is used to create users based on the options choosen by user.

# Function for user creation if user chooses option 1.
create_user() {
        read -p "Enter username to create: " USER
        read -p "Enter name of real/application user: " COMMENT
        useradd -c "${COMMENT}" -m "${USER}" >> /dev/null
        if [[ "${?}" -ne 0 ]]
        then
            echo "User $USER was NOT created." >&2
            exit 1
        else
            echo "User $USER was created successfully."
        fi
return 1
}

# Function for password option.
set_password() {
while true
do
    echo -e '========Submenu========'
    echo -e ' 1) Select if need random password.'
    echo -e ' 2) Select if you want to give password.'
read -p "Choose an option or <return> to exit: " OPT

case $OPT in
	1) DYNAMIC="true"
	   ;;
	2) MANUAL="true"
	   ;;
	*) return 1
	   ;;
esac

# If user choose option 1 from submenu.

if [[ "${DYNAMIC}" = "true" ]]
then
   PASSWORD=$(date +%s%N${RANDOM} | sha256sum | head -c16)
   NO_CHANGE=$(id -u $USER)
	if [[ "${NO_CHANGE}" -eq 0 ]]
	then
	echo "Password can't be changed for root."
	else
   echo "${PASSWORD}" | passwd --stdin ${USER} >& /dev/null
   echo
   echo "Password for user $USER: $PASSWORD"
   echo
	if [[ "${?}" -ne 0 ]]
	   then
		echo "Password was NOT set." >&2
		exit 1
	fi
        fi
fi

# If user chooses option 2 from submenu.

if [[ "${MANUAL}" = "true" ]]
then
	NO_CHANGE=$(id -u $USER)
        if [[ "${NO_CHANGE}" -eq 0 ]]
        then
        echo "Password can't be changed for root."
        else
	read -p "Please provide password to set: " PASS
	echo "${PASS}" | passwd --stdin ${USER} >& /dev/null
	echo
	echo "Password for user $USER: $PASS"
	echo
        if [[ "${?}" -ne 0 ]]
           then
                echo "Manual Password was NOT set." >&2
                exit 1
        fi
	fi
fi
return 1
done
}

# Make sure script is executed by root or sudo privilages.

if [[ "${UID}" -ne 0 ]]
then
	echo "This script should be executed with sudo or root privilages." >&2
	exit 1
fi

# Give options to user so that he can choose from them according to requirement.

while true
do
	clear
	echo -e '==============================='
	echo -e '          USER MENU            '
	echo -e '==============================='
	echo -e '1) Select this option for creation.'
	echo -e '2) Select this option to set password to user and Display them.'
	echo -e '3) Select this option to force password change on first login.'
read -p "Choose an option or <Return> to exit: " OPTION

case ${OPTION} in

	1) create_user
	   ;;
	2) set_password
	   ;;
	3) FORCE="true"
	   ;;
	*) exit 1
	   ;;
esac

# If user chooses option 3 to expire password for newly created user.
if [[ "${FORCE}" = "true" ]]
then
   passwd -e ${USER} >& /dev/null
   if [[ "${?}" -ne 0 ]]
   then
	echo "Password for ${USER} was not expired."
   else
	echo "Password for ${USER} was expired successfully."
   fi
fi
read -p "Please enter to continue..." wait
done
