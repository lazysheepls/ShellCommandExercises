#!/bin/sh

sort marks >tmp1
sort students >tmp2
join -j1 tmp1 tmp2 | cut -d' ' -f2- | cut -d' ' -f1,3-|sort -k2
rm tmp1
rm tmp2