#!/usr/bin/perl
use strict;
use warnings;

sub is_char_a_vowel{
    my @vowels = ('a','e','i','o','u');
    my ($input_char) = @_;
    my ($char_to_compare) = lc($input_char);
    my $is_vowel = 0;
    for my $vowel (@vowels){
        if ($char_to_compare eq $vowel){
            $is_vowel = 1;
            last;
        }
    }
    return $is_vowel;
}

sub is_word_with_three_vowel{
    my($word) = @_;
    my @chars_in_word = split "",$word;
    my $is_consec_vowels_found = 0;
    my $vowel_counter = 0;
    for my $char (@chars_in_word){
        # incrase vowel counter or reset
        if(is_char_a_vowel($char)){
            $vowel_counter++;
        } else {
            $vowel_counter = 0;
        }

        # check if consec vowels found
        if ($vowel_counter >= 3){
            $is_consec_vowels_found = 1;
            # print("$word\n");
            last;
        }
    }
    return $is_consec_vowels_found;
}

# process user arguements
my @proved_words = ();
for my $arg (@ARGV){
    if(is_word_with_three_vowel($arg)){
        push @proved_words, $arg;
    }
}
my $output_str = join " ", @proved_words;
print $output_str,"\n";