#!/bin/sh

if test $# -ne 2
then
    echo "Usage: $0 <number of lines> <string>"
    exit 1
elif ! echo $1 | egrep "^[0-9]+$" >/dev/null
then
    echo "argument 1 must be a non-negative integer"
    exit 1
fi

for (( i=0;i<$1;i+=1 ))
do
    echo $2
done

