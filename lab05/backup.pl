#!/usr/bin/perl -w
use strict;
use warnings;

#init
my $flag = 0;
my $counter = 0;
my $file_name = $ARGV[0];
my @content;

while($flag != 1){
    my $backup_file_name = ".$file_name.$counter";
    
    if(-e $backup_file_name){
        $counter++;
    } 
    else 
    {
        $flag = 1;
        #copy content
        open(my $read, "<", $file_name);
            @content = <$read>;
            #paste content
            open(my $write, ">", $backup_file_name);
                print $write @content;
                print "Backup of '$file_name' saved as '$backup_file_name'\n";
            close($write);
        close($read);
    }
}