#!/bin/sh

egrep "COMP[29]041" $1| cut -d'|' -f3 | cut -d' ' -f2 | sort | uniq -c | sort | tail -n1 | egrep -o "[A-Za-z]+"