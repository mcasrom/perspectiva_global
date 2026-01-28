#!/bin/bash

# Configuración: Colores para la terminal
VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m' # Sin color

echo -e "${AZUL}--> Iniciando proceso de publicación de Perspectiva Global...${NC}"

# 1. Comprobar si hay cambios
if [ -z "$(git status --porcelain)" ]; then 
    echo "No hay cambios para publicar."
    exit 0
fi

# 2. Pedir mensaje de commit (opcional, si no, usa uno genérico)
echo -e "${VERDE}Escribe el mensaje del commit (o pulsa Enter para 'Actualización automática'):${NC}"
read mensaje
if [ -z "$mensaje" ]; then
    mensaje="Actualización automática: $(date +'%Y-%m-%d %H:%M')"
fi

# 3. Proceso Git
echo -e "${AZUL}--> Sincronizando con GitHub...${NC}"
git add .
git commit -m "$mensaje"
git push origin main

echo -e "${VERDE}--> ¡Listo! El robot de GitHub está cocinando tu blog ahora mismo.${NC}"
echo -e "${AZUL}--> URL: https://mcasrom.github.io/perspectiva_global/${NC}"
