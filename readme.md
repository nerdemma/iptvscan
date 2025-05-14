# Iptv Scanner

A partir de una lista proporcionada en el directorio local, este script permite inspeccionar la disponibilidad de cada canal de streaming iptv generando una lista unica de canales disponibles.

## Instalación
```bash
$git -clone https://github.com/nerdemma/iptvscan
$cd iptvscan
$./iptvscan archivo.m3u nuevoarchivo.m3u
```
## Uso
```
$./iptvscan archivo.m3u archivodesalida.m3u #lo que va a realizar es escanear cada url de la lista **archivo.m3u** y guardar unicamente los canales disponibles que responda la solicitud de curl.
```
## Dependencias
Este script se probo en un equipo con las siguientes caracteristicas. 
-- curl 7.68.0 (x86_64-pc-linux-gnu) libcurl/7.68.0 OpenSSL/1.1.1f zlib/1.2.11 brotli/1.0.7 libidn2/2.2.0 libpsl/0.21.0 (+libidn2/2.2.0) libssh/0.9.3/openssl/zlib nghttp2/1.40.0 librtmp/2.3
Release-Date: 2020-01-08

-- Linux kosmos 5.4.0-215-generic #235-Ubuntu SMP Fri Apr 11 21:55:32 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

-- GNU bash, versión 5.0.17(1)-release (x86_64-pc-linux-gnu)
Copyright (C) 2019 Free Software Foundation, Inc.
Licencia GPLv3+: GPL de GNU versión 3 o posterior <http://gnu.org/licenses/gpl.html>

## Licencia
Este script esta bajo la licencia GPL

