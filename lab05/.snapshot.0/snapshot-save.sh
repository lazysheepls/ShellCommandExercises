#!/bin/dash

#init
flag=0
counter=0
snapshot=0

#Create folder
while [ $flag != 1 ]
do
    snapshot=".snapshot.$counter"
    if [ -e $snapshot ]
    then
        counter=`expr $counter + 1`
    else
        flag=1 #new snapshot folder name found
        `mkdir $snapshot`
    fi
done

#Copy files to folder
for file in *.*
do
    if [ `echo $file|grep -v "^\."|grep -v "snapshot-[load|save]"` ]
    then
        cp $file $snapshot
    fi
done

echo "Creating snapshot $counter"