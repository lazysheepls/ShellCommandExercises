#!/bin/sh
for file in $@
do
    # Get email address
    echo -n "Address to e-mail this image to? "
    read email

    # Get message
    read -p "Message to accompany image? " message

    # Send email
    echo $file sent to $email
    subject=`echo $file | sed {s/.png$/!/}`
    
    echo "$message" | mutt -s "$subject" -e 'set copy=no' -a "$file" -- "$email"
done