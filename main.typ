// --- CONFIGURACIÓN DEL TEMPLATE ---
#set figure(supplement: none)

//
#let proyecto = (
  titulo: "Proyecto EAGON",
  subtitulo: "Sistema de monitoreo de gases con imágenes",
  autores: "Flavio Jara, Diego Henríquez",
  universidad: "Universidad Autónoma de Chile, sede Temuco",
  logo: "./imagenes/logo.png",
  facultad: "Facultad de Ingeniería",
  carrera: "Ingeniería Civil Informática",
  docente: "Mg. Edio Mardones",
  fecha: [#datetime.today().display("[day]/[month]/[year]")],
)

#set page(
  paper: "us-letter",
  margin: (x: 2.5cm, y: 3cm),
  header: align(right, image(proyecto.logo, width: 2.5cm)),
  numbering: "1",
)

#set text(
  size: 12pt,
  lang: "es"
)

#set par(justify: true)

#set heading(numbering: "1.1.")

// --- PORTADA PERSONALIZADA ---
#align(center + horizon)[
  #text(size: 14pt, weight: "bold", proyecto.universidad)
  
  #v(0.1em)
  #text(size: 14pt, proyecto.facultad)

  #v(0.1em)
  #text(size: 12pt, proyecto.carrera)
  
  #v(5em)
  #line(length: 100%, stroke: 0.5pt + gray)
  #text(size: 24pt, weight: "bold", proyecto.titulo)
  #v(0.5em)
  #text(size: 16pt, style: "italic", gray, proyecto.subtitulo)
  #line(length: 100%, stroke: 0.5pt + gray)
  
  #v(5em)
  
  #grid(
    columns: (1fr, 1fr),
    align: (left, right),
    [
      *Autores:* \
      #proyecto.autores
    ],
    [
      *Docente:* \
      #proyecto.docente
    ]
  )

  #v(10em)
  #text(size: 12pt, [#proyecto.fecha])
]

#pagebreak()

// --- ÍNDICE ---
#outline(indent: auto)
#pagebreak()

// --- CONTENIDO DEL INFORME ---

= Contextualización

#v(1em)

El proyecto EAGON surge de la necesidad de monitorear el impacto ambiental en la planta industrial *EAGON*, mediante una alianza estratégica con la carrera de Ingeniería Civil Informática de la Universidad Autónoma de Chile.
La iniciativa busca aplicar tecnologías de Industria 4.0 (IoT + ML) para digitalizar y alertar sobre el estado de las emisiones en calderas.

#v(1em)

== Problema y Justificación Técnica
Tras una evaluación en terreno, se determinó que los métodos tradicionales de monitoreo son inviables para este contexto específico por las siguientes razones:

- *Hostilidad del ambiente:* Las temperaturas en las chimeneas oscilan entre los $176°C$ y $279°C$. Los sensores básicos de gases *in-situ* se derriten o saturan bajo estas condiciones.
- *Costos elevados:* La instrumentación industrial de alta gama (quimioluminiscencia) requiere una inversión mínima de $45,000$ USD, además de altos costos de mantenimiento y sistemas de enfriamiento.
- *Falta de datos históricos:* No existe un registro digitalizado de la columna de gas que permita realizar análisis preventivos o predictivos.

#v(1em)

== Solución Propuesta
Se ha optado por un sistema de *Visión Artificial*, el cual permite una evaluación no invasiva al operar de forma externa a la salida de la chimenea.


- *Hardware:* El nodo sensor utiliza una *Raspberry Pi 5* conectada a un módulo óptico de alta resolución para la captura de imágenes cada 30 segundos.
- *Diseño Mecánico:* Se ha diseñado una carcasa industrial a medida mediante *FreeCAD* e impresión 3D en filamento ABS para proteger la electrónica de las condiciones climáticas y ambientales.
- *Procesamiento Local (Edge Computing):* La Raspberry procesa las imágenes internamente utilizando algoritmos de visión artificial para calcular la densidad y color de la pluma.

#v(1em)

= Plan de Trabajo Académico
El desarrollo del proyecto se estructura en cuatro fases clave, ejecutadas por estudiantes de ingeniería bajo supervisión docente:

== *Fase 1: Diseño del prototipo mínimo viable:*
Diseño y montaje del hardaware básico para la creación de un dataset con imágenes en diferentes estados de la caldera, condiciones climáticas y horarios.

=== Imágenes

#grid(columns:2,
  rows: 2,
  gutter: 18pt,
  grid.cell(
    figure(
      image("imagenes/whiteboard_diagram.jpeg", width: 80%),
      caption: [Diagrama de módulos, con direcciones IP y calculos de tamaño en disco.],
    )
  ),
  grid.cell(
    figure(
      image("imagenes/logs_backend.jpeg", width: 80%),
      caption: [Registros de ejecución del servidor detallando eventos de sistema. ],
    )
  ),
  grid.cell(
    figure(
      image("imagenes/prototype_1st_meeting.jpeg", width: 80%),
      caption: [Estado del prototipo durante la primera reunión.],
    )
  ),
  grid.cell(
    figure(
      image("imagenes/prototype_case.jpeg", width: 80%),
      caption: [Prototipo de carcasa diseñada para la protección del hardware.],
    )

  )
)

== *Fase 2: Recolección de datos*
Instalación del prototipo en terreno para la captura de imágenes cada 30 segundos, con el objetivo de construir un dataset representativo de las condiciones operativas y ambientales.
== *Fase 3: Entrenamiento del modelo*
Se utilizará el dataset creado en la fase anterior para la implementación de modelos de clasificación cualitativa (vapor vs hidrocarburos) utilizando técnicas de visión artificial, con el objetivo de validar la viabilidad del enfoque y generar alertas tempranas.
== *Fase 4: Escalamiento tecnológico:*
Transición del análisis cualitativo al cuantitativo mediante técnicas de espectroscopía (DOAS), *sujeto a disponibilidad de fondos futuros*.


El proyecto actualmente se encuentra en la fase de recolección de datos, con el prototipo de hardware adportas de ser instalado para la captura de imágenes.

#v(1em)

= Valor Agregado e Innovación
El proyecto transforma la inspección manual en un monitoreo digital completo. Al correlacionar el análisis visual con los datos físicos de la caldera (temperatura, vapor, oxígeno), se logra una robustez predictiva que permite optimizar la operación y posicionar a la empresa en liderazgo tecnológico ambiental.

#v(1em)

= Descripción de Hardware

El prototipo se ha diseñado de forma robusta para que sea capaz de soportar las condiciones ambientales críticas a las que se verá expuesto para captar la información de las calderas. A continuación, se detallan los componentes finales integrados en el sistema:

#v(1em)

== Unidad de Procesamiento: Raspberry Pi 5
Se ha seleccionado la *Raspberry Pi 5* como núcleo del sistema debido a su alta capacidad de procesamiento, necesaria para gestionar la captura de imágenes de alta resolución y el envío en de estas a la nube DropBox en tiempo real. 

- *Gestión Térmica:* Debido a las altas temperaturas del sitio de operación, es obligatorio el uso de un Active Cooler para asegurar la durabilidad y el rendimiento constante del equipo.
- *Sistema Operativo:* El dispositivo opera con Raspberry Pi OS sin interfaz gráfica, optimizado para la ejecución de scripts.

#v(1em)

== Módulo Óptico
Para la vigilancia de la pluma de gases, se integró una cámara Raspberry Pi de 5MP (modelo OV5647). 
- *Capacidad:* Permite capturar detalles precisos de la salida de gases para su posterior análisis de opacidad.
- *Protección:* Para evitar la entrada de hollín y humedad, se diseñó una pieza extra de PLA montable a la carcasa dedicada a la protección del lente, la cual integra una mica protectora para el lente, sellada con pegamento a prueba de agua.

#v(1em)

== Diseño Mecánico y Carcasa (FreeCAD)
La protección física del nodo fue diseñada íntegramente en *FreeCAD* y fabricada mediante impresión 3D.

- *Material:* Se utilizó filamento *PLA*, seleccionado por su temperatura de deformación ($50-60°"C"$) apta para las condiciones, por su facilidad de impresión y su bajo costo.
- *Estructura:* La carcasa cuenta con un diseño modular que permite un fácil acceso a los componentes internos para mantenimiento, además de orificios y compartimientos estratégicos para la disipación de calor y la protección contra el ingreso de partículas.
- *Hermeticidad:* Se incorporó pegamento a prueba de agua para sellar las uniones mecánicas y evitar la entrada de humedad o partículas contaminantes al sistema.

#v(2em)

#grid(columns:2,
  rows: 2,
  gutter: 18pt,
  grid.cell(
    figure(
      image("imagenes/3d model.png", width: 108%),
      caption: [Diseño 3D del prototipo en FreeCAD, vista general.],
    )
  ),
  grid.cell(
    figure(
      image("imagenes/cover-cam.png", width: 80%),
      caption: [Pieza de protección del lente diseñada para evitar la entrada de hollín y humedad.],
    )
  ),
  grid.cell(
    colspan: 2,
    figure(
      image("imagenes/case-top.png", width: 80%),
      caption: [Vista inferior de la tapa y soporte de la raspberry, con soportes en altura para ventilación y protección de la electrónica.],
    )
  )

)



#v(2em)

= Estructura de Software
El sistema se divide en dos secciones para asegurar la modularidad y facilitar una futura publicación científica.

#v(1em)

== Almacenamiento
Para garantizar la integridad de los datos ante posibles fallos de red:
- *Red:* Se implementará una conexión a red mediante un cable Ethernet para asegurar la continuidad en la transmisión de datos.
- *Envío de Datos:* El sistema está configurado para realizar envíos secuenciales constantes de las imágenes capturadas a una nube (DropBox) luego de que estas mismas ya hayan sido procesada (recorte, corrección de color, escala de grises y compresión), disminuyendo considerablemnte el peso de las imágenes, evitando una carga excesiva en la red.
- *Seguridad:* Se han implementado medidas de seguridad básicas como el uso de credenciales seguras para la conexión tanto a la nube, como a la misma Raspberry Pi.

#v(1em)

== Gestión de errores
El sistema cuenta con un mecanismo de monitoreo interno que detecta y registra cualquier anomalía en la captura o transmisión de datos.
- *Registro de eventos:* Todos los errores y eventos importantes se registran en un archivo de log para su posterior análisis y mejora continua del sistema.
- *Falla en la captura:* En caso de una falla en la captura de una imagen, el sistema está diseñado para continuar operando y capturando nuevas imágenes, asegurando que la falta de transmisión no afecte la continuidad del monitoreo.
- *Fallas en sistema de envío:* El sistema de envío cuenta con un mecanismo de manejo de excepciones diseñado para mitigar fallos por conectividad intermitente. Ante un error de envío, continúa con la secuencia de monitoreo para proteger la integridad de la operación. Esta estrategia de 'fallo silencioso' se sustenta en una frecuencia de muestreo redundante, lo que garantiza que la base de datos mantenga la densidad de información requerida para los modelos de aprendizaje profundo.

= Próximos Pasos
1. Instalación del prototipo en terreno para la recolección de datos hasta el mes de junio, con un plan de captura de imágenes cada 30 segundos.
2. Desarrollo de algoritmos de visión artificial para el análisis de la pluma de gases, con un enfoque inicial en la clasificación cualitativa (vapor vs hidrocarburos).
3. Implementación de un dashboard web para la visualización en tiempo real de los resultados y la generación de alertas preventivas.
