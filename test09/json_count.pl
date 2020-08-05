#!/usr/bin/perl

use warnings;
use strict;

my $species_name = $ARGV[0];
my $json_file = $ARGV[1];
my $count = 0;
my $how_many = 0;

open my $fh, "<", $json_file;
    while(<$fh>){
        if ($_ =~ /how_many\"\: (.*),/){
            $how_many = $1;
        }

        if ($_ =~ /species\"\: \"(.*)\"/){
            if ($1 eq $species_name){
                $count = $count + $how_many;
            }
        }
    }
close $fh;

print $count,"\n"
