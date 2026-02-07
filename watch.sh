#!/bin/bash

# 1. Matar procesos colgados
fuser -k 1313/tcp 2>/dev/null
pkill -9 hugo 2>/dev/null

# 2. Limpiar carpetas temporales de Hugo
rm -rf resources/ public/

# 3. Detectar la IP actual del Odroid (dinámico)
IP_ODROID=$(hostname -I | awk '{print $1}')

echo "----------------------------------------------------------"
echo " Lanzando Hugo en: http://$IP_ODROID:1313"
echo "----------------------------------------------------------"

# 4. Lanzar el servidor con la IP correcta para que tu Laptop la vea bien
hugo server \
  --baseURL "http://$IP_ODROID:1313/" \
  --bind 0.0.0.0 \
  --disableFastRender \
  --ignoreCache \
  --noHTTPCache \
  -D
