#!/bin/bash

# This script generates a random password.
# This user can set the password length with -l and add a special character with -s.
# Verbose mode can be enabled with -v.

usage() {

	echo "Usage ${0}: [-vs] [-l][.]"
	echo "	-v To switch on Verbose Mode"
	echo "	-s Special Character"
	echo "	-l LENGTH Specify password length"
}

log() {
	local MESSAGE=${@}
	if [[ "${VERBOSE}" = "true" ]]
	then
	echo ${MESSAGE}
	fi
}

# Set a defaul password length.
LENGTH=48

while getopts vl:s OPTION
do
	case ${OPTION} in
		v)	
			VERBOSE="true" 
			log "Verbose mode is ON."
			;;
		s) 	
			USE_SPECIAL_CHARACTER="true"
			;;
		l)	
			LENGTH="$OPTARG"
			;;
		?) 	
			usage
			;;
	esac
done

log "Generating a password"

PASSWORD=$(date +%s%N${RANDOM}${RANDOM}|sha256sum|head -c${LENGTH})

# Apend a special character if requested to do so.
if [[ "${USE_SPECIAL_CHARACTER}" = "true" ]]
	then
	log "Selecting special character"
	SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+'|fold -w1|shuf|head -c1)
	PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
	fi

log "Done."
log "Here is the password:"
# Display the password (Using echo because we want to display the password to screen no matter if verbose mode is on or not.)
echo "${PASSWORD}"
exit 0

