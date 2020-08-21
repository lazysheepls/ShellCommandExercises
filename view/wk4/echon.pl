#!/usr/bin/perl -w

if ($#ARGV+1 != 2){
    print "Usage: $0 <number of lines> <string>\n";
    exit 1;
}

if ($ARGV[0] !~ /^[0-9]+$/){
    print "Usage: $0 <number of lines> <string>\n";
    exit 1;
}

for (my $i=0;$i<$ARGV[0];$i++){
    print $ARGV[1],"\n";
}