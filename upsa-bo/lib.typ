#import "@preview/hydra:0.6.1": hydra
#import "utils/to-string.typ": to-string

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
  email: "",
  agradecimientos: none,
  resumen-ejecutivo: none,
  palabras-clave: (),
  plan: [],
  portada-externa: true,
  ubicación: "Santa Cruz de la Sierra, Bolivia",
  fecha: datetime.today().year(),
  tamaño-fuente: 11pt,
  estilo-fuente: "Libertinus Serif",
  body,
) = {
  if (autor == []) {
    panic("El autor es obligatorio: ", autor)
  } else if (título == []) {
    panic("El título es obligatorio: ", título)
  }

  set document(
    title: to-string(título),
    description: resumen,
    author: to-string(autor).trim(),
    keywords: ("Tesis", "UPSA", "Proyecto de grado") + palabras-clave,
  )

  set page(
    margin: (
      left: 4cm,
      rest: 2.5cm,
    ),
    paper: "us-letter",
    number-align: bottom + right,
  )

  set text(
    size: tamaño-fuente,
    font: estilo-fuente,
    lang: "es",
    region: "bo",
  )

  set par(
    leading: 1.5em,
    spacing: 2em,
    first-line-indent: (amount: 0in, all: true),
  )

  set math.equation(numbering: "(1)", supplement: [Expresión Matemática])

  // MARK: Figures
  show figure: set figure.caption(position: top)

  show figure: set block(breakable: true, sticky: true)

  set figure(
    gap: 1.5em,
    placement: auto,
  )

  set figure.caption(separator: parbreak(), position: top)
  show figure.caption: set align(left)
  show figure.caption: set par(first-line-indent: 0em)
  show figure.caption: it => {
    strong[#it.supplement #context it.counter.display(it.numbering)]
    parbreak()
    emph(it.body)
  }

  // MARK: Tables
  set table(
    stroke: (x, y) => if y == 0 {
      (
        top: (thickness: 1pt, dash: "solid"),
        bottom: (thickness: 0.5pt, dash: "solid"),
      )
    },
  )

  show table.cell: set par(leading: 1em, spacing: 2em)

  // MARK: Quotes
  show quote.where(block: true): set block(spacing: 1.5em)

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

  // MARK: External and internal title page
  let portada = context {
    set align(center)
    set text(weight: "bold")
    image("assets/images/logo-upsa.png")
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
      text(font: "Libertinus Sans", weight: "bold")[«#título»],
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

  if portada-externa {
    portada

    pagebreak(to: "odd")
  }

  portada

  // MARK: Acknowledgments
  if (agradecimientos != none) {
    heading(numbering: none, level: 2)[Agradecimientos]
    agradecimientos
  } else {
    pagebreak(to: "odd", weak: true)
  }

  counter(page).update(1)

  set page(numbering: "i")

  // MARK: Preliminary headings
  show heading: set text(size: 1em, font: "Libertinus Sans")
  show heading: set block(spacing: 2em)

  // MARK: Abstract
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

    // MARK: Summary
    if resumen != none {
      pagebreak()
      heading(numbering: none, level: 2)[Resumen]
      resumen
    }

    // MARK: Executive Summary
    if resumen-ejecutivo != none {
      heading(numbering: none, level: 2)[Resumen Ejecutivo]
      resumen-ejecutivo
    }

    // MARK: Tables of contents
    {
      show heading: it => {
        pagebreak()
        it
      }
      show outline.entry.where(level: 1): it => link(
        it.element.location(),
        text(
          font: "Libertinus Sans",
          weight: "bold",
          upper(
            it.indented(
              if it.element.numbering != none [ #it.element.supplement #it.prefix()] else { it.prefix() },
              [#it.body() #h(1fr) #it.page()],
            ),
          ),
        ),
      )
      show outline.entry.where(level: 2): it => link(
        it.element.location(),
        text(
          font: "Libertinus Sans",
          weight: "bold",
          smallcaps(
            it.indented(
              if it.element.numbering != none [ #it.element.supplement #it.prefix()] else { it.prefix() },
              [#it.body() #h(1fr) #it.page()],
            ),
          ),
        ),
      )
      show outline.entry.where(level: 3): it => it
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
      show heading: it => {
        pagebreak()
        it
      }

      if (counter(figure.where(kind: table)).final().at(0) != 0) {
        outline(
          title: [Índice de Tablas],
          target: figure.where(kind: table),
        )
      }

      if (counter(figure.where(kind: image)).final().at(0) != 0) {
        outline(
          title: [Índice de Figuras],
          target: figure.where(kind: image),
        )
      }

      if (counter(figure.where(kind: math.equation)).final().at(0) != 0) {
        outline(
          title: [Índice de Expresiones Matemáticas],
          target: figure.where(kind: math.equation),
        )
      }


      if (query(heading.where(supplement: [Anexo])).len() != 0) {
        outline(
          title: [Índice de Anexos],
          target: selector(heading.where(supplement: [Anexo])),
        )
      }
    }
  }

  set page(
    numbering: "1",
    header: context hydra(2, display: (_, it) => upper(it.body)),
  )

  // MARK: Headings
  show heading.where(level: 1): set heading(supplement: [Parte], numbering: "I")
  show heading.where(level: 2): set heading(
    supplement: [Capítulo],
    numbering: (part, chapter-numbering, ..rest) => numbering("I", chapter-numbering),
  )
  set heading(numbering: (part, chapter-numbering, ..rest) => numbering("1.", ..rest))

  show heading.where(level: 1): it => {
    pagebreak()
    set page(numbering: none, header: none)

    {
      set align(center)

      v(6em)

      text(
        font: "Libertinus Sans",
        size: 1.25em,
        weight: "regular",
        tracking: 0.05em,
        fill: gray.darken(40%),
      )[#upper(it.supplement)]

      v(1em)

      if it.numbering != none and it.outlined == true {
        text(
          font: "Libertinus Sans",
          size: 3.5em,
          weight: "bold",
        )[#counter(heading).display("I")]

        v(4em)
      }

      text(
        font: "Libertinus Sans",
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

  show heading.where(level: 2): it => context {
    if it.numbering != none and it.outlined == true { chapter-counter.step() }
    pagebreak()
    // set page(numbering: none, header: none)

    block(width: 100%, inset: (top: 3cm, bottom: 2cm))[
      #set text(font: "Libertinus Sans")

      #if it.numbering != none and it.outlined == true [
        #set text(size: 2.5em, weight: "bold", fill: gray.darken(40%))
        #it.supplement
        #if it.supplement == [Anexo] [
          #chapter-counter.display("A").trim(".")
        ] else [
          #chapter-counter.display("I").trim(".")
        ]

        #v(0.5cm)
      ]

      #text(
        size: 2em,
        weight: "bold",
      )[#it.body]

      #v(0.3cm)

      #line(length: 25%, stroke: (thickness: 0.5pt, dash: "solid"))
    ]
  }

  show heading.where(level: 3): set align(center)
  show heading.where(level: 3): smallcaps
  show heading.where(level: 5): emph
  show heading.where(level: 6): it => [
    #it.body.
  ]
  show heading.where(level: 7): it => [
    2 _#it.body._
  ]

  body
}

#let anexos(body) = context {
  show heading.where(level: 2): set heading(
    supplement: [Anexo],
    numbering: (part, appendix-numbering, ..rest) => numbering("A", appendix-numbering),
  )
  set heading(numbering: (part, appendix-numbering, ..rest) => numbering("A.1.", appendix-numbering, ..rest))

  chapter-counter.update(0)
  let current_part = counter(heading).get().at(0)
  counter(heading).update((part, ..rest) => (current_part, 0))


  body
}
