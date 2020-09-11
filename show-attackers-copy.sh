#!/bin/bash
#set -x
# Count the number of failed logins by IP address.
# If there are any IPs with over LIMIT failures, display the count, IP and location.

LIMIT="10"
LOG_FILE="${1}"

# Make sure a file was supplied as an argument.
if [[ ! -e "${LOG_FILE}" ]]
then
	echo "Can not open file: ${LOG_FILE}" >&2
fi

# Display the CSV header.
echo "count,ip,location"

# Loop through the list of failed attempts and corresponding IP addresses.
grep Failed "${LOG_FILE}" |awk '{print $(NF-3)}'|sort|uniq -c|sort -nrk1 |while read COUNT IP
do
 # If the number of failed attempts is greater than the limit, display count, IP, and location.
 if [[ "${COUNT}" -gt "${LIMIT}" ]]
 then
   LOCATION=$(geoiplookup $IP |awk -F', ' '{print $2}')
   echo "${COUNT},${IP},${LOCATION}"
 fi
done
exit 0
