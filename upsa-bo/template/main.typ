#import "../lib.typ": back-matter, front-matter, main-matter, settings

#let is-web = eval(sys.inputs.at("web", default: "false"))

#show: settings.with(
  fonts: (
    body: "Source Serif 4",
    title: "Source Sans 3",
  ),
  graduation-work-info: (
    abstract: lorem(20),
    keywords: ("UPSA", "tesis"),
  ),
  is-web: is-web,
)

#front-matter(
  executive-summary: lorem(50),
  objective: lorem(30),
  problem: lorem(20),
)

#show: main-matter.with()

= Introducción

== Definiciones

#lorem(500)

=== Justificación

#lorem(50)

==== Justificación académica

#lorem(100)

===== Sobre la Universidad

#lorem(100)

====== Historia de la Universidad
#lorem(100)

======= Misión y Visión de la Universidad
#lorem(100)

=== Objetivos

#lorem(20)

==== Objetivo general

#lorem(100)

==== Objetivos específicos

#lorem(50)

+ #lorem(100)
+ #lorem(100)
+ #lorem(100)
+ #lorem(100)
+ #lorem(100)

= Desarrollo

== Análisis de requerimientos

#lorem(20)

=== Requerimientos funcionales

#lorem(300)

=== Requerimientos no funcionales

#lorem(500)

#figure(
  table(
    columns: 3,
    table.header([Caso de Uso], [Actor], [Descripción]),
    [CU-01], [Usuario], [El usuario inicia sesión en el sistema.],
    [CU-02], [Administrador], [El administrador gestiona los usuarios.],
    table.hline(),
  ),
  caption: [Tabla de Casos de Uso],
)

== Pruebas

=== Código Fuente

#lorem(10)

#figure(
  ```go
  package main

  import "fmt"

  func main() {
      fmt.Println("Hello, World!")
  }
  ```,
  alt: "Hello World en Go",
  caption: [Ejemplo de código fuente en Go],
)

=== Verificación y validación

#lorem(30)

#figure(
  caption: [Recurrencia de complejidad algorítmica (Teorema Maestro) y entropía de Shannon],
  kind: math.equation,
  $
    T(n) & = a T(n/b) + f(n) \
    H(X) & = - sum_(i=1)^n p(x_i) log_2 p(x_i)
  $,
  alt: "Ecuación de complejidad algorítmica y entropía",
)


= Conclusiones

== Conclusiones

#lorem(50)

=== #lorem(10)

#lorem(40)

=== #lorem(10)

#lorem(40)

=== #lorem(10)

#lorem(40)

=== #lorem(10)

#lorem(40)

=== #lorem(10)

#lorem(40)

== Recomendaciones

#lorem(500)

#show: back-matter.with()

#bibliography(
  "referencias.yaml",
  style: "ieee",
  full: true,
)

= Anexos

== Curriculum Vitae

== Carta de Aprobación

#lorem(100)

== Presupuesto

#lorem(100)

=== Herramientas

#lorem(50)
