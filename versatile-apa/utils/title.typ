#import "languages.typ": get-terms
#import "authoring.typ": print-affiliations, print-authors
#import "constants.typ": double-spacing, first-indent-length
#import "authoring.typ": validate-inputs
#import "to-string.typ": to-string

#let title-page(
  title: none,
  custom-authors: none,
  custom-affiliations: none,
  authors: none,
  affiliations: none,
  course: none,
  instructor: none,
  due-date: none,
  author-note: none,
) = context {
  let the-authors = validate-inputs(authors, custom-authors, "author")
  let the-affiliations = validate-inputs(affiliations, custom-affiliations, "affiliation")

  set document(
    author: if type(the-authors) == array {
      the-authors.map(it => to-string(it.name))
    } else {
      to-string[#the-authors].trim()
    },
  ) if the-authors != none
  set document(
    title: title,
  ) if title != none

  for i in range(4) {
    [~] + parbreak()
  }

  std.title()

  [~]

  parbreak()

  set align(center)
  print-authors(the-authors, the-affiliations, text.lang)
  parbreak()
  print-affiliations(the-authors, the-affiliations)
  parbreak()
  course
  parbreak()
  instructor
  parbreak()
  due-date

  if author-note == none {
    pagebreak()
    return
  }

  v(1fr)

  strong(context get-terms(text.lang).at("Author Note"))
  set align(left)
  set par(first-line-indent: first-indent-length)
  author-note

  pagebreak()
}
