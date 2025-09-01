#let experience(role: none, period: none, details: none, business: none) = {
  v(0.2em)
  text(size: 1.4em)[#business #h(1fr) #period]
  v(-1em)
  text(size: 1.125em, style: "italic", role)
  v(-0.5em)
  details
  v(-0.5em)
}
