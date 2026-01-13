#import "@preview/datify:1.0.0": custom-date-format
#import "utils/authoring.typ": format-acm-reference, print-acm-authors, print-contact-info
#import "utils/ccs.typ": process-ccs
#import "utils/thanks.typ": thanks
#import "utils/copyright.typ": processed
#import "utils/fonts.typ": get-font-size

#let template(
  title: none,
  copyright: none,
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
  copyright-year: none,
  keywords: none,
  abstract: none,
  short-authors: none,
  no-acm: false,
  body,
) = {
  set document(title: title, keywords: keywords)
  set heading(numbering: "1.1")
  show std.title: set align(left)

  let font-sizes = get-font-size(10pt)
  show std.title: set text(font: "Libertinus Sans", size: font-sizes.LARGE)
  set text(font: "Libertinus Serif", size: font-sizes.normal)
  show footnote.entry: set text(size: font-sizes.footnote)
  set par(justify: true)

  let copyright-notice = processed(
    copyright: copyright,
    year: copyright-year,
    journal: journal,
    volume: volume,
    number: number,
    article: article,
    month: month,
    doi: doi,
  )

  set page(
    header: context {
      // the page with the title shouldn't have a header (usually the first one)
      let current-page = here().position().page
      let the-page = if no-acm [#current-page] else [#article:#current-page]
      set grid(inset: 0in, columns: (1fr, auto))
      show grid: set block(spacing: 0in, inset: 0in, outset: 0in)

      if current-page == 1 {
        return
      } else if calc.even(current-page) {
        grid(
          the-page,
          short-authors,
        )
      } else {
        grid(
          title,
          the-page,
        )
      }
    },
    footer: if not no-acm {
      context {
        let current-page = here().position().page
        let the-date = datetime(year: year, month: month, day: 1)
        let the-footer = text(
          size: font-sizes.footnote,
        )[#journal, Vol. #volume, No. #number, Article #article. Publication date: #custom-date-format(the-date).]

        if calc.odd(current-page) {
          set align(right)
          the-footer
        } else {
          set align(left)
          the-footer
        }
      }
    } else { none },
  )

  set footnote.entry(indent: 0in)

  std.title()

  let author-result = print-acm-authors(authors, affiliations, "en")
  author-result.authors

  if author-result.notes.len() > 0 {
    thanks[
      #for note in author-result.notes {
        [#note.symbol~#note.text\ ]
      }
    ]
  }

  thanks(line(length: 100%, stroke: 0.5pt))
  thanks[Authors' Contact Information: #print-contact-info(authors, affiliations)]
  if not no-acm {
    thanks(line(length: 100%, stroke: 0.5pt))
    thanks(copyright-notice)
  }

  context {
    set text(size: font-sizes.small)
    parbreak()
    abstract
    parbreak()
    [CCS Concepts: • #process-ccs(ccs)]
    parbreak()
    [Additional Key Words and Phrases: #keywords.join(", ")]
    parbreak()
    // TODO: ACM Reference format
    strong[ACM Reference Format:]
    parbreak()
    let the-pages = 11
    format-acm-reference(
      authors,
      year,
      title,
      journal,
      volume,
      number,
      article,
      month,
      the-pages, // You'll need to add this parameter
      doi,
      text.lang,
    )
  }

  body
}
