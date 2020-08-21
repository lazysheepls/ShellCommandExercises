#!/usr/bin/perl

use strict;
use warnings;

my @lines = <STDIN>;

while (@lines) {
    my $line = shift @lines;
    $line =~ s/[1-4]/</g;
    $line =~ s/[6-9]/>/g;
    print $line;
}