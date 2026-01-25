#import "@preview/datify:1.0.0": custom-date-format
#import "utils/authoring.typ": format-acm-reference, print-acm-authors, print-contact-info
#import "utils/ccs.typ": process-ccs
#import "utils/thanks.typ": thanks
#import "utils/copyright.typ": processed
#import "utils/fonts.typ": get-font-size, math-font, mono, sans, sans-serif, sans-serif-display

#let template(
  title: none,
  copyright: none,
  volume: none,
  journal: none,
  ccs: none,
  number: none,
  article: none,
  month: none,
  author-groups: none,
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
  set document(title: title, keywords: keywords)
  set text(ligatures: false)
  let font-sizes = get-font-size(10pt)
  let leading = 2pt
  let first-line-indent-length = 1em

  set text(
    font: sans-serif,
    size: font-sizes.normal,
    top-edge: 1em,
    bottom-edge: 0em,
    weight: "regular",
    ligatures: false,
  )

  set par(
    leading: leading,
    spacing: leading,
    justify: true,
    linebreaks: "optimized",
    justification-limits: (spacing: (min: 50% + 0pt, max: 150% + 0pt), tracking: (min: 0pt, max: 0pt)),
    first-line-indent: first-line-indent-length,
  )
  set block(spacing: leading)

  // FIXME: Breaks the referencing
  set heading(numbering: "1.1")
  show heading: it => if it.numbering == none { it } else {
    let numbering = counter(heading).display(it.numbering) + h(calc.max(.25em, 1em / it.level))
    block(numbering + it.body)
  }

  show heading: set text(size: font-sizes.normal, font: sans)
  show heading: set block(above: 1em, below: 4pt)

  show heading.where(level: 3).or(heading.where(level: 4)): set text(style: "italic", weight: "regular")
  show heading.where(level: 5): set text(weight: "regular")
  show heading.where(level: 3): set heading(outlined: false)
  show heading.where(level: 4): set heading(numbering: none, outlined: false)
  show heading.where(level: 5): set heading(numbering: none, outlined: false)
  show heading.where(level: 4).or(heading.where(level: 5)): set text(font: sans-serif)
  show heading.where(level: 3): it => box(inset: (
    left: -first-line-indent-length,
  ))[#counter(heading).display() #it.body.]
  //   counter(selector(heading).before(here())).display() + h(font-sizes.normal) + box(it.body) + [.]
  // )
  show heading.where(level: 4): it => box[#it.body.]
  // show heading.where(level: 5): set par(first-line-indent: 0in)
  show heading.where(level: 5): it => box(inset: (left: -first-line-indent-length))[#it.body]

  show std.title: set align(left)

  show std.title: set text(
    font: sans,
    size: font-sizes.Large,
    top-edge: font-sizes.normal,
  )

  show std.title: set block(below: font-sizes.large)

  show footnote.entry: set text(size: font-sizes.footnote)

  set table(
    stroke: (x, y) => (
      top: if y == 0 { 1pt } else if y == 1 { 1pt / 2 } else { 0pt },
      bottom: 1pt,
    ),
  )

  set table(stroke: (_, y) => if y == 0 { (bottom: .5pt) }, row-gutter: (-5pt, -8pt))
  show table: block.with(stroke: (y: 1pt), inset: (top: -3pt))
  set figure(gap: 1.5em, placement: auto)
  show figure.where(kind: image): set figure(supplement: "Fig.")
  show figure.caption: set text(font: sans)
  show figure: set block(spacing: 2em) // for non floating figures
  show figure: set place(clearance: 2em) // for floating figures
  show figure: set figure.caption(separator: ". ")
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set figure(placement: top, supplement: "Table")

  // https://tex.stackexchange.com/a/540068
  show raw: set text(font: "Inconsolata", size: font-sizes.normal)
  show raw.where(block: true): box.with(inset: (y: 0.25em))
  // FIXME: Sublists spacing is broken
  set enum(indent: 1em, body-indent: .35em)
  set list(indent: 2em, body-indent: .35em)
  set footnote.entry(indent: 0em)
  // credits: shampoohere, https://sitandr.github.io/typst-examples-book/book/snippets/math/numbering.html#simple-code
  show math.equation.where(block: true): it => {
    set text(font: "Libertinus Math", fallback: false)
    context text.font
    if it.fields().keys().contains("label") {
      block(math.equation(block: true, numbering: "(1)", it), inset: .4em)
    } else {
      block(it, inset: .4em)
    }
  }


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
    header-ascent: 27pt - font-sizes.normal,
    footer-descent: 20pt - font-sizes.normal, // TODO: finetune
    margin: (
      top: 58pt + 27pt,
      bottom: 44pt + 20pt,
      inside: 46pt,
      outside: 46pt,
    ),
    header: context {
      set text(size: font-sizes.footnote, font: "Linux Biolinum", weight: "regular")
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

  set footnote.entry(indent: 0in, separator: line(length: 13% + 0pt, stroke: 0.5pt))

  std.title()

  // FIXME: author with same address should be one a different line: only join authors with same mark?
  let author-result = print-acm-authors(author-groups, affiliations, "en")
  author-result.authors

  if author-result.notes.len() > 0 {
    thanks[
      // FIXME: The asterisk/mark is smaller and a bit lower in LaTeX
      #for note in author-result.notes {
        [#(note.symbol)#note.text\ ]
      }
    ]
  }
  {
    thanks({
      line(length: 100%, stroke: 0.5pt)
      // FIXME: if multiple authors have same address and author note, then group them together
      par(
        [Authors' Contact Information: #print-contact-info(author-groups, affiliations)],
        leading: .1em,
        first-line-indent: (
          amount: 0pt,
        ),
      )
    })
  }
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
    [CCS Concepts: #process-ccs(ccs).]
    parbreak()
    [Additional Key Words and Phrases: #keywords.join(", ")]
    if not nonacm {
      parbreak()
      strong[ACM Reference Format:]
      parbreak()
      let the-pages = counter(page).final().at(0)
      format-acm-reference(
        author-groups,
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

  show bibliography: set text(size: font-sizes.footnote)
  set bibliography(style: "association-for-computing-machinery", title: "References")

  body
}
