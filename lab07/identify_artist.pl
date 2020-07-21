#!/usr/bin/perl -w
use strict;
use warnings;

# 0 - process input arguements
my $number_of_arguements = $#ARGV + 1;

# mode selection
my $is_debug_mode = 0;
if ($number_of_arguements >= 1){
    if ($ARGV[0] eq "-d"){
        $is_debug_mode = 1;
    }
}

# 1 - get all artist and their words
my %artist_words = ();
foreach my $file (glob "lyrics/*.txt"){
    # get artist name
    my $artist_name = $file;
    $artist_name =~ s/lyrics\///g;
    $artist_name =~ s/_/ /g;
    $artist_name =~ s/.txt//g;

    # intialize list in dict for this artist
    @artist_words{$artist_name} = ();

    # get all words in the song
    open my $fh, "<", $file;
        while(<$fh>){
            my @words_in_line = split /[^a-zA-Z]/, $_;
            for my $word (@words_in_line){
                if ($word =~ /^[a-zA-Z]+$/){
                    push @{$artist_words{$artist_name}}, $word;
                }
            }
        }
    close $fh;
}

#####################
# sub functions
sub get_word_in_song{
    # get parameters
    my ($one_line_lyrics) = @_;
    # get words from string
    my @words = split /[^a-zA-Z]/, $one_line_lyrics;
    # filter words and remove white spaces
    my @words_clean = ();
    for my $word (@words){
        if ($word =~ /^[a-zA-Z]+$/){
            push @words_clean, $word;
        }
    }
    return @words_clean;
}
####################

# 2 - song to search
# get all songs
my @songs = glob $ARGV[1];
if ($is_debug_mode){
    @songs = @ARGV;
    shift @songs;
} else {
    @songs = @ARGV;
}

# read each song
for my $song (@songs){
    # print "$song\n";

    #read file (only read once)
    my @lyrics = ();
    open my $fh, "<", "$song";
        @lyrics = <$fh>;
    close $fh;
    my $one_line_lyrics = join "", @lyrics;
    
    #get word in song (this is all the words we need to count)
    my @words_in_song = get_word_in_song($one_line_lyrics);

    # 3 - search words of song in each artist words
    my $max_artist = "";
    my $max_log = 0;
    my $artist_counter = 0;
    for my $artist (keys %artist_words){
        $artist_counter++;
        my $log_a_song = 0;
        for my $song_word (@words_in_song){
            my $total_number_of_words = 0;
            my $number_of_occurance = 0;
            # loop in artist words to find the match
            for my $artist_word (@{$artist_words{$artist}}){
                $total_number_of_words++;
                if (lc($song_word) eq lc($artist_word)){
                    $number_of_occurance++;
                }
            }
            # calculate log for this song_word then add to song
            $log_a_song += log(($number_of_occurance + 1)/$total_number_of_words);
        }
        # find max log
        if ($artist_counter == 1){
            $max_artist = $artist;
            $max_log = $log_a_song;
        }
        if ($log_a_song > $max_log){
            $max_artist = $artist;
            $max_log = $log_a_song;
        }
        if ($is_debug_mode){
            printf "%s: log_probability of %.1f for %s\n", $song, $log_a_song, $artist; 
        }   
    }
    printf "%s most resembles the work of %s (log-probability=%.1f)\n", $song, $max_artist, $max_log;
}