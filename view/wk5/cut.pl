#!/usr/bin/perl -w
use strict;

my $start = $ARGV[0] - 1;
my $end = $ARGV[1] - 1;
my $file = $ARGV[2];
my @lines = ();
open my $fh, "<", $file;
    @lines = <$fh>;
close $fh;

while(@lines){
    my $line = shift @lines;
    my @characters = split //,$line;
    print @characters[$start..$end],"\n";
}
