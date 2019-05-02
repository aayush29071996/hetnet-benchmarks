
#!/bin/sh

echo RPS

SUMMARY1="allSet.out"
SUMMARY2="allGet.out"
EXTENSION="txt"
NEW_EXTENSION="dat"
THREADS="1 2 4 8 16 32 48 64 96"
CLIENTS="50 100 200 300 400 500"


rm ${SUMMARY1}
rm ${SUMMARY2}

for CLIENT in $CLIENTS ; do
  for THREAD in $THREADS ; do

    NAME="${CLIENT}_t${THREAD}_Zeus.${EXTENSION}"
    NAME2="${CLIENT}_t${THREAD}_Ares.${EXTENSION}"
   # NAME3="${CLIENT}_t${THREAD}_Zeus.${EXTENSION}"
    echo $NAME $NAME2 

    
    SET_VAL1=`cat $NAME | awk 'BEGIN{is_set=0; thr=99.0; set_values=0; setIdx=0; set_gotit=0; get_values=0; getIdx=0; get_gotit=0;} /====== SET ======/{is_set=1; set_gotit=0; set_values=0;} /====== GET ======/ {is_set=0; get_gotit=0; get_values=0;} /[0-9]+\.[0-9]+% <= [0-9]+ [(milli)|(micro)|(nano)]*seconds/{fact=1; if(index($4,"milliseconds")!=0) fact=0.001; if(index($4,"microseconds")!=0) fact=0.000001; if(index($4,"nanoseconds")!=0) fact=0.000000001; if(is_set==1){set_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && set_gotit==0) {set_gotit=1; setValues[setIdx]=set_values; setIdx+=1;}} else{get_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && get_gotit==0) {get_gotit=1; getValues[getIdx]=get_values; getIdx+=1;}} } END{min=99999999; max=0; avg=0; for (i in setValues){if(setValues[i]<min) min=setValues[i]; if(setValues[i]>max) max=setValues[i]; avg+=setValues[i];} print max;}'`
    GET_VAL1=`cat $NAME | awk 'BEGIN{is_set=0; thr=99.0; set_values=0; setIdx=0; set_gotit=0; get_values=0; getIdx=0; get_gotit=0;} /====== SET ======/{is_set=1; set_gotit=0; set_values=0;} /====== GET ======/ {is_set=0; get_gotit=0; get_values=0;} /[0-9]+\.[0-9]+% <= [0-9]+ [(milli)|(micro)|(nano)]*seconds/{fact=1; if(index($4,"milliseconds")!=0) fact=0.001; if(index($4,"microseconds")!=0) fact=0.000001; if(index($4,"nanoseconds")!=0) fact=0.000000001; if(is_set==1){set_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && set_gotit==0) {set_gotit=1; setValues[setIdx]=set_values; setIdx+=1;}} else{get_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && get_gotit==0) {get_gotit=1; getValues[getIdx]=get_values; getIdx+=1;}} } END{min=99999999; max=0; avg=0; for (i in setValues){if(setValues[i]<min) min=setValues[i]; if(setValues[i]>max) max=setValues[i]; avg+=setValues[i];} min=99999999; max=0; avg=0; for (i in getValues){if(getValues[i]<min) min=getValues[i]; if(getValues[i]>max) max=getValues[i]; avg+=getValues[i];} print max;}'`
    SET_VAL2=`cat $NAME2 | awk 'BEGIN{is_set=0; thr=99.0; set_values=0; setIdx=0; set_gotit=0; get_values=0; getIdx=0; get_gotit=0;} /====== SET ======/{is_set=1; set_gotit=0; set_values=0;} /====== GET ======/ {is_set=0; get_gotit=0; get_values=0;} /[0-9]+\.[0-9]+% <= [0-9]+ [(milli)|(micro)|(nano)]*seconds/{fact=1; if(index($4,"milliseconds")!=0) fact=0.001; if(index($4,"microseconds")!=0) fact=0.000001; if(index($4,"nanoseconds")!=0) fact=0.000000001; if(is_set==1){set_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && set_gotit==0) {set_gotit=1; setValues[setIdx]=set_values; setIdx+=1;}} else{get_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && get_gotit==0) {get_gotit=1; getValues[getIdx]=get_values; getIdx+=1;}} } END{min=99999999; max=0; avg=0; for (i in setValues){if(setValues[i]<min) min=setValues[i]; if(setValues[i]>max) max=setValues[i]; avg+=setValues[i];} print max;}'`
    GET_VAL2=`cat $NAME2 | awk 'BEGIN{is_set=0; thr=99.0; set_values=0; setIdx=0; set_gotit=0; get_values=0; getIdx=0; get_gotit=0;} /====== SET ======/{is_set=1; set_gotit=0; set_values=0;} /====== GET ======/ {is_set=0; get_gotit=0; get_values=0;} /[0-9]+\.[0-9]+% <= [0-9]+ [(milli)|(micro)|(nano)]*seconds/{fact=1; if(index($4,"milliseconds")!=0) fact=0.001; if(index($4,"microseconds")!=0) fact=0.000001; if(index($4,"nanoseconds")!=0) fact=0.000000001; if(is_set==1){set_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && set_gotit==0) {set_gotit=1; setValues[setIdx]=set_values; setIdx+=1;}} else{get_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && get_gotit==0) {get_gotit=1; getValues[getIdx]=get_values; getIdx+=1;}} } END{min=99999999; max=0; avg=0; for (i in setValues){if(setValues[i]<min) min=setValues[i]; if(setValues[i]>max) max=setValues[i]; avg+=setValues[i];} min=99999999; max=0; avg=0; for (i in getValues){if(getValues[i]<min) min=getValues[i]; if(getValues[i]>max) max=getValues[i]; avg+=getValues[i];} print max;}'`
    #SET_VAL3=`cat $NAME3 | awk 'BEGIN{is_set=0; thr=99.0; set_values=0; setIdx=0; set_gotit=0; get_values=0; getIdx=0; get_gotit=0;} /====== SET ======/{is_set=1; set_gotit=0; set_values=0;} /====== GET ======/ {is_set=0; get_gotit=0; get_values=0;} /[0-9]+\.[0-9]+% <= [0-9]+ [(milli)|(micro)|(nano)]*seconds/{fact=1; if(index($4,"milliseconds")!=0) fact=0.001; if(index($4,"microseconds")!=0) fact=0.000001; if(index($4,"nanoseconds")!=0) fact=0.000000001; if(is_set==1){set_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && set_gotit==0) {set_gotit=1; setValues[setIdx]=set_values; setIdx+=1;}} else{get_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && get_gotit==0) {get_gotit=1; getValues[getIdx]=get_values; getIdx+=1;}} } END{min=99999999; max=0; avg=0; for (i in setValues){if(setValues[i]<min) min=setValues[i]; if(setValues[i]>max) max=setValues[i]; avg+=setValues[i];} print max;}'`
    #GET_VAL3=`cat $NAME3 | awk 'BEGIN{is_set=0; thr=99.0; set_values=0; setIdx=0; set_gotit=0; get_values=0; getIdx=0; get_gotit=0;} /====== SET ======/{is_set=1; set_gotit=0; set_values=0;} /====== GET ======/ {is_set=0; get_gotit=0; get_values=0;} /[0-9]+\.[0-9]+% <= [0-9]+ [(milli)|(micro)|(nano)]*seconds/{fact=1; if(index($4,"milliseconds")!=0) fact=0.001; if(index($4,"microseconds")!=0) fact=0.000001; if(index($4,"nanoseconds")!=0) fact=0.000000001; if(is_set==1){set_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && set_gotit==0) {set_gotit=1; setValues[setIdx]=set_values; setIdx+=1;}} else{get_values=$3*fact; if(substr($1,1,length($1)-1)>=thr && get_gotit==0) {get_gotit=1; getValues[getIdx]=get_values; getIdx+=1;}} } END{min=99999999; max=0; avg=0; for (i in setValues){if(setValues[i]<min) min=setValues[i]; if(setValues[i]>max) max=setValues[i]; avg+=setValues[i];} min=99999999; max=0; avg=0; for (i in getValues){if(getValues[i]<min) min=getValues[i]; if(getValues[i]>max) max=getValues[i]; avg+=getValues[i];} print max;}'`
   
    SET_MAX_VAL=`echo $SET_VAL1 $SET_VAL2 | awk '{max=$1; if(max < $2) max=$2; print max}'`
    GET_MAX_VAL=`echo $GET_VAL1 $GET_VAL2 | awk '{max=$1; if(max < $2) max=$2; print max}'`


    echo $CLIENT $THREAD $SET_MAX_VAL $GET_MAX_VAL >> avg_max_lat.values
  done
done
