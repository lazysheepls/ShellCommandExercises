#!/usr/bin/perl

use strict;
use warnings;

my $number_of_lines = 10;

if (@ARGV){
    $ARGV[0] =~ s/\-//g;
    $number_of_lines = $ARGV[0];
}

my @lines = <STDIN>;
my $counter = 0;
while(@lines){
    my $line = shift @lines;
    print $line;
    $counter = $counter + 1;
    if ($counter >= $number_of_lines){
        last;
    }
}