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
    libtcmalloc-minimal4 \
    make &&\
    pip install awscli boto msgpack-python &&\
    mkdir -p /mnt/data &&\
    chmod a+rwx /mnt/data

RUN cd /opt &&\
    git clone -b tdb_event_filter_match_none https://github.com/tuulos/traildb &&\
    cd traildb &&\
    ./waf configure &&\
    ./waf install &&\
    cp /usr/local/lib/libtraildb.so* /usr/lib/

ARG CACHE_DATE=2016-01-01
RUN cd /opt &&\
    git clone --recursive -b fix_deps https://github.com/aimran/trck &&\
    cd trck &&\
    make install

VOLUME /mnt/data
WORKDIR /mnt/data
