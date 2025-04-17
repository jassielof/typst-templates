#import "../lib.typ": *

#show: versatile-acm.with(
  title: (full: [The Name of the Title Is Hope]),
  review: true,
  screen: true,
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

= Introduction
ACM's consolidated article template, introduced in 2017, provides a consistent LaTeX~style for use across ACM publications, and incorporates accessibility and metadata-extraction functionality necessary for future Digital Library endeavors. Numerous ACM and SIG-specific LaTeX~templates have been examined, and their unique features incorporated into this single new template.

If you are new to publishing with ACM, this document is a valuable guide to the process of preparing your work for publication. If you have published with ACM before, this document provides insight and instruction into more recent changes to the article template.

The "`acmart`" document class can be used to prepare articles for any ACM publication --- conference or journal, and for any stage of publication, from review to final "camera-ready" copy, to the author's own version, with #emph[very] few changes to the source.

= Template Overview
= Modifications
= Typefaces
= Title Information
= Authors and Affiliations
= Rights Information
= CCS Concepts and User-Defined Keywords
= Sectioning Commands
= Tables
= Math Equations
= Figures
= Citations and Bibliographies
= Acknowledgments
= Appendices
= Multi-language papers
= SIGCHI Extended Abstracts
= Research Methods
= Online Resources
