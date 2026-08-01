#import "default.typ"

#let uni-logo = image(
  "../assets/images/upsa-logo.webp",
  width: 50%,
  alt: "Logo de la Universidad Privada de Santa Cruz de la Sierra",
)

#let base(
  title: none,
  faculty: none,
  degree: none,
  plan: none,
  modality: none,
  author: none,
  include-advisor: false,
  author-id: none,
  // El nombre del asesor/guía del trabajo.
  advisor: none,
  // La ubicación de la universidad.
  location: none,
  // La fecha de publicación del trabajo.
  date: none,
  // Si es la portada externa o interna.
  is-front-cover: false,
  degree-level: none,
  fonts: default.fonts,
) = context {
  set align(center)
  set text(weight: "bold", size: 12pt, font: fonts.title)
  uni-logo
  v(1fr)
  faculty
  parbreak()
  degree
  v(1fr)

  if plan != [] {
    plan
    v(1fr)
  }

  if modality != [] {
    [Modalidad de Graduación]
    parbreak()
    modality
    v(1fr)
  }

  rect(
    radius: 20%,
    inset: 10pt,
    text(font: fonts.body, weight: "bold")[_«#title»_],
  )

  if (not is-front-cover) {
    v(1fr)
    [
      #modality para optar por el grado de

      «#degree-level en #degree»
    ]
  }

  v(1fr)

  author

  if author-id != [] and not is-front-cover [
    #parbreak()
    Reg.: #author-id
  ]

  v(1fr)

  if advisor != [] and include-advisor {
    advisor
    parbreak()
  }

  location
  parbreak()
  repr(date)
}

// Art. 136: Carátula o tapa interna
// En la carátula o tapa interna se debe colocar lo mismo que en la tapa (portada externa) con la sola adición de: "{modalidad de grado} para optar al grado de {grado} en {carrera}".
#let title-page(
  title,
  faculty,
  degree,
  plan: [],
  modality: [],
  author,
  author-id: [],
  advisor: [],
  include-advisor: false,
  location,
  date,
  degree-level,
  fonts,
) = {
  base(
    title: title,
    faculty: faculty,
    degree: degree,
    plan: plan,
    modality: modality,
    author: author,
    include-advisor: include-advisor,
    author-id: author-id,
    advisor: advisor,
    location: location,
    date: date,
    degree-level: degree-level,
    fonts: fonts,
  )
}

// Art. 134: Cubierta o tapa externa
// En la cubierta o tapa de la TL, PG, TD o documento de GE se debe colocar con letras de color negro, partiendo de la parte superior: logo de la universidad en color negro, facultad y carrera, modalidad de graduación, título del trabajo, nombre del autor, ciudad, pais y año.
#let front-cover(
  title: default.title,
  faculty: default.faculty,
  degree: default.degree,
  modality: default.modality,
  author: default.author.name,
  author-id: default.author.id,
  advisor: default.advisor-name,
  show-advisor: true,
  location: default.location,
  date: datetime.today().year(),
  degree-level: default.degree-level,
  fonts: default.fonts,
) = {
  base(
    title: title,
    faculty: faculty,
    degree: degree,
    modality: modality,
    author: author,
    author-id: author-id,
    is-front-cover: true,
    advisor: advisor,
    location: location,
    date: date,
    degree-level: degree-level,
    fonts: fonts,
  )
}
