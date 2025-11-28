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
  plan: none,
  portada-externa: true,
  ubicación: "Santa Cruz de la Sierra, Bolivia",
  fecha: datetime.today().year(),
  fuentes: (
    tamaño: 12pt,
    cuerpo: "TeX Gyre Termes",
    títulos: "TeX Gyre Heros",
    mono: "TeX Gyre Cursor",
    ecuaciones: "TeX Gyre Termes Math",
  ),
  espaciado: (
    interlineado: 1.5em,
    párrafo: 2em,
  ),
  body,
) = {
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
    author: if type(autor) == content {
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
    supplement: [Expresión matemática],
  )

  show math.equation: set text(font: fuentes.ecuaciones)

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

  set table(
    stroke: (x, y) => if y == 0 {
      (
        top: (thickness: 1pt, dash: "solid"),
        bottom: (thickness: 0.5pt, dash: "solid"),
      )
    },
  )

  show table.cell: set par(leading: espaciado.interlineado, spacing: espaciado.párrafo)

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

  pagebreak(to: "odd", weak: true)

  if (agradecimientos != none) {
    set align(right + horizon)
    agradecimientos
  } else {
    pagebreak(to: "odd", weak: true)
  }
  counter(page).update(1)

  set page(numbering: "i")

  show heading: set text(size: fuentes.tamaño, font: fuentes.títulos)
  show heading: set block(spacing: espaciado.párrafo)

  if (plan == none) {
    heading(numbering: none, outlined: false)[Abstracto]
    table(
      align: (left + horizon, left),
      columns: 2,
      stroke: 1pt,
      [*Título*], título,
      [*Autor*], autor,
    )

    if (problemática != none) {
      heading(numbering: none, outlined: false)[Problemática]
      problemática
    }

    if objetivo-general != none {
      heading(numbering: none, outlined: false)[Objetivo General]
      objetivo-general
    }

    if contenido != none {
      heading(numbering: none, outlined: false)[Contenido]
      contenido
    }

    table(
      columns: 2,
      stroke: 1pt,
      align: (left + horizon, left),
      [*Carrera*], carrera,
      [*Guía*], guía,
      [*Palabras Clave*], palabras-clave.join(", "),
      [*Correo Electrónico*], link("mailto:" + email),
      [*Fecha*], to-string[#fecha],
    )
  }

  show heading.where(level: 2): set text(font: fuentes.cuerpo)

  show heading.where(level: 2): it => context {
    if it.numbering != none and it.outlined == true {
      chapter-counter.step()
    }
    pagebreak()
    set par(justify: false, leading: espaciado.interlineado - 0.75em)
    set align(right)
    set text(tracking: 0.05em)

    if it.numbering != none and it.outlined == true [
      #set text(
        size: 2.5em,
        weight: "bold",
        fill: gray.darken(40%),
      )

      #it.supplement
      #set text(size: 1.25em)
      #counter(heading).display(it.numbering)
    ]

    block(
      width: 100%,
      stroke: (y: 1pt),
      inset: 1.5em,
      spacing: 2em,
      text(
        size: 2em,
        weight: "bold",
        it.body,
      ),
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
    show outline.entry.where(level: 4): it => link(
      it.element.location(),
      emph(it),
    )

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

  set page(
    numbering: "1",
    header: context hydra(
      2,
      display: (
        _,
        it,
      ) => upper(
        text(
          font: fuentes.títulos,
          it.body,
        ),
      ),
    ),
  )

  show heading.where(level: 1): set heading(
    supplement: [Parte],
  )

  show heading.where(level: 2): set heading(
    supplement: [Capítulo],
  )

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

    {
      set align(center)

      v(0.5fr)

      text(
        size: 1.25em,
        weight: "regular",
        tracking: 0.05em,
        fill: gray.darken(40%),
        upper(it.supplement),
      )

      v(1em)

      if it.numbering != none and it.outlined == true {
        text(
          size: 3.5em,
          weight: "bold",
        )[#counter(heading).display(it.numbering) ]

        v(1em)
      }

      text(
        size: 2.4em,
        weight: "bold",
        upper(it.body),
      )

      v(1fr)
    }
  }

  show heading.where(level: 2): smallcaps
  show heading.where(level: 3): set align(center)
  show heading.where(level: 5): emph
  show heading.where(level: 6): it => [#it.body.]
  show heading.where(level: 7): it => [_#it.body._]

  show raw: set text(font: fuentes.mono, size: 1em)
  show figure.where(kind: raw): set figure(placement: none)
  show figure.where(kind: raw): set block(breakable: true, sticky: false)
  show figure.where(kind: raw): set raw(block: true)

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
