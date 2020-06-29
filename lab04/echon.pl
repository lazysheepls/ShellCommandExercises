#!/usr/bin/perl -w
use strict;
use warnings;

@ARGV == 2 or die "Usage: ./echon.pl <number of lines> <string>\n";
$ARGV[0] =~ /^[0-9]+/ or die "./echon.pl: argument 1 must be a non-negative integer\n";

# for loop ver 1 (C style)
# for (my $i=0;$i<$ARGV[0];$i++){
#     print "$ARGV[1]\n";
# }

# for loop ver 2 (use list)
my @numbers = (1..$ARGV[0]);
for(@numbers){
    print("$ARGV[1]","\n");
}