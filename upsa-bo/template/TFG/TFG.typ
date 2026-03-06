#import "../../lib.typ": *

#show: tfg.with(
  // Máximo 15 palabras
  título: [Mi Título],
  autor: [Nombre Apellido/s],
  registro-autor: [XXXXXXXXXX],
  facultad: [FAI: Facultad de Ingeniería],
  carrera: [Ingeniería de Sistemas],
  modalidad: [Proyecto de Grado],
  palabras-clave: ("typesetting", "system"), // Ya incluye UPSA por defecto.
  email: "nombre@upsa.edu.bo", // o personal/profesional
  contenido: outline(
    target: heading.where(
      level: 2,
      outlined: true,
      supplement: [Capítulo],
    ),
    title: none,
  ),
  guía: [Docente/Guía],
)

// Por defecto, la plantilla viene estructurada por partes como nivel inicial, si tu documento no incluye partes y solo capítulos, solo agregá la siguiente línea.
#set heading(offset: 1)
= Introducción
== Definiciones
== Empresa
== The Typst Typesetting System
= Requerimientos
== Análisis de Requerimientos
== Casos de Uso
== Análisis y Diseño
== Análisis de Robustez
= Entrega
== Diagramas de Secuencia
== Diagrama de Clase
== Código Fuente
== Pruebas
= Conclusiones

#bibliography(
  "../referencias.yml",
  style: "../Assets/apa.csl",
  title: [Bibliografía],
  full: true,
)

#show: anexos
= CV
= Carta de Aprobación
= Presupuesto
