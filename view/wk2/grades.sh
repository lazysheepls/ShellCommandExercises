#!/bin/sh

while read sid mark other
do
    echo -n "$sid "
    if echo $mark | egrep "^[0-9]|[1-9][0-9]|[1-9][0-9]{2}$" >/dev/null
    then
        if test $mark -lt 50
        then
            echo "FL"
        elif test $mark -lt 65
        then
            echo "PS"
        elif test $mark -lt 75
        then
            echo "CR"
        elif test $mark -le 100
        then
            echo "HD"
        else
            echo "?? ($mark)"
        fi
    else
        echo "?? ($mark)"
    fi
done