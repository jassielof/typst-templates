#import "languages.typ": get-terms
#import "authoring.typ": print-affiliations, print-authors
#import "constants.typ": double-spacing, first-indent-length

#let title-page(
  authors: none,
  affiliations: none,
  course: none,
  instructor: none,
  due-date: none,
  author-notes: none,
) = context {
  set align(center)
  for i in range(4) {
    [~] + parbreak()
  }

  std.title()

  [~]

  parbreak()

  print-authors(authors, affiliations, text.lang)

  print-affiliations(authors, affiliations)

  course
  parbreak()
  instructor
  parbreak()
  due-date

  if author-notes == none {
    pagebreak()
    return
  }

  v(1fr)

  strong(context get-terms(text.lang).at("Author Note"))
  set align(left)
  set par(first-line-indent: first-indent-length)
  author-notes

  pagebreak()
}
