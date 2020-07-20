#!/usr/bin/perl -w
use strict;
use warnings;

my $total_number_of_words = 0;
while (<>){
    my @words_in_line = split /[^a-zA-Z]/,$_;
    # remove spaces from list
    for my $word (@words_in_line){
        if ($word =~ /^[a-zA-Z]+$/){
            $total_number_of_words++;
        }
    }
}
print $total_number_of_words, " words\n";