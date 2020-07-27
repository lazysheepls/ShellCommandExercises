#!/usr/bin/perl

use strict;
use warnings;

my @lines = ();
my $line_number = -1; # start from 0
my %max_number_in_lines = ();
while(<STDIN>){
    # get stdin line
    my $line = $_;
    push @lines, $line;
    $line_number++;
    # get number(s) from line
    my @words = split /\s+/, $line;
    my @numbers_in_line = ();
    foreach my $word (@words){
        if($word =~ /(-?[0-9]*\.?[0-9]+)/){
            # print $word,"\n";
            push @numbers_in_line, $1;
        }
    }
    # get max number from numbers in this line
    my @descent_sort_numbers_in_line = ();
    @descent_sort_numbers_in_line = sort {$b <=> $a} @numbers_in_line;
    
    if (@descent_sort_numbers_in_line){
        # format {line number}:{max number of the line}
        $max_number_in_lines{$line_number} = $descent_sort_numbers_in_line[0];
    }
}

# find max numbers from all lines
my @local_max_numbers = ();
foreach my $line (keys %max_number_in_lines){
    push @local_max_numbers, $max_number_in_lines{$line};
}

if (@local_max_numbers){
    my @sorted_local_max_numbers = sort {$b <=> $a} @local_max_numbers;
    my $global_max_number = $sorted_local_max_numbers[0];
    
    # find lines with the global max numbers
    my @output_lines = ();
    foreach my $line (sort keys %max_number_in_lines){
        if ($max_number_in_lines{$line} == $global_max_number){
            push @output_lines, $lines[$line];
        }
    }
    # print filterd lines
    print @output_lines;
}
