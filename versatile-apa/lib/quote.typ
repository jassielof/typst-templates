#import "@preview/wordometer:0.1.6": utils as wordometer
#import "constants.typ": quote-block-trigger, quote-unit

/// https://apastyle.apa.org/style-grammar-guidelines/citations/quotations
#let apa-quote(it) = context {
  let stats = wordometer.word-count-of(it.body)
  let unit = quote-unit.get()
  let units = ("words", "characters")
  assert(unit in units, message: "Invalid quote counting unit: " + unit)

  let threshold = quote-block-trigger.get()

  let count = if unit == "words" {
    stats.words
  } else if unit == "characters" {
    stats.characters
  } else {
    panic("Invalid quote counting unit: " + unit)
  }

  let is-block = it.block or count >= threshold

  let attribution = if type(it.attribution) == label {
    cite(it.attribution)
  } else {
    it.attribution
  }

  if is-block {
    block(inset: (left: 0.5in))[
      #set par(first-line-indent: 0pt)
      #it.body
      #if attribution != none {
        h(0.25em)
        attribution
      }
    ]
  } else {
    ["#it.body"]
    if attribution != none {
      h(0.25em)
      attribution
    }
  }
}
