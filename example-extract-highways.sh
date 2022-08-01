# Copyright (c) 2022, Andy Egleton
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. 

osmconvert peru-latest.osm.pbf -o=peru.o5m
osmfilter peru.o5m --keep="highway=" -o=highways.osm
ogr2ogr -skipfailures -f GPKG highways.gpkg highways.osm lines
