#import "@preview/datify:1.0.0": custom-date-format
#import "utils/authoring.typ": print-acm-authors, print-contact-info
#import "utils/ccs.typ": process-ccs
#import "utils/thanks.typ": thanks

#let template(
  title: none,
  volume: none,
  journal: none,
  ccs: none,
  number: none,
  article: none,
  month: none,
  authors: none,
  affiliations: none,
  year: none,
  doi: none,
  copyright: none,
  copyright-year: none,
  keywords: none,
  abstract: none,
  short-authors: none,
  body,
) = {
  set document(title: title, keywords: keywords)
  set heading(numbering: "1.1")
  show std.title: set align(left)
  show std.title: set text(font: "Libertinus Sans")
  set text(font: "Libertinus Serif")


  set page(
    header: context {
      // the page with the title shouldn't have a header (usually the first one)
      let current-page = here().position().page
      let the-page = [#article:#current-page]

      if current-page == 1 {
        return
      } else if calc.even(current-page) {
        the-page
        h(1fr)
        short-authors
      } else {
        title
        h(1fr)
        the-page
      }
    },
    footer: context {
      let current-page = here().position().page
      let the-date = datetime(year: year, month: month, day: 1)
      let the-footer = [#journal, Vol. #volume, No. #number, Article #article. Publication date: #custom-date-format(the-date).]

      if calc.odd(current-page) {
        set align(right)
        the-footer
      } else {
        set align(left)
        the-footer
      }
    },
  )

  set footnote.entry(indent: 0in)

  std.title()

  let author-result = print-acm-authors(authors, affiliations, "en")
  author-result.authors

  if author-result.notes.len() > 0 {
    thanks[
      #for note in author-result.notes {
        [#super[#note.id] #note.text\ ]
      }
    ]
  }
  thanks(line(length: 100%, stroke: 0.5pt))
  thanks[
    Authors' Contact Information: #print-contact-info(authors, affiliations)
  ]
  thanks(line(length: 100%, stroke: 0.5pt))
  thanks[Permission to...]

  abstract
  parbreak()
  [CCS Concepts: • #process-ccs(ccs)]
  parbreak()
  [Additional Key Words and Phrases: #keywords.join(", ")]


  body
}
