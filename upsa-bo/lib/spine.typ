#import "state.typ": document-fonts, document-graduation-work, document-institution

// El lomo del libro (art. 135 del Reglamento de Graduación)
#let cover(
  // El número de volúmenes/tomos del libro, esto debe establecerse solo cuando el libro es una obra de varios volúmenes.
  volumes: none,
  // El año de publicación del libro.
  year: datetime.today().year(),
) = context {
  let fonts = document-fonts.get()
  let university = document-institution.get().university.short
  let modality = document-graduation-work.get().modality-abbr
  let title = document-graduation-work.get().title
  let volumes = volumes

  if volumes == none {
    volumes = 1
  }

  for n in range(1, volumes + 1) {
    set align(center)
    set page(
      height: 11in,
      width: 2in,
      margin: 1cm,
    )
    set text(
      font: fonts.body,
      weight: "bold",
      hyphenate: false,
    )
    set par(justify: false)
    show grid: set block(breakable: false)

    grid(
      rows: (auto, 1fr, auto),
      align: horizon,
      {
        set text(tracking: 2pt)
        text(university, size: 28pt)
        parbreak()
        text(modality, size: 20pt)
      },
      rotate(
        -90deg,
        reflow: true,
        box(
          text(title, font: fonts.title, size: 22pt, weight: "semibold"),
          width: 90%,
        ),
      ),
      {
        if volumes > 1 {
          text(size: 24pt, font: fonts.title, weight: "bold")[
            #numbering("I", n)
          ]
          parbreak()
        }
        text(size: 20pt)[#year]
      },
    )

    if n < volumes {
      pagebreak()
    }
  }
}
