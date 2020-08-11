#!/bin/sh

for url in "$@"
do
    software=`curl -sI $url | grep -i "server:" | cut -d ":" -f2`
    echo "$url$software"
done