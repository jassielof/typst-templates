#import "default.typ"

// El lomo del libro (art. 135 del Reglamento de Graduación)
#let spine-cover(
  // La sigla de la universidad.
  university: default.university.short,
  // La sigla de la modalidad de graduación según el Reglamento Académico.
  modality: [PG],
  // El título oficial del documento.
  title: default.title,
  // El número de volúmenes/tomos del libro, esto debe establecerse solo cuando el libro es una obra de varios volúmenes.
  volumes: none,
  // El año de publicación del libro.
  year: datetime.today().year(),
) = {
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
      font: "Source Sans 3",
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
          text(title, size: 22pt, weight: "semibold"),
          width: 90%,
        ),
      ),
      {
        if volumes > 1 {
          text(size: 24pt, font: "Source Serif 4 Display", weight: "bold")[
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
