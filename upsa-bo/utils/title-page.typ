// Art 135: Lomo
// En el lomo se debe colocar: UPSA, sigla respectiva de modalidad de grado, título de trabajo, numeración romana de los tomos (si corresponde) y año.
// Esto no va en la portada ni en el documento final, dado que esta es planilla para documento, pero esta relacionado.
#let portada(
  título,
  facultad,
  carrera,
  plan,
  modalidad,
  autor,
  incluir-guía: false,
  registro-autor,
  guía,
  ubicación,
  fecha,
  portada-externa,
  grado,
  fuentes,
) = context {
  // Art. 134: Cubierta o tapa
  // En la cubierta o tapa de la TL, PG, TD o documento de GE
  // se debe colocar con letras de color negro, partiendo de la parte superior: logo de la universidad en color negro, facultad y carrera, modalidad de graduación, título del trabajo, nombre del autor, ciudad, pais y año.
  // Art. 136: Carátula o tapa interna
  // En la carátula o tapa interna se debe colocar lo mismo que en la tapa (portada externa) con la sola adición de: "{modalidad de grado} para optar al grado de {grado} en {carrera}".
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

  if guía != [] and incluir-guía {
    guía
    parbreak()
  }

  ubicación
  parbreak()
  repr(fecha)
}
