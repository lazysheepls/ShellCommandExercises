#!/usr/bin/perl -w

my $number_of_lines = 10;
my $counter = 0;

if (@ARGV){
    # from ARGV
    if ($ARGV[0] =~ /-(\d+)/){
        $number_of_lines = $1;
        shift @ARGV;
    }

    my $is_print_file_name = @ARGV > 1;

    while(@ARGV){
        my $file = shift @ARGV;
        my @lines = ();
        open $fh, "<", $file;
            @lines = <$fh>;
        close $fh;

        print "==> $file <==\n" if $is_print_file_name;

        my $first_line = @lines - $number_of_lines;
        $first_line = 0 if $first_line < 0;

        print @lines[$first_line..$#lines];
    }
} else {
    my @lines = <>;
    
    my $first_line = @lines - $number_of_lines;
    $first_line = 0 if $first_line < 0;

    print @lines[$first_line..$#lines];
}

