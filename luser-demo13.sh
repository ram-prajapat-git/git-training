#!/bin/bash

# This script shows the open ports on a system.
# Use -4 as an argument to limit to tcpv4 ports.

#if [[ "${1}" = "-4" ]]
#then
netstat -nutl ${1} |grep ':'|awk '{print $4}'|awk -F ':' '{print $NF}'
#else
# echo "Give correct argument (i.e -4)."
#fi
