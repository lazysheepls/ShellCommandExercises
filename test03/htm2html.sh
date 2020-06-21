#!/bin/sh

for htm in *.htm
do
    html=`echo "$htm" | sed {s/.htm$/.html/g}`

    if [ -e "$html" ]
    then
        echo "$html" exists
        exit 1
    fi

    mv "$htm" "$html"
done