#!/bin/dash
#Get user input
nth=$1
snapshot=".snapshot.$nth"

#Create a new snapshot for current dir
snapshot-save.sh

for file in "$snapshot/*"
do
    # echo $file
    cp -f $file .
done

echo "Restoring snapshot $nth"