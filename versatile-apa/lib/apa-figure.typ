#import "languages.typ": *
#import "to-string.typ": *

#let apa-figure-numbering(n) = {
  let header-counter = counter(heading).get().first()
  let queried-heading = query(selector(heading.where(level: 1)).before(here())).last().numbering
  if queried-heading == none {
    queried-heading = "A"
  }
  // An unnumbered single appendix still uses A for its figure and table prefix.
  numbering(queried-heading + "1", calc.max(1, header-counter), n)
}

#let apa-figure(
  body,
  ..args,
  note: none,
  specific-note: none,
  probability-note: none,
) = {
  figure(
    [
      #set par(first-line-indent: 0em)
      #body
      #set align(left)
      #if note != none [
        #context emph[#get-terms(text.lang, text.script).Note.]
        #note
      ]
      #parbreak()
      #specific-note
      #parbreak()
      #probability-note
    ],
    ..args,
  )
}

// Keep all header rows in one repeatable group so row spans cross rows.
#let apa-table(
  headers: none,
  header-separator: 0.5pt,
  footers: none,
  ..args,
) = {
  let header-groups = ()
  if headers != none and headers.len() > 0 {
    assert(type(headers) == array, message: "headers must be an array")
    let multi-row = type(headers.first()) == array
    let rows = if multi-row { headers } else { (headers,) }
    let cells = ()
    for (index, row) in rows.enumerate() {
      assert(type(row) == array, message: "Each header row must be an array")
      cells += row
      if index < rows.len() - 1 and header-separator != none {
        cells.push(table.hline(y: index + 1, stroke: header-separator))
      }
    }
    header-groups.push(table.header(
      table.hline(stroke: 1pt),
      ..cells,
      table.hline(y: if multi-row { rows.len() } else { auto }, stroke: 1pt),
    ))
  }

  table(
    stroke: 0pt,
    ..args.named(),
    ..if header-groups.len() == 0 { (table.hline(stroke: 1pt),) } else { () },
    ..header-groups,
    ..args.pos(),
    ..if footers != none and footers.len() > 0 {
      (table.hline(stroke: 1pt), table.footer(..footers, table.hline(stroke: 1pt)))
    } else {
      (table.hline(stroke: 1pt),)
    },
  )
}
