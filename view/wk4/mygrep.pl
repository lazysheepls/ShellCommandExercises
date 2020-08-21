#!/usr/bin/perl
use strict;
use warnings;

my $pattern = shift @ARGV;

while(<>){
    print if /$pattern/;
}