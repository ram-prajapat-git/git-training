#!/bin/bash
#set -x
# This function sends a message to syslog and standard output if VERBOSE is true.
log() {
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = "true" ]]
	then
	echo "${MESSAGE}"
	fi
	logger -t $(basename "${0}") ${MESSAGE}
}

backup_file() {
# This function creates a backup of a file. Returns non-zero status on error.
	local FILE="${1}"

# Make sure the file exists.
	if [[ -f "${FILE}" ]]
	then
	local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
	log "Backing up ${FILE} to ${BACKUP_FILE}"
# The exit status of the function will be the exit status of the cp command.
	cp -p ${FILE} ${BACKUP_FILE}
# The file doesn't exist so return a non-zero exit status.
	else
	return 1
	fi
}
# Make a decision based on the exit status of the function.
decision() {
	if [[ "${?}" -eq 0 ]]
	then
	log "Backup succeeded"
	else
	log "Backup Failed"
	fi
}

#read -p "Enter the file to backup: " INP
readonly VERBOSE="true"
log "Hello!"
log "Have Fun!"
backup_file "${1}"
backup_file "${2}"
decision
