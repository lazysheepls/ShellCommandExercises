#!/bin/sh

# all digits less than 5 translate into '<'
# all digits greater than 5 translate into '>'

tr "[0-4]" "<" | tr "[6-9]" ">"