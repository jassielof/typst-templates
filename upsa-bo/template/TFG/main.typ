#import "../../lib.typ": *

#show: tfg.with(
  título: [The Typst Typesetting System],
  autor: [Nombre Apellido],
  registro-autor: [YEAR-XXXXXX],
  facultad: [FAI: Facultad de Ingeniería],
  carrera: [Ingeniería de Sistemas],
  modalidad: [Proyecto de Grado],
  palabras-clave: ("typst", "typesetting", "system"),
  email: "name@example.com",
  contenido: outline(target: heading.where(level: 2, outlined: true, supplement: [Capítulo]), title: none),
  guía: [Docente Guía],
)


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

#heading(numbering: none)[Bibliografía]
#bibliography(
  "../referencias.yml",
  // style: "apa",
  title: none,
  full: true,
)

#show: anexos
== CV
== Carta de Aprobación
== Presupuesto

