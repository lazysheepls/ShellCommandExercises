#!/usr/bin/perl -w
use strict;

my @lines = <STDIN>;

for my $line (@lines){
    (my $uid, my $mark) = split /\s/, $line;
    print "$uid ";
    
    if ($mark !~ /^\d+$/){
        print "?? ($mark)\n";
    }
    elsif ($mark > 100){
        print "?? ($mark)\n";
    }
    elsif ($mark >= 75){
        print("HD\n");
    }
    elsif ($mark >= 65){
        print "CR\n";
    }
    elsif ($mark >=50){
        print "PS\n";
    }
    else {
        print "FL\n";
    }
}