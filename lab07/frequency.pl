#!/usr/bin/perl -w
use strict;
use warnings;

# hash table to store artist name and frequency
my $word_to_count = $ARGV[0];

foreach my $file (glob "lyrics/*.txt"){
    # get artist name
    my $artist_name = $file;
    $artist_name =~ s/lyrics\///g;
    $artist_name =~ s/_/ /g;
    $artist_name =~ s/.txt//g;

    # get all words in the song
    my $total_number_of_words = 0;
    my $number_of_occurance = 0;
    open my $fh, "<", $file;
        while(<$fh>){
            my @words_in_line = split /[^a-zA-Z]/, $_;
            my @words_with_no_space = ();
            for my $word (@words_in_line){
                if ($word =~ /^[a-zA-Z]+$/){
                    $total_number_of_words++;
                }
                if (lc($word) eq lc($word_to_count)){
                    $number_of_occurance++;
                }
            }
        }
    close $fh;

    my $frequency = $number_of_occurance/$total_number_of_words;
    printf "%4d/%6d = %.9f %s\n", $number_of_occurance, $total_number_of_words, $frequency, $artist_name;
}
