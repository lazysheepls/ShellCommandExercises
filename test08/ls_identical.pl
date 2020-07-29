#!/usr/bin/perl

use strict;
use warnings;

my $dir1 = $ARGV[0];
my $dir2 = $ARGV[1];
my @files_in_dir1 = ();
my @files_in_dir2 = ();

# use glob() is better
@files_in_dir1 = glob("$dir1/*");
@files_in_dir2 = glob("$dir2/*");

for my $file (@files_in_dir1){
    # get file names
    $file =~ s/$dir1\///g;

    my $is_file_exist = 0;
    for my $search_file (@files_in_dir2){
        $search_file =~ s/$dir2\///g;

        if ($file eq $search_file){
            $is_file_exist = 1;
            last;
        }
    }
    next if ($is_file_exist == 0);
    # print "$file is $is_file_exist\n";

    my @content1 = ();
    my @content2 = ();
    open my $fh1, "<", "$dir1/$file";
        @content1 = <$fh1>;
    close $fh1;

    open my $fh2, "<", "$dir2/$file";
        @content2 = <$fh2>;
    close $fh2;

    # compare content of two files
    next if ($#content1 != $#content2);

    my $is_content_same = 1;
    for (my $i = 0; $i <= $#content1; $i++){
        my $status = $content1[$i] cmp $content2[$i];
        if ($status != 0){
            $is_content_same = 0;
            last;
        }
    }
    if ($is_content_same == 1){
        print $file, "\n";
    }
}