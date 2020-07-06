#!/bin/sh
file_name=$1

#init
flag=0
counter=0

#Find backup file name
while [ $flag -ne 1 ]
do
    if [ -e ".$file_name.$counter" ]
    then
        counter=$(($counter+1))
    else
        flag=1 #new name found for the backup file
        cp $file_name ".$file_name.$counter"
        echo "Backup of '$file_name' saved as '.$file_name.$counter'"
    fi
done