#!/usr/bin/perl
use POSIX;

use warnings;
use strict;

my $main_c_filename = "";
my %dependencies = (); # a dictionary of list of h file

# find main in .c
for my $file (glob("*.c")){
    # create new entries in dipendencies
    @dependencies{"$file"} = ();

    # save file content
    my @content = ();
    open my $fh, "<", $file;
        @content = <$fh>;
    close $fh;
    
    # read content line by line and find main
    while(@content){
        my $line = shift @content;
        if ($line =~ /^\s*(int|void)\s*main\s*\(/){
            $main_c_filename = $file;
            last;
        }
    }
}

# find hearder file start from main.c
for my $c_file (keys %dependencies){
    find_hearder_file($c_file,$c_file);
}

# print make file
print_make_file();

sub find_hearder_file{
    my ($origin_file,$search_file) = @_;
    my @content = ();

    open my $fh, "<", $search_file;
        @content = <$fh>;
    close $fh;

    while (@content){
        my $line = shift @content;

        #find ".h" file
        if ($line =~ /#include\s+\"(\S+.h)\"/){
            my $header_file = $1;
            
            next if(is_header_file_exist($header_file,@{$dependencies{$origin_file}}));

            # update dependencies dictionary
            push @{$dependencies{$origin_file}}, $header_file;
            # update list of h files if h file does not exist before
            find_hearder_file($origin_file,$header_file);
        }
    }
}

sub is_header_file_exist{
    my ($file,@files) = @_;
    my $is_file_exist = 0;
    for my $candidate_file (@files){
        if ($file eq $candidate_file){
            $is_file_exist = 1;
            last;
        }
    }
    return $is_file_exist;
}

sub print_make_file{
    my $localtime = strftime "%a %d %b %R %Z %G", localtime();
    print "# Makefile generated at $localtime\n";
    print "\n";
    print "CC = gcc\n";
    print "CFLAGS = -Wall -g\n";
    print "\n";

    my $executable = $main_c_filename =~ s/\.c//r;
    print "$executable\:\t";

    my @o_files = ();
    for my $c_file (keys %dependencies){
        my $o_file = $c_file =~ s/\.c/\.o/r;
        push @o_files, $o_file;
    }
    print join(" ", @o_files), "\n";

    print "\t\$(CC) \$(CFLAGS) -o \$\@ ";
    print join(" ", @o_files), "\n";
    print "\n";

    for my $c_file (keys %dependencies){
        my @h_files = ();
        for my $h_file (@{$dependencies{$c_file}}){
            push @h_files, $h_file;
        }
        
        next unless (@h_files);
        my $o_file = $c_file =~ s/\.c/\.o/r;
        print "$o_file\:\t";
        
        my @h_and_c_files = (@h_files);
        push @h_and_c_files, $c_file;
        print join(" ", @h_and_c_files), "\n";
    }
}