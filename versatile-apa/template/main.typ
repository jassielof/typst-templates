#import "../lib.typ": *
#import "@preview/orchid:0.1.0"

#set document(
  title: [American Psychological Association (APA) Style Template for Typst],
  keywords: ("APA", "Template", "Typst", "Versatile"),
  description: lorem(200),
)

#show: versatile-apa.with(
  // Common fields
  font-family: "Libertinus Serif",
  font-size: 12pt,
  region: "us",
  language: "en",
  paper-size: "us-letter",
  running-head: [APA Style Template for Typst],
)

#title-page(
  // Document titles should be formatted in title case (https://capitalizemytitle.com/)
  // title: [Another title],

  authors: (
    (
      name: [Author Name],
      affiliations: (
        "ID-1",
        "ID-2",
      ),
    ),
    (
      name: [Author Name 2],
    ),
    (
      name: [Author Name 3],
      affiliations: "ID-4",
    ),
    (
      name: [Author Name 4],
      affiliations: ("ID-1", "ID-3", "ID-4"),
    ),
  ),
  affiliations: (
    "ID-1": [Affiliation Name 1],
    "ID-2": [Affiliation Name 2],
    "ID-3": [Affiliation Name 3],
    "ID-4": [Affiliation Name 4],
  ),

  // Student-specific fields
  course: [Course Code: Course Name],
  instructor: [Instructor Name],
  due-date: datetime.today().display(),

  // Professional-specific fields
  author-note: [
    Author Name~#orchid.logo-icon()~#orchid.generate-link("0000-0000-0000-0000", format: "full")

    #lorem(50)
  ],
)

#abstract-page(
  lorem(100),
  // keywords: ("APA", "template", "Typst"),
)

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
#appendix-outline()

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

#show: appendix.with(supplement: "Addendum")

#include "sections/appendix.typ"
