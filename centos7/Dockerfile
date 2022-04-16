# base image

FROM centos:centos7.5.1804

# author lijippy@163.comm
MAINTAINER jeff.li

COPY env_prepare.sh /env/env_prepare.sh
COPY miniconda.sh /env/app/miniconda.sh

RUN /env/env_prepare.sh

RUN rm -r /env