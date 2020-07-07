#!/usr/bin/perl -w

use strict;
use warnings;

my @lines = <STDIN>;
chomp(@lines);
foreach my $line (@lines){
    my @words = split(" ", $line);
    my @sorted_words = sort @words;
    my $sorted_line = join " ", @sorted_words;
    print($sorted_line,"\n");
}