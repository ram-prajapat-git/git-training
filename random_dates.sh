#!/bin/bash

# This script is to generate dates in sequence from past.

read -p "Please enter the number of days: " DAY

while [[ ${DAY} -gt 0 ]]
do
DATE=`date "+%d%m%Y" --date "${DAY} day ago"`
echo ${DATE}
DAY=`expr ${DAY} - 1`	
done
