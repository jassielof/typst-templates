#let thanks(body) = {
  footnote(numbering: _ => none, body)
  counter(footnote).update(n => n - 1)
}
