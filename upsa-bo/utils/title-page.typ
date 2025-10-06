#let portada(
  título,
  facultad,
  carrera,
  plan,
  modalidad,
  autor,
  registro-autor,
  guía,
  ubicación,
  fecha,
  portada-externa,
  grado,
  fuentes,
) = context {
  set align(center)
  set text(weight: "black", font: fuentes.títulos)
  image("../assets/images/logo-upsa.png")
  v(1fr)
  facultad
  parbreak()
  carrera
  v(1fr)

  if plan != [] {
    plan
  }

  if modalidad != [] [
    Modalidad de Graduación

    #modalidad

    #v(1fr)
  ]

  rect(
    radius: 20%,
    inset: 10pt,
    text(font: fuentes.cuerpo, weight: "bold")[_«#título»_],
  )

  if (here().page() == 3 and portada-externa) {
    v(1fr)
    [#modalidad para optar por el grado de «#grado en #carrera»]
  }

  v(1fr)

  autor

  if registro-autor != [] and here().page() == 3 [
    #parbreak()
    Reg.: #registro-autor
  ]

  v(1fr)

  if guía != [] {
    guía
    parbreak()
  }

  ubicación
  parbreak()
  repr(fecha)
}
