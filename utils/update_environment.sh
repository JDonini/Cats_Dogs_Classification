#!/bin/bash

progress(){
  echo -n "$0: Please wait ."
  while true
  do
    sleep 5
    echo -n "."
  done
}

dobackup(){
    conda env update -f=environment.yml
    conda env export > utils/environment.yml    
}

progress &

MYSELF=$!

dobackup

kill $MYSELF >/dev/null 2>&1

echo -n "... done."
echo
