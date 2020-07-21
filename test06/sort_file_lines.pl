#!/usr/bin/perl -w
use strict;
use warnings;

my @lines = ();
my @sorted_lines = ();
sub sort_by_length{
    return length $a <=> length $b || $a cmp $b;  # <=> numeric compare, cmp string compare
}

open my $fh, "<", $ARGV[0];
    @lines = <$fh>;
close $fh;

@sorted_lines = sort sort_by_length @lines;

print @sorted_lines;
