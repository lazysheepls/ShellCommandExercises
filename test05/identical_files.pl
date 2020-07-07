#!/usr/bin/perl -w

use strict;
use warnings;

#Check number of arguements is bigger than 2
if (@ARGV < 2){
    die "Usage: ./identical_files.pl <files>\n";
}

#Get content of the base file
my @base_content = ();
open my $base_fh, "<", $ARGV[0];
    @base_content = <$base_fh>;
close $base_fh;

#Loop from 2nd to last file
for(my $i = 1; $i<@ARGV; $i++){
    #Get content of the compared file
    my @cmp_content = ();
    open my $cmp_fh, "<", $ARGV[$i];
        @cmp_content = <$cmp_fh>;
    close $cmp_fh;

    #Compare to base line by line
    # different number of lines
    @base_content == @cmp_content or die "$ARGV[$i] is not identical\n";

    for(my $k = 0; $k < @base_content; $k++){
        $base_content[$k] == $cmp_content[$k] or die "$ARGV[$i] is not identical\n";
    }
}

print ("All files are identical\n");