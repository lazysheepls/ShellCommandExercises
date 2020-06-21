#!/bin/sh

for file in $@
do
    for header in `cat "$file" | egrep "#include \"" | cut -d' ' -f2 | sed {s/\"//g}`
    do
        if ! [ -e $header ] 
        then
            echo "$header" included into "$file" does not exist
        fi
    done
done