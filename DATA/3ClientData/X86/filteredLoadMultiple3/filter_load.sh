#!/bin/sh

for FILE in `ls cpuLoad_*` ; do
  cat $FILE | sed 's/],/ \n/g' | sed 's/\(\.[0-9]*\)\[/\1 /g' > $FILE.dat
done

