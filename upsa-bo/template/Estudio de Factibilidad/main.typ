#import "../../lib.typ": *

#show: tfg.with(
  título: [Estudio de Factibilidad],
  materia: [SIGLA: Proyectos],
  fecha: [Semestre, Año],
  modalidad: [Proyecto de Grado],
  guía: [Docente Guía],
  autor: [Nombre Apellido],
  facultad: [FAI: Facultad de Ingeniería],
  carrera: [Ingeniería de Sistemas],
  abstracto: lorem(50),
  resumen-ejecutivo: lorem(50),
)

#contenido-principal[
  #set heading(offset: 1)
  #include "capítulos/1.introducción.typ"
  #include "capítulos/2.marco teórico.typ"
  #include "capítulos/3.diagnóstico interno de la empresa.typ"
  #include "capítulos/4.estudio de la materia prima e insumos.typ"
  #include "capítulos/5.estudio de mercado.typ"
  #include "capítulos/6.localización y tamaño.typ"
  #include "capítulos/7.estudio de ingeniería.typ"
  #include "capítulos/8.inversiones.typ"
  #include "capítulos/9.presupuesto de ingresos y costos.typ"
  #include "capítulos/10.financiamiento.typ"
  #include "capítulos/11.evaluación social y ambiental.typ"
  #include "capítulos/12.diseño de la organización.typ"
  #include "capítulos/13.evaluación económica y financiera.typ"
  #include "capítulos/14.conclusiones y recomendaciones.typ"
]

#heading(numbering: none)[Bibliografía]
#bibliography(
  "../referencias.yml",
  // style: "apa",
  title: none,
  // full: true,
)

#anexos[
  #set heading(offset: 1)
  = Instrumentos para la Recolección de Información
  == Guías de Entrevistas
  == Cuestionarios
  == Etc.
  = Propios de la Investigación
  = Cálculos, Tablas, Cotizaciones, Etc.
  = Curriculum Vitae
]
