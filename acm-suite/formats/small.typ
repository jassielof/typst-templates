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
  nonacm: false,
  body,
) = {
  let font-sizes = get-font-size(10pt)
  let leading = .2em
  set document(title: title, keywords: keywords)
  set heading(numbering: "1.1")
  set text(font: "Linux Libertine G", size: font-sizes.normal, top-edge: 1em, bottom-edge: 0em, weight: "regular")
  set par(
    leading: leading,
    spacing: leading,
    justify: true,
    first-line-indent: (
      amount: 1em,
      all: false,
    ),
  )
  set block(spacing: leading)

  show heading: set text(size: font-sizes.normal, font: "Linux Biolinum G")
  show heading.where(depth: 3): set text(style: "italic")
  show heading: set block(above: 1em, below: .3em)

  show std.title: set align(left)

  show std.title: set text(font: "Linux Biolinum G", size: font-sizes.Large)
  show footnote.entry: set text(size: font-sizes.footnote)

  set figure(gap: 1em, supplement: "Fig.")
  // This affects the gap between figure and main content
  set place(clearance: 1em)

  // https://tex.stackexchange.com/a/540068
  show raw: set text(font: "Inconsolata")
  set enum(indent: .25em, body-indent: .25em)
  set list(indent: .25em, body-indent: .25em)
  set footnote.entry(indent: 0em)

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
    height: 10in,
    width: 6.75in,
    header-ascent: 26pt - font-sizes.normal,
    margin: (
      top: 58pt + 26pt,
      bottom: 44pt,
      inside: 46pt,
      outside: 46pt,
    ),
    header: context {
      set text(size: font-sizes.footnote, font: "Linux Biolinum G", weight: "semibold")
      set block(spacing: .2em)

      // the page with the title shouldn't have a header (usually the first one)
      let current-page = here().position().page
      let the-page = if nonacm [#current-page] else [#article:#current-page]
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
    footer: if not nonacm {
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
  if not nonacm {
    thanks(line(length: 100%, stroke: 0.5pt))
    thanks(copyright-notice)
  }

  context {
    set text(size: font-sizes.small)
    set par(spacing: 1em, first-line-indent: 0em)

    // FIXME: edge case when multiple paragraphs inside abstract
    abstract

    parbreak()
    [CCS Concepts: #process-ccs(ccs)]
    parbreak()
    [Additional Key Words and Phrases: #keywords.join(", ")]
    if not nonacm {
      parbreak()
      // TODO: ACM Reference format
      strong[ACM Reference Format:]
      parbreak()
      let the-pages = counter(page).final()
      format-acm-reference(
        authors,
        year,
        title,
        journal,
        volume,
        number,
        article,
        month,
        the-pages,
        doi,
        text.lang,
      )
    }
  }


  body
}
