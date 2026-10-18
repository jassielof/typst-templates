#import "languages.typ": get-terms
#import "authoring.typ": print-affiliations, print-authors
#import "constants.typ": apa-strict, double-spacing, first-indent-length, title-page-spacing
#import "strict.typ": check-page-setup, check-title-page
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
  set document(
    author: if type(authors) == array and authors.len() > 0 and type(authors.at(0)) == dictionary {
      authors.map(it => to-string[#it.name]).join(", ")
    } else if type(authors) == array {
      authors.map(it => to-string[#it]).join(", ")
    } else {
      to-string[#authors].trim()
    },
  ) if authors != none
  set document(
    title: title,
  ) if title != none

  // Without `authors`, show the names from the user's own `set document(author: ...)`.
  let authors = if authors == none and document.author.len() > 0 { document.author } else { authors }

  let mode = apa-strict.get()
  check-page-setup(mode)
  check-title-page(mode, title, authors, affiliations, author-note)

  v(title-page-spacing.get())
  std.title()

  v(2em)

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

  strong(context get-terms(text.lang, text.script).at("Author Note"))
  set align(left)
  set par(first-line-indent: first-indent-length)
  author-note

  pagebreak(weak: true)
}
