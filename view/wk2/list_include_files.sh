#!/bin/sh

for file in *.c
do
    echo "$file includes:"
    include_files=`cat $file | egrep "#include" | cut -d' ' -f2 | egrep -o "[^<>\"]+(\.h|\.c)"`
    for inc_file in ${include_files[*]} # note: this is to print all items in array
    do
        echo -n "   "
        echo $inc_file
    done
done