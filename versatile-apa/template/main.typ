#import "../lib.typ": *
#import "@preview/orchid:0.1.0"

#set page(paper: "a4")

#show: versatile-apa.with(
  // Document titles should be formatted in title case (https://capitalizemytitle.com/)
  title: [American Psychological Association (APA) Style Template for Typst],

  // authors with different affiliations
  // authors: (
  //   (
  //     name: [Author Name 1],
  //     affiliations: ("AF-1", "AF-2"),
  //   ),
  //   (
  //     name: [Author Name 2],
  //     affiliations: ("AF-3",),
  //   ),
  //   (
  //     name: [Author Name 3],
  //     affiliations: ("AF-4", "AF-5", "AF-6"),
  //   ),
  // ),
  // affiliations: (
  //   (
  //     id: "AF-1",
  //     name: [Affiliation Department 1],
  //   ),
  //   (
  //     id: "AF-2",
  //     name: [Affiliation Department 2],
  //   ),
  //   (
  //     id: "AF-3",
  //     name: [Affiliation Department 3],
  //   ),
  //   (
  //     id: "AF-4",
  //     name: [Affiliation Department 4],
  //   ),
  //   (
  //     id: "AF-5",
  //     name: [Affiliation Department 5],
  //   ),
  //   (
  //     id: "AF-6",
  //     name: [Affiliation Department 6],
  //   )
  // ),

  // authors with shared affiliations
  authors: (
    (
      name: [Author Name 1],
      affiliations: ("AF-1", "AF-2", "AF-3"),
    ),
    (
      name: [Author Name 3],
      affiliations: ("AF-1", "AF-2", "AF-3"),
    ),
  ),
  affiliations: (
    (
      id: "AF-1",
      name: [Affiliation Department 1],
    ),
    (
      id: "AF-2",
      name: [Affiliation Department 2],
    ),
    (
      id: "AF-3",
      name: [Affiliation Department 3],
    ),
  ),

  // custom-authors: [Author Name],
  // custom-affiliations: [Affiliation Department, Affiliation Name],

  // Student-specific fields
  course: [Course Code: Course Name],
  instructor: [Instructor Name],
  // At the moment only supports English
  due-date: datetime.today().display(),

  // Professional-specific fields
  running-head: [running head],
  author-notes: [
    Author Name~#orchid.logo-icon()~#orchid.generate-link("0000-0000-0000-0000", format: "full")

    #lorem(50)
  ],

  // Common fields
  font-family: "Libertinus Serif",
  font-size: 12pt,
  region: "us",
  language: "en",
  paper-size: "us-letter",
  implicit-introduction-heading: false,
  abstract-as-description: true,
)

#abstract-page(lorem(100), keywords: ("APA", "template", "Typst"))

#outline()
#pagebreak()
#outline(target: figure.where(kind: table), title: [Tables])
#pagebreak()
#outline(target: figure.where(kind: image), title: [Figures])
#pagebreak()
#outline(target: figure.where(kind: math.equation), title: [Equations])
#pagebreak()
#outline(target: figure.where(kind: raw), title: [Listings])
#pagebreak()

#title() // Implicit introduction heading level 1, remove if implicit-introduction-heading is true
// = American Psychological Association (APA) Style Template for Typst
#include "sections/introduction.typ"

#pagebreak()
#include "sections/lists.typ"

#pagebreak()
#include "sections/quotes.typ"

#pagebreak()
#include "sections/computer-code.typ"

#pagebreak()
#include "sections/math.typ"

#pagebreak()
#bibliography(
  "bibliography/ref.yml",
  style: "csl/apa.csl",
  full: true,
  title: auto,
)

#show: appendix

#include "sections/appendix.typ"
