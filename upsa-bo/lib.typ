#import "@preview/hydra:0.6.1": hydra
#import "utils/to-string.typ": to-string
#import "utils/title-page.typ": portada

#let chapter-counter = counter("chapter")

#let tfg(
  título: [],
  facultad: [],
  carrera: [],
  autor: [],
  registro-autor: [],
  adición: none,
  modalidad: [],
  materia: [],
  guía: none,
  resumen: none,
  problemática: none,
  objetivo-general: none,
  contenido: none,
  grado: [Licenciatura],
  doble-cara: false,
  email: "",
  agradecimientos: none,
  resumen-ejecutivo: none,
  palabras-clave: (),
  plan: [],
  portada-externa: true,
  ubicación: "Santa Cruz de la Sierra, Bolivia",
  fecha: datetime.today().year(),
  fuentes: (
    tamaño: 10pt,
    cuerpo: "TeX Gyre Pagella",
    títulos: "TeX Gyre Heros",
    mono: "TeX Gyre Cursor",
    ecuaciones: "TeX Gyre Pagella Math",
  ),
  espaciado: (
    interlineado: 1.5em,
    párrafo: 2em,
  ),
  body,
) = {
  let show-title-page = {
    if portada-externa {
      portada(
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
      )

      pagebreak(to: "odd")
    }

    portada(
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
    )
  }

  let show-acknowledgments = {
    pagebreak(to: "odd", weak: true)
    if (agradecimientos != none) {
      set align(right + horizon)
      agradecimientos
    } else {
      pagebreak(to: "odd", weak: true)
    }
  }

  let show-abstract = {
    if (plan == [] or plan == none) {
      heading(numbering: none, level: 2)[Abstracto]
      table(
        align: (left + horizon, left),
        columns: 2,
        stroke: 1pt,
        [*Título*], título,
        [*Autor*], autor,
      )

      if (problemática != none) {
        heading(numbering: none, level: 2)[Problemática]
        problemática
      }

      if objetivo-general != none {
        heading(numbering: none, level: 2)[Objetivo General]
        objetivo-general
      }

      if contenido != none {
        heading(numbering: none, level: 2)[Contenido]
        contenido
      }

      table(
        columns: 2,
        stroke: 1pt,
        align: (left + horizon, left),
        [*Carrera*], carrera,
        [*Guía*], guía,
        [*Palabras Clave*], palabras-clave.join(", "),
        [*Correo Electrónico*], email,
        [*Fecha*], to-string[#fecha],
      )
    }
  }

  if (autor == []) {
    panic("El autor es obligatorio: ", autor)
  } else if (título == []) {
    panic("El título es obligatorio: ", título)
  }

  set document(
    title: if type(título) == content {
      to-string(título)
    } else { título },
    description: resumen,
    author: if type(título) == content {
      to-string(autor).trim()
    } else {
      autor
    },
    keywords: ("UPSA",) + palabras-clave,
  )

  set page(
    margin: (
      inside: if doble-cara { 4cm } else { 2.5cm },
      rest: 2.5cm,
    ),
    paper: "us-letter",
    number-align: bottom + right,
  )

  set text(
    size: fuentes.tamaño,
    font: fuentes.cuerpo,
    lang: "es",
    region: "bo",
  )

  set par(
    leading: espaciado.interlineado,
    spacing: espaciado.párrafo,
    justify: true,
    first-line-indent: (
      amount: 0in,
      all: true,
    ),
  )

  set math.equation(numbering: "(1)", supplement: [Expresión matemática])
  show math.equation: set text(font: fuentes.ecuaciones)

  // MARK: Figures
  show figure: set figure.caption(position: top)

  show figure: set block(breakable: true, sticky: true)

  set figure(
    gap: espaciado.interlineado,
    placement: auto,
  )

  set figure.caption(separator: parbreak(), position: top)
  show figure.caption: set align(left)
  show figure.caption: set text(font: fuentes.títulos)
  show figure.caption: set par(first-line-indent: 0em)
  show figure.caption: it => {
    strong[#it.supplement #context it.counter.display(it.numbering)]
    parbreak()
    emph(it.body)
  }

  // MARK: Tables
  set table(stroke: (x, y) => if y == 0 {
    (
      top: (thickness: 1pt, dash: "solid"),
      bottom: (thickness: 0.5pt, dash: "solid"),
    )
  })

  show table.cell: set par(leading: espaciado.interlineado, spacing: espaciado.párrafo)

  // MARK: Quotes
  show quote.where(block: true): set block(spacing: espaciado.párrafo)
  show quote: set text(style: "italic")

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

  show-title-page
  show-acknowledgments

  counter(page).update(1)

  set page(numbering: "i")

  // MARK: Preliminary headings
  show heading: set text(size: fuentes.tamaño, font: fuentes.títulos)
  show heading: set block(spacing: espaciado.párrafo)

  // MARK: Abstract
  if (plan == [] or plan == none) {
    heading(numbering: none, level: 3)[Abstracto]
    table(
      align: (left + horizon, left),
      columns: 2,
      stroke: 1pt,
      [*Título*], título,
      [*Autor*], autor,
    )

    if (problemática != none) {
      heading(numbering: none, level: 3)[Problemática]
      problemática
    }

    if objetivo-general != none {
      heading(numbering: none, level: 3)[Objetivo General]
      objetivo-general
    }

    if contenido != none {
      heading(numbering: none, level: 3)[Contenido]
      contenido
    }

    table(
      columns: 2,
      stroke: 1pt,
      align: (left + horizon, left),
      [*Carrera*], carrera,
      [*Guía*], guía,
      [*Palabras Clave*], palabras-clave.join(", "),
      [*Correo Electrónico*], email,
      [*Fecha*], to-string[#fecha],
    )
  }

  show heading.where(level: 2): set text(font: fuentes.cuerpo)

  show heading.where(level: 2): it => context {
    if it.numbering != none and it.outlined == true { chapter-counter.step() }
    pagebreak()
    set par(justify: false)

    if it.numbering != none and it.outlined == true [
      #set text(
        size: 2.5em,
        weight: "bold",
        fill: gray.darken(40%),
      )

      #it.supplement
      #if it.supplement == [Anexo] [
        #chapter-counter.display("A").trim(".")
      ] else [
        #chapter-counter.display("I").trim(".")
      ]

      #v(0.05cm)
    ]

    text(
      size: 2em,
      weight: "bold",
    )[#it.body]

    v(0.3cm)

    line(length: 25%, stroke: (thickness: 0.5pt, dash: "solid"))
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
  {
    show outline.entry.where(level: 1): set block(spacing: 1.5em)
    show outline.entry.where(level: 2): set block(spacing: 1.3em)
    show outline.entry.where(level: 1): it => link(it.element.location(), text(
      font: fuentes.títulos,
      size: 1.2em,
      weight: "bold",
      upper(it.indented(
        if it.element.numbering != none [ #it.element.supplement #it.prefix()] else { it.prefix() },
        [#it.body() #h(1fr) #it.page()],
      )),
    ))
    show outline.entry.where(level: 2): it => link(it.element.location(), text(
      font: fuentes.títulos,
      size: 1.1em,
      weight: "bold",
      smallcaps(it.indented(
        if it.element.numbering != none [ #it.element.supplement #it.prefix()] else { it.prefix() },
        [#it.body() #h(1fr) #it.page()],
      )),
    ))
    show outline.entry.where(level: 4): it => emph(it)

    outline(
      title: [Índice General],
      depth: 4,
      indent: n => {
        if n == 0 or n == 1 { 0em } else { n * 0.75em }
      },
    )
  }

  context {
    if (counter(figure.where(kind: table)).final().at(0) != 0) {
      outline(title: [Índice de tablas], target: figure.where(kind: table))
    }

    if (counter(figure.where(kind: image)).final().at(0) != 0) {
      outline(title: [Índice de figuras], target: figure.where(kind: image))
    }

    if (counter(figure.where(kind: math.equation)).final().at(0) != 0) {
      outline(title: [Índice de expresiones matemáticas], target: figure.where(kind: math.equation))
    }


    if (query(heading.where(supplement: [Anexo])).len() != 0) {
      outline(title: [Índice de anexos], target: selector(heading.where(supplement: [Anexo])))
    }
  }

  set page(numbering: "1", header: context hydra(2, display: (_, it) => upper(text(font: fuentes.títulos, it.body))))

  // MARK: Headings
  show heading.where(level: 1): set heading(
    supplement: [Parte],
    numbering: "I",
  )

  show heading.where(level: 2): set heading(
    supplement: [Capítulo],
    numbering: (..args) => {
      let chapter-numbers = args.pos()

      // For level 2 headings, we want just the chapter number (index 1) in Roman numerals
      if chapter-numbers.len() >= 2 {
        numbering("I", chapter-numbers.at(1)) // Use the chapter number (second argument)
      } else {
        none
      }
    },
  )

  set heading(
    numbering: (..args) => {
      let heading-numbers = args.pos()

      if heading-numbers.len() > 2 {
        // Drop the first two (part and chapter) and number the rest
        let remaining = heading-numbers.slice(2)
        numbering("1.", ..remaining)
      } else {
        // For part and chapter levels, show no numbering
        none
      }
    },
  )

  show heading.where(level: 1): it => {
    pagebreak()
    set par(justify: false)
    set page(numbering: none, header: none)

    {
      set align(center)

      v(0.5fr)

      text(size: 1.25em, weight: "regular", tracking: 0.05em, fill: gray.darken(40%))[#upper(it.supplement)]

      v(1em)

      if it.numbering != none and it.outlined == true {
        text(
          size: 3.5em,
          weight: "bold",
        )[#counter(heading).display("I") ]

        v(1em)
      }

      text(
        size: 2.4em,
        weight: "bold",
      )[#it.body]

      v(1fr)
    }

    context if it.numbering != none and it.outlined == true {
      let chapters = chapter-counter.get()
      counter(heading).update((one, ..rest) => (one, ..chapters))
    }
  }

  show heading.where(level: 3): set align(center)
  show heading.where(level: 3): smallcaps
  show heading.where(level: 5): emph
  show heading.where(level: 6): it => [
    #it.body.
  ]
  show heading.where(level: 7): it => [
    _#it.body._
  ]

  show raw: set text(font: fuentes.mono, size: 1em)
  show figure.where(kind: raw): set figure(placement: none)
  show figure.where(kind: raw): set block(breakable: true, sticky: false)
  show figure.where(kind: raw): set raw(block: true)

  show bibliography: bib-it => {
    set block(inset: 0in)
    show block: block-it => context {
      if block-it.body == auto {
        block-it
      } else {
        if block-it.body.func() != [].func() {
          block-it.body
          parbreak()
        } else {
          par(block-it.body)
        }
      }
    }

    bib-it
  }

  show bibliography: set heading(
    level: 2,
    numbering: none,
    outlined: false,
  )

  set bibliography(style: "apa")

  show bibliography: set par(
    first-line-indent: 0in,
    hanging-indent: 0.5in,
  )

  body
}

#let anexos(body) = context {
  show heading.where(level: 2): set heading(supplement: [Anexo], numbering: (
    ..args,
  ) => {
    let annex-numbers = args.pos()

    if annex-numbers.len() >= 2 {
      numbering("A", annex-numbers.at(1)) // Use the annex number (second argument)
    } else {
      none
    }
  })

  set heading(numbering: (
    ..args,
  ) => {
    let annex-numbers = args.pos()

    if annex-numbers.len() > 2 {
      let remaining = annex-numbers.slice(2)
      numbering("a.1.", ..remaining)
    } else {
      none
    }
  })

  chapter-counter.update(0)
  let current-part = counter(heading).get().at(0)
  counter(heading).update((part, ..rest) => (current-part, 0))

  body
}
