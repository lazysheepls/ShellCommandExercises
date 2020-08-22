# Shell
## Wk1 (shell intro)
shell prefix `#!/bin/sh`

`sort -k2` sort by field 2
`sort --debug` show what is used for sort
`sort -n` sort using numeric value

`cut -d: -f1 < test.txt` same as
`cut -d":" -f 1 test.txt`
`cut -f2-` cut from 2nd colum to end

uniq
`...|uniq -c|sed "s/.* //g"` remove count number after `uniq -c`
`uniq -d` only print duplicated lines

## Wk2 (shell all and review)
`$#` number of arguement
`test ...` or `[ ... ]` compare expression
`man test` to see all the options
`-lt -le -eq -gt -ge` for arthmeric compare
`= !=` for string compare
`-a -o` for logical operations AND OR
`$(( ... ))` arthemric operation (+, -, *, /)
also written as `i=`expr $i + $inc`` (arthemric operation)

for and while loop
`while ... do ... done` while loop
`for ... do ... done` for loop
`for file in "$@"` for loop (through input arguments)
`for (( i = $1; i <= $3; i += $2)) do .. done` for loop
`for i in {1..5} do .. done` for loop
`for i in {START..END..STEP}`  for loop (constant int only)
`continue break` still works in shell
`exit 0 exit 1 exit` to quit the program

how to squeeze white spaces?
`tr -s " "` replace multiple occurance of white space with only 1 space

seq
`for i in `seq $1``
`for i in `seq 1 $1``
`seq 1 5 100` first step last

array in shell
`arr=()` declare array
`arr=(a b c d)` array declare
`arr[1]=b` assign value
`echo ${arr[*]}` print all element of array
`echo ${arr[@]}` same as above
`echo ${arr[0]}` print first element of array

if statement
`if..then..elif..then..else..fi` if statement
`if [ ! -r "$file" ]` check if file is not readable (`man test`)

diff #TODO:
`if diff -q txt1.txt txt2.txt >/dev/null`
`if diff -i -w txt1.txt txt2.txt` #TODO:

read command
`while read; do echo $REPLY done` read from STDIN and give back as variables (splitted)
`while read var1 var2 var3; do echo $var1 done < file1` read from file as standard input
`$REPLY` is a special key word (by default: data from read is stored in `$REPLY`)
`read answer; echo $answer` read content is stored in `$answer`
`read -p "Enter Your Name:"` read with prompt text

file command
`file $file_name` tells you what kind of file it is

join
`join -j1 file1 file2` note that join field must be sorted before using join command
`sort file1 | join marks -` when FILE1 or FILE2 (not both) is -, read standard input

wc
`wc -l < file.txt` show number of lines in the file (note: it actually produce different output than `wc -l file.txt`)

date (need practice)
`date` display time for now
`date +%H` display time in hour (00-23)
`date +%a-%c` display time in day-time

## wk 3

mv
`mv $source_file $dest_file` move (rename) file
`mv -- "$source_file" "$dest_file"` use of -- stop parsing shell command options, so that it is able to handle file name starts with -
`ls -l -- *.txt` same as above

sed
`sed "s///g;s///g"` multiple sed
`sed "s///g" $file` sed can take in a file 

find (Recursively look into directory)
`find $file_full_path` print a file
`find $file_dir` print all files under this dir (recursively)
`for file in `find "$@" -type -f`` find file in current and sub directories from user input

basename
`basename /usr/bin/sort` -> "sort"
`basename include/stdio.h .h` -> "stdio" (remove trailing suffix if specified)
`basename -s include/stdio.h` -> "stdio" (remove suffix)

# Perl
## wk4
perl prefix `#!/usr/bin/perl -w`
perl prefex `#!/usr/bin/perl use strict; use warnings;`

perl help
`perldoc ...`

grammar
end of each line with `;`

special key words
`$#ARGV` last index of input arguments
`$#ARGV+1` number of input arguements
`@ARGV` array of input arguements
`$_` default variable
`$0` current script name
`$1 $2` capture group of regex
`last;` break out of a loop
`die` quit program `... or die;` `die if ...;`
`exit` quit program

read from stdin
`my @lines = <STDIN>; while (@lines) { my $line = shift @lines; }`
`while ($line = <STDIN>) { print $line; }`

regex replace string
`$line =~ s/[pattern]//g;`
`$line =~ s/[pattern]//gi;` case in-sensitive replacement

regex pattern match
`$line =~ /[pattern]/i;` case in-sensitive pattern match
`print $_ if /$pattern/;` use pattern match in if statement
`print $_ if !/$pattern/;` invert pattern match in if statement

check if there is any input arguements
`if(@ARGV){ .. }`
`if(@ARGV != 2)` check array size
`if (..) { .. } elsif (..) { .. } else { .. }`

print first n element of the array
`print @lines[0..$n_lines-1];`

for loop and while loop
`foreach my $file (@files) { .. }`
`for (my $i=0;$i<7;$i++) { .. }`
`for 1..$ARGV[1]`
`for (@lines) { print $_; }`
`while ( .. ) { .. } `

`chomp $line;` remove thr trailing newline \n at the end of line

`eq ne lt le gt ge cmp` string compare
`< <= > >= == != <=>` numeric compare

difference between `<>` and `<STDIN>`
`<>` can be both stdin or file
`<STDIN>` is only stdin

get content of regex pattern match
`$line =~ /(pattern)/; $content = $1;`
`($content) = $line =~ /(pattern)/;`

replace with pattern match
`$line =~ s/(pattern1)(pattern2)(pattern3)/$3$2$1/;` this would replace the capture group only, and leave the rest of the code same

## wk5
array operation
`@lines = ()` decalre empty array
`@lines = (1, 3, 5)` initialize array
`@lines = (1..9)` initialize array by sequence of numbers
`$first_line = @lines - $offset` calculate using size of array 
`print @lines[$first_line..$#lines]` print last few elements of array

shift unshift push pop
`my $line = shift @lines` pop the 1st of the array, and the list is shorter
`unshift @lines, $line` place $line to the beginning of the array
`my $line = pop @lines` pop the last of array, and the list is shorter
`push @lines, $line` append $line to the end of array @lines
Note: I can also do `push @lines, @another`

hash
`%hash = ();` initialize empty hash
`$color_of{'apple'} = 'red';` put value to key
`%Hash = (Mumbai => 1, Kolkata => 2, Delhi => 3);` initialize hash with value
`$color_of{$fruit} = 'red';` initialize hash with value

loop through hash
`foreach $key (sort keys %hash) { print $hash{key}; }`

hash of hash
`$hash1{$has1_key1}{$hash2_key1} = "name";`
```
foreach $hash1_key1 (sort keys %hash1) { 
    foreach $hash2_key2 (sort keys %{$hash1{$hash_key1}}) { .. }
}
```
`keys %hash`
`valus %hash`

push array into hash
`push( @{ $hash{key} }, "some value ");`

exists
`if(exists($array[$i]))` check if index exist in array
`if(exists($hash{$i}))` check if key exist in hash

split
`@list = split(/;/, $marks);`
`@list = split /;/, $marks;` split into array by separator, support regex

join
`my $line = join ':',@list;`
`my $line = join(':',$login,$password,$uid);`

sort(wk7)
`my @articles = sort @files;` sort in lexical order
`my @articles = sort {$a cmp $b} @files;` sort string with explicit sort routine 
`my @articles = sort {fc($a) cmp fc($b)} @files;` sort with case-insensitively
`my @articles = sort {$b cmp $a} @files;` sort in reverse order
`my @articles = sort {$a <=> $b} @files;` sort in numeric order ascending
`my @articles = sort {$b <=> $a} @files;` sort in numeric order descending
`my @eldest = sort { $age{$a} <=> $age{$b} } keys %age;` sort hash key of %age by value instead of keys
```
sub byage{
    $age{$a} <=> $age{$b};
}
my @eldest = sort byage @age;
```

glob
`foreach $file (glob("*.[ch]")) { .. }` support regex
`my @files = glob '"*e *f"'` match file in current directory that has a space (need extra qutation mark)

lc uc fc
`lc($var)` lower-case string
`uc($var)` upper-case string
`fc($var)` casefolded version (only this can used for compare cmp, eq, lt)

printf (format print)
`printf "%7d %s\n";` print first int with min field width 7, right adjustify, then print a string
`printf "%-8s %s\n"` print first string with min field width 8, left adjustify, then print a string

print array to file
`print $fh join("\n",@lines);`
```
open my $fh, '>', "output.txt";
    foreach ($list){
        print $fh "$_\n";
    }
close $fh;
```

sub funciton
`sub myfunc { (@list) = @_ }`

concatenate string
`$string .= $another_string`