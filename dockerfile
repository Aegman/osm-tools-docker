# Copyright (c) 2022, Andy Egleton
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. 

FROM ubuntu:latest

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone
RUN apt-get -y update && apt-get -y install \
    libpq-dev \
    gdal-bin \
    libgdal-dev \
    osmctools \
    osmosis \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /osm
