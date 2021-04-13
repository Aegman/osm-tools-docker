osmconvert peru-latest.osm.pbf -o=peru.o5m
osmfilter peru.o5m --keep="highway=" -o=highways.osm
ogr2ogr -skipfailures -f GPKG highways.gpkg highways.osm lines