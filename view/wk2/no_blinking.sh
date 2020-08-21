#!/bin/sh

for file in *.html
do
    if egrep -iw "</?blink>" $file >dev/null
    then
        rm "$file"
    fi
done