#!/bin/bash
# Author: Nigel Byrne 20058969
# Description: This script asks the user to enter employee name and then it returns the requested employees wages
 
echo -n -e  "Welcome to the wageBot!!  Here are the employees on record\n\n"
 
awk '{print $2}' employee.txt
 
while true; do
        echo -n -e  "\n  Please enter one name and I will return their wages:\n  (type exit to quit the bot)\n\n" 
        read  employeeName
        
        if [ -z "$employeeName" ]; then
                echo -e  "\nno name entered please try again"
        elif [ "$employeeName" == "exit" ]; then
                echo -e "\n  thank you for using wageBot goodbye!!"
                break
        else
                searchResult=$(grep -i "$employeeName" ~/employee.txt)
 
                if [ -z "$searchResult" ]; then
                        echo -e "\nno record for ${employeeName} exists please try again!"
                else
                        wages=$(echo "$searchResult" | awk '{print $NF}')
        
                        echo -e "\nThe wages for ${employeeName} are: ${wages}"
                fi
        fi
done
