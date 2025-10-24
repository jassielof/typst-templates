#import "../lib.typ": report
#import "@preview/metalogo:1.2.0": LaTeX, TeX

#let latex-info = (
  title: [Report Template for #LaTeX],
  author: [Author Name],
  date: datetime.today().display("[month repr:long] [day padding:none], [year]"),
)

#show: report.template.with(..latex-info)

#report.title-page(..latex-info)

#report.abstract[
  #lorem(100)

  #lorem(100)
]

#report.table-of-contents()

#report.abstract[
  #lorem(100)

  #lorem(100)
]

= A really long part for testing purposes that should allow me to notice how the Part title behaves in the terms of vertical and horizontal spacing, even longer, so long that will have to fit the whole dummy page, it takes a while to read this, but it is ok, because it is just for testing purposes
= A short part
== Another really long chapter title for testing purposes that should allow me to notice how the Chapter title behaves in the terms of vertical and horizontal spacing, even longer, so long that will have to fit the whole dummy page, it takes a while to read this, but it is ok, because it is just for testing purposes
This is the background chapter. Here, we provide some background information on
the topic of the report.

=== Background Section
This is the background chapter. Here, we provide some background information on
the topic of the report.

== Background
#lorem(120)

#lorem(70)

=== This is the background section. Here, we provide some background information on the topic of the report
#lorem(20)

==== Background Subsection
#lorem(20)

===== Background Subsubsection
This is the background section. Here, we provide some background information on the topic of the report.

=== Background Section
This is the background section. Here, we provide some background information on the topic of the report.

This is the background section. Here, we provide some background information on the topic of the report.

== Figures
=== Tables
#figure(
  table(
    columns: 2,
    table.header([Header 1], [Header 2]),
    [Cell 1], [Cell 2],
  ),
  caption: [Example table 1],
)

#figure(
  table(
    columns: 3,
    table.header([Header 1], [Header 2], [Header 3]),
    [Cell 1], [Cell 2], [Cell 3],
  ),
  caption: [Example table 2],
)

=== Images
#figure(
  square(),
  caption: [Example image 1],
)

#figure(
  rect(),
  caption: [Example image 2],
)

=== Listings
#figure(
  ```python
  def hello_world():
      print("Hello, world!")
  ```,
  caption: [Example listing 1],
)

#figure(
  ```tex
  \documentclass{article}
  \begin{document}
  Hello, World!
  \end{document}
  }
  ```,
  caption: [Example listing 2],
)
== Figures
=== Tables
#figure(
  table(
    columns: 2,
    table.header([Header 1], [Header 2]),
    [Cell 1], [Cell 2],
  ),
  caption: [Example table 1],
)

#figure(
  table(
    columns: 3,
    table.header([Header 1], [Header 2], [Header 3]),
    [Cell 1], [Cell 2], [Cell 3],
  ),
  caption: [Example table 2],
)

=== Images
#figure(
  square(),
  caption: [Example image 1],
)

#figure(
  rect(),
  caption: [Example image 2],
)

=== Listings
#figure(
  ```python
  def hello_world():
      print("Hello, world!")
  ```,
  caption: [Example listing 1],
)

#figure(
  ```tex
  \documentclass{article}
  \begin{document}
  Hello, World!
  \end{document}
  }
  ```,
  caption: [Example listing 2],
)

= Appendices

#show: report.appendix
= This part shouldn't be reset <appendix-part>
#counter(figure.where(outlined: true)).update(0)

Ref @appendix-part

== Figures
=== Tables
#figure(
  table(
    columns: 2,
    table.header([Header 1], [Header 2]),
    [Cell 1], [Cell 2],
  ),
  caption: [Example table 1],
)

#figure(
  table(
    columns: 3,
    table.header([Header 1], [Header 2], [Header 3]),
    [Cell 1], [Cell 2], [Cell 3],
  ),
  caption: [Example table 2],
)

=== Images
#figure(
  square(),
  caption: [Example image 1],
)

#figure(
  rect(),
  caption: [Example image 2],
)

=== Listings
#figure(
  ```python
  def hello_world():
      print("Hello, world!")
  ```,
  caption: [Example listing 1],
)

#figure(
  ```tex
  \documentclass{article}
  \begin{document}
  Hello, World!
  \end{document}
  }
  ```,
  caption: [Example listing 2],
)
== Figures

=== Tables
#figure(
  table(
    columns: 2,
    table.header([Header 1], [Header 2]),
    [Cell 1], [Cell 2],
  ),
  caption: [Example table 1],
)
#figure(
  table(
    columns: 3,
    table.header([Header 1], [Header 2], [Header 3]),
    [Cell 1], [Cell 2], [Cell 3],
  ),
  caption: [Example table 2],
)

=== Images
#figure(
  square(),
  caption: [Example image 1],
)

#figure(
  rect(),
  caption: [Example image 2],
)

=== Listings
#figure(
  ```python
  def hello_world():
      print("Hello, world!")
  ```,
  caption: [Example listing 1],
)

#figure(
  ```tex
  \documentclass{article}
  \begin{document}
    Hello, World!
  \end{document}
  }
  ```,
  caption: [Example listing 2],
)
