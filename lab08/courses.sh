#!/bin/dash
course_prefix=$1

# get timetable from web
curl --location --silent http://www.timetable.unsw.edu.au/current/"$course_prefix"KENS.html | grep "$course_prefix" | grep -vP "href=\"\S+.html\">"$course_prefix"\S*<\/a>" | sed s/"^.*a href=\""//g | sed s/".html\">"/" "/g | sed s/"<\/a.*$"//g | sort | uniq -w8