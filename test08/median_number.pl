#!/usr/bin/perl
use strict;
use warnings;

my @numbers = @ARGV;

@numbers = sort { $a <=> $b } @numbers;

my $medium_location = int($#ARGV / 2);
print $numbers[$medium_location],"\n";