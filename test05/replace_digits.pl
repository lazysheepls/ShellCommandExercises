#!/usr/bin/perl -w
use strict;
use warnings;

my @content = ();
my @new_content = ();

open my $read, "<", $ARGV[0];
    @content = <$read>;
close $read;

foreach my $line (@content){
    $line =~ s/([0-9])/#/g;
    push @new_content,$line;
}

open my $write, ">", $ARGV[0];
    foreach my $line (@new_content){
        print $write $line;
    }
close $write;