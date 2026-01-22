#let description(dict: (:)) = par({
  for (k, v) in dict.pairs() {
    h(2em) + [#text(raw(k), weight: "bold"): #v]
    linebreak()
  }
}, first-line-indent: (amount: 0pt, all: false))
