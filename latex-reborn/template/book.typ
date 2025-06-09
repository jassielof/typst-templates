#import "../lib.typ": *
#import "@preview/metalogo:1.2.0": TeX, LaTeX

#let latex-info = (
  title: [Report Template for #LaTeX],
  author: [Author Name],
  date: datetime.today().display("[month repr:long] [day padding:none], [year]"),
)

#show: book.with(..latex-info)

