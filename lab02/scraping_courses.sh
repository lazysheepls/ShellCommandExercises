#!/bin/sh

# Generate base url
underGradUrl="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=O"
postGradUrl=`echo $underGradUrl | sed "s/Under/Post/"`
#echo $postGradUrl

# Add Course filter to url
filterChar=`echo $1 | cut -c1`
#echo $filterChar

underGradUrl=`echo $underGradUrl | sed "s/[A-Z]$/$filterChar/"`
postGradUrl=`echo $postGradUrl | sed "s/[A-Z]$/$filterChar/"`
#echo $underGradUrl
#echo $postGradUrl

# grab web page
curl --silent "$underGradUrl" "$postGradUrl" | egrep "$1[0-9]+.html" | sed "s/.*2018\///" | sed "s/.html\">/ /" | sed "s/ *<.*>$//" | sort | uniq