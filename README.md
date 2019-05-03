# hetNetBenchmarks

DATA- 
The data folder represents the data from primary tests conducted between ARM and X86 while in the development process.
It represents the folder divisions as CLIENTS , X86 and ARM.
The CLIENTS folder contains the data which involves the measurements of RPS and LATENCY which are required to conclude our experiments.
The X86 and ARM folders contains the data's such as Cpu Load and Power which are required to check the server stress during the benchmark experiments.


PREREQUISITES-


SCRIPTS-
The tests are then run in order to conduct the actual benchmarks to know the actual performance differences between the X86 and the ARM servers using the MEMCACHED and REDIS SERVERS

    SERVERS USED-
    Our test suite uses 2 types of servers such as - 
    1. Memcached 
    2. Redis 

  RUNNING THE TESTS-

    ONE CLIENT ARCHITECTURE-
    In this type of architecture we use 1 client named "ARES" and 1 server(anyone of the 2 "ARM" or "X86" at a time).
    1. When you enter the Client directory, you can see a memCacheClient.py file which you need to setup in your home                directory of the client server machine.
    2. When you choose any one of the server from the 2 given servers, when you enter the particular server directory, there        you can see a python script which you will be using 
       in your router machine or your own laptop on which you need to execute this whole script which will automate all the          tests on all given machines to get the benchmark results.
    3. Adjoining the python script you can enter the server configs file , in which you will find different files such as            serverConf.sh, changeThreadsMemcache.py and cpuLoadPower.py.
       All of these files makes the necessary changes on the server and sets up files to extract the cpuLoad and the Power          data from the server, it is also used to configure the Memcached server threads and the cpu's or cores of the server          machine.
       Please be careful of changing the scripts with the appropriate IP address required to run the tests and which is              assigned to that particular ARM or X86 server.
       
    MULTIPLE CLIENT ARCHITECTURES-
    1. Multiple client architectures are configured in the given architecture with the configuration of already existing            python script which is run by the router.
    2. The server configuration files, load scripts, power scripts and the client test scripts, all remain the same.
    
       

  DATA PROCESSING AFTER THE BENCHMARKS-
    
    The Data processing architecture is divided into 3 categories-
    
    1. CLIENT-
        RPS-
        Latency-
        Maximum Latency-
    
    
    
    2. SERVER-
        LOAD-
        POWER-
        AVERAGING-
    
    
    
    
    
    3. GRAPHING-
  
  
