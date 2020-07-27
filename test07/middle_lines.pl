#!/usr/bin/perl

use strict;
use warnings;

my $file = $ARGV[0];
my @lines = ();
open my $fh, '<', $file;
    @lines = <$fh>;
close $fh;

my $number_of_lines = $#lines + 1;

if ($number_of_lines == 0){
    # do nothing
} elsif ($number_of_lines % 2 == 0){
    #even
    my $line1 = int($number_of_lines / 2) - 1;
    my $line2 = int($number_of_lines / 2);
    print $lines[$line1];
    print $lines[$line2];
} else {
    #odd
    my $line1 = int($number_of_lines / 2);
    print $lines[$line1];
}
