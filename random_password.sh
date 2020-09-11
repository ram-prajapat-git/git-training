#!/bin/bash

# This scrip will be used to generate random passwords.

# Generate random password.
PASSWORD=${RANDOM}
echo "${PASSWORD}"

#Create some better password
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Even better password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

#More complex
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# Further complex using sha256sum command
PASSWORD="$(date +%s%N| sha256sum | head -c32 )"
echo "${PASSWORD}"

# More and more complex
PASSWORD="$(date +%s%N${RANDOM}${RANDOM}| sha256sum |head -c48)"
SPECIAL_CHARACTER="$(echo "!@#$%^&*()_+" |fold -w1|shuf|head -c1)"
echo "${PASSWORD}${SPECIAL_CHARACTER}"
