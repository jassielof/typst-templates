#import "../lib.typ" as acm-suite

#show: acm-suite.manuscript.template.with(
  title: [The Name of the Title Is Hope],
  keywords: ("Do", "Not", "Use", "This", "Code", "Put", "the", "Correct", "Terms", "for", "Your", "Paper"),
  journal: "J. ACM",
  volume: 37,
  copyright: "ACM licensed",
  ccs: xml("assets/ccs.xml"),
  short-authors: [Trovato et al.],
  copyright-year: 2018,
  number: 4,
  authors: (
    (
      name: [Ben Trovato],
      affiliations: ("inst1",),
      email: [trovato\@corporation.com],
      orcid: "1234-5678-9012-1111",
      note: [Both authors contributed equally to this research.],
    ),
    (
      name: [G.K.M. Tobin],
      affiliations: ("inst1",),
      email: [webmaster\@marysville-ohio.com],
      note-mark: 1, // References Ben's note
    ),
    (
      name: [Lars Thørväld],
      affiliations: ("inst2",),
      email: [larst\@affiliation.org],
    ),
    (
      name: [Valerie Béranger],
      affiliations: ("inst3",),
    ),
    (
      name: [Aparna Patel],
      affiliations: ("inst4",),
    ),
    (
      name: [Huifen Chan],
      affiliations: ("inst5",),
    ),
    (
      name: [Charles Palmer],
      affiliations: ("inst6",),
      email: [cpalmer\@prl.com],
    ),
    (
      name: [John Smith],
      affiliations: ("inst2",),
      email: [jsmith\@affiliation.org],
    ),
    (
      name: [Julius P. Kumquat],
      affiliations: ("inst7",),
      email: [jpkumquat\@consortium.net],
    ),
  ),
  affiliations: (
    "inst1": (
      institution: [Institute for Clarity in Documentation],
      city: [Dublin],
      state: [Ohio],
      country: [USA],
    ),
    "inst2": (
      institution: [The Thørväld Group],
      city: [Hekla],
      country: [Iceland],
    ),
    "inst3": (
      institution: [Inria Paris-Rocquencourt],
      city: [Rocquencourt],
      country: [France],
    ),
    "inst4": (
      institution: [Rajiv Gandhi University],
      city: [Doimukh],
      state: [Arunachal Pradesh],
      country: [India],
    ),
    "inst5": (
      institution: [Tsinghua University],
      city: [Haidian Qu],
      state: [Beijing Shi],
      country: [China],
    ),
    "inst6": (
      institution: [Palmer Research Laboratories],
      city: [San Antonio],
      state: [Texas],
      country: [USA],
    ),
    "inst7": (
      institution: [The Kumquat Consortium],
      city: [New York],
      country: [USA],
    ),
  ),
  article: 111,
  month: 8,
  year: 2018,
  abstract: [  A clear and well-documented LaTeX document is presented as an article formatted for publication by ACM in a conference proceedings or journal publication. Based on the ``acmart'' document class, this article presents and explains many of the common variations, as well as many of the formatting elements an author may use in the preparation of the documentation of their work.
  ],
  doi: "XXXXXXX.XXXXXXX",
)

= Introduction
ACM's consolidated article template, introduced in 2017, provides a consistent LaTeX style for use across ACM publications, and incorporates accessibility and metadata-extraction functionality necessary for future Digital Library endeavors. Numerous ACM and SIG-specific LaTeX templates have been examined, and their unique features incorporated into this single new template.

If you are new to publishing with ACM, this document is a valuable guide to the process of preparing your work for publication. If you have published with ACM before, this document provides insight and instruction into more recent changes to the article template.

The "`acmart`" document class can be used to prepare articles for any ACM publication --- conference or journal, and for any stage of publication, from review to final "camera-ready" copy, to the author's own version, with #emph[very] few changes to the source.

= Template Overview

#pagebreak()
= Modifications
#pagebreak()
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
