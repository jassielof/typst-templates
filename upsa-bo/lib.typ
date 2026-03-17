#import "@preview/hydra:0.6.1": hydra
#import "utils/to-string.typ": to-string
#import "utils/title-page.typ": portada

#let chapter-counter = counter("chapter")
// Planilla para documentos finales de licenciatura de la Universidad Privada de Santa Cruz de la Sierra (UPSA). Basada en el Reglamento de Graduación (revisado el 2025, a su vez adecuado al D.S 1433), título V (aspectos formales del documento final de licenciatura), capítulo I (presentación del documento final).
#let tfg(
  título: [],
  facultad: [],
  carrera: [],
  autor: [],
  registro-autor: [],
  adición: none,
  modalidad: [],
  incluir-guía: false,
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
  // El texto se escribirá usando mayúsculas y minúsculas, limitando el uso de mayúsculas completas a títulos. El tipo de letras podrá ser elegido de algunos de los siguientes: Times New Roman (14 pt [nunca se especifica la unidad, así que puede asumirse la unidad por defecto de Microsoft Word (punto) o bien pixel]), Arial (12 pt) o Helvética (12 pt).
  // El tamaño y tipo de las letras será uniforme en todo el texto, así como el sistema de encabezamientos y jerarquización, y otras formas de presentación. Para sub/títulos, notas, referencias bibliográficas y citas,podrán usarse tamaños mayores/menores de letra.
  fuentes: (
    tamaño: 12pt,
    // [TeX Gyre es un conjunto de familias como alternativas a fuentes de paga o propietarias, fieles en métricas a sus respectivas contrapartes.]
    cuerpo: "TeX Gyre Termes", // Basada en Times New Roman
    títulos: "TeX Gyre Heros", // Basada en Helvética
    mono: "TeX Gyre Cursor", // Basada en Courier New
    ecuaciones: "TeX Gyre Termes Math", // Para jugar a la par de TeX Gyre Termes en expresiones matemáticas.
    // [Considerar que el reglamento no menciona ninguna fuente para expresiones matemáticas o mono.]
  ),
  // Art. 141: Espacios
  // El interlineado del texto será a espacio y medio (1,5). Entre párrafo y párrafo se dejarán dos espacios [se asume 2,0]. Cada párrafo debe iniciarse al principio del margen izquierdo sin dejar ninguno tipo de sangrado.
  // [El espaciado no puede ser estrictamente copiado ya que (asumo) este espaciado es dado según Microsoft Word, y el espaciado de Typst funciona un tanto diferente, para asimilarse un poco más al de Microsoft Word, simplemente se lo deja en los mismos valores con unidad em, pero si se desea una apariencia similar, se puede usar 1.25 em en interlineado y 1.5 em en párrafo]
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
    // Art. 142: Márgenes
    // Los márgenes serán 4 cm para el izquierdo, y 2.5 cm para el resto (incluye la numeración de página [por defecto en Typst])
    margin: (
      ..if doble-cara { (inside: 4cm) } else { (left: 4cm) },
      rest: 2.5cm,
    ),
    // Art. 137: Tipo de hoja
    // El tipo de hoja será papel bond blanco, de 75 g, tamaño carta (us-letter) en posición vertical.
    paper: "us-letter",
    // Art. 138: Numeración
    // La numeración de las páginas será arábiga correlativa, sin límites, en la esquina inferior derecha, para el desarrollo del trabajo; y romana con minúscula para la presentación, prólogo e índice/s.
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
    supplement: [Formula],
  )

  show math.equation: set text(font: fuentes.ecuaciones)

  show figure: set figure.caption(position: top)
  show figure.where(kind: image): set block(breakable: true, sticky: true)
  show figure.where(kind: table): set block(breakable: true, sticky: false)
  show figure.where(kind: math.equation): set figure(supplement: [Formula])
  set figure(
    gap: espaciado.interlineado,
    placement: none,
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
      incluir-guía: incluir-guía,
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
    incluir-guía: incluir-guía,
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
      ..if (carrera != none) {
        ([*Carrera*], carrera)
      },
      ..if (guía != none) {
        ([*Guía*], guía)
      },
      ..if (palabras-clave != none) {
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

  show heading.where(level: 2): set text(font: fuentes.cuerpo)

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
      outline(title: [Índice de fórmulas], target: figure.where(kind: math.equation))
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

// Artículos irrelevantes o sin efecto directo a la planilla.
// Art. 140: Encuadernación
// La encuadernación será: En cartón duro, color blanco, y la tapa se plastificará para proteger las letras y/o la hoja con el contenido de la cubierta o tapa.
// Art. 145: Estilo de redacción
// El estilo de redacción será impersonal, evitando utilizar la primera persona.
// Se recomienda: usar el estilo científico (directo y preciso), evitar la verbosidad y palabras rebuscadas, no distraer el mensaje con términos ambiguos e imprecisos, redactar párrafos breves, evitando un excesivo número de oraciones subordinadas, las que hacen perder la idea central, emplear las frases para demostrar y argumentar (no para decorar ni persuadir), y elaborar una lista de aquellos términos poco comunes que necesiten una definición particular dentro del contexto de la investigación. Este glosario de términos deberá ir al final del trabajo y debe estar indicado en el índice del contenido.
// Art. 146: Tiempo de los verbos
// La redacción del trabajo deberá hacerse utilizando el tiempo presente, a excepción del capítulo de "Método", que podrá escribirse en pretérito (pasado). Una vez decidido el tiempo verbal a utilizar, no se modificará el mismo en párrafos subsiguientes
// Art 147: Citas y notas
// Las citas y notas bibliográficas deberán ceñirse al estilo de referenciación bibliográfica establecido por la Facultad.
