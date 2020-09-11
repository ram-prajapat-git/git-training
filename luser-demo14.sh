#!/bin/bash

# This script will give top three users who writes in /var/log/messages file.

if [[ "${UID}" -ne 0 ]]
then
	echo "Run with sudo or root."
fi

LOG_FILE="${1}"

if [[ ! -e "${LOG_FILE}" ]]
then
	echo "Incorrect file."
fi

paste "${LOG_FILE}" |cut -d ' ' -f 5 |sort|uniq -c|sort -nrk1|head -n3
