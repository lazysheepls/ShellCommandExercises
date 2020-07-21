#!/usr/bin/perl -w
use strict;
use warnings;

my $number_of_times = $ARGV[0];
my %input = ();
# print($number_of_times);

while (<STDIN>){
    my $line = $_;
    chomp $line;    
    if (exists($input{$line})){
        $input{$line}++;
    } else {
        $input{$line} = 1;
    }
    # print "echo line: $line, occurance $input{$line} \n";

    foreach my $saved_line (keys %input){
        if ($input{$saved_line} == $number_of_times){
            print "Snap: $saved_line\n";
            exit;
        }
    }
}