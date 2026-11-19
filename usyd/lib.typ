
#let appendix(body) = {}

#let school-state = state("school", none)
#let faculty-state = state("faculty", none)
#let submission-year-state = state("submission-year", none)
#let creative-component-state = state("creative-component", none)
#let academic-degree-state = state("academic-degree", none)

#let submission-statement() = context {
  let statement = [A thesis submitted ]

  statement += if creative-component-state.get() [as partial fulfilment of] else [to fulfil]

  statement += [ the requirements of the degree of #academic-degree-state.get()]

  return statement
}

#let title-page() = context {
  set align(center)
  set page(
    paper: "a4",
    margin: 4cm,
  )

  set text(
    size: 14pt,
    font: "Reforma 2018",
    stylistic-set: (1,),
    discretionary-ligatures: true,
    number-type: "lining",
    number-width: "tabular",
  )
  show title: set text(size: 1.5em)

  title()

  v(1fr)

  document.author.join(", ", last: " and ")

  v(1fr)

  // In the meantime, the logo used is extracted from Wikipedia (https://en.wikipedia.org/wiki/File:The_University_of_Sydney_Logo.svg; using the default size).
  image("assets/images/The_University_of_Sydney_Logo.svg", width: 50%)

  v(1fr)

  submission-statement()

  v(1fr)

  school-state.get()

  if faculty-state.get() != none {
    v(0.75em)
    faculty-state.get()
  }

  v(1fr)

  [The University of Sydney]
  v(0.75em)
  [Australia]

  v(1fr)

  [#submission-year-state.get()]
}


#let template(
  thesis-title: none,
  author-name: none,
  academic-degree: none,
  school: none,
  faculty: none,
  submission-year: none,
  funding-type: none,
  with-creative-componet: false,
  body,
) = {
  set document(
    title: thesis-title,
    author: author-name,
  )

  school-state.update(school)
  faculty-state.update(faculty)
  submission-year-state.update(submission-year)
  academic-degree-state.update(academic-degree)
  creative-component-state.update(with-creative-componet)

  title-page()

  body
}
