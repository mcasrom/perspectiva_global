#!/bin/bash
# Script para generar un nuevo post Hugo/PaperMod con cabecera Org Mode

POST_DIR="$HOME/perspectiva_global/content/posts"

# Comprobar que se pasó el título
if [ -z "$1" ]; then
  echo "Uso: $0 \"Título del Post\""
  exit 1
fi

TITLE="$1"
DATE=$(date +"%Y-%m-%d")
FILENAME="${DATE}_$(echo $TITLE | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd '[:alnum:]_').org"
FILEPATH="$POST_DIR/$FILENAME"

# Cabecera base
cat <<EOT > "$FILEPATH"
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
{{< figure src="/images/imagen_ejemplo.png" alt="$TITLE" >}}
#+end_export

* Resumen Ejecutivo

* 1. Sección Principal

EOT

echo "Nuevo post creado: $FILEPATH"
