#!/usr/bin/perl -w
use strict;
use warnings;

#init
my $flag = 0;
my $counter = 0;
my $snapshot = "";
sub save(){
    while($flag != 1){
        $snapshot = ".snapshot.$counter";
        if(-d $snapshot){
            $counter++;
        }else{
            $flag = 1;
            mkdir $snapshot;

            # you can also use glob( $dir . '/*' );
            opendir my $cur_dir, "./";
                my @files = readdir $cur_dir;
                foreach my $file (@files){
                    # ignore files
                    if ($file =~ "snapshot.pl"){
                        next;
                    }
                    if ($file =~ /^\./){
                        next;
                    }

                    # copy and past files
                    open my $read, "<", $file;
                        open my $write, ">", "$snapshot/$file";
                            my @content = <$read>;
                            print $write @content;
                        close $write;
                    close $read;
                }
            closedir $cur_dir;
            print "Creating snapshot $counter\n";
        }
    }
}

sub load(){
    save();
    my @files = glob("\.snapshot.$ARGV[1]/*");
    foreach my $file (@files){
        open my $read, "<", $file;
            my $restored_file = $file;
            $restored_file =~ s/.snapshot.$ARGV[1]\///g;
            if ($restored_file =~ /^\./){
                next;
            }
            if ($restored_file =~ /snapshot.pl/){
                next;
            }
            my @content = <$read>;
            open my $write, ">", $restored_file;
                print $write @content;
            close $write;
        close $read;
    }
    print "Restoring snapshot $ARGV[1]\n";
}

if($ARGV[0] eq "save"){
    save();
}

if($ARGV[0] eq "load"){
    load();
}