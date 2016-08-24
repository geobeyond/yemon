#!/usr/bin/env sh

# Wait for version to come up before downloading it
# args  $1 - version
# args  $2 - temp directory

echo "GeoServer Data Dir version is $1"
echo "-----------------------------------------------------------------------------------------------"
echo "Archive temporary directory is $2"

GEOSERVER_VERSION=$1
TEMP_DOWNLOADED=$2 

echo "GeoServer Data Directory is going to be downloaded"
# for debugging
echo "curl -L -O http://build.geonode.org/geoserver/latest/data-${GEOSERVER_VERSION}.zip"
# TO BE CHANGED TO THAT SPECIFIC FOR GEOSERVER
curl -L -O http://build.geonode.org/geoserver/latest/data-$GEOSERVER_VERSION.zip && \
unzip -x -d ${TEMP_DOWNLOADED} data-$GEOSERVER_VERSION.zip
echo "GeoServer Data Directory download has been completed"