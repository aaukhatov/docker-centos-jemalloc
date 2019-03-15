#!/bin/bash

jeprof --svg /tmp/jeprof.* > /tmp/jeprof-report.svg 2>/dev/null
jeprof --text /tmp/jeprof.* > /tmp/jeprof-report.txt 2>/dev/null
