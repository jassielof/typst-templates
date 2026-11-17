// Implicit introduction heading
#context [= #document.title]

#lorem(200)

#pagebreak()
= Section
#lorem(100)

== Subsection
#lorem(100)

=== Subsubsection
#lorem(100)

// For run-in headings, place body text on the next source line without a blank line. This keeps the heading and text in the same paragraph; a blank line starts a separate paragraph.
// The template adds the final period to run-in headings; do not add another period to the heading text.
==== Paragraph (Run-in Heading)
#lorem(100)

===== Subparagraph (Run-in Heading)
#lorem(100)

====== Additional Heading Depth
Headings deeper than level five keep their semantic level but use level-five styling.
