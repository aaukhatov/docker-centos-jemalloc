# Docker image with Java 8 and jemalloc
The docker image intended for debugging native memory leaks.

## Tools

- [jemalloc](http://jemalloc.net/)

### Configure

Configure Java to use jemalloc using **LD_PRELOAD**.
```shell
LD_PRELOAD="/usr/local/lib/libjemalloc.so"
```

Enable profiling using **MALLOC_CONF**.
```shell
MALLOC_CONF="prof_leak:true,prof:true,lg_prof_interval:25,lg_prof_sample:18,prof_prefix:/tmp/jeprof"
```

### Reports

Use jeprof to produce a text report or a nice graph over the
allocations – eventually the leak should stand out.

#### Graphical report
```shell
jeprof --svg /tmp/jeprof.* > jeprof-report.svg
```

#### Text report
```shell
jeprof --text /tmp/jeprof.* > jeprof.log
```

## Run Docker Container

```shell
docker run -ti --rm aukhatov/centos-jemalloc:8u191b09
```
