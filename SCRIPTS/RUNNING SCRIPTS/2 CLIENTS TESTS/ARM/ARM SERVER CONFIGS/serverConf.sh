#!/bin/sh

sudo systemctl stop memcached

sudo su

CPUS=$1
MAX=`ls /sys/devices/system/cpu | awk '/cpu[0-9]+/{print $1}'  | sed 's/cpu\([0-9]*\)/\1/' | tail -n 1`

echo $CPUS $MAX

for C in `seq 1 $MAX` ; do
  echo 0 > /sys/devices/system/cpu/cpu$C/online
done

for C in `seq 1 $CPUS` ; do
  echo 1 > /sys/devices/system/cpu/cpu$C/online
done


sudo ifconfig enP2p1s0f5 192.168.4.10

sudo systemctl restart memcached

echo Server Config Done
