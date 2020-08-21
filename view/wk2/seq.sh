#!/bin/sh

if test $# -eq 1
then
    counter=1
    while test $counter -le $1
    do
        echo $counter
        counter=$(($counter + 1))
    done
fi

if test $# -eq 2
then
    counter=$1
    while test $counter -le $2
    do
        echo $counter
        counter=$(($counter + 1))
    done
fi

if test $# -eq 3
then
    counter=$1
    while [ $counter -lt $3 ]
    do
        echo $counter
        counter=$(($counter + $2))
    done
fi

# another way using for loop
if test $# -eq 3
then
    for (( counter = $1; counter <= $3; counter += $2))
    do
        echo $counter
    done
fi