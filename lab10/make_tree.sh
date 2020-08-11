#!/bin/sh
root_dir=`pwd`
required_dir=$1
shift
build_options=$@

for file in `find "$required_dir"`
do
    if echo $file | grep -q "Makefile"
    then
        make_dir=`echo $file | sed s@\/Makefile@@g`
        echo "Running make in $make_dir"
        cd "$root_dir/$make_dir"
        make $build_options
    fi
done