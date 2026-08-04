#import "state.typ": (
  document-advisor, document-author, document-degree, document-fonts, document-graduation-work, document-institution,
  document-paragraph,
)

#let uni-logo = image(
  "../assets/images/upsa-logo.webp",
  width: 50%,
  alt: "Logo de la Universidad Privada de Santa Cruz de la Sierra",
)

// Art. 136: Carátula o tapa interna.
//
// En la carátula o tapa interna se debe colocar lo mismo que en la tapa (portada externa) con la sola adición de: "{modalidad de grado} para optar al grado de {grado} en {carrera}".
#let title-page(is-front-cover: false) = context {
  let fonts = document-fonts.get()
  let author-info = document-author.get()
  let institution-info = document-institution.get()
  let degree-info = document-degree.get()
  let graduation-work-info = document-graduation-work.get()
  let advisor-info = document-advisor.get()

  set text(weight: "bold", size: fonts.size, font: fonts.title)
  set page(margin: 1in) if is-front-cover

  set align(center)

  uni-logo
  v(1fr)
  institution-info.faculty.long
  parbreak()
  degree-info.program
  v(1fr)

  if graduation-work-info.is-plan {
    [Plan de trabajo de graduación]
    v(1fr)
  }

  if graduation-work-info.modality != none {
    [Modalidad de graduación]
    parbreak()
    graduation-work-info.modality
    v(1fr)
  }

  rect(
    radius: 20%,
    inset: 10pt,
    text(font: fonts.body, weight: "semibold", size: 1.1em)[_«#graduation-work-info.title»_],
  )

  if not is-front-cover {
    v(1fr)
    [
      #graduation-work-info.modality para optar por el grado de

      «#degree-info.level en #degree-info.program»
    ]
  }

  v(1fr)

  author-info.name

  if author-info.id != none and not is-front-cover [
    #parbreak()
    Reg.: #author-info.id
  ]

  v(1fr)

  if advisor-info.name != none {
    advisor-info.name
    parbreak()
  }

  institution-info.location
  parbreak()
  [#graduation-work-info.date]
  pagebreak(to: "odd", weak: true)
}

// Art. 134: Cubierta o tapa externa
// En la cubierta o tapa de la TL, PG, TD o documento de GE se debe colocar con letras de color negro, partiendo de la parte superior: logo de la universidad en color negro, facultad y carrera, modalidad de graduación, título del trabajo, nombre del autor, ciudad, pais y año.
#let front-cover = title-page(is-front-cover: true)

