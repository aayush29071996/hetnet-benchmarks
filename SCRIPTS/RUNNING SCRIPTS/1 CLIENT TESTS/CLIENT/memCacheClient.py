import time
import sys
import os
import pexpect

a = sys.argv
b = a[1]
c = a[2]

testData=pexpect.run('./Downloads/mc-benchmark-master/mc-benchmark -h 192.168.4.10 -p 4000 -c '+str(b)+' -d 100 -n 100000 -l',30)
print(testData)

with open(str(b)+'_t'+str(c)+'.txt', 'w') as file:
    file.write(str(testData))
file.close()
