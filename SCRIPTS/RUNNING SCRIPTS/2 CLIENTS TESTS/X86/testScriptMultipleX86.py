import pexpect
from pexpect import pxssh
import getpass
import time

try:
    s = pxssh.pxssh()
    hostname = "192.168.10.23"
    username = "helios"
    password = "P@ssw0rd1"
    s.login(hostname, username, password)
    print('Stage 1 Completed')

    threadArray=['1','2','4','8','16','32','48','64','96']
    clientsArray=['50','100','200','300','400','500']
    a = 1
    for i in threadArray:


        s.sendline('sudo ./serverConf.sh '+i)
        s.sendline('P@ssw0rd1')
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
            password = "P@ssw0rd1"
            z.login(hostname, username, password)
            
            z.sendline('sudo nohup python cpuLoadPower.py '+i+'_c'+j)
            z.prompt()
            print(z.before)
            z.sendline('P@ssw0rd1')
	    time.sleep(3)
        

            print('Stage 3 Completed')
            #Client Machine ARES

            p= pxssh.pxssh()
            hostname = "192.168.10.12"
            username = "ares"
            password= "P@ssw0rd"
            p.login(hostname, username, password)


            print('Stage 4 Completed')


            p.sendline('sudo nohup python memCacheClientMultiple.py '+j+' '+i)
#            p.prompt()
            print(p.before)
            p.sendline('P@ssw0rd')
 #           p.prompt()
            print(p.before)
            p.sendline('exit')
  #          p.prompt()
            print(p.before)

	    #Client Machine ZEUS

            c= pxssh.pxssh()
            hostname = "192.168.10.10"
            username = "zeus"
            password= "P@ssw0rd"
            c.login(hostname, username, password)


            print('Stage 4 Completed')

	    
            c.sendline('sudo python memcacheClientMultiple.py '+j+' '+i)
            c.prompt()
            print(c.before)
            c.sendline('P@ssw0rd')
            c.prompt()
            print(c.before)
            c.sendline('exit')
            c.prompt()
            print(c.before)


            #Again on Server machine

            q = pxssh.pxssh()
            hostname = "192.168.10.23"
            username = "helios"
            password = "P@ssw0rd1"
            q.login(hostname, username, password)


            q.sendline('sudo pkill python')
            q.prompt()
            print(q.before)
            q.sendline('P@ssw0rd1')
            q.prompt()
            print(q.before)
	    q.sendline('exit')
          #  q.prompt()
            print(q.before)


            print('Stage 5 Completed')

	    #Again on Client Ares
	    d = pxssh.pxssh()
            hostname = "192.168.10.12"
            username = "ares"
            password = "P@ssw0rd"
            d.login(hostname, username, password)


            d.sendline('sudo pkill python')
            d.prompt()
            print(d.before)
            d.sendline('P@ssw0rd')
            d.prompt()
            print(d.before)
            d.sendline('exit')
           # d.prompt()
            print(d.before)






except pxssh.ExceptionPxssh as e:
    print("pxssh failed on login.")
    print(e)



