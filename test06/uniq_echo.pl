#!/usr/bin/perl -w
use strict;
use warnings;

# method 1
my @args = @ARGV;
my @uniq_args = ();
for my $arg (@args){
    my $arg_exist = 0;
    for my $uniq_arg (@uniq_args){
        if ($uniq_arg eq $arg){
            $arg_exist = 1;
        }
    }
    if ($arg_exist == 0){
        push @uniq_args, $arg;
    }
}
my $output_str = join " ", @uniq_args;
print $output_str, "\n";

# method 2: use dictionary (exists)
# my @args = @ARGV;
# my %arg_counts = ();
# my @uniq_args = ();
# for my $arg (@args){
#     next if(exists($arg_counts{$arg}));
#     $arg_counts{$arg} = 1;
#     push @uniq_args, $arg;
# }
# my $output_str = join " ",@uniq_args;
# print "$output_str\n";