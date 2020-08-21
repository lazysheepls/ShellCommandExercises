#!/bin/sh

small="Small files:"
medium="Medium-sized files:"
large="large files:"

for file in *
do
    if echo $0 | egrep "$file" >/dev/null
    then
        continue
    fi
    
    file_size=`wc -l <$file`

    if test $file_size -lt 10
    then
        small="$small $file"
    elif test $file_size -lt 100
    then
        medium="$medium $file"
    else
        large="$large $file"
    fi
done

echo $small
echo $medium
echo $large