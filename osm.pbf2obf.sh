#!/bin/sh

HOMEDIR="/path/to/dir"

OSMANDFILE="Bolivia_southamerica.osm.pbf"

SRCURL="http://download.geofabrik.de/south-america/bolivia-latest.osm.pbf"

JAVA_MMIN="256m"
JAVA_MMAX="2560m"

# 0=delete/1=preserve
KEEPSRC=0    # osm files
KEEPLOG=0    # log files

##
## --- with a little luck, you won't have to edit below this point ---
##

# src file
SOURCE="$HOMEDIR/osm_files/${OSMANDFILE}"

# exit the script on errors
set -e
trap 'echo -e "\n$0 FAILED at line ${LINENO}" | tee $HOMEDIR/error.log' ERR

# wget path
RUNWGET="/usr/bin/wget"

# java path
if [ -z "$JAVA_HOME" -a -z "$JRE_HOME" ]; then
  echo "Neither the JAVA_HOME nor the JRE_HOME environment variable is defined"
  echo "At least one of these environment variable is needed to run this program"
  exit 1
fi
if [ -z "$JRE_HOME" ]; then
  JRE_HOME="$JAVA_HOME"
fi
RUNJAVA="$JRE_HOME"/bin/java

# create working directories
echo -e "\nCreating some directories..."
mkdir -p $HOMEDIR/{osm,index,gen,upload}_files

# download osm files
if ! [ -f ${SOURCE} ]; then
  if ! [ "x${SRCURL}" == "x" ]; then
    echo -e "\nSource '$(basename ${SOURCE})' not available yet..."
    echo -e "Will download file to $(dirname $SOURCE)\n"
    $RUNWGET -v -T 5 -O "${SOURCE}" "${SRCURL}" || true
    if [ $? -ne 0 -o ! -s "${SOURCE}" ]; then
      echo -e "\nDownloading '$(basename ${SOURCE})' failed... aborting the build.\n"
      mv -f "${SOURCE}" "${SOURCE}".FAIL
      exit 1
    fi
  else
    exit 1
  fi
fi

## --- BUILDING ---
cd $HOMEDIR/OsmAndMapCreator || exit 1

echo -e "\nCreating ${OSMANDFILE} file..."
$RUNJAVA \
    -Djava.util.logging.config.file=logging.properties \
    -Xms${JAVA_MMIN} -Xmx${JAVA_MMAX} \
    -cp "./OsmAndMapCreator.jar:./lib/OsmAnd-core.jar:./lib/*.jar" \
    net.osmand.data.index.IndexBatchCreator \
    ./batch.xml

echo -e "\nDone!"

mv $HOMEDIR/index_files/*.obf $HOMEDIR/upload_files
if [ "${KEEPSRC}" == "0" ]; then
  rm -rf $HOMEDIR/osm_files
fi
if [ "${KEEPLOG}" == "0" ]; then
  rm -rf $HOMEDIR/{index,gen}_files
else
  mv $HOMEDIR/index_files/*.log $HOMEDIR
fi
