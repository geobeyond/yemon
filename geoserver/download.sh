#!/usr/bin/env bash

# Wait for version to come up before downloading it
# args  $1 - version
# args  $2 - wars directory

echo "GeoServer version is $1"
echo "-----------------------------------------------------------------------------------------------"
echo "Wars directory is $2"

GEOSERVER_VERSION=$1
WARS_DOWNLOADED=$2 

if [ `echo $1 | grep "SNAPSHOT"` ]
then
	echo "GeoServer nightly build is going to be downloaded"
	GEOSERVER_SNAPSHOT_VERSION=`echo $GEOSERVER_VERSION | sed 's|-SNAPSHOT|.x|'`
	# for debugging
	echo "curl -L -O http://ares.boundlessgeo.com/geoserver/${GEOSERVER_SNAPSHOT_VERSION}/geoserver-${GEOSERVER_SNAPSHOT_VERSION}-latest-war.zip"
	curl -L -O http://ares.boundlessgeo.com/geoserver/$GEOSERVER_SNAPSHOT_VERSION/geoserver-$GEOSERVER_SNAPSHOT_VERSION-latest-war.zip && \
	unzip -x -d ${WARS_DOWNLOADED} ${WARS_DOWNLOADED}/geoserver-$GEOSERVER_SNAPSHOT_VERSION-latest-war.zip
else
	# not nightly release
	echo "GeoServer nightly build is going to be downloaded"
	# for debugging
	echo "curl -L -O http://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip"
	curl -L -O http://sourceforge.net/projects/geoserver/files/GeoServer/$GEOSERVER_VERSION/geoserver-$GEOSERVER_VERSION-war.zip && \
	unzip -x -d ${WARS_DOWNLOADED} geoserver-$GEOSERVER_VERSION-war.zip
fi

