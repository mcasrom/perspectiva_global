#!/bin/bash

# Matar procesos colgados
fuser -k 1313/tcp 2>/dev/null
pkill -9 hugo 2>/dev/null

# Limpiar carpetas temporales de Hugo
rm -rf resources/ public/

# Lanzar el servidor forzando la raíz local
hugo server \
  --baseURL "http://localhost:1313/" \
  --bind 0.0.0.0 \
  --disableFastRender \
  --ignoreCache \
  --noHTTPCache \
  -D
