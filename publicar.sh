#!/bin/bash

# 0. Navegar a la carpeta (Crucial para Cron)
cd /home/dietpi/perspectiva_global

# Configuración de colores (solo se verán en manual)
VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m'

echo -e "${AZUL}--> Iniciando proceso de publicación...${NC}"

# 1. Comprobar cambios
if [ -z "$(git status --porcelain)" ]; then 
    echo "No hay cambios para publicar."
    exit 0
fi

# 2. Lógica inteligente para el mensaje de commit
# El comando [ -t 0 ] verifica si hay una terminal abierta
if [ -t 0 ]; then
    # Estamos en modo MANUAL
    echo -e "${VERDE}Escribe el mensaje del commit (o Enter para 'Actualización automática'):${NC}"
    read mensaje
else
    # Estamos en modo CRON (Inatendido)
    mensaje=""
fi

# Si el mensaje está vacío (porque es cron o pulsaste Enter)
if [ -z "$mensaje" ]; then
    mensaje="Actualización automática Odroid: $(date +'%Y-%m-%d %H:%M')"
fi

# 3. Proceso Git
echo -e "${AZUL}--> Sincronizando con GitHub...${NC}"
git add .
git commit -m "$mensaje"
git push origin main

echo -e "${VERDE}--> ¡Hecho! Blog actualizado.${NC}"
