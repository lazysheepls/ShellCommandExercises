#!/bin/sh
# Initialize output string
smallStr="Small files:"
midStr="Medium-sized files:"
largeStr="Large files:"

# Iterate through files in current directories
for filename in `ls`
do
    # get file size
    size=`cat $filename | wc -l`

    if [ "$size" -lt 10 ]
    then
        smallStr="$smallStr $filename"
    elif [ "$size" -lt 100 ]
    then
        midStr="$midStr $filename"
    else
        largeStr="$largeStr $filename"
    fi
done

# Output 
echo "$smallStr"
echo "$midStr"
echo "$largeStr"