#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $course_prefix = $ARGV[0];

my $url = "http://www.timetable.unsw.edu.au/current/${course_prefix}KENS.html";
my $web_page = get($url) or die "Unable to get $url";
my @lines = split "\n", $web_page;
my @filterd_lines = ();

for my $line (@lines){
    if ($line =~ /$course_prefix/){
        next if ($line =~ /$course_prefix\S+.html\">$course_prefix/);
        push @filterd_lines, $line;
    }
}

my @course_list = ();
for my $filterd_line (@filterd_lines){
    $filterd_line =~ /($course_prefix\d+).html\">(.*)<\/a/;
    my $course_code = $1;
    my $course_name = $2;
    my $course_str = join " ", $course_code, $course_name;
    push @course_list, $course_str;

    # print "$course_str\n";
}

@course_list = sort @course_list;
my %seen_dict = ();
my @clean_course_list = ();

# initialize the seen dictionary
for my $init_course (@course_list){
    $seen_dict{$init_course} = 0;
}

for my $course (@course_list){
    if ($seen_dict{$course} != 1){
        push @clean_course_list,$course;
        $seen_dict{$course} = 1;
    }
}

for my $clean_course (@clean_course_list){
    print $clean_course, "\n";
}
