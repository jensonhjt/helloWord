#!/bin/bash

# process command pattern
cmd=127.0.0.1:2222:0.0.0.0:22

# timestamp
ts=`date +%T`

echo "$ts: begin checking..."

while [ 1 ]; do
  if [ `pgrep -n -f $cmd` ]; then
    #echo "$ts: is running..."
    :
  else
    echo "$ts: not running, restarting..."
    screen -S 'sessionname' -X screen bash -c 'ssh -o ServerAliveInterval=60 -R 127.0.0.1:2222:0.0.0.0:22 username@xx.xx.xx.xx -i /etc/ssh/id_rsa_2048_priKey'
  fi

  sleep 3600
done
