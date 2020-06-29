#!/usr/bin/perl -w
use strict;
use warnings;

my $nth = $ARGV[0];
my $file_name = $ARGV[1];
my $counter = 1;

open my $fh, "<", $file_name;
    my @lines = <$fh>;
    if ($nth > @lines){
        print("");
        exit;
    }
    while ($counter < $nth){
        shift @lines;
        $counter++;
    }
    print($lines[0]);
close $fh;