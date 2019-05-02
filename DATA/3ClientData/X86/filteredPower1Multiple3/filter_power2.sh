#!/bin/sh

EXT_LOG="log"
EXT_DAT="dat"
EXT_OUT="out"

NAME_ROOT="cpuPower2_cpuPower1"

for FILE in `ls ${NAME_ROOT}*` ;do
  FILE_NAME=${FILE%.*}

  cat ${FILE_NAME}.${EXT_LOG} | sed 's/\([0-9]*:[0-9]*:[0-9]*.[0-9]*\)[ \t]*/\1\n/' |  sed 's/\([0-9]*.[0-9]*\)W/\1 W/' > ${FILE_NAME}.${EXT_DAT}
  cat ${FILE_NAME}.${EXT_DAT} | awk '/2019-/{date=$0} /Core sum:/{pwr=$3; pwrExt=$4; print date, pwr, pwrExt}' > ${FILE_NAME}.${EXT_OUT}
done
