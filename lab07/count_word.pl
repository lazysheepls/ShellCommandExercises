#!/usr/bin/perl -w
use strict;
use warnings;

my $word_to_count = $ARGV[0];
my $number_of_occurance = 0;
while (<STDIN>){
    my @words_in_line = split /[^a-zA-Z]/,$_;
    for my $word (@words_in_line){
        if (lc($word) eq lc($word_to_count)){
            $number_of_occurance++;
        }
    }
}
print "$word_to_count occurred $number_of_occurance times\n";