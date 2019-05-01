#!/bin/sh

for FILE in `ls cpuLoad_*` ; do
  cat $FILE | sed 's/],/ \n/g' | sed 's/\(\.[0-9]*\)\[/\1 /g'|  awk '{sum = 0; for(i=3; i<NF; i++) sum+=$i; print $1 , $2,  sum}' > $FILE.dat
  
done

