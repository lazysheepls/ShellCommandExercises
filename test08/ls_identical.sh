#!/bin/sh
dir1=$1
dir2=$2

for file1 in "$dir1/"*
do
    # echo "File -> $file1"
    file1=`echo "$file1"|sed "s/$dir1\///g"`
    # echo $file1
    for file2 in "$dir2/"*
    do
        file2=`echo "$file2"|sed "s/$dir2\///g"`
        # echo $file2
        if [ "$file1" = "$file2" ]
        then
            # echo $file1
            `cmp -s "$dir1/$file1" "$dir2/$file2"`
            if [ $? -eq 0 ]
            then
                echo "$file1"
            fi
        fi
    done
done