
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

    NAME="${CLIENT}_t${THREAD}_Ares.${EXTENSION}"
    echo $NAME

    
    SET_VAL=`cat $NAME | awk '/BEGIN/{total=0; elems=0} /SET/{cur="SET"} /GET/{cur="GET"}/requests per/{if(cur=="SET"){total+=$1; elems+=1;}}END{print total/elems}'`
    GET_VAL=`cat $NAME | awk '/BEGIN/{total=0; elems=0} /SET/{cur="SET"} /GET/{cur="GET"}/requests per/{if(cur=="GET"){total+=$1; elems+=1;}}END{print total/elems}'`
    echo $CLIENT $THREAD $SET_VAL $GET_VAL >> set_get.values
  done
done

