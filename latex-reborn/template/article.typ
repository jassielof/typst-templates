#import "../lib.typ": article

#show: (
  article.template.with(
    title: [LaTeX Standard/Base Class/Template for Typst and Authoring],
    paper-size: "a4",
    author: [Author Name],
    make-title: true,
  )
)

#article.table-of-contents()
#pagebreak()

#for s in range(1, 6) [
  = Section #s
  #lorem(110)
]

#for s in range(1, 6) [
  == Subsection #s
  #lorem(110)
]

#for s in range(1, 6) [
  === Subsubsection #s
  #lorem(110)

  #lorem(50)
]

#for s in range(1, 6) [
  ==== Paragraph #s
  #lorem(110)

]

#for s in range(1, 6) [
  ===== Subparagraph #s
  #lorem(110)

  #lorem(50)

]

#pagebreak()
== Sub Final
#lorem(115)

== Final
#lorem(115)

#lorem(115)

