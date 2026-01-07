#import "../lib.typ": title-page, versatile-apa
#import "@preview/orchid:0.1.0": generate-link as orchid-link, logo-icon as orchid-logo

#show: versatile-apa.with(
  running-head: [compulsive texting and academic functioning],
)

#set text(font: "Source Sans 3")

// Example from https://apastyle.apa.org/style-grammar-guidelines/paper-format/title-page
#title-page(
  title: [The Role of Compulsive Texting in Adolescents's Academic Functioning],
  authors: (
    (name: [Kelly M. Lister-Landman], affiliations: "DoP:CHC"),
    (name: [Sarah E. Domoff], affiliations: "CHGD:UM"),
    (name: [Eric F. Dubow], affiliations: ("DoP:BGSU", "ISR:UM")),
  ),
  affiliations: (
    "DoP:CHC": [Department of Psychology, Chestnut Hill College],
    "CHGD:UM": [Center for Human Growth and Development, University of Michigan],
    "DoP:BGSU": [Department of Psychology, Bowling Green State University],
    "ISR:UM": [Institute for Social Research, University of Michigan],
  ),
  author-note: [
    #show link: set underline(stroke: 0pt)
    #show link: set text(fill: black)
    Sarah E. Domoff #orchid-logo() #orchid-link("0000-0001-6011-8738", format: "full")

    Eric F. Dubow #orchid-logo() #orchid-link("0000-0002-2718-2268", format: "full")

    Kelly M. Lister-Landman is now at the Business, Computing, and Social Sciences Division, Department of Psychology, Delaware County Community College.

    We have no known conflict of interest to disclose.

    Correspondence concerning this article should be addressed to Kelly M. Lister-Landman, Delaware County Community College, 901 South Media Line Road, Media, PA 19063, United States. Email: #link("mailto:kmlandman@institution.edu")
  ],
)
