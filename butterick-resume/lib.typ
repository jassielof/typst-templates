#import "@preview/fontawesome:0.6.0": *
#import "utils/education.typ": *
#import "utils/experience.typ": *
#import "utils/project.typ": *

#let butterick(
  title: none,
  subtitle: none,
  locale: (
    language: "en",
    region: "us",
  ),
  typography: (
    headings: (
      font: "IBM Plex Sans",
    ),
    body: (
      font: "IBM Plex Serif",
      size: 9pt,
    ),
  ),
  style: (paper-size: "a4", margin: 1.25in),
  body,
) = {
  set page(
    paper: style.paper-size,
    margin: 1.5in,
  )

  set text(
    font: typography.body.font,
    lang: locale.language,
    region: locale.region,
    size: typography.body.size,
  )

  set par(
    spacing: 1.5em,
    leading: 1em,
  )

  show heading: set text(font: typography.headings.font)
  show heading: smallcaps

  set list(
    body-indent: 1.5em,
  )

  set enum(
    body-indent: 1em,
  )

  show heading.where(level: 1): set text(size: typography.body.size + 0.3em, tracking: 0.05em)
  show heading.where(level: 1): set block(below: 1em, above: 1em)
  show heading.where(level: 1): it => {
    v(1em)
    line(length: 100%, stroke: 0.5pt)
    v(-0.55em)
    text(size: 0.8em, it)
  }

  {
    set align(center)
    set par(justify: true, spacing: 1em)
    show text: upper
    set text(font: typography.headings.font, tracking: 0.1em, hyphenate: false)

    text(size: 2em, weight: "regular", title)

    v(-0.5em)

    subtitle
  }

  body
}
