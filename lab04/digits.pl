#!/usr/bin/perl -w
use strict;
use warnings;
while(<>) { # <> is the same as <STDIN>
    my $new_line = $_; # var must init and declared before use
    $new_line =~ s/[0-4]/</g;
    $new_line =~ s/[6-9]/>/g;
    print $new_line;
}