#!/bin/bash

jcmd $(pgrep java) VM.native_memory baseline
