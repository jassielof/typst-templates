#import "@preview/hydra:0.6.3": hydra
#import "lib/string.typ": to-string
#import "lib/title.typ": front-cover, title-page, title-page2
#import "lib/spine.typ": spine-cover
#import "lib/default.typ"
#import "lib/csl-styles.typ"
#import "lib/state.typ": (
  document-advisor, document-author, document-degree, document-fonts, document-graduation-work, document-institution,
  document-paragraph,
)

// Define la configuración general de la plantilla.
#let settings(
  author-info: default.author-info,
  institution-info: default.institution-info,
  degree-info: default.degree-info,
  graduation-work-info: default.graduation-work-info,
  advisor-info: default.advisor-info,
  fonts: default.fonts,
  paragraph: default.paragraph,
  is-web: false,
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
// Plantilla para documentos finales de licenciatura de la Universidad Privada de Santa Cruz de la Sierra (UPSA). Basada en el Reglamento de Graduación (revisado el 2025, a su vez adecuado al D.S 1433), título V (aspectos formales del documento final de licenciatura), capítulo I (presentación del documento final).
#let tfg(
  // El título del trabajo.
  title: default.title,
  // La facultad.
  faculty: default.faculty,
  // El grado académico (carrera) que se está optando.
  degree: default.degree,
  // El nombre del autor.
  author: default.author.name,
  // El registro del autor.
  author-id: default.author.id,
  additional-info: none,
  // La modalidad de graduación. Por ejemplo: Proyecto de Grado, Tesis, Trabajo Dirigido, etc.
  modality: default.modality,
  // Si se incluye la guía o no.
  incluir-guía: false,
  // El nombre del asesor.
  advisor: none,
  resumen: none,
  problemática: none,
  objetivo-general: none,
  contenido: outline(
    target: heading.where(
      level: 2,
      outlined: true,
      supplement: [Capítulo],
    ),
    title: none,
  ),
  // El nivel de grado académico que se está optando. Por ejemplo: Licenciatura, Tecnicatura, Maestría, o Doctorado.
  degree-level: default.degree-level,
  doble-cara: false,
  email: default.author.email,
  agradecimientos: none,
  // Si el documento va a ser publicado como PDF en la web.
  web-format: false,
  resumen-ejecutivo: none,
  // Palabras clave del trabajo,
  palabras-clave: (),
  // El título para el plan/propuesta de investigación, si aplica.
  plan: none,
  ubicación: default.location,
  fecha: datetime.today().year(),
  // El texto se escribirá usando mayúsculas y minúsculas, limitando el uso de mayúsculas completas a títulos. El tipo de letras podrá ser elegido de algunos de los siguientes: Times New Roman (14 pt [nunca se especifica la unidad, así que puede asumirse la unidad por defecto de Microsoft Word (punto) o bien pixel]), Arial (12 pt) o Helvética (12 pt).
  // El tamaño y tipo de las letras será uniforme en todo el texto, así como el sistema de encabezamientos y jerarquización, y otras formas de presentación. Para sub/títulos, notas, referencias bibliográficas y citas,podrán usarse tamaños mayores/menores de letra.
  // Las fuentes tipográficas a utilizar en el documento.
  fonts: default.fonts,
  // [Considerar que el reglamento no menciona ninguna fuente para expresiones matemáticas o mono.]
  // Art. 141: Espacios
  // El interlineado del texto será a espacio y medio (1,5). Entre párrafo y párrafo se dejarán dos espacios [se asume 2,0]. Cada párrafo debe iniciarse al principio del margen izquierdo sin dejar ninguno tipo de sangrado.
  // [El espaciado no puede ser estrictamente copiado ya que (asumo) este espaciado es dado según Microsoft Word, y el espaciado de Typst funciona un tanto diferente, para asimilarse un poco más al de Microsoft Word, simplemente se lo deja en los mismos valores con unidad em, pero si se desea una apariencia similar, se puede usar 1.25 em en interlineado y 1.5 em en párrafo]
  espaciado: (
    interlineado: 1.5em,
    párrafo: 2em,
  ),
  body,
) = {
  let fonts = (:..default.fonts, ..fonts)
  context document-fonts.update(fonts)

  set document(
    title: if type(title) == content {
      to-string(title)
    } else { title },
    description: resumen,
    author: if type(author) == content {
      to-string(author).trim()
    } else {
      author
    },
    keywords: palabras-clave,
  )

  set page(
    // Art. 142: Márgenes
    // Los márgenes serán 4 cm para el izquierdo, y 2.5 cm para el resto (incluye la numeración de página [por defecto en Typst])
    margin: if web-format { 1in } else {
      (
        ..if doble-cara { (inside: 4cm) } else { (left: 4cm) },
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

  set text(
    size: fonts.size,
    font: fonts.body,
    lang: "es",
    region: "bo",
  )

  set par(
    leading: espaciado.interlineado,
    spacing: espaciado.párrafo,
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
    spacing: espaciado.párrafo - 0.5em,
    leading: espaciado.interlineado - 0.25em,
  )
  show raw: set text(font: fonts.mono, size: fonts.size - (1 / 12 * 1em))
  show figure.where(kind: math.equation): set figure(supplement: [Fórmula])
  set figure(
    gap: espaciado.interlineado,
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

  show quote.where(block: true): set block(spacing: espaciado.párrafo)
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

  title-page(
    title,
    faculty,
    degree,
    plan: plan,
    modality: modality,
    author,
    author-id: author-id,
    advisor: advisor,
    include-advisor: incluir-guía,
    ubicación,
    fecha,
    degree-level,
    fonts,
  )

  pagebreak(to: "odd", weak: true)

  if (agradecimientos != none) {
    set align(right + horizon)
    agradecimientos
  } else {
    pagebreak(to: "odd", weak: true)
  }
  counter(page).update(1)

  set page(numbering: "i")

  show heading: set text(size: fonts.size, font: fonts.title)
  show heading: set block(spacing: espaciado.párrafo)

  show heading.where(level: 2): set text(font: fonts.body)

  show heading.where(level: 1): set heading(
    supplement: [Parte],
  )

  show heading.where(level: 2): set heading(
    supplement: [Capítulo],
  )

  show heading.where(level: 2): it => context {
    if it.numbering != none and it.outlined == true {
      chapter-counter.step()
    }
    // Art. 143: Inicio y conclusión del capítulo
    // Se recomienda que cada capítulo comience en hoja aparte y que cada uno de ellos incluya un párrafo introductorio que presente su organización e indique al lector cuál es el objetivo específico del mismo.
    // Igualmente, al terminar cada capítulo es aconsejable redactar un párrafo que contenga un pequeño resumen de lo tratado e indique además la relación del capítulo que termina con el que empieza a continuación.
    pagebreak()
    set par(justify: false, leading: espaciado.interlineado - 0.75em)
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

  show heading.where(level: 2): smallcaps
  show heading.where(level: 3): set align(center)
  show heading.where(level: 5): emph
  show heading.where(level: 6): it => [#it.body.]
  show heading.where(level: 7): it => [_#it.body._]

  if (plan == none) {
    set heading(numbering: none, outlined: false, level: 3)
    heading(level: 2)[Abstracto]
    table(
      align: (left + horizon, left),
      columns: 2,
      stroke: 1pt,
      [*Título*], title,
      [*Autor*], author,
    )

    if (problemática != none) {
      heading[Problemática]
      problemática
    }

    if objetivo-general != none {
      heading[Objetivo General]
      objetivo-general
    }

    if contenido != none {
      heading[Contenido]
      contenido
    }

    table(
      columns: 2,
      stroke: 1pt,
      align: (left + horizon, left),
      ..if (degree != none) {
        ([*Carrera*], degree)
      },
      ..if (advisor != none) {
        ([*Guía*], advisor)
      },
      ..if (palabras-clave != ()) {
        ([*Palabras Clave*], palabras-clave.join(", "))
      },
      ..if (email != none) {
        ([*Correo Electrónico*], link("mailto:" + email))
      },
      ..if (fecha != none) {
        ([*Fecha*], to-string[#fecha])
      },
    )
  }

  if resumen != none {
    pagebreak(weak: true)
    heading(numbering: none, level: 2)[Resumen]
    resumen
  }

  if resumen-ejecutivo != none {
    pagebreak(weak: true)
    heading(numbering: none, level: 2)[Resumen Ejecutivo]
    resumen-ejecutivo
  }

  show outline: set heading(level: 2)
  show outline.entry: set block(spacing: 0.75em)

  all-outlines

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

  show heading.where(level: 1): it => {
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

  show figure.where(kind: raw): set figure(placement: none)
  show figure.where(kind: raw): set block(breakable: true, sticky: false)
  show figure.where(kind: raw): set raw(block: true)
  show figure.where(kind: raw): set align(left)

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

  show bibliography: set heading(
    level: 2,
    numbering: none,
    outlined: false,
  )

  set bibliography(style: "apa", full: false, title: [Referencias])

  show bibliography: set par(
    first-line-indent: 0in,
    hanging-indent: 0.5in,
  )

  // La numeración de páginas no es correlativa entre romana y arábiga, por lo que se reinicia el contador de páginas al cambiar a la numeración arábiga.
  counter(page).update(1)

  body
}

#let anexos(body) = context {
  show heading.where(
    level: 2,
  ): set heading(
    supplement: [Anexo],
    numbering: (
      ..args,
    ) => {
      let annex-numbers = args.pos()

      if annex-numbers.len() >= 2 {
        numbering("A", annex-numbers.at(1)) // Use the annex number (second argument)
      } else {
        none
      }
    },
  )

  set heading(
    numbering: (
      ..args,
    ) => {
      let annex-numbers = args.pos()

      if annex-numbers.len() > 2 {
        let remaining = annex-numbers.slice(2)
        numbering("a.1.", ..remaining)
      } else {
        none
      }
    },
  )

  chapter-counter.update(0)
  let current-part = counter(heading).get().at(0)
  counter(heading).update((part, ..rest) => (current-part, 0))

  body
}

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
  acknowledgements: none,
) = context {
  title-page2()

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

  abstract(problem: problem, objective: objective)

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

  show bibliography: set heading(
    level: 2,
    numbering: none,
    outlined: false,
  )

  set bibliography(style: "apa", full: false, title: [Referencias])

  show bibliography: set par(
    first-line-indent: 0in,
    hanging-indent: 0.5in,
  )

  // La numeración de páginas no es correlativa entre romana y arábiga, por lo que se reinicia el contador de páginas al cambiar a la numeración arábiga.
  counter(page).update(1)

  body
}

// Prepara el documento para las páginas finales, incluyendo anexos, glosario, etc.
#let back-matter(body) = context {
  show heading.where(level: 2): set heading(supplement: [Anexo])

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
