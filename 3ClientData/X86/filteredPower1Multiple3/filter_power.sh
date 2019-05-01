#!/bin/sh

EXT_LOG="log"
EXT_DAT="dat"
EXT_OUT="out"

NAME_ROOT="cpuPower1"

for FILE in `ls ${NAME_ROOT}*` ;do
  FILE_NAME=${FILE%.*}

  cat ${FILE_NAME}.${EXT_LOG} | sed 's/\(.[0-9]*\)\(003a \)/\1\n\2/' > ${FILE_NAME}.${EXT_DAT}
  cat ${FILE_NAME}.${EXT_DAT} | awk '/2019-/{date=$0} /003a/{amp=$16; ampExt=$17;} /003b/{amp2=$16; ampExt2=$17;} /003c/{volt=$16; voltExt=$17;} /003d/{volt2=$16; voltExt2=$17;} /0043/{pwr=$16; pwrExt=$17; print date, amp, ampExt, amp2, ampExt2, volt, voltExt, volt2, voltExt2, pwr, pwrExt}' > ${FILE_NAME}.${EXT_OUT}
done
