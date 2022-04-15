
# base image
FROM ubuntu:20.04
# author lijippy@163.comm
MAINTAINER jeff.li

RUN apt update && apt install -y --no-install-recommends \
        curl \
        wget \
        apt-utils \
        openssl \
        ca-certificates

RUN apt update && apt install -y \
        git \
        g++ \
        make \
        libssl-dev \
        libgflags-dev \
        libprotobuf-dev \
        libprotoc-dev \
        protobuf-compiler \
        libleveldb-dev \
        libsnappy-dev \
        libblas-dev liblapack-dev \
        && apt clean -y

COPY env_prepare.sh /env/env_prepare.sh

RUN /env/env_prepare.sh

RUN rm -r /env