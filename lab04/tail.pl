#!/usr/bin/perl -w
use strict;
use warnings;

my $tail_number = 10; #default value
if (@ARGV == 0) { #read from stdin
    my @lines = <>;
    while(@lines > $tail_number){ # removes lines in front, until the last -n lines
        shift @lines;
    }

    for(@lines){ # print last -n lines
        print($_);
    }
} else {
    if($ARGV[0] =~ /^-[0-9]+$/){# tail number exist
        # print "found -n\n";
        $tail_number = $ARGV[0];
        $tail_number =~ s/^-([0-9]+)$/$1/;
        shift @ARGV #remove -n from the arguement list
        # print "$tail_number\n"
    }

    for(@ARGV){
        my @lines = (); # note: this is a list, not a scalar variable
        open my $fh, "<", $_ or die "./tail.pl: can't open $_\n";
            @lines = <$fh>;
        close $fh;

        if(@ARGV > 1) { # more than one file
            print("==> $_ <==\n");
        }

        while(@lines > $tail_number){ # removes lines in front, until the last -n lines
            shift @lines;
        }

        for(@lines){ # print last -n lines
            print($_);
        }
    }
}