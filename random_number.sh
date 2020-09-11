#!/bin/bash

# This scrip is for generating sequencial numbers from the passed number.

read -p "Enter the number: " NUMBER

while [[ ${NUMBER} -gt 0 ]]
do
echo $NUMBER
NUMBER=`expr $NUMBER - 1`
done
