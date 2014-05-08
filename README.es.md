
OSM PBF to OBF
==============

### **Descripción**

`osm.pbf2obf.sh` es un script que crea un archivo `obf` para [OsmAnd](https://github.com/osmandapp/Osmand) desde un archivo `osm.pbf` usando la herramienta **OSMAndCreator**

### **Requerimientos**

* Cualquier OS GNU/Linux (probado en [Slackware Linux](http://www.slackware.com/) 14.0)
* Memoria RAM +2GB
* Herramienta OsmAndMapCreator
* OpenJDK +7
* Wget

### **Instalar**

1. Clonar este repositorio e ingresar al directorio

    `$ git clone https://github.com/51114u9/osm.pbf2obf.git`

    `$ cd osm.pbf2obf`

2. Descargar la herramienta OsmAndMapCreator desde [OsmAnd.net](http://osmand.net/)

    `$ wget -c http://download.osmand.net/releases/OsmAndMapCreator-1.1.3.zip`

3. Descomprimir el archivo `OsmAndMapCreator-1.1.3.zip`

    `$ unzip -d OsmAndMapCreator OsmAndMapCreator-1.1.3.zip`

4. Reemplazar el archivo `batch.xml` en el directorio OsmAndMapCreator

    `$ cp batch.xml OsmAndMapCreator`

### **Configurar**

Editar las líneas del archivo `OsmAndMapCreator/batch.xml` y establecer la ruta completa al directorio del proyecto github, ej.

```
directory_for_osm_files="/home/<user_name>/projects/github/osm.pbf2obf/osm_files"
directory_for_index_files="/home/<user_name>/projects/github/osm.pbf2obf/index_files"
directory_for_generation="/home/<user_name>/projects/github/osm.pbf2obf/gen_files"
```

Editar las líneas del archivo `osm.pbf2obf.sh`

```
HOMEDIR="/home/<user_name>/projects/github/osm.pbf2obf"
COUNTRY="bolivia"
CONTINENT="south-america"
SRCFILE="Bolivia_southamerica.osm.pbf"
JAVA_MMIN="256m"
JAVA_MMAX="2560m"
```

donde:

* `HOMEDIR` - es la ruta completa al directorio del proyecto clonado
* `COUNTRY` - nombre del país (busca tu país en [download.geofabrik.de](http://download.geofabrik.de/))
* `CONTINENT` - nombre del continente (igual que arriba)
* `SRCFILE` - nombre del archivo dentro del directorio **osmand** en tu dispositivo móvil, ej. `Japan_asia.obf`, `Spain_europe.obf`, `Bolivia_southamerica.obf`
* `JAVA_MMIN` - tamaño inicial de memoria para la aplicación java, ej. `250m, 0.5g, 1g`
* `JAVA_MMAX` - tamaño máximo de memoria para la aplicación java, ej. `2550m, 4096m, 2g, 4g`

### **Ejecutar**

1. Correr el script

    `$ sh osm.pbf2obf.sh`

2. Vé y sírvete una taza de café (no instantáneo) porque esto tomará algún tiempo ;-)

3. Una vez generado tu archivo `obf`, cópialo en el directorio `osmand` de tu dispositivo móvil

### **Planificar**

Si tu quieres crear un nuevo archivo cada noche, tu puedes añadir una línea al crontab así

`0 4 * * * /home/<user_name>/projects/github/osm.pbf2obf/osm.pbf2obf.sh > /dev/null 2>&1`

Disfruta!

B^)

---

Licencia: BSD
