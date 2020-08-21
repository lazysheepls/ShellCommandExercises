#!/bin/sh

if test $1 -eq 1
then
    echo "$1 is not prime"
    exit 1;
elif test $1 -eq 2
then    
    echo "$1 is prime"
    exit 0
fi

for ((i=2;i<$1;i+=1))
do
    if test $(($1 % $i)) -eq 0
    then
        echo "$1 is not prime"
        exit 1
    fi
done

echo "$1 is prime"