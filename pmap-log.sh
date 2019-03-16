#!/bin/bash

while true
do
  pmap -xp $(pgrep java) 2>&1 | tee -a /tmp/pmap/pmap.log
  sleep 5
done
