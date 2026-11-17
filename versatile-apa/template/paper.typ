// This is the feature guide. For a shorter starting point, open student.typ (Spanish with custom terms) or professional.typ (Spanish with four multilingual abstracts).
// 1. Edit document metadata, authors, and affiliations below.
// 2. Keep course/instructor/due-date for student papers; keep running-head and author-note for professional papers. This guide displays both for reference.
// 3. Keep only the outlines and sample sections you need. When removing appendices, remove appendix-outline(), the final show: appendix, and its include together. Relative library imports are rewritten by the release bundler.

#import "../lib.typ": abstract-page, appendix, appendix-outline, title-page, versatile-apa as apa-style
#import "@preview/orchid:0.2.0": orcid

#set document(
  title: [American Psychological Association (APA) Style Template for Typst],
  keywords: ("APA", "Template", "Typst", "Versatile"),
  description: lorem(200),
)

#show: apa-style.with(
  font-size: 12pt,
  running-head: [APA Style Template for Typst],
)

#title-page(
  // For English titles, use title case. Capitalize My Title supports APA style: https://capitalizemytitle.com/
  // title: [Another Title],

  // Choose the least complex author format that fits your paper: one string/content value, an array of names, an array of author records (shown here), or a dictionary whose values are author records (professional.typ). Student.typ uses document author metadata instead.
  // Each record needs name; affiliations accepts one ID or an array of IDs. IDs must exist in the affiliations dictionary. An unnamed single affiliation cannot resolve explicit IDs. Errors explain missing names, invalid formats, duplicates, and unknown IDs.
  // Without explicit IDs, all authors share the supplied affiliation(s). With explicit mappings, records without IDs remain unassigned; Author Name 2 below demonstrates that case. Superscripts appear only when assignments differ, and unused affiliations are omitted.
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
      affiliations: ("ID-1", "ID-3"),
    ),
  ),
  // Dictionary keys are internal IDs, not printed text. Values are affiliation names as strings or content. A single shared affiliation can instead be given directly as content, as in student.typ.
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
    Author Name~#orcid("0009-0004-4390-7419")

    #lorem(50)
  ],
)

#abstract-page(
  // body: lorem(10),
  // keywords: ("APA", "template", "Typst"),
  // modify-document-metadata: true,
)

// These outlines demonstrate navigation; they are optional for an APA paper.
#outline()
#pagebreak()
#outline(target: figure.where(kind: table), title: [Tables])
#pagebreak()
#outline(target: figure.where(kind: image), title: [Figures])
#pagebreak()
#outline(target: math.equation.where(block: true), title: [Equations])
#pagebreak()
#outline(target: figure.where(kind: raw), title: [Listings])
#pagebreak()
#appendix-outline(title: [Appendices])
#pagebreak()

#include "sections/introduction.typ"

#pagebreak()
#include "sections/lists.typ"

#pagebreak()
#include "sections/quotes.typ"

#pagebreak()
#include "sections/computer-code.typ"

#pagebreak()
#include "sections/math.typ"

// https://apastyle.apa.org/style-grammar-guidelines/paper-format/reference-list
#pagebreak()
#bibliography(
  "bibliography/ref.yml",
  full: true,
  title: [References],
)

#show: appendix

#include "sections/appendix.typ"
