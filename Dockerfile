ARG BASE_IMAGE
FROM ${BASE_IMAGE} AS base

RUN apt-get update && apt-get upgrade -y
RUN add-pkg libqt5x11extras5 python3 python3-pip python3-paho-mqtt git -y --no-install-recommends
RUN pip3 install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install tdmgr

# see https://github.com/jlesage/docker-baseimage-gui/#environment-variables
ENV TZ="Europe/Warsaw"

RUN echo "#!/bin/sh\n" \
         "export HOME=/config\n" \
         "exec /usr/bin/python3 /usr/local/bin/tdmgr.py\n" > /startapp.sh

# Create volume
VOLUME /config