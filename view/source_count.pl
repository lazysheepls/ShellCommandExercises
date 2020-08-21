#!/usr/bin/perl -w
use strict;

for my $file (glob("*.[ch]")){
    my @lines = ();
    open my $fh, "<", $file;
        @lines = (<$fh>);
    close $fh;

    my $num_lines = 0;
    while(@lines){
        shift @lines;
        $num_lines += 1;
    }

    printf "%7d %s\n",$num_lines,$file;
}