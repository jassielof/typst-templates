#import "../report.typ": *

#show: report.with(
  title: [Report Template for Typst],
  author: [Author Name],
  make-title: true,
)

#table-of-contents()

#abstract(lorem(100))

#for h in range(1, 5) [
  = Part #h
  #lorem(100)

  #lorem(100)
]
#for s in range(1, 5) [
  == Chapter #s
  #lorem(100)
]


#for h in range(1, 7) [
  #heading(level: 2)[Section #h]
  #lorem(100)

  #lorem(100)

  #heading(level: 3)[Subsection #h]
  #lorem(100)

  #lorem(100)

  #heading(level: 4)[Subsubsection #h]
  #lorem(100)

  #lorem(100)

  #heading(level: 5)[Paragraph #h]
  #lorem(100)

  #lorem(100)

]

// === History
// A brief history of the topic.

// ==== Early Developments
// Details about early developments.


