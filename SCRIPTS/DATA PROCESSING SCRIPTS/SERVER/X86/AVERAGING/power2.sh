#!/bin/sh

echo Power2

SUMMARY="cpuPower2.out"
EXPERIMENT="cpuPower2_cpuPower1"
EXTENSION="out"
R_SOURCE="input_data"
THREADS="1 2 4 8 16 32 48 64 96"
CLIENTS="50 100 200 300 400 500"
INPUT_PATH="datFiles/"

rm ${R_SOURCE}
rm ${SUMMARY}

for CLIENT in $CLIENTS ; do
  for THREAD in $THREADS ; do

    NAME="${EXPERIMENT}_${THREAD}_c${CLIENT}.${EXTENSION}"
    echo $NAME

    cp ${INPUT_PATH}${NAME} ${R_SOURCE}
    VALUES=`R --vanilla < kmeansPower2.R | awk '/ center/{if ($7 < $8) {min=$7; max=$8} else {min=$8; max=$7}; print min, max}'`

echo ${VALUES}

    echo "$CLIENT $THREAD $VALUES" >> ${SUMMARY}

  done
done
  
