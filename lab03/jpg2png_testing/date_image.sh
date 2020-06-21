#!/bin/sh

# Get date and time
dateTime=`ls -l $1 | cut -d' ' -f6,7,8`

# Create temp file with label
convert -gravity south -pointsize 36 -draw "text 0,10 '$dateTime'" "$1" "temporary_file.jpg"

# Repalce orginal file with temp file
mv "temporary_file.jpg" $1