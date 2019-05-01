#!/bin/sh

for FILE in `ls cpuPower1_*` ; do
    cat $FILE | sed 's/\([0-9]*\-[0-9]*\-[0-9]* [0-9]*:[0-9]*:[0-9]*\.[0-9]*\)0040/TIMESTAMP \1\n0040/' | awk '/BEGIN/{p0v=0; p1v=0; p0a=0; p1a=0} /^TIMESTAMP/{timestamp=$3; if(p0v > 0 && p1v > 0 && p0a >0 && p1a >0) print timestamp, p0v, p1v, p0a, p1a, (p0v*p0a + p1v*p1a); else {p0v=0; p1v=0; p0a=0; p1a=0}} /VR_P0_VOUT/{p0v=$15} /VR_P1_VOUT/{p1v=$15} /VR_P0_IOUT/{p0a=$15} /VR_P1_IOUT/{p1a=$15}' > $FILE.dat
done

