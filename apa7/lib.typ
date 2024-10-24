#import "../utils/to-string.typ": *
#import "utils/languages.typ": *
#import "utils/authoring.typ": *
#import "utils/orcid.typ": *
#import "utils/addendum.typ": *

#let apa7(
  title: [Paper Title],
  
  authors: (:),
  affiliations: (:),

  custom-authors: [],
  custom-affiliations: [],

  // Student-specific fields
  course: [],
  instructor: [],
  due-date: [],

  // Professional-specific fields
  running-head: [],
  author-notes: [],
  keywords: (),
  abstract: [],

  // Common fields
  font-family: "Libertinus Serif",
  font-size: 12pt,
  region: "us",
  language: "en",
  paper-size: "us-letter",
  implicit-introduction-heading: true,
  toc: false,

  body
) = {
  let double-spacing = 1.5em

  authors = validate-inputs(authors, custom-authors, "author")
  affiliations = validate-inputs(affiliations, custom-affiliations, "affiliation")

  set document(
    title: title,
    author: if type(authors) == array {
      authors.map(it => plain-text(it.name))
    } else {
      plain-text(authors).trim(" ", at: start).trim(" ", at: end)
    },
    keywords: keywords,
  )

  set text(
    size: font-size,
    font: font-family,
    region: region,
    lang: language,
  )

  set page(
    margin: 1in,
    paper: paper-size,
    numbering: "1",
    number-align: top + right,
    header: context {
      upper(running-head)
      h(1fr)
      str(here().page())
    }
  )

  set par(
    leading: double-spacing,
    spacing: double-spacing,
  )

  show link: set text(
    fill: blue,
  )

  show link: it => {
    underline(it.body)
  }

  if running-head != none and running-head != [] and running-head != "" {
    if plain-text(running-head).len() > 50 {
      panic("Running head must be no more than 50 characters, including spaces and punctuation.")
    }
  }

  align(center)[
    #for i in range(4) {
      [~] + parbreak()
    }

    #strong(title)

    ~
    
    #parbreak()

    #print-authors(authors, affiliations, language)

    #print-affiliations(authors, affiliations)

    #if type(course) == content and course != [] {
      course
    } else if type(course) != content {
      panic("Course must be of type content: ", type(course))
    }

    #if type(instructor) == content and instructor != [] {
      instructor
    } else if type(instructor) != content {
      panic("Instructor must be of type content: ", type(instructor))
    }

    #if ((type(due-date) == content and due-date != []) or (type(due-date) == str and due-date != "")) {
      due-date
    } else if type(due-date) != content {
      panic("Due date must be of type content or string: ", type(due-date))
    }

    #if author-notes != [] and author-notes != none {
      v(1fr)

      strong(get-terms(language).at("Author Note"))

      align(left)[
        #set par(first-line-indent: 0.5in)
        #author-notes
      ]
    }

    #pagebreak()
  ]

  show heading: set text(size: font-size)
  show heading: set block(spacing: double-spacing)

  show heading: it => emph(strong[#it.body.])
  show heading.where(level: 1): it => align(center, strong(it.body))
  show heading.where(level: 2): it => par(
    first-line-indent: 0in, strong(it.body)
  )

  show heading.where(level: 3): it => par(
    first-line-indent: 0in, emph(strong(it.body))
  )

  show heading.where(level: 4): it => strong[#it.body.]
  show heading.where(level: 5): it => emph(strong[#it.body.])

  set par(
    first-line-indent: 0.5in,
    leading: double-spacing,
  )

  show figure: set figure.caption(
    position: top
  )

  show figure: set block(
    breakable: true
  )

  show figure: it => {
    it.caption
    align(center, it.body)
  }

  set figure(
    gap: 1.5em,
    placement: none
  )

  show figure.caption: it => {
    set par(first-line-indent: 0in)
    align(left)[
      *#it.supplement #context it.counter.display(it.numbering)*

      #emph(it.body)
    ]
  }

  set table(
    stroke: none,
  )

  set list(
    marker: ([•], [◦]),
    indent: 0.5in - 1.75em,
    body-indent: 1.3em,
  )

  set enum(
    indent: 0.5in - 1.5em,
    body-indent: 0.75em,
  )

  set raw(
    tab-size: 4,
    block: true,
  )

  show raw.where(block: true): block.with(
    fill: luma(230),
    inset: 5pt,
    radius: 10pt,
  )

  show raw: text.with(
    font: "DejaVu Sans Mono",
    size: 10pt
  )

  show figure.where(kind: raw): it => {
    set align(left)
    it.caption
    it.body
  }

  show quote: set pad(left: 0.5in)
  show quote: set block(spacing: 1.5em)

  show quote: it => {
    let quote-text = plain-text(it.body)
    let quote-text-words = plain-text(it.body).split(" ").len()

    if quote-text-words <= 40 {
      set quote(block: false)
      [
        "#quote-text.trim(" ")"~#it.attribution.
      ]
    } else {
      set quote(block: true)
      set par(hanging-indent: 0.5in)
      [
        #quote-text.trim(" ")~#it.attribution
      ]
    }
  }

  set bibliography(
    style: "apa",
  )

  if (toc) {
    show outline.entry.where(level: 1): it => {
      strong(it)
    }

    show outline.entry.where(level: 2): it => {
      strong(emph(it))
    }

    show outline.entry.where(level: 3): it => {
      emph(it)
    }

    show outline.entry.where(level: 4): it => {
      it
    }
    
    outline(indent: 2em, depth: 4)
    pagebreak()
  }

  if (type(abstract) == content and abstract != []) {
    heading(level: 1, get-terms(language).Abstract)

    par(first-line-indent: 0in)[
      #abstract
    ]

    emph(get-terms(language).Keywords)
    [: ]
    keywords.map(it => it).join(", ")
    
    pagebreak()
  } else if (type(abstract) != content) {
    panic("Invalid abstract type, must of type content: ", type(abstract))
  }

  if implicit-introduction-heading {
    heading(level: 1, title)
  }

  body
}
