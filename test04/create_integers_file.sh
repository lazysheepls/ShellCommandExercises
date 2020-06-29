#!/bin/sh
start=$1
end=$2
file_name=$3

# echo $start
# echo $end
# echo $file_name

touch $file_name

counter=$start
while [ $counter -le $end ]
do
    echo $counter >> $file_name
    counter=$(($counter+1))
done