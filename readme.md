# OSM Tools
Command line tools to work with OSM files in docker.

This image contains the following comand line utilities:
* [osmctools](https://gitlab.com/osm-c-tools/osmctools) - Includes osmconvert, osmfilter & osmupdate tools.
* [osmosis](https://wiki.openstreetmap.org/wiki/Osmosis) - Command line tools to extract specific tags to OSM files.
* [GDAL/OGR](https://gdal.org/) - convert OSM to other formats.

## Prepare your data:

Download some OSM data (pbf) from [geoFabrik](https://download.geofabrik.de/), or other sources.

for example:

```
wget https://download.geofabrik.de/south-america/peru-latest.osm.pbf -O $env:USERPROFILE/downloads/data/osm/peru.osm.pbf
```

Mount your data folder to the `osm` volume when running the container: `--volume /downloads/data/osm:/osm`

## Using this image

Build image with:

```
docker build -t osm-tools:latest .
```

To run as an interactive command line:

```
docker run --rm  -it --volume  $env:USERPROFILE/downloads/data/osm:/osm --rm -it osm-tools
```

## Examples

**Convert from osm.pbf to o5m**

```
docker run --rm  -it --volume $env:USERPROFILE/downloads/data/osm/downloads/data/osm:/osm osm-tools osmconvert peru.osm.pbf -o=peru.o5m
```

**Extract all highways**

```
docker run --rm -it --volume $env:USERPROFILE/downloads/data/osm/downloads/data/osm:/osm osm-tools osmfilter peru.o5m --keep="highway=" -o=highways.osm
```

*OR*

```
docker run --rm -it --volume $env:USERPROFILE/downloads/data/osm/downloads/data/osm:/osm osm-tools osmosis --read-pbf peru.osm.pbf --tf accept-ways highway=* --used-node --write-xml highways.osm
```

**Convert OSM to SHP**

```
docker run --rm -it --volume $env:USERPROFILE/downloads/data/osm/downloads/data/osm:/osm osm-tools ogr2ogr -skipfailures -f GPKG highways.gpkg highways.osm lines
```