#!/bin/sh

for file in "$@"
do
    name=`echo $file | sed "s/\.gz//g"`
    echo "===== $name ====="
    if test -e $file
    then
        zcat $file
        echo 
    else
        echo "No such file: $file"
    fi
done