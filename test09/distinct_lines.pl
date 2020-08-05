#!/usr/bin/perl

use warnings;
use strict;

my $required_num_uniq_lines = $ARGV[0];
my @raw_lines = ();
my @uniq_lines = ();

while(<STDIN>){
    my $line = $_;
    $line =~ s/\s+//g;
    $line = lc($line);
    push @raw_lines, $line;
    if(is_line_uniq($line)){
        push @uniq_lines, $line;
        my $number_of_uniq_lines = $#uniq_lines + 1;
        my $num_of_raw_lines = $#raw_lines + 1;
        if ($number_of_uniq_lines >= $required_num_uniq_lines){
            print "$required_num_uniq_lines distinct lines seen after $num_of_raw_lines lines read.\n";
            exit;
        }
    }
}

my $num_of_raw_lines = $#raw_lines + 1;
print "End of input reached after $num_of_raw_lines lines read - $required_num_uniq_lines different lines not seen.\n";

sub is_line_uniq{
    my ($line) = @_;
    my $is_uniq = 1;
    for my $canidate_line (@uniq_lines){
        if ($line eq $canidate_line){
            $is_uniq = 0;
            last;
        }
    }
    return $is_uniq;
}