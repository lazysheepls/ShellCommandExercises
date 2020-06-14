#!/bin/sh

# $1 is integer $2 is string

# Check number of arguements
if [ "$#" != 2 ]
then
    echo "Usage: ./echon.sh <number of lines> <string>"
    exit 1
fi

# Check 1st arguement should be int
if [[ ! "$1" =~ ^[0-9]+$ ]]
then
    echo "./echon.sh: argument 1 must be a non-negative integer"
    exit 1
fi

# echo $1 times
for (( i = 0; i < "$1"; i++ ))
do
    echo "$2"
done
exit 0