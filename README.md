
OSM PBF to OBF
==============

### **Description**

`osm.pbf2obf.sh` is a script that creates a `obf` file to [OsmAnd](https://github.com/osmandapp/Osmand) from a `osm.pbf` file using **OSMAndCreator** tool

### **Requirements**

* Any OS GNU/Linux (tested in [Slackware Linux](http://www.slackware.com/) 14.0)
* Memory RAM +2GB
* OsmAndMapCreator tool
* OpenJDK +7
* Wget

### **Install**

1. Clone this repository and enter to the directory

    `$ git clone https://github.com/51114u9/osm.pbf2obf.git`

    `$ cd osm.pbf2obf`

2. Download OsmAndMapCreator tool from [OsmAnd.net](http://osmand.net/)

    `$ wget -c http://download.osmand.net/releases/OsmAndMapCreator-1.1.3.zip`

3. Unzip `OsmAndMapCreator-1.1.3.zip` file

    `$ unzip -d OsmAndMapCreator OsmAndMapCreator-1.1.3.zip`

4. Replace `batch.xml` file into OsmAndMapCreator directory

    `$ cp batch.xml OsmAndMapCreator`

### **Setup**

Edit lines of `OsmAndMapCreator/batch.xml` file and set full directory path to github project directory, e.g.

```
directory_for_osm_files="/home/<user_name>/projects/github/osm.pbf2obf/osm_files"
directory_for_index_files="/home/<user_name>/projects/github/osm.pbf2obf/index_files"
directory_for_generation="/home/<user_name>/projects/github/osm.pbf2obf/gen_files"
```

Edit lines of `osm.pbf2obf.sh` file

```
HOMEDIR="/home/<user_name>/projects/github/osm.pbf2obf"
OSMANDFILE="Bolivia_southamerica.osm.pbf"
SRCURL="http://download.geofabrik.de/south-america/bolivia-latest.osm.pbf"
JAVA_MMIN="256m"
JAVA_MMAX="2560m"
```

where:

* `HOMEDIR` - is the full directory path to the project cloned
* `OSMANDFILE` - filename inside the **osmand** directory on the mobile device, e.g. `Japan_asia.obf`, `Spain_europe.obf`, `Bolivia_southamerica.obf`
* `SRCURL` - url of the ".pbf" file. Get from [download.geofabrik.de](http://download.geofabrik.de/) or [download.openstreetmap.fr](http://download.openstreetmap.fr/extracts/)
* `JAVA_MMIN` - initial size of memory to java app, e.g. `250m, 0.5g, 1g`
* `JAVA_MMAX` - maximum size of memory to java app, e.g. `2550m, 4096m, 2g, 4g`

If you have Ubuntu based distro, replace the first line with

```
#!/bin/bash
```

### **Execute**

1. Run script

    `$ sh osm.pbf2obf.sh`  // POSIX distro

    `$ bash osm.pbf2obf.sh`  // Ubuntu based distro

2. Go and pour yourself a cup of coffee (not instant) because it will take a few minutes ;-)

3. Once generated your `obf` file, you can copy it into the `osmand` directory on your mobile device

### **Schedule**

If you want to create a new file every night, you could add a crontab line like

`0 4 * * * /home/<user_name>/projects/github/osm.pbf2obf/osm.pbf2obf.sh > /dev/null 2>&1`

Enjoy!

B^)

---

License: BSD
