#import "@preview/drafting:0.2.0": *
#import "@preview/scaffolder:0.2.1": scaffolding
#import "../utils/font-sizes.typ": *
#import "../utils/to-string.typ": *

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
  // Close-close enough to LaTeX, revision might be needed.
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

#let template(
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
    background: scaffolding(),
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
  show raw: set text(
    font: "New Computer Modern Mono",
    size: font-size.normalsize,
  )

  set heading(
    numbering: (..args) => {
      if args.pos().len() == 1 {
        // Level 1: Roman numerals for Parts.
        numbering("I", ..args)
      } else if args.pos().len() == 2 {
        // Level 2: Use the chapter state counter and increment it.
        chapter-counter.get().first() + 1
      } else if args.pos().len() == 3 or args.pos().len() == 4 {
        // Level 3+: Use the chapter number followed by the position within that chapter.
        numbering("1.1", ..chapter-counter.get(), ..args.pos().slice(2))
      } else {
        none
      }
    },
  )

  // typst doesn't have ex unit, so ex = ~0.5em
  show heading.where(level: 1): set heading(supplement: [Part])
  show heading.where(level: 1): set text(
    hyphenate: false,
  )
  show heading.where(level: 1): set par(
    justify: false,
    leading: 0.55em,
  )
  show heading.where(level: 1): it => if it.supplement == [Part] {
    // TODO: handle open right
    // TODO: handle two sides
    pagebreak(weak: true)
    // Vertical spacing is weird compared to LaTeX, it's too centered if using align(center + horizon), whereas LaTeX puts it more to the top, a workaround is wrapping it with v(0.5fr)-v(0.9fr). Works, but at least, I'd want a better explanation on how does LaTeX do it.
    v(0.5fr)
    align(center + horizon)[
      #set text(weight: "bold")
      #text(
        size: font-size.huge,
      )[#it.supplement #context counter(heading).display("I")]
      #v(20pt)
      #text(size: font-size.Huge, it.body)
    ]
    // v(10em)

    v(0.9fr)
    pagebreak()

    context if it.numbering != none and it.outlined == true {
      let chapters = chapter-counter.get()
      counter(heading).update((one, ..n) => (one, ..chapters))
    }
  } else if it.supplement == [Abstract] {
    it
  }

  show heading.where(
    level: 2,
  ): set heading(
    supplement: [Chapter],
  )

  // chapter with numbering
  show heading.where(level: 2): it => {
    pagebreak(weak: true)
    v(50pt + 2em) // Without 2em it looks a bit higher, LaTeX only sets 50pt
    if (it.outlined == true and it.numbering != none) {
      chapter-counter.step()
      text(size: font-size.huge)[#it.supplement #context chapter-counter.display()]
      v(20pt)
    }
    block(
      below: 40pt,
      text(size: font-size.Huge, it.body),
    )
  }

  show heading.where(level: 3): set text(size: font-size.Large, weight: "bold")
  show heading.where(level: 3): set block(
    above: 3.5 * 0.5em,
    below: 2.3 * 0.5em,
  )
  show heading.where(level: 3): it => {
    block(
      grid(
        columns: (auto, 1fr),
        align: (left, left),
        grid.cell(
          inset: (right: 1em),
          context counter(heading).display(),
        ),
        it.body,
      ),
    )
  }

  // Subsection
  show heading.where(level: 4): set text(size: font-size.large, weight: "bold")
  show heading.where(level: 4): set block(
    above: 3.25 * 0.6em,
    below: 1.5 * 0.6em,
  )

  // Subsubsection
  show heading.where(level: 5): set text(size: font-size.normalsize, weight: "bold")
  show heading.where(level: 5): set block(above: 3.25 * 0.6em, below: 1.5 * 0.6em)
  show heading.where(level: 5): set heading(numbering: none)

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

  // show heading.where(level: 4).or(heading.where(level: 5)): it => {
  //   if it.level == 4 {
  //     box(
  //       pad(
  //         left: -1.5em,
  //         it.body,
  //       ),
  //     )
  //   } else if (it.level == 5) {
  //     it.body
  //   }
  // }

  set par(
    first-line-indent: 1.5em,
    spacing: 1.2 * 0.5em,
    leading: 1.15 * 0.5em,
    justify: true,
  )

  set outline.entry(fill: repeat([.], gap: 0.5em))
  show outline.entry.where(level: 1): set text(weight: "bold", size: font-size.large)
  show outline.entry.where(level: 1): set par(
    leading: 0.3em,
    justify: true,
    hanging-indent: 3em,
  )
  show outline.entry.where(level: 1).or(outline.entry.where(level: 2)): set outline.entry(fill: none)
  show outline.entry.where(level: 1): set block(above: 2.25em)
  show outline.entry.where(level: 2): set text(weight: "bold", size: font-size.normalsize)
  show outline.entry.where(level: 2): set par(justify: true)
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
  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    it.indented(
      none,
      grid(
        columns: (1fr, auto),
        align: (left, bottom + right),
        {
          it.prefix()
          h(1em)
          it.body()
        },
        grid.cell(inset: (left: 1em), it.page()),
      ),
    ),
  )

  show outline.entry.where(level: 2): it => link(
    it.element.location(),
    it.indented(
      none,
      grid(
        columns: (auto, 1fr, auto),
        align: (left, left, bottom + right),
        grid.cell(inset: (right: 1em), it.prefix()),
        it.body(),
        grid.cell(inset: (left: 1em), it.page()),
      ),
    ),
  )


  pagebreak(weak: true)
  heading(numbering: none, outlined: false, title, level: 2)
  outline(title: none, depth: depth, target: heading.where(outlined: true))
}

// Seems to be fine already, but some revision for pixel-perfect might be needed.
#let abstract(title: [Abstract], body) = context {
  pagebreak()
  set page(footer: none, header: none)
  set par(first-line-indent: 1em)
  v(0.56fr)
  show heading: set align(center)
  show heading: set text(
    weight: "bold",
    size: get-font-size(text.size).normalsize,
  )
  // align(center, text(weight: "bold", title))
  heading(
    numbering: none,
    supplement: [Abstract],
    bookmarked: false,
    outlined: false,
    title,
  )
  v(1em)
  body
  v(1fr)
  pagebreak()
}
