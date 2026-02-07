#!/bin/bash
cd /home/dietpi/perspectiva_global

# 1. Comprobar cambios
if [ -z "$(git status --porcelain)" ]; then 
    echo "$(date): No hay cambios." exit 0
fi

# 2. Mensaje de commit: SIN 'read' si no hay terminal
# Usamos una variable por defecto si no se pasa como argumento
MENSAJE_AUTO="Actualización automática Odroid: $(date +'%Y-%m-%d %H:%M')"

if [ -t 0 ]; then
    # Solo pregunta si hay una terminal real (teclado)
    echo "Escribe el mensaje del commit (o Enter para usar el defecto):"
    read -t 10 input  # Espera 10 segundos, si no, sigue solo
    mensaje=${input:-$MENSAJE_AUTO}
else
    # En Cron, no preguntes nada
    mensaje=$MENSAJE_AUTO
fi

# 3. Proceso Git (con rutas completas por seguridad)
/usr/bin/git add .
/usr/bin/git commit -m "$mensaje"
/usr/bin/git push origin main
