#import "utils/to-string.typ": *
#import "utils/languages.typ": *
#import "utils/authoring.typ": *
#import "utils/appendix.typ": appendix, appendix-outline
#import "utils/apa-figure.typ": apa-figure
#import "utils/abstract.typ": abstract-page
#import "utils/title.typ": title-page
#import "utils/constants.typ": double-spacing, first-indent-length


/// The APA 7th edition template for academic and professional documents.
///
/// - title (content): The title of your document.
/// - authors (dictionary): The authors of the document.
///   - For each author you must specify their name and their affiliations.
/// - affiliations (dictionary): The affiliations of the authors.
///   - For each affiliation you must specify its ID and its name.
/// - custom-authors (content): The custom authors of the document.
///   - You can manually specify the authors of the document.
/// - custom-affiliations (content): The custom affiliations of the document.
///   - You can manually specify the affiliations of the document.
/// - course (content): The academic course for the document.
/// - instructor (content): The instructor for the document.
/// - due-date (content): The due date for the document.
/// - running-head (content): The running head for the document.
/// - author-notes (): The author notes for the document.
/// - keywords (array | str): The keywords for the document metadata and abstract.
/// - abstract (content): The abstract of the document.
/// - journal (bool): Whether to use journal format.
/// - font-family (): The font family for the document. APA 7th edition recommended fonts are:
///   - Sans Serif fonts such as 11-point Calibri, 11-point Arial, or 10-point Lucida Sans Unicode
///   - Serif fonts such as 12-point Times New Roman, 11-point Georgia, or   10-point Computer Modern (LaTeX)
/// - font-size (length): The font size for the document.
///   - APA 7th edition recommends a 10-12 point font size.
/// - region (str): The region for the document (e.g., "us", "uk", "au").
/// - language (str): The language for the document (e.g., "en", "es", "fr").
/// - paper-size (str): The paper size for the document (e.g., "us-letter", "a4").
/// - implicit-introduction-heading (bool): Wether to include the paper title at the top of the first page of the text, which acts as a de facto Level 1 heading.
/// - abstract-as-description (bool): Whether to use the abstract as the document description.
/// - body (content): The body of the document.
/// -> content
#let versatile-apa(
  // Common fields
  font-family: "Libertinus Serif",
  font-size: 12pt,
  region: "us",
  language: "en",
  custom-terms: (:),
  paper-size: "us-letter",
  // TODO: Add strict mode for APA compliance, defaults to false for more versatility
  // TODO:Add a possible dictionary-based strict compliance for given parts, such as running head, quotes, fonts.
  strict: false,
  running-head: none,
  body,
) = {
  context language-terms.update(custom-terms)

  set text(
    size: font-size,
    font: font-family,
    region: region,
    lang: language,
  )

  show std.title: set text(size: font-size, weight: "bold")
  show std.title: set block(spacing: double-spacing)
  show std.title: set align(center)

  set page(
    paper: paper-size,
    numbering: "1",
    number-align: top + right,
    margin: 1in,
    header: if running-head != none {
      upper(running-head)
      h(1fr)
      context str(here().page())
    } else { auto },
  )

  set par(
    leading: double-spacing,
    spacing: double-spacing,
  )

  // Show-set rules are at least, easier to override compared to show-function
  // https://github.com/typst/typst/discussions/2883
  show link: set text(fill: blue)
  show link: underline // considering one would want to disable underline, current workaround is set its stroke to 0pt

  // FIXME: This should be on strict mode only
  // if running-head != none {
  //   if type(running-head) == content { running-head = to-string(running-head) }
  //   if running-head.len() > 50 {
  //     panic("Running head must be no more than 50 characters, including spaces and punctuation.")
  //   }
  // }

  show heading: set text(size: font-size)
  show heading: set block(spacing: double-spacing)

  show heading: it => emph(strong[#it.body.])
  show heading.where(level: 1): it => align(center, strong(it.body))
  show heading.where(level: 2): it => par(first-line-indent: 0in, strong(it.body))

  show heading.where(level: 3): it => par(first-line-indent: 0in, emph(strong(it.body)))

  show heading.where(level: 4): it => strong[#it.body.]
  show heading.where(level: 5): it => emph(strong[#it.body.])

  set par(
    first-line-indent: (
      amount: first-indent-length,
      all: true,
    ),
    leading: double-spacing,
  )

  show table.cell: set par(leading: 1em)

  show figure: set block(breakable: true, sticky: false)

  set figure(
    gap: double-spacing,
    placement: auto,
  )

  set figure.caption(separator: parbreak(), position: top)
  show figure.caption: set align(left)
  show figure.caption: set par(first-line-indent: 0em)
  show figure.caption: it => {
    strong[#it.supplement #context it.counter.display(it.numbering)]
    it.separator
    emph(it.body)
  }

  set table(stroke: (x, y) => if y == 0 {
    (
      top: (thickness: 1pt, dash: "solid"),
      bottom: (thickness: 0.5pt, dash: "solid"),
    )
  })

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
    fill: luma(250),
    stroke: (left: 3pt + rgb("#6272a4")),
    inset: (x: 10pt, y: 8pt),
    width: auto,
    breakable: true,
    outset: (y: 7pt),
    radius: (left: 0pt, right: 6pt),
  )

  show raw: set text(
    size: 10pt,
  )

  show raw.where(block: true): set par(leading: 1em)
  show figure.where(kind: raw): set block(breakable: true, sticky: false, width: 100%)

  set math.equation(numbering: "(1)")

  show quote.where(block: true): set block(spacing: double-spacing)

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

  show outline.entry: it => {
    if (
      (
        it.element.supplement == [#context get-terms(language).Appendix]
          or it.element.supplement == [#context get-terms(language).Annex]
          or it.element.supplement == [#context get-terms(language).Addendum]
      )
        and it.element.has("level")
        and it.element.level == 1
    ) {
      link(it.element.location(), it.indented([#it.element.supplement #it.prefix().], it.inner()))
    } else {
      it
    }
  }

  set outline(depth: 3, indent: 2em)

  set bibliography(style: "apa")
  show bibliography: set par(
    first-line-indent: 0in,
    hanging-indent: 0.5in,
  )

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

  body
}
