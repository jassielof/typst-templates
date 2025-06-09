#import "@preview/drafting:0.2.0": *
#import "utils/showframe.typ": background
#import "utils/font-sizes.typ": *
#import "utils/to-string.typ": *

#let chapter-counter = counter("chapter")


#let get-font-size(font-size) = {
  if (font-size == 10pt) {
    return font-10pt
  } else if (font-size == 11pt) {
    return font-11pt
  } else if (font-size == 12pt) {
    return font-12pt
  } else {
    panic("Font size must be 10pt, 11pt, or 12pt.")
  }
}

// FIXME: Vertical spacing
#let title-page(
  title: [Title],
  author: [Author Name],
  date: datetime.today().display("[month repr:long] [day], [year]"),
  font-size: 10pt,
) = {
  set document(
    author: to-string(author),
    title: title,
  )

  font-size = get-font-size(font-size)
  set page(footer: none)
  // Close-close enough to LaTeX
  v(0.8fr)
  align(center)[
    #text(size: font-size.LARGE, title)
    #v(3em)
    #[#set text(size: font-size.large)
      #set par(leading: 0.75em)
      #author
    ]
    #v(1.5em)
    #text(size: font-size.large, date)
    #v(1fr)
  ]
  pagebreak()
}

#let report(
  title: [Title],
  author: [Author Name],
  date: datetime.today().display("[month repr:long] [day], [year]"),
  font-size: 10pt,
  paper-size: "us-letter",
  flush-left-equations: false,
  left-equation-numbering: false,
  two-column: false,
  sides: "one",
  landscape: false,
  open: "any",
  draft: false,
  body,
) = {
  font-size = get-font-size(font-size)

  set page(
    header-ascent: -25pt,
    footer-descent: 30pt - 1em,
    paper: paper-size,
    background: background(),
    margin: font-size.margin,
    numbering: "1",
  )

  // set-page-properties()
  set-margin-note-defaults(
    stroke: none,
    side: right,
    margin-right: 2.8cm,
    margin-left: 4.8cm,
  )

  set text(
    size: font-size.normalsize,
    font: "New Computer Modern",
  )
  show raw: set text(font: "New Computer Modern Mono", size: font-size.normalsize)

  show heading.where(level: 1): set heading(numbering: "I.I")
  set heading(numbering: (first, ..n) => (numbering("1.1", ..n)))
  // typst doesn't have ex unit, so ex = ~0.5em
  show heading.where(level: 1): set heading(supplement: [Part])
  show heading.where(level: 1): it => {
    // TODO: handle open right
    // TODO: handle two sides
    align(center + horizon)[
      #pagebreak(weak: true)
      #set text(weight: "bold")
      #text(size: font-size.huge)[#it.supplement #context counter(heading.where(level: 1)).display("I")]
      #v(20pt)
      #text(size: font-size.Huge, it.body)
      #pagebreak()
    ]

    context {
      let chapters = chapter-counter.get()
      counter(heading).update((one, ..n) => (one, ..chapters))
    }
  }

  show heading.where(level: 2): set heading(supplement: [Chapter])

  // chapter with numbering
  show heading.where(level: 2): it => {
    pagebreak(weak: true)
    v(50pt + 1em)
    if (it.outlined == true) {
      chapter-counter.step(level: 1)
      text(size: font-size.huge)[#it.supplement #context counter(
          heading.where(level: 2, supplement: [Chapter]),
        ).display()]
      v(20pt)
    }
    block(below: 40pt, text(size: font-size.Huge, it.body))
  }

  // Lower level headings
  // FIXME: Numbering width is too narrow

  // Section
  show heading.where(level: 3): set heading(supplement: [Section])
  show heading.where(level: 3): set text(size: font-size.Large, weight: "bold")
  show heading.where(level: 3): set block(above: 3.5 * 0.5em, below: 2.3 * 0.5em)

  // Subsection
  show heading.where(level: 4): set text(size: font-size.large, weight: "bold")
  show heading.where(level: 4): set block(above: 3.25 * 0.6em, below: 1.5 * 0.6em)
  show heading.where(level: 4): set heading(numbering: "1.1")

  // Subsubsection
  show heading.where(level: 5): set text(size: font-size.normalsize, weight: "bold")
  show heading.where(level: 5): set block(above: 3.25 * 0.6em, below: 1.5 * 0.6em)
  show heading.where(level: 5): set heading(numbering: "1.1")

  // Paragraph
  show heading.where(level: 6): set text(size: font-size.normalsize, weight: "bold")
  // show heading.where(level: 4): set block(above: 3.25 * 0.5em, below: 1em)
  show heading.where(level: 6): set heading(numbering: none)
  show heading.where(level: 6): set text(top-edge: 3.25 * 0.5em, bottom-edge: 1em)
  // show heading.where(level: 4): set box()

  // show heading.where(level: 4): it => strong(it.body)

  // Subparagraph
  show heading.where(level: 7): set text(size: font-size.normalsize, weight: "bold")
  show heading.where(level: 7): set block(above: 3.25 * 0.5em, below: 1em)
  show heading.where(level: 7): set heading(numbering: none)
  show heading.where(level: 7): set text(top-edge: 3.25 * 0.5em, bottom-edge: 1em)

  // show heading.where(level: 5): it => strong(it.body)

  show heading.where(level: 4).or(heading.where(level: 5)): it => {
    if it.level == 4 {
      box(
        pad(
          left: -1.5em,
          it.body,
        ),
      )
    } else if (it.level == 5) {
      it.body
    }
  }

  set par(
    first-line-indent: 1.5em,
    spacing: 1.2 * 0.5em,
    leading: 1.15 * 0.5em,
    justify: true,
  )

  set outline.entry(fill: repeat([.], gap: 0.5em))
  show outline.entry.where(level: 1): set text(weight: "bold", size: font-size.large)
  show outline.entry.where(level: 1).or(outline.entry.where(level: 2)): set outline.entry(fill: none)
  show outline.entry.where(level: 1): set block(above: 2.25em)
  show outline.entry.where(level: 2): set text(weight: "bold", size: font-size.normalsize)
  show outline.entry.where(level: 2): set outline(indent: 0em)
  show outline.entry.where(level: 2): set block(above: 1em)
  show outline.entry.where(level: 3): set outline(indent: 0.6em)
  show outline.entry.where(level: 4): set outline(indent: 1em)
  show outline.entry.where(level: 5): set outline(indent: 7em)
  show outline.entry.where(level: 6): set outline(indent: 10em)
  show outline.entry.where(level: 7): set outline(indent: 12em)

  body
}

#let table-of-contents(title: [Contents], depth: 4) = {
  pagebreak(weak: true)
  heading(numbering: none, outlined: false, title, level: 2)
  outline(title: none, depth: depth, target: heading.where(outlined: true))
}

// FIXME: Vertical spacing
// A revised abstract function for report.typ

#let abstract(title: [Abstract], body) = {
  pagebreak()
  set page(footer: none, header: none)
  set par(first-line-indent: 0em)
  v(0.56fr)
  align(center, text(weight: "bold", title))
  v(1em)
  body
  v(1fr)
  pagebreak()
}
