#import "../lib.typ": *
#import "@preview/metalogo:1.2.0": TeX, LaTeX

#let latex-info = (
  title: [Report Template for #LaTeX],
  author: [Author Name],
  date: datetime.today().display("[month repr:long] [day padding:none], [year]"),
)

#show: report.with(..latex-info)

#title-page(..latex-info)

#abstract[
  This is an example of an extended report using the `report` class in LaTeX. It showcases many built-in features of the class.
]

#table-of-contents()

#abstract[
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim
  aeque doleamus animo, cum corpore dolemus, fieri tamen permagna accessio
  potest, si aliquod aeternum et infinitum impendere malum nobis opinemur.
  Quod idem licet transferre in voluptatem, ut postea variari voluptas distinguique
  possit, augeri amplificarique non possit. At etiam Athenis, ut e patre audiebam
  facete et urbane Stoicos irridente, statua est in quo a nobis philosophia defensa
  et collaudata est, cum id, quod maxime placeat, facere possimus, omnis voluptas
  assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et.

]

= First Part
== Introduction
This is the background chapter. Here, we provide some background information on
the topic of the report.

This is the background chapter. Here, we provide some background information on
the topic of the report.

=== Background Section
This is the background chapter. Here, we provide some background information on
the topic of the report.


