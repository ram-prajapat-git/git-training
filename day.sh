#!/bin/bash
while true
do
read -p "Enter the value: " day

case $day in

1)  echo "Monday"
    ;;
2)  echo  "Tuesday"
    ;;
3)  echo  "Wednesday"
    ;;

4)  echo "Thursday"
    ;;
5)  echo "Friday"
    ;;
6)  echo "Saturday"
    ;;
7) echo  "Sunday"
   ;;
*) echo "please enter valid day"
   exit 1
   ;;
esac
done
