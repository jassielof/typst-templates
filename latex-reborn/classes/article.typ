#import "@preview/drafting:0.2.0": *
#import "@preview/scaffolder:0.2.1": scaffolding
#import "../utils/font-sizes.typ": *
#import "../utils/to-string.typ": *

// TODO: Move the function parameters out to this var, so that they can be used in other possible functions.
#let latex-info = (document-class: "article", font-size: 10pt, paper-size: "us-letter")

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
  make-title: false,
  body,
) = {
  set document(
    author: to-string(author),
    title: title,
  )

  if (font-size == 10pt) {
    font-size = font-10pt
  } else if (font-size == 11pt) {
    font-size = font-11pt
  } else if (font-size == 12pt) {
    font-size = font-12pt
  } else {
    font-size = font-10pt
  }

  let test-rect = rect(outset: 0cm, inset: 0cm, width: 100%, height: 100%, stroke: 1pt)
  let test-block = block(outset: 0cm, inset: 0cm, width: 100%, height: 100%, stroke: 1pt, spacing: 0cm)

  set page(
    header-ascent: 25pt,
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
    // FIXME: dict doesnt have normalsize
    // size: font-size.normalsize,
    font: "CMU Serif",
  )

  if (make-title) {
    v(1fr)
    v(60pt)
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
  }

  //TODO: Chapters shouldn't be available if the class is article.
  // So the level 1 heading should be a chapter if the class isn't article.

  // typst doesn't have ex unit, so ex = ~0.5em
  // show heading.where(level: 1): set heading(supplement: [Chapter]) if class == "report" or class == "book"

  // show heading.where(level: 1, outlined: true): it => if class == "report" {
  //   pagebreak()
  //   set par(first-line-indent: 0in)
  //   v(50pt)
  //   text(size: font-size.huge)[#it.supplement #context counter(
  //       heading.where(level: 1, supplement: [Chapter]),
  //     ).display()]
  //   v(20pt)
  //   block(below: 40pt, text(size: font-size.Huge, it.body))
  // }

  // Lower level headings
  // TODO: Numbering width is too narrow

  // Section
  // show heading.where(level: 1): set heading(supplement: [Section]) if class == "article"
  // show heading.where(level: 2): set heading(supplement: [Section]) if class == "report"
  // show heading.where(level: 1): set text(size: font-size.Large, weight: "bold") if class == "article"
  // show heading.where(level: 2): set text(size: font-size.Large, weight: "bold") if class == "report"
  // show heading.where(level: 1): set block(above: 3.5 * 0.5em, below: 2.3 * 0.5em) if class == "article"
  // show heading.where(level: 2): set block(above: 3.5 * 0.5em, below: 2.3 * 0.5em) if class == "report"

  // set heading(numbering: "1.1") if class == "article" or class == "report"

  // Subsection
  // show heading.where(level: 2): set text(size: font-size.large, weight: "bold") if class == "article"
  // show heading.where(level: 2): set block(above: 3.25 * 0.6em, below: 1.5 * 0.6em) if class == "article"
  // show heading.where(level: 2): set heading(numbering: "1.1") if class == "article"

  // Subsubsection
  // show heading.where(level: 3): set text(size: font-size.normalsize, weight: "bold") if class == "article"
  // show heading.where(level: 3): set block(above: 3.25 * 0.6em, below: 1.5 * 0.6em) if class == "article"
  // show heading.where(level: 3): set heading(numbering: "1.1") if class == "article"

  // Paragraph
  // show heading.where(level: 4): set text(size: font-size.normalsize, weight: "bold") if class == "article"
  // // show heading.where(level: 4): set block(above: 3.25 * 0.5em, below: 1em) if class == "article"
  // show heading.where(level: 4): set heading(numbering: none) if class == "article"
  // show heading.where(level: 4): set text(top-edge: 3.25 * 0.5em, bottom-edge: 1em) if class == "article"
  // show heading.where(level: 4): set box()

  // show heading.where(level: 4): it => strong(it.body)

  // Subparagraph
  // show heading.where(level: 5): set text(size: font-size.normalsize, weight: "bold") if class == "article"
  // show heading.where(level: 5): set block(above: 3.25 * 0.5em, below: 1em) if class == "article"
  // show heading.where(level: 5): set heading(numbering: none) if class == "article"
  // show heading.where(level: 5): set text(top-edge: 3.25 * 0.5em, bottom-edge: 1em) if class == "article"

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

  show figure.where(kind: "part"): part => {
    // TODO: handle open right
    // TODO: handle two sides
    set page(numbering: "1")
    align(center + horizon)[#block(width: 100%, height: 100%, stroke: 1pt)[
      #set text(weight: "bold")
      #text(size: font-size.huge)[#part.supplement #context counter(figure.where(kind: "part")).display("I")]
      #v(20pt)
      #text(size: font-size.Huge, part.caption.body)
      #parbreak()
    ]]
  }

  body
}

// show heading.where(level: 1) makes the outline() be numbered
#let table-of-contents(title: [Contents], depth: 3) = {
  show outline.entry.where(level: 1): set outline.entry(fill: none)
  show outline.entry: set block(spacing: 0.55em)
  show outline.entry.where(level: 1): set block(above: 2.5 * 0.55em, below: 0.5 * 0.55em)
  show outline.entry.where(level: 1): set text(weight: "bold")
  set outline.entry(fill: repeat([.], gap: 0.5em))
  heading(numbering: none, outlined: false, title)
  outline(title: none, depth: depth, target: heading.where(outlined: true).or(figure.where(kind: "part")))
}

// Abstract is from the report class
#let abstract(body) = {}

// TODO: None of the sections support short title
// Part section won't be bookmarked due to it being a figure instead of a heading, unless one could use the heading function and hide its content and move down all the other headings level.
#let part(title) = figure(
  caption: title,
  kind: "part",
  supplement: [Part],
  [],
)
// These should work with heading offset/depth so it automatically detects the level of the heading with the chapter.

// Chapter is not available in the article class
#let chapter(title) = {
  v(50pt)
  show heading.where(offset: 0, depth: 1): set text(size: font-)
  heading(offset: 0, title)
  v(40pt)
}

#let section
#let subsection
#let subsubsection

#let paragraph
#let subparagraph

