WTF:

  1; pi@synapse:~$ sudo service elasticsearch status
  [ ok ] elasticsearch is running.
  0; pi@synapse:~$ sudo service elasticsearch stop
  [ ok ] Stopping Elasticsearch Server:.
  0; pi@synapse:~$ sudo service elasticsearch start
  [FAIL] Starting Elasticsearch Server: failed!
  1; pi@synapse:~$ sudo service elasticsearch status
  [FAIL] elasticsearch is not running ... failed!
  3; pi@synapse:~$ sudo service elasticsearch start
  [ ok ] Starting Elasticsearch Server:[....] Already running..
  0; pi@synapse:~$ sudo service elasticsearch status
  [ ok ] elasticsearch is running.
  0; pi@synapse:~$ 

Expect elasticsearch to fail to start, and also be running when you
check on it.  More research would be good.
