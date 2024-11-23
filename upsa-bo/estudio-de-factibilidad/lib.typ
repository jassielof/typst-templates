#import "@preview/hydra:0.5.1": hydra
#import "../../utils/to-string.typ": *

#let estudio-de-factibilidad(
  título: [],
  facultades-carreras: [],
  estudiantes: [],
  materia: [],
  fecha: [],
  docente: [],
  abstracto: [],
  resumen-ejecutivo: [],
  body,
) = {
  set document(
    title: to-string(título),
    author: to-string(estudiantes).trim(),
    keywords: ("Estudio de Factibilidad", "UPSA"),
  )

  set page(
    margin: (
      left: 4cm,
      bottom: 2.5cm,
      right: 2.5cm,
      top: 2.5cm,
    ),
    paper: "us-letter",
    number-align: bottom + right,
  )

  set text(
    size: 12pt,
    font: "Libertinus Serif",
    lang: "es",
    region: "bo",
  )

  set par(leading: 1.5em)

  set math.equation(numbering: "(1)", supplement: [Expresión Matemática])

  show figure: set figure.caption(position: top)

  show figure: it => {
    block(
      breakable: false,
      sticky: true,
      width: 100%,
      inset: 0in,
    )[
      #it.caption
      #align(center, it.body)
    ]
  }

  set figure(
    gap: 1.5em,
    placement: none,
  )

  show figure.caption: it => {
    set par(first-line-indent: 0in)
    align(left)[
      *#it.supplement #context it.counter.display(it.numbering)*

      #emph(it.body)
    ]
  }

  show table.cell: set par(
    leading: 1em,
    spacing: 2em,
  )

  show figure: set block(breakable: true)

  set par(spacing: 2em)

  show quote: set par(
    leading: 1.5em,
    spacing: 2em,
  )

  show quote: set pad(left: 0.5in)

  set heading(numbering: "1.")

  show heading.where(level: 1): it => {
    pagebreak()
    it
  }

  show heading: set text(size: 12pt)
  show heading: set block(spacing: 2em)
  show heading: set par(leading: 1.5em)

  let portada = align(center)[
    #set text(weight: "bold")
    #image("../assets/images/logo-upsa.png")

    #v(1fr)

    #facultades-carreras

    #v(1fr)

    #materia

    #v(1fr)

    #rect(radius: 20%, inset: 10pt)[_"#título"_]

    #v(1fr)

    #estudiantes

    #v(1fr)

    #docente \
    Santa Cruz de la Sierra, Bolivia \
    #fecha
  ]

  portada

  pagebreak(to: "odd")

  portada

  pagebreak(weak: false)

  counter(page).update(0)

  set page(numbering: "i")

  if ((type(abstracto) == content and abstracto != []) or (type(abstracto) == str and abstracto != "")) {
    heading([Abstracto], numbering: none)
    abstracto
  }

  if (
    (type(resumen-ejecutivo) == content and resumen-ejecutivo != []) or (
      type(resumen-ejecutivo) == str and resumen-ejecutivo != ""
    )
  ) {
    heading([Resumen Ejecutivo], numbering: none)
    resumen-ejecutivo
  }

  {
    show outline.entry.where(level: 1): it => strong(it)
    show outline.entry.where(level: 2): it => strong(emph(it))
    show outline.entry.where(level: 3): it => emph(it)

    outline(
      title: [Índice General],
      indent: 0em,
    )
  }

  outline(
    title: [Índice de Tablas],
    target: figure.where(kind: table),
  )

  outline(
    title: [Índice de Figuras],
    target: figure.where(kind: image),
  )

  set math.equation(numbering: "1.")

  outline(
    title: [Índice de Expresiones Matemáticas],
    target: figure.where(kind: math.equation),
  )

  outline(
    title: [Índice de Anexos],
    target: selector(heading.where(supplement: [Anexo])),
  )

  set page(numbering: "1")

  show heading.where(level: 1): set heading(supplement: [Capítulo])

  set page(header: context hydra(1, display: (_, it) => upper(it.body)))

  body
}

#let contenido-principal(
  body,
) = (
  context {
    show heading.where(level: 1): it => {
      {
        set page(
          numbering: none,
          header: none,
        )

        set par(spacing: 1.5em)

        align(center + horizon)[
          #text(size: 2.25em)[#it.supplement #context counter(heading).display("I").trim(".")]

          #text(size: 2.75em)[#it.body]
        ]
      }

      it
    }
    body
  }
)

#let anexos(
  body,
) = (
  context {
    counter(heading).update(0)
    show heading: set heading(supplement: [Anexo])
    show heading: set heading(numbering: "A.")

    show heading.where(level: 1): it => {
      {
        set page(
          numbering: none,
          header: none,
        )

        set par(spacing: 1.5em)

        align(center + horizon)[
          #text(size: 2.25em)[#it.supplement #counter(heading).display().trim(".")]

          #text(size: 2.75em)[#it.body]
        ]
      }

      it
    }

    body
  }
)
