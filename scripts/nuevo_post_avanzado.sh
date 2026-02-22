#!/bin/bash
# Script avanzado: crea post Org Mode completo con PlantUML y plantilla Hugo/PaperMod
# Autor: M.Castillo
# Fecha: $(date +"%Y-%m-%d")

POST_DIR="$HOME/perspectiva_global/content/posts"
IMG_DIR="$HOME/perspectiva_global/assets/images"

# Validación de título
if [ -z "$1" ]; then
  echo "Uso: $0 \"Título del Post\""
  exit 1
fi

TITLE="$1"
DATE=$(date +"%Y-%m-%d")
FNAME="$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd '[:alnum:]_')"
ORG_FILE="$POST_DIR/${DATE}_${FNAME}.org"
POST_IMG_DIR="$IMG_DIR/$FNAME"

# Crear carpeta de imágenes
mkdir -p "$POST_IMG_DIR"

# Crear archivo Org con plantilla completa
cat <<EOT > "$ORG_FILE"
#+TITLE: $TITLE
#+AUTHOR: Análisis Geopolítico Estratégico
#+DATE: $DATE
#+EMAIL: mcasrom.emacs@gmail.com
#+DESCRIPTION: Breve descripción analítica
#+TAGS[]: geopolítica ciberseguridad infraestructura
#+CATEGORIES[]: Análisis Geopolítico
#+DRAFT: true
#+KEYWORDS: geopolítica ciberseguridad infraestructura

#+begin_export html
{{< alerta >}}
**CRÓNICA GLOBAL:** Introducción crítica.
{{< /alerta >}}
#+end_export

#+begin_export html
{{< figure src="/images/$FNAME/imagen_portada.png" alt="$TITLE" >}}
#+end_export

* Resumen Ejecutivo

* 1. Fundamentos Tecnológicos y Estratégicos

#+BEGIN_SRC plantuml :file $FNAME/diagrama_arquitectura.png :exports none
@startuml
rectangle "Infraestructura Global" #LightBlue
rectangle "Nodos Continentales" #LightGreen
rectangle "Cables Troncales" #LightCoral
rectangle "PoPs y CDNs" #LightYellow
[Nodos Continentales] --> [Cables Troncales]
[Cables Troncales] --> [PoPs y CDNs]
@enduml
#+END_SRC

#+RESULTS:
[[file:$FNAME/diagrama_arquitectura.png]]

#+begin_export html
{{< figure src="/images/$FNAME/diagrama_arquitectura.png" alt="Arquitectura" >}}
#+end_export

* 2. Dimensiones Geopolíticas

#+BEGIN_SRC plantuml :file $FNAME/evolucion_control.png :exports none
@startuml
title Evolución Control Cables 1850-2026
rectangle "Imperial 1850-1945" #FFE4E1
rectangle "Telecom 1945-2000" #E6F3FF
rectangle "Digital 2000-2015" #E8F5E9
rectangle "Big Tech 2015-Presente" #FFF3E0
@enduml
#+END_SRC

#+RESULTS:
[[file:$FNAME/evolucion_control.png]]

#+begin_export html
{{< figure src="/images/$FNAME/evolucion_control.png" alt="Evolución Control" >}}
#+end_export

#+BEGIN_SRC plantuml :file $FNAME/actores_estrategias.png :exports none
@startmindmap
title Actores y Estrategias
+ Estados Unidos
++ NSA/Five Eyes
+ China
++ Peace Cable, Huawei Marine
+ Rusia
++ Cables Ártico
+ Unión Europea
++ Dependencia crítica
+ Big Tech
++ Google, Meta, Amazon, Microsoft
@endmindmap
#+END_SRC

#+RESULTS:
[[file:$FNAME/actores_estrategias.png]]

#+begin_export html
{{< figure src="/images/$FNAME/actores_estrategias.png" alt="Actores" >}}
#+end_export

* 3. Aspectos Críticos y Valoración Estratégica

* 4. Escenarios de Conflicto y Amenazas Emergentes

#+BEGIN_SRC plantuml :file $FNAME/matriz_amenazas.png :exports none
@startuml
title Matriz de Amenazas
rectangle "Alta Probabilidad/Bajo Impacto" #FFE4E1
rectangle "Alta Probabilidad/Alto Impacto" #FFB6C1
rectangle "Baja Probabilidad/Bajo Impacto" #E6F3FF
rectangle "Baja Probabilidad/Alto Impacto" #FF6B6B
@enduml
#+END_SRC

#+RESULTS:
[[file:$FNAME/matriz_amenazas.png]]

#+begin_export html
{{< figure src="/images/$FNAME/matriz_amenazas.png" alt="Matriz Amenazas" >}}
#+end_export

* 5. Implicaciones Estratégicas

#+BEGIN_SRC plantuml :file $FNAME/triangulo_gobernanza.png :exports none
@startuml
title Trilema Gobernanza
object Seguridad #LightCoral
object Economia #LightGreen
object Libertad #LightBlue
Seguridad -[#red,bold]- Economia
Economia -[#red,bold]- Libertad
Libertad -[#red,bold]- Seguridad
@enduml
#+END_SRC

#+RESULTS:
[[file:$FNAME/triangulo_gobernanza.png]]

#+begin_export html
{{< figure src="/images/$FNAME/triangulo_gobernanza.png" alt="Triángulo Gobernanza" >}}
#+end_export

* 6. Tendencias Futuras

#+BEGIN_SRC plantuml :file $FNAME/prospectiva_temporal.png :exports none
@startuml
title Prospectiva Temporal
robust "Evolución Geopolítica" as evolucion
@0
evolucion is "Presente" #LightBlue
@5
evolucion is "Corto Plazo" #LightGreen
@10
evolucion is "Medio Plazo" #LightYellow
@15
evolucion is "Largo Plazo" #LightCoral
@0 <-> @5
@5 <-> @10
@10 <-> @15
@enduml
#+END_SRC

#+RESULTS:
[[file:$FNAME/prospectiva_temporal.png]]

#+begin_export html
{{< figure src="/images/$FNAME/prospectiva_temporal.png" alt="Prospectiva Temporal" >}}
#+end_export

* 7. Recomendaciones y Conclusiones

* Referencias Documentales

#+BEGIN_CENTER
/Documento generado automáticamente el $DATE/
/Carpeta de imágenes: $POST_IMG_DIR/
#+END_CENTER

EOT

echo "✅ Post avanzado creado: $ORG_FILE"
echo "📂 Carpeta de imágenes: $POST_IMG_DIR"
