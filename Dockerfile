FROM aukhatov/centos-java:8u201-b09

RUN yum upgrade -y; yum group install -y "Development Tools" ; \
    yum install -y wget tcl which zlib-devel git dockbook-xsl libxslt graphviz; \
    yum clean all

RUN mkdir -p /opt && cd /opt && git clone https://github.com/jemalloc/jemalloc.git

RUN cd /opt/jemalloc && git checkout -b stable-4 origin/stable-4
RUN cd /opt/jemalloc && ./autogen.sh --enable-prof
RUN cd /opt/jemalloc && make dist
RUN cd /opt/jemalloc && make
RUN cd /opt/jemalloc && make install

COPY nmt-baseline.sh .
COPY nmt-diff.sh .
