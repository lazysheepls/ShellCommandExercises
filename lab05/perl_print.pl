#!/usr/bin/perl -w

use strict;
use warnings;

# send program to pipeline
print "#!/usr/bin/perl -w\n";
print "print ";
print "\"";
# convert char to ascii
my @chars = split(//,$ARGV[0]);
for(my $i = 0; $i < @chars; $i++){
    $chars[$i] = ord($chars[$i]);
    printf "\\x%02x", $chars[$i];
}
print "\n\";\n";