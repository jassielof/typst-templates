#import "languages.typ": get-terms
#import "authorship.typ": print-affiliations, print-authors, normalize-authorship
#import "constants.typ": double-spacing, first-indent-length, title-page-spacing
#import "to-string.typ": to-string

#let title-page(
  title: none,
  authors: none,
  affiliations: none,
  course: none,
  instructor: none,
  due-date: none,
  author-note: none,
) = context {
  let visible-authors = if authors == none and document.author.len() > 0 { document.author } else { authors }
  let authorship = normalize-authorship(visible-authors, affiliations)
  set document(author: authorship.authors.map(author => to-string[#author.name])) if authors != none
  set document(
    title: title,
  ) if title != none

  // Without `authors`, show the names from the user's own `set document(author: ...)`.
  let authors = visible-authors

  std.title()

  set align(center)
  print-authors(authors, affiliations, text.lang, text.script)
  parbreak()
  print-affiliations(authors, affiliations)
  parbreak()
  course
  parbreak()
  instructor
  parbreak()
  due-date

  if author-note == none {
    pagebreak(weak: true)
    return
  }

  v(1fr)

  strong(get-terms(text.lang, text.script).at("Author Note"))
  set align(left)
  set par(first-line-indent: first-indent-length)
  author-note

  pagebreak(weak: true)
}
