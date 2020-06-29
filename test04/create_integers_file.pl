#!/usr/bin/perl -w
use strict;
use warnings;

my $start = 0;
my $end = 0;
my $file_name = 0;

$start = $ARGV[0];
$end = $ARGV[1];
$file_name = $ARGV[2];

my $counter = $start;
open my $fh, ">", $file_name;
    while($counter <= $end){
        print $fh "$counter\n";
        $counter++;
    }
close $fh;