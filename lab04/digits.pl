#!/usr/bin/perl -w
use strict;
use warnings;
my $line = 0;
while($line = <>) { # <> is the same as <STDIN>
    $line =~ s/[0-4]/</g;
    $line =~ s/[6-9]/>/g;
    print $line;
}