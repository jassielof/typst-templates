#import "@preview/datify:1.0.1": custom-date-format

#let fonts = (
  size: 12pt,
  title: "TeX Gyre Heros",
  body: "TeX Gyre Termes",
  mono: "TeX Gyre Cursor",
  math: "TeX Gyre Termes Math",
)

#let paragraph = (
  spacing: 2em,
  leading: 1.5em,
)

#let institution-info = (
  university: (
    long: [Universidad Privada de Santa Cruz de la Sierra],
    short: [UPSA],
  ),
  faculty: (
    long: [FAI: Facultad de Ingeniería],
    short: [FAI],
  ),
  location: [Santa Cruz de la Sierra, Bolivia],
)

#let degree-info = (
  program: [Ingeniería de Sistemas],
  level: [Licenciatura],
)

#let author-info = (
  name: [Nombre y apellido(s) del autor],
  id: "YYYYXXXXXX",
  email: "author@estudiantes.upsa.edu.bo",
)

#let advisor-info = (
  name: [Nombre y Apellido/s del Asesor],
)

#let graduation-work-info = (
  title: [El título oficial del documento (máximo recomendado de 15 palabras)],
  subtitle: none,
  abstract: none,
  is-plan: false,
  date: custom-date-format(datetime.today(), lang: "es"),
  keywords: ("UPSA", "Licenciatura", "Proyecto de grado"),
  modality: [Proyecto de grado],
  modality-abbr: [PG],
)
