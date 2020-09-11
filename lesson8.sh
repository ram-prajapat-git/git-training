#!/bin/bash
#set -x
# This script demonstrate I/O redirection.

# Redirect STDOUT to a file.
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}
# Redirect the STDIN to a program.
echo "1. STDIN to program."
read LINE < ${FILE}
echo "Content of LINE: ${LINE}"
# Redirect STDOUT to a file, overwriting the file.
echo
echo "2. STDOUT to a file, overwriting."
head -n2 /etc/passwd > ${FILE}
echo "Contents of $FILE:"
cat ${FILE}
# Redirect STDOUT to a file, appending to the file.
echo
echo "3. STDOUT to a file, Appending."
echo "${RANDOM}" >> ${FILE}
echo "${RANDOM}" >> ${FILE}
echo "Contents of ${FILE}:"
cat ${FILE}
# Redirect STDIN to a program, using File Descriptor 0.
echo
echo "4. STDIN to a program, FD 0"
read LINE 0< ${FILE}
echo "Content of LINE: ${LINE}"
# Redirect STDOUT to a file using FD 1, overwriting a file.
echo
echo "5. STDOUT to a file using FD 1, overwriting."
head -n3 /etc/passwd 1> ${FILE}
echo "Contents of ${FILE}:"
cat ${FILE}
# Redirect STDERR to a file using FD 2.
echo
echo "6. STDERR to a file using FD 2."
STD_ERR="/tmp/data.err"
head -n4 /etc/passwd /nofile 2> ${STD_ERR}
# Redirect STDOUT and STDERR to a file.
echo
echo "7. STDOUT & STDERR to a file."
head -n5 /etc/passwd /nofile &> ${FILE}
echo "Contents of ${FILE}:"
cat ${FILE}
# Redirect STDOUT and STDERR through a pipe.
echo
echo "8. STDOUT and STDERR through a pipe."
head -n6 /etc/passwd /nofile |& cat -n
# Send output to STDERR
echo
echo "9. Send output to STDERR"
echo
echo "This is standard Error!" >&2
# Discard STDOUT.
echo
echo "10. Discard STDOUT."
echo
echo "Output discarded"
head -n1 /etc/passwd > /dev/null
# Discard STDERR.
echo
echo "11. Discard STDERR."
echo
echo "Stadard Error discarded"
head -n1 /nofile 2> /dev/null
# Discard STDOUT & STDERR.
echo
echo "12. Discard STDOUT & STDERR."
echo
echo "Stadard output and error discarded."
head -n2 /etc/passwd /nofile &> /dev/null
# Clean up
echo
echo "13. Clean up."
echo
echo "Cleaning up the created files."
rm $FILE $STD_ERR 2> /dev/null
