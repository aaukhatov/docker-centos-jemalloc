#!/bin/bash

while true
do
  jcmd $(pgrep java) VM.native_memory summary.diff >> /tmp/app-nmt.log
  sleep 10
done
