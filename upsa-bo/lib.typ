#import "@preview/hydra:0.6.3": hydra
#import "lib/string.typ": to-string
#import "lib/title.typ": front-cover, title-page
#import "lib/spine.typ"
#import "lib/default.typ"
#import "lib/csl-styles.typ"
#import "lib/state.typ": (
  document-advisor, document-author, document-degree, document-fonts, document-graduation-work, document-institution,
  document-paragraph,
)

// Define la configuración general de la plantilla.
#let settings(
  // Información general del autor o estudiante que realiza el trabajo de graduación.
  //
  // Corresponde a su nombre, número de registro y correo electrónico.
  author-info: default.author-info,
  // Información general de la institución educativa.
  //
  // Corresponde al nombre de la universidad (completo y abreviado), facultad (completo y abreviado), y la ubicación de la institución.
  institution-info: default.institution-info,
  // Información general del grado académico que se está optando.
  //
  // Corresponde al título de grado y nivel de grado.
  degree-info: default.degree-info,
  // Información general del trabajo de graduación.
  //
  // Corresponde al título del trabajo, subtítulo, su resumen o abstracto (descripción general), palabras clave, si es un plan/propuesta de investigación, fecha de presentación, y la modalidad de graduación (por ejemplo: Proyecto de Grado, Tesis, Trabajo Dirigido, etc.).
  graduation-work-info: default.graduation-work-info,
  // Información del asesor o guía del trabajo de graduación.
  //
  // Corresponde a su nombre.
  advisor-info: default.advisor-info,
  // Fuentes a ser usadas en el documento.
  fonts: default.fonts,
  // Espaciado entre líneas y párrafos.
  paragraph: default.paragraph,
  // Si el documento va a ser publicado como PDF en la web.
  is-web: false,
  // Si el documento va a ser impreso a doble cara.
  double-sided: false,
  body,
) = context {
  document-author.update((:..default.author-info, ..author-info))
  document-institution.update((:..default.institution-info, ..institution-info))
  document-degree.update((:..default.degree-info, ..degree-info))
  document-graduation-work.update((:..default.graduation-work-info, ..graduation-work-info))
  document-advisor.update((:..default.advisor-info, ..advisor-info))
  document-fonts.update((:..default.fonts, ..fonts))
  document-paragraph.update((:..default.paragraph, ..paragraph))

  let author = document-author.get().name
  let author-name = if type(author) == content {
    to-string(author).trim()
  } else {
    author
  }

  set document(
    title: document-graduation-work.get().title,
    description: document-graduation-work.get().abstract,
    author: author-name,
    keywords: document-graduation-work.get().keywords,
  )

  set page(
    // Art. 142: Márgenes
    // Los márgenes serán 4 cm para el izquierdo, y 2.5 cm para el resto (incluye la numeración de página [por defecto en Typst])
    margin: if is-web { 1in } else {
      (
        ..if double-sided { (inside: 4cm) } else { (left: 4cm) },
        rest: 1in,
      )
    },
    // Art. 137: Tipo de hoja
    // El tipo de hoja será papel bond blanco, de 75 g, tamaño carta (us-letter) en posición vertical.
    paper: "us-letter",
    // Art. 138: Numeración
    // La numeración de las páginas será arábiga correlativa, sin límites, en la esquina inferior derecha, para el desarrollo del trabajo; y romana con minúscula para la presentación, prólogo e índice/s.
    number-align: bottom + right,
  )

  body
}

#let general-outline = context {
  show outline.entry.where(level: 1): set block(spacing: 1.5em)
  show outline.entry.where(level: 2): set block(spacing: 1.3em)
  show outline.entry.where(level: 1): set text(
    font: document-fonts.get().title,
    size: 1.2em,
    weight: 700,
    tracking: 0.05em,
  )
  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    it.indented(
      {
        upper(it.element.supplement)
        sym.space
        it.prefix()
      },
      box(grid(
        columns: (1fr, auto),
        align: (left, right + horizon),
        upper(it.body()), it.page(),
      )),
    ),
  )
  show outline.entry.where(level: 2): set text(
    weight: 600,
    size: 1.1em,
    font: document-fonts.get().title,
    tracking: 0.025em,
  )
  show outline.entry.where(level: 2): it => link(
    it.element.location(),
    it.indented(
      {
        smallcaps(it.element.supplement)
        sym.space
        it.prefix()
      },
      box(grid(
        columns: (1fr, auto),
        align: (left, right + horizon),
        smallcaps(it.body()), it.page(),
      )),
    ),
  )
  show outline.entry.where(level: 3): set text(weight: 500)
  show outline.entry.where(level: 4): set text(style: "italic")
  outline(
    title: [Índice General],
    depth: 5, // Incluye partes, capítulos, secciones, subsecciones y subsubsecciones. Párrafos y demás se omiten.
    indent: n => {
      if n == 0 or n == 1 or n == 2 { 0em } else if n == 3 { 0.75em } else { n * 0.5em }
    },
  )
}

// Genera el índice de tablas si existen.
#let table-outline = context {
  if (counter(figure.where(kind: table)).final().at(0) != 0) {
    outline(title: [Índice de tablas], target: figure.where(kind: table))
  }
}

// Genera el índice de figuras (imágenes) si existen.
#let figure-outline = context {
  if (counter(figure.where(kind: image)).final().at(0) != 0) {
    outline(title: [Índice de figuras], target: figure.where(kind: image))
  }
}

// Genera el índice de listados (código fuente) si existen.
#let listing-outline = context {
  if (counter(figure.where(kind: raw)).final().at(0) != 0) {
    outline(title: [Índice de listados], target: figure.where(kind: raw))
  }
}

// Genera el índice de fórmulas (o expresiones matemáticas) si existen.
#let math-outline = context {
  if (counter(figure.where(kind: math.equation)).final().at(0) != 0) {
    outline(title: [Índice de fórmulas], target: figure.where(kind: math.equation))
  }
}

// Genera el índice de anexos si existen.
#let appendix-outline = context {
  if (query(heading.where(supplement: [Anexo])).len() != 0) {
    panic(query(heading.where(supplement: [Anexo])))
    outline(title: [Índice de anexos], target: selector(heading.where(supplement: [Anexo])))
  }
}

// Genera todos los índices del documento en su respectivo orden,
#let all-outlines = {
  show outline: set heading(level: 2)
  show outline.entry: set block(spacing: 0.75em)

  general-outline
  figure-outline
  table-outline
  math-outline
  listing-outline
  appendix-outline
}

// Genera el abstracto del documento.
#let abstract(
  problem: none,
  objective: none,
  content: outline(
    target: heading.where(
      level: 2,
      outlined: true,
      supplement: [Capítulo],
    ),
    indent: 0em,
    title: [Contenido],
  ),
) = context {
  set heading(numbering: none, outlined: false, level: 3)
  show outline: set heading(numbering: none, outlined: false, level: 3)
  heading(level: 2)[Abstracto]
  table(
    align: (left + horizon, left),
    columns: 2,
    stroke: 1pt,
    [*Título*], document-graduation-work.get().title,
    [*Autor*], document-author.get().name,
  )

  if (problem != none) {
    heading[Problemática]
    problem
  }

  if (objective != none) {
    heading[Objetivo general]
    objective
  }

  show outline.entry: set block(spacing: 0.75em)
  content
  v(document-paragraph.get().spacing)
  // Personal information
  table(
    columns: 2,
    stroke: 1pt,
    align: (left + horizon, left),
    ..if (document-degree.get().program != none) {
      ([*Carrera*], document-degree.get().program)
    },
    ..if (document-advisor.get().name != none) {
      ([*Guía*], document-advisor.get().name)
    },
    ..if (document.keywords != ()) {
      ([*Palabras Clave*], (document.keywords).join(", "))
    },
    ..if (document-author.get().email != none) {
      ([*Correo Electrónico*], link("mailto:" + document-author.get().email))
    },
    ..if (document-graduation-work.get().date != none) {
      ([*Fecha*], to-string[#document-graduation-work.get().date])
    },
  )
}

// Genera la página de agradecimientos del documento, si aplica.
#let acknowledgements-page(body) = {
  if body == none {
    return
  }

  body
  pagebreak(to: "odd", weak: true)
}

// Genera la página dedicatoria del documento, si aplica.
//
// Se recomienda que la dedicatoria sea breve y concisa (1 página).
#let dedication-page(body) = {
  if body == none {
    return
  }

  body
  pagebreak(to: "odd", weak: true)
}

#let chapter-counter = counter("chapter")

#let chapter-page(it) = context {
  let fonts = document-fonts.get()
  let paragraph = document-paragraph.get()
  if it.numbering != none and it.outlined == true {
    chapter-counter.step()
  }
  // Art. 143: Inicio y conclusión del capítulo
  // Se recomienda que cada capítulo comience en hoja aparte y que cada uno de ellos incluya un párrafo introductorio que presente su organización e indique al lector cuál es el objetivo específico del mismo.
  // Igualmente, al terminar cada capítulo es aconsejable redactar un párrafo que contenga un pequeño resumen de lo tratado e indique además la relación del capítulo que termina con el que empieza a continuación.
  pagebreak()
  set par(justify: false, leading: paragraph.leading - 0.75em)
  set align(right)
  set block(sticky: false)
  set text(tracking: 0.05em)

  if it.numbering != none and it.outlined == true [
    #set text(
      size: 2.5em,
      fill: gray.darken(40%),
    )
    #it.supplement
    #text(size: 1.25em, counter(heading).display(it.numbering))
  ]

  block(
    width: 100%,
    stroke: (y: 1pt),
    inset: 1.5em,
    spacing: 2em,
    text(
      size: 2em,
      it.body,
    ),
  )
}

#let part-page(it) = context {
  pagebreak()
  set par(justify: false)
  set page(numbering: none, header: none)

  set align(center)

  v(0.5fr)

  text(
    size: 1.5em,
    weight: 500,
    tracking: 0.05em,
    upper(it.supplement),
  )

  v(1em)

  if it.numbering != none and it.outlined == true {
    text(
      size: 3.5em,
      weight: "black",
    )[#counter(heading).display(it.numbering)]

    v(1em)
  }

  text(
    size: 2.5em,
    weight: "bold",
    tracking: 0.1em,
    upper(it.body),
  )

  v(1fr)
}

// Genera las páginas preliminares del documento, incluyendo carátula, índices, abstracto, etc.
#let front-matter(
  problem: none,
  objective: none,
  executive-summary: none,
  dedication: none,
  abstract-content: outline(
    target: heading.where(
      level: 2,
      outlined: true,
      supplement: [Capítulo],
    ),
    indent: 0em,
    title: [Contenido],
  ),
  acknowledgements: none,
) = context {
  title-page()

  let fonts = document-fonts.get()
  let paragraph = document-paragraph.get()

  set text(
    size: fonts.size,
    font: fonts.body,
    lang: "es",
    region: "bo",
  )

  set par(
    leading: paragraph.leading,
    spacing: paragraph.spacing,
    justify: true,
    justification-limits: (
      spacing: (min: 75%, max: 130%),
      tracking: (min: -0.008em, max: 0.015em),
    ),
    first-line-indent: (
      amount: 0in,
      all: true,
    ),
  )

  show table: set text(size: fonts.size - (1 / 6 * 1em))
  show table: set par(
    spacing: paragraph.spacing - 0.5em,
    leading: paragraph.leading - 0.25em,
  )

  dedication-page(dedication)
  acknowledgements-page(acknowledgements)

  counter(page).update(1)
  set page(numbering: "i")

  show heading: set text(size: fonts.size, font: fonts.title)
  show heading: set block(spacing: paragraph.spacing)

  show heading.where(level: 2): set text(font: fonts.body)

  show heading.where(level: 2): set heading(
    supplement: [Capítulo],
  )

  show heading.where(level: 2): it => chapter-page(it)
  show heading.where(level: 2): smallcaps
  show heading.where(level: 3): set align(center)

  abstract(problem: problem, objective: objective, content: abstract-content)

  {
    set heading(numbering: none, level: 2)

    if document-graduation-work.get().abstract != none {
      pagebreak(weak: true)
      heading[Resumen]
      document-graduation-work.get().abstract
    }

    if executive-summary != none {
      pagebreak(weak: true)
      heading[Resumen ejecutivo]
      executive-summary
    }
  }

  all-outlines
}

// Prepara el documento para el contenido principal.
#let main-matter(body) = context {
  let fonts = document-fonts.get()
  let paragraph = document-paragraph.get()

  set page(
    numbering: "1",
    header: context hydra(
      2,
      display: (
        _,
        it,
      ) => text(
        font: fonts.title,
        tracking: 0.2em,
        fill: gray.darken(40%),
        weight: "bold",
        upper(it.body),
      ),
    ),
  )

  set text(
    size: fonts.size,
    font: fonts.body,
    lang: "es",
    region: "bo",
  )

  set par(
    leading: paragraph.leading,
    spacing: paragraph.spacing,
    justify: true,
    justification-limits: (
      spacing: (min: 75%, max: 130%),
      tracking: (min: -0.008em, max: 0.015em),
    ),
    first-line-indent: (
      amount: 0in,
      all: true,
    ),
  )

  set math.equation(
    numbering: "(1)",
    supplement: [Fórmula],
  )

  show math.equation: set text(font: fonts.math)

  set figure.caption(separator: parbreak(), position: top)
  show figure: set align(left)
  show figure.where(kind: image): set block(breakable: false, sticky: true)
  show figure.where(kind: table): set block(breakable: true, sticky: false)
  show table: set text(size: fonts.size - (1 / 6 * 1em))
  show table: set par(
    spacing: paragraph.spacing - 0.5em,
    leading: paragraph.leading - 0.25em,
  )
  show raw: set text(font: fonts.mono, size: fonts.size - (1 / 12 * 1em))
  show figure.where(kind: math.equation): set figure(supplement: [Fórmula])
  set figure(
    gap: paragraph.leading,
    placement: none,
  )

  show figure.caption: set align(left)
  show figure.caption: set text(font: fonts.title)
  show figure.caption: set par(first-line-indent: 0em)
  show figure.caption: it => {
    strong[#it.supplement #context it.counter.display(it.numbering)]
    it.separator
    emph(it.body)
  }

  show quote.where(block: true): set block(spacing: paragraph.spacing)
  show quote: set text(style: "italic")

  // TODO: Move this as an APA quote function
  show quote: it => {
    let quote-text-words = to-string(it.body).split(regex("\\s+")).filter(word => word != "").len()

    if quote-text-words < 40 {
      ["#it.body" ]

      if (type(it.attribution) == label) {
        cite(it.attribution)
      } else if (
        type(it.attribution) == str or type(it.attribution) == content
      ) {
        it.attribution
      }
    } else {
      block(inset: (left: 0.5in))[
        #set par(first-line-indent: 0.5in)
        #it.body
        #if (type(it.attribution) == label) {
          cite(it.attribution)
        } else if (type(it.attribution) == str or type(it.attribution) == content) {
          it.attribution
        }
      ]
    }
  }

  // Art. 144: Encabezamientos
  // Todo escrito deberá incluir encabezados para destacar los subtemas de la investigación. Para ello se deberá considerar un espacio adicional antes y después de cada encabezado. Se podrá remarcar los encabezados con negrillas, en cuyo caso solo se necesita un espacio antes del encabezado.
  // Existen encabezados principales y secundarios, los cuales deberán estar escritos y ubicados apropiadamente, según una escala jerárquica sistemática durante todo el desarrollo del texto. Para señalar los encabezados podrá utilizarse el sistema decimal o alfanumérico.
  set heading(
    numbering: (..args) => {
      if args.pos().len() == 1 {
        // Level 1: Roman numerals for Parts.
        numbering("I", ..args)
      } else if args.pos().len() == 2 {
        // Level 2: Use the chapter state counter and increment it.
        // chapter-counter.display("I")
        numbering("I", chapter-counter.get().first())
      } else if args.pos().len() == 3 or args.pos().len() == 4 or args.pos().len() == 5 {
        // Level 3+: Use the chapter number followed by the position within that chapter.
        numbering(
          "1.1.",
          // ..chapter-counter.get(),
          ..args.pos().slice(2),
        )
      } else {
        // For the rest of headings, no
        none
      }
    },
  )

  show heading: set text(size: fonts.size, font: fonts.title)
  show heading: set block(spacing: paragraph.spacing)

  show heading.where(level: 2): set text(font: fonts.body)

  show heading.where(level: 1): set heading(
    supplement: [Parte],
  )

  show heading.where(level: 2): set heading(
    supplement: [Capítulo],
  )

  show heading.where(level: 1): it => part-page(it)
  show heading.where(level: 2): it => chapter-page(it)

  show heading.where(level: 2): smallcaps
  show heading.where(level: 3): set align(center)
  show heading.where(level: 5): emph
  show heading.where(level: 6): it => [#it.body.]
  show heading.where(level: 7): it => [_#it.body._]

  show figure.where(kind: raw): set figure(placement: none)
  show figure.where(kind: raw): set block(breakable: true, sticky: false)
  show figure.where(kind: raw): set raw(block: true)
  show figure.where(kind: raw): set align(left)

  // La numeración de páginas no es correlativa entre romana y arábiga, por lo que se reinicia el contador de páginas al cambiar a la numeración arábiga.
  counter(page).update(1)

  body
}

// Prepara el documento para las páginas finales, incluyendo anexos, glosario, etc.
#let back-matter(body) = context {
  let document-graduation-work = document-graduation-work.get()
  // Art 147: Citas y notas
  // Las citas y notas bibliográficas deberán ceñirse al estilo de referenciación bibliográfica establecido por la Facultad.
  show bibliography: bib-it => {
    show block: block-it => context {
      // if it body is auto or styled()
      if block-it.body == auto or block-it.body.func() == text(fill: red)[].func() {
        block-it
        // if its body isn't sequence(), for example: pdf-marker-tag
      } else if block-it.body.func() != [].func() {
        par(block-it.body)
      } else {
        par(block-it.body)
      }
    }

    bib-it
  }

  set bibliography(style: "apa", full: false, title: [Referencias])

  show bibliography: set par(
    first-line-indent: 0in,
    hanging-indent: 0.5in,
  )

  show heading.where(level: 2): set heading(supplement: [Anexo])

  show bibliography: set heading(
    level: if document-graduation-work.is-plan == true { 3 } else { 2 },
    numbering: none,
    outlined: false,
    bookmarked: true,
    supplement: [Capítulo],
  )

  set heading(
    numbering: (..args) => {
      let pos = args.pos()
      if pos.len() == 1 {
        numbering("I", ..pos)
      } else if pos.len() == 2 {
        numbering("A", chapter-counter.get().first())
      } else {
        numbering("a.1.", ..pos.slice(2))
      }
    },
  )

  chapter-counter.update(0)

  body
}

// Artículos irrelevantes o sin efecto directo a la planilla.
// Art. 140: Encuadernación
// La encuadernación será: En cartón duro, color blanco, y la tapa se plastificará para proteger las letras y/o la hoja con el contenido de la cubierta o tapa.
// Art. 145: Estilo de redacción
// El estilo de redacción será impersonal, evitando utilizar la primera persona.
// Se recomienda: usar el estilo científico (directo y preciso), evitar la verbosidad y palabras rebuscadas, no distraer el mensaje con términos ambiguos e imprecisos, redactar párrafos breves, evitando un excesivo número de oraciones subordinadas, las que hacen perder la idea central, emplear las frases para demostrar y argumentar (no para decorar ni persuadir), y elaborar una lista de aquellos términos poco comunes que necesiten una definición particular dentro del contexto de la investigación. Este glosario de términos deberá ir al final del trabajo y debe estar indicado en el índice del contenido.
// Art. 146: Tiempo de los verbos
// La redacción del trabajo deberá hacerse utilizando el tiempo presente, a excepción del capítulo de "Método", que podrá escribirse en pretérito (pasado). Una vez decidido el tiempo verbal a utilizar, no se modificará el mismo en párrafos subsiguientes
