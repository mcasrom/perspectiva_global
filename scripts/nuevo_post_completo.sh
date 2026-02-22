#!/bin/bash
# Script completo para crear un nuevo post Hugo/PaperMod en Org Mode
# Autor: M.Castillo
# Fecha: $(date +"%Y-%m-%d")

POST_DIR="$HOME/perspectiva_global/content/posts"
IMG_DIR="$HOME/perspectiva_global/assets/images"

# Comprobar que se pasó el título
if [ -z "$1" ]; then
  echo "Uso: $0 \"Título del Post\""
  exit 1
fi

TITLE="$1"
DATE=$(date +"%Y-%m-%d")
FNAME="$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd '[:alnum:]_')"
ORG_FILE="$POST_DIR/${DATE}_${FNAME}.org"
POST_IMG_DIR="$IMG_DIR/$FNAME"

# Crear carpeta de imágenes para este post
mkdir -p "$POST_IMG_DIR"

# Crear archivo Org con cabecera y plantilla base
cat <<EOT > "$ORG_FILE"
#+TITLE: $TITLE
#+AUTHOR: Análisis Geopolítico Estratégico
#+DATE: $DATE
#+EMAIL: mcasrom.emacs@gmail.com
#+DESCRIPTION: Breve descripción del post
#+TAGS[]: geopolítica ciberseguridad infraestructura
#+CATEGORIES[]: Análisis Geopolítico
#+DRAFT: true
#+KEYWORDS: geopolítica ciberseguridad infraestructura

#+begin_export html
{{< alerta >}}
**CRÓNICA GLOBAL:** Introducción breve del post.
{{< /alerta >}}
#+end_export

#+begin_export html
{{< figure src="/images/$FNAME/imagen_ejemplo.png" alt="$TITLE" >}}
#+end_export

* Resumen Ejecutivo

* 1. Sección Principal

* 2. Diagramas y PlantUML

#+BEGIN_SRC plantuml :file $FNAME/diagrama_ejemplo.png :exports none
@startuml
!theme plain
rectangle "Bloque 1" #LightBlue
rectangle "Bloque 2" #LightGreen
[ Bloque 1 ] --> [ Bloque 2 ]
@enduml
#+END_SRC

#+RESULTS:
[[file:$FNAME/diagrama_ejemplo.png]]

#+begin_export html
{{< figure src="/images/$FNAME/diagrama_ejemplo.png" alt="Diagrama Ejemplo" >}}
#+end_export

* 3. Conclusiones

* Referencias Documentales
#+BEGIN_CENTER
/Documento generado automáticamente el $DATE/
/Carpeta de imágenes: $POST_IMG_DIR/
#+END_CENTER

EOT

echo "✅ Nuevo post creado: $ORG_FILE"
echo "📂 Carpeta de imágenes: $POST_IMG_DIR"
