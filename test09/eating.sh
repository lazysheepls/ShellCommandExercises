#!/bin/sh
json_file=$1

egrep name $json_file | cut -d":" -f2 | cut -d "," -f1 | sed s/\"//g | sed s/^[[:blank:]]*// | sort | uniq