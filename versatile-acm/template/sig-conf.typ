#import "../lib.typ": *

#show: versatile-acm.with(
  format: "sig-conf",
  title: [The Name of the Title Is Hope],
  authors: (
    (
      name: "Ben Trovato",
      email: "trovato@corporation.com",
      orcid: "1234-5678-9012",
      affiliations: (0,), // References first affiliation
      notes: (0,), // References first author note
    ),
    (
      name: "G.K.M. Tobin",
      email: "webmaster@marysville-ohio.com",
      affiliations: (0,), // Shares the same affiliation as Trovato
      notes: (0,), // Shares the same note
    ),
    (
      name: "Lars Thørvald",
      email: "larst@affiliation.org",
      affiliations: (1,), // References second affiliation
    ),
    (
      name: "Valerie Béranger",
    ),
    (name: "Aparna Patel"),
    (name: "Huifen Chan"),
    (name: "Charles Palmer", email: "cpalmer@prl.com"),
    (name: "John Smith", email: "jsmith@affiliation.org"),
    (name: "Julius P. Kumquat", email: "jpkumquat@consortium.net"),
  ),
  affiliations: (
    (
      institution: "Institute for Clarity in Documentation",
      city: "Dublin",
      state: "Ohio",
      country: "USA",
    ),
    (
      institution: "The Thørvald Group",
      city: "Hekla",
      country: "Iceland",
    ),
    (
      institution: "Inria Paris-Rocquencourt",
      city: "Rocquencourt",
      country: "France",
    ),
    (
      institution: "Tsinghua University",
      city: "Haidian Qu",
      state: "Beijing Shi",
      country: "China",
    ),
    (
      institution: "Palmer Research Laboratories",
      city: "San Antonio",
      state: "Texas",
      country: "USA",
    ),
    (
      institution: "The Kumquat Consortium",
      city: "New York",
      country: "USA",
    ),
  ),
  author-notes: (
    "Both authors contributed equally to this research.",
  ),
  make-title: true,
)
