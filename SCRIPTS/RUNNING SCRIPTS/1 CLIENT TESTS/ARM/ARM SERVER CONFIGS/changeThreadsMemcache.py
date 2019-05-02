import sys

c = sys.argv
a = c[1]
b = c[2]

with open('/etc/memcached.conf', 'r') as file:
    filedata = file.read()


filedata = filedata.replace('-t '+str(a), '-t '+str(b))


with open('/etc/memcached.conf', 'w') as file:
    file.write(filedata)

print('Thread Setup Done')



