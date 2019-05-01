#!/bin/bash
set -euo pipefail

OUTPUT=cavium-power.log
USER=sunsky
PASSWORD=sunsky
HOST=127.0.0.1
VOLTAGE0=65
VOLTAGE1=66
CURRENT0=138
CURRENT1=141

echo "#Timestamp;V0;V1;I0;I1;P0;P1" > $OUTPUT

${*:1} &

while [ -e /proc/$! ]; do
timestamp=`date +"%s"`
echo -n "$timestamp;" >> $OUTPUT
ipmi-sensors -h $HOST -u $USER -p $PASSWORD -r $VOLTAGE0 -r $VOLTAGE1 -r $CURRENT0 -r $CURRENT1 | awk 'BEGIN{FS="|"} {if(NR != 1) printf("%f;", $4)} END{printf("\n")}' | awk 'BEGIN{FS=";"} {print $1";"$2";"$3";"$4";"$1*$3";"$2*$4}' >> $OUTPUT
sleep 1
done

energy=`cat $OUTPUT | awk 'BEGIN{FS=";"; E0=0; E1=0} {E0+=$6; E1+=$7} END{printf("# E0: %f, E1: %f, Total:%f\n", E0, E1, E0 + E1)}'`
echo $energy >> $OUTPUT
