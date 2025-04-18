#import "../lib.typ": *

#show: versatile-acm.with(
  format: "sig-conf",
  title: [The Name of the Title Is Hope],
  authors: (
    (
      name: "Ben Trovato",
      email: "trovato@corporation.com",
      orcid: "1234-5678-9012",
      affiliations: (0,),
      notes: (0,),
    ),
    (
      name: "G.K.M. Tobin",
      email: "webmaster@marysville-ohio.com",
      affiliations: (0,),
      notes: (0,),
    ),
    (
      name: "Lars Thørvald",
      email: "larst@affiliation.org",
      affiliations: (1,),
    ),
    (
      name: "Valerie Béranger",
      affiliations: (2,),
    ),
    (name: "Aparna Patel", affiliations: (3,)),
    (name: "Huifen Chan", affiliations: (4,)),
    (name: "Charles Palmer", email: "cpalmer@prl.com", affiliations: (5,)),
    (name: "John Smith", email: "jsmith@affiliation.org", affiliations: (1,)),
    (name: "Julius P. Kumquat", email: "jpkumquat@consortium.net", affiliations: (6,)),
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
      institution: "Rajiv Gandhi University",
      city: "Doimukh",
      state: "Arunachal Pradesh",
      country: "India",
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
