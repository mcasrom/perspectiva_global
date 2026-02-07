#!/bin/bash

# 0. Navegar a la ruta absoluta (Vital para Cron)
cd /home/dietpi/perspectiva_global

# Configuración: Colores
VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m'

echo -e "${AZUL}--> Iniciando proceso de publicación...${NC}"

# 1. Comprobar si hay cambios
if [ -z "$(git status --porcelain)" ]; then 
    echo "No hay cambios para publicar."
    exit 0
fi

# 2. Gestión del mensaje de commit (Modificado para Cron)
# Si el script detecta que NO hay una terminal interactiva (stdin), usa el mensaje genérico
if [ -t 0 ]; then
    echo -e "${VERDE}Escribe el mensaje del commit (o Enter para 'Actualización automática'):${NC}"
    read -t 10 mensaje  # Espera 10 segundos, si no, sigue
else
    mensaje=""
fi

if [ -z "$mensaje" ]; then
    mensaje="Actualización automática: $(date +'%Y-%m-%d %H:%M')"
fi

# 3. Proceso Git
echo -e "${AZUL}--> Sincronizando con GitHub...${NC}"
git add .
git commit -m "$mensaje"
# Usamos -u para asegurar el tracking si fuera la primera vez
git push origin main

echo -e "${VERDE}--> ¡Hecho! Blog actualizado.${NC}"
