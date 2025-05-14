#Iptv - Scanner

A partir de una lista proporcionada en el directorio local, este script permite inspeccionar la disponibilidad de cada canal de streaming iptv generando una lista unica de canales disponibles.

##Instalación
```bash
$git -clone https://github.com/nerdemma/iptvscan
$cd iptvscan
$./iptvscan archivo.m3u nuevoarchivo.m3u
```
##Uso
```
$./iptvscan archivo.m3u archivodesalida.m3u #lo que va a realizar es escanear cada url de la lista **archivo.m3u** y guardar unicamente los canales disponibles que responda la solicitud de curl.
```
##Dependencias
Este script se desarrollo dentro de ubuntu 20.04, con bash, curl y se ha testeado el resultado con vlc.


