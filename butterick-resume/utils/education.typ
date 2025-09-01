#let education(institution: none, period: none, details: none) = {
  v(0.2em)
  text(size: 1.4em)[
    #institution #h(1fr) #period
  ]
  v(-1em)
  details
  v(-0.5em)
}
