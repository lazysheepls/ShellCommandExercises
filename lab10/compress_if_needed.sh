#!/bin/sh

for file in "$@"
do
    size_before=`ls -l $file | cut -d " " -f5`
    xz -qk $file
    size_after=`ls -l $file.xz | cut -d " " -f5`

    if test $size_after -lt $size_before
    then
        echo "$file $size_before bytes, compresses to $size_after bytes, compressed"
        rm $file
    else
        echo "$file $size_before bytes, compresses to $size_after bytes, left uncompressed"
        rm "$file.xz"
    fi
done