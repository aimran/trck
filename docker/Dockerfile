FROM ubuntu:16.04

# Install dependencies
RUN apt-get update &&\
    apt-get install -y \
    jq \
    libcurl4-openssl-dev \
    bc \
    vim \
    git \
    libarchive-dev \
    libjudy-dev \
    python \
    python-pip \
    libbz2-dev \
    pypy \
    pkgconf \
    python-ply \
    libjson-c-dev \
    libcmph-dev \
    libc6-dev \
    libgoogle-perftools-dev \
    cmake \
    make &&\
    ldconfig &&\
    pip install awscli boto msgpack-python &&\
    mkdir -p /mnt/data &&\
    chmod a+rwx /mnt/data

RUN cd /opt &&\
    git clone -b tdb_event_filter_match_none https://github.com/tuulos/traildb &&\
    cd traildb &&\
    ./waf configure &&\
    ./waf install &&\
    cp /usr/local/lib/libtraildb.so* /usr/lib/

RUN cd /opt &&\
  git clone https://github.com/traildb/traildb-python.git &&\
  cd traildb-python &&\
  python setup.py install

ARG CACHE_DATE=2017-03-23
RUN cd /opt &&\
    git clone --recursive -b fix_deps https://github.com/aimran/trck &&\
    cd trck &&\
    cd deps/msgpack-c &&\
    cmake . &&\
    make install && \
    cd ../.. &&\
    make install

COPY run /usr/bin/

VOLUME /mnt/data
WORKDIR /mnt/data
ENTRYPOINT ["/usr/bin/run"]
