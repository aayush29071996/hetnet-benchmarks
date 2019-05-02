
import psutil
import time
import datetime
import plotly
import random
import os
import sys

a = sys.argv

name= 'cpuLoad_'+str(a[1])
f = open(name+'.log', 'w')
name1= 'cpuPower1_'+str(a[1])
a = open(name1+'.log', 'w')


while True:
    timestamp = datetime.datetime.now()
    f.write(str(timestamp))
    a.write(str(timestamp))


    power1=os.popen("sudo ipmiutil sensor | grep -e Amps -e Volts").read()
#    power2=os.popen("sudo /home/helios/rapl-read-ryzen/amd").read()

    f.write(str(psutil.cpu_percent(percpu=True)) + ", ")
    f.flush()
    a.write(str(power1))
    a.flush()
    time.sleep(1)

