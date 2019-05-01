import pexpect
from pexpect import pxssh
import getpass
import time

try:
    s = pxssh.pxssh()
    hostname = "192.168.10.23"
    username = "helios"
    password = "P@ssw0rd"
    s.login(hostname, username, password)
    print('Stage 1 Completed')

    threadArray=['1','2','4','8','16','32','48','64','96']
    clientsArray=['400','500']
    a = 1
    for i in threadArray:


        s.sendline('sudo ./serverConf.sh '+i)
        s.sendline('P@ssw0rd')
        s.prompt()
        print(s.before)
        s.sendline('sudo python changeThreadsMemcache.py '+str(a)+' '+i)
        s.prompt()
        print(s.before)
        s.sendline('sudo systemctl restart memcached')
        s.prompt()
        print(s.before)
        a=i
        print('Stage 2 Completed')
        s.sendline('exit')
        s.prompt()
        print(s.before)
        

        for j in clientsArray:
            z = pxssh.pxssh()
            hostname = "192.168.10.23"
            username = "helios"
            password = "P@ssw0rd"
            z.login(hostname, username, password)
            
            z.sendline('sudo nohup python cpuLoadPower.py '+i+'_c'+j)
            z.prompt()
            print(z.before)
            z.sendline('P@ssw0rd')
	    time.sleep(5)
        

            print('Stage 3 Completed')
            #Client Machine

            p= pxssh.pxssh()
            hostname = "192.168.10.12"
            username = "ares"
            password= "P@ssw0rd"
            p.login(hostname, username, password)


            print('Stage 4 Completed')


            p.sendline('sudo python memCacheClient.py '+j+' '+i)
            p.prompt()
            print(p.before)
            p.sendline('P@ssw0rd')
            p.prompt()
            print(p.before)
            p.sendline('exit')
            p.prompt()
            print(p.before)

            #Again on Server machine

            q = pxssh.pxssh()
            hostname = "192.168.10.23"
            username = "helios"
            password = "P@ssw0rd"
            q.login(hostname, username, password)


            q.sendline('sudo pkill python')
            q.prompt()
            print(q.before)
            q.sendline('P@ssw0rd')
            q.prompt()
            print(q.before)

            print('Stage 5 Completed')




except pxssh.ExceptionPxssh as e:
    print("pxssh failed on login.")
    print(e)



