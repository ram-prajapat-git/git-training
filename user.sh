#/bin/bash

# This script will be used to create local users.
# User will be forced to change password on first login.
# Testing changes
read -p "Please enter uername to create: " USER
read -p "Please enter fullname of user: " COMMENT
read -p "Please enter password: " PASSWORD
useradd -c "${COMMENT}" -m ${USER}
echo ${PASSWORD} |passwd --stdin ${USER}
passwd -e ${USER}
