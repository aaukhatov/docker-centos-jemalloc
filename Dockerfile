FROM aukhatov/centos-java:8u201-b09

RUN yum upgrade -y; yum group install -y "Development Tools" ; \
    yum install -y wget tcl which zlib-devel git dockbook-xsl libxslt graphviz; \
    yum clean all

RUN mkdir -p /opt && cd /opt && git clone https://github.com/jemalloc/jemalloc.git && mkdir /tmp/jprof

RUN cd /opt/jemalloc && git checkout -b stable-4 origin/stable-4
RUN cd /opt/jemalloc && ./autogen.sh --enable-prof
RUN cd /opt/jemalloc && make dist
RUN cd /opt/jemalloc && make
RUN cd /opt/jemalloc && make install

COPY nmt-baseline.sh .
COPY nmt-diff.sh .

ENV LD_PRELOAD="/usr/local/lib/libjemalloc.so"
ENV MALLOC_CONF="prof_leak:true,prof:true,lg_prof_interval:25,lg_prof_sample:18,prof_prefix:/tmp/jeprof"
