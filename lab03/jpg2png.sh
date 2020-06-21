#!/bin/sh

# filter out .jpg files
for jpgFile in *.jpg
do
    # Get png file name
    pngFile=`echo $jpgFile | sed {s/.jpg$/.png/g}`

    # Check if file.png already exist
    if [ -f "$pngFile" ]
    then
        echo "$pngFile already exists"
        exit 1
    fi
done

# if you reach this point, all files in the current folder are valid
for jpgFile in *.jpg
do
   # Get png file name
    pngFile=`echo $jpgFile | sed {s/.jpg$/.png/g}`

    # convert file
    `convert "$jpgFile" "$pngFile"`
    `rm "$jpgFile"`
done