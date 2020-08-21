#!/bin/sh

for i in `seq $1`
do
    if test $i -eq 1
    then
        continue #not prime
    fi
    is_prime=1
    for ((cn=2;cn<i;cn++))
    do
        if test $(($i % $cn)) -eq 0
        then
            is_prime=0
            break
        fi
    done

    if test $is_prime -eq 1
    then
        echo "$i"
    fi
done