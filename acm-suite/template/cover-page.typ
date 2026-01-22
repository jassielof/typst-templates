
#import "../lib.typ" as acm-suite
#import "@preview/metalogo:1.2.0": LaTeX

#show: acm-suite.cover-page.template.with(
  title: [The Name of the Title Is Hope],
  keywords: ("Do", "Not", "Use", "This", "Code", "Put", "the", "Correct", "Terms", "for", "Your", "Paper"),
  journal: acm-suite.journals.JDS,
  volume: 37,
  copyright: acm-suite.permissions.acm-licensed,
  ccs: xml("assets/ccs.xml"),
  short-authors: [Trovato et al.],
  article: 111,
  doi: "XXXXXXX.XXXXXXX",
  month: 8,
  code-link: "https://github.com/borisveytsman/acmart",
  data-link: "https://zenodo.org/link",
  contributions: [BT and GKMT designed the study; LT, VB, and AP conducted the experiments, BR, HC, CP and JS analyzed the results, JPK developed analytical predictions, all authors participated in writing the manuscript.],
  year: 2018,
  copyright-year: 2018,
  number: 4,
  authors: (
    (
      name: [Ben Trovato],
      affiliations: "inst1",
      email: [trovato\@corporation.com],
      orcid: "1234-5678-9012-0000",
      note: [Both authors contributed equally to this research.],
    ),
    (
      name: [G.K.M. Tobin],
      affiliations: "inst1",
      email: [webmaster\@marysville-ohio.com],
      note-mark: 1, // References Ben's note
    ),
    (
      name: [Lars Thørväld],
      affiliations: "inst2",
      email: [larst\@affiliation.org],
    ),
    (
      name: [Valerie Béranger],
      affiliations: "inst3",
    ),
    (
      name: [Aparna Patel],
      affiliations: "inst4",
    ),
    (
      name: [Huifen Chan],
      affiliations: "inst5",
    ),
    (
      name: [Charles Palmer],
      affiliations: "inst6",
      email: [cpalmer\@prl.com],
    ),
    (
      name: [John Smith],
      affiliations: "inst2",
      email: [jsmith\@affiliation.org],
    ),
    (
      name: [Julius P. Kumquat],
      affiliations: "inst7",
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
  abstract: [A clear and well-documented LaTeX document is presented as an article formatted for publication by ACM in a conference proceedings or journal publication. Based on the ``acmart'' document class, this article presents and explains many of the common variations, as well as many of the formatting elements an author may use in the preparation of the documentation of their work.],
)


= Problem statement
In this document we discuss how to write an ACM article.

= Methods
This document provides LaTeX~templates for the article. We demonstrate
different versions of ACM styles and show various options and commands.
We add extensive documentation for these commands and show examples of
their use.

= Results
We hope the resulting templates and documentation will help the readers
to write submissions for ACM journals and proceedings.

= Significance
This document is important for anybody wanting to comply with the
requirements of ACM publishing.
