#import "@preview/datify:1.0.0": custom-date-format
#import "utils/authoring.typ": print-acm-authors, print-contact-info
#import "utils/ccs.typ": process-ccs
#import "utils/thanks.typ": thanks
#import "utils/copyright.typ": processed
#import "utils/journals.typ": get-journal

#let review-color = cmyk(0%, 42%, 100%, 1%)
#let document-background-color = review-color.lighten(90%)

#let template(
  title: none,
  copyright: none,
  volume: none,
  journal: none,
  code-link: none,
  data-link: none,
  contributions: none,
  ccs: none,
  number: none,
  article: none,
  month: none,
  authors: none,
  affiliations: none,
  year: none,
  doi: none,
  copyright-year: none,
  keywords: none,
  abstract: none,
  short-authors: none,
  body,
) = {
  set document(title: title, keywords: keywords)
  show std.title: set align(left)
  show std.title: set text(font: "Libertinus Sans")
  show heading: set text(font: "Libertinus Sans")
  set text(font: "Libertinus Serif", size: 9pt)

  set page(
    margin: (x: 6.75in, y: 10in),
    footer: context {
      let the-date = datetime(year: year, month: month, day: 1)
      let the-journal = get-journal(journal)
      let the-footer = [#the-journal.name, Volume #volume, Issue #number, Article #article (#custom-date-format(the-date, pattern: "MMMM yyyy"))]
      set align(right)
      line(length: 100%, stroke: 0.5pt)
      the-footer += linebreak()
      the-footer += link("https://doi.org/" + doi)
      the-footer
    },
  )

  set footnote.entry(indent: 0in)
  let author-result = print-acm-authors(authors, affiliations, "en")

  place(dx: -1in, dy: 50%)[
    #set text(fill: white)
    #rotate(-90deg)[#block(fill: review-color, inset: 1cm, width: auto)[Review Article]]
  ]

  grid(
    columns: (1fr, 5cm),
    {}, image("../assets/images/acm-jdslogo.png", width: 100%),
    {
      std.title()

      author-result.authors


      block(body, fill: document-background-color)
    },
    {
      set text(size: 9pt)
      [Code and data links: #link(code-link) #link(data-link)]
      parbreak()
      [Keywords: #keywords.join(", ")]
      parbreak()
      contributions
      parbreak()
      print-contact-info(authors, affiliations)
    },
  )
}
