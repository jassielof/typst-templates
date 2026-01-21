#import "../lib.typ" as acm-suite
#import "@preview/metalogo:1.2.0": LaTeX, TeX

#show: acm-suite.small.template.with(
  title: [The Name of the Title Is Hope],
  keywords: ("Do", "Not", "Use", "This", "Code", "Put", "the", "Correct", "Terms", "for", "Your", "Paper"),
  journal: acm-suite.journals.JACM,
  volume: 37,
  copyright: acm-suite.permissions.acm-licensed,
  ccs: xml("assets/ccs.xml"),
  short-authors: [Trovato et al.],
  article: 111,
  doi: "XXXXXXX.XXXXXXX",
  month: 8,
  year: 2018,
  copyright-year: 2018,
  number: 4,
  // nonacm: true,
  author-groups: (
    (
      affiliations: "inst1",
      members: (
        (
          name: [Ben Trovato],
          email: "trovato@corporation.com",
          orcid: "0009-0004-4390-7419",
          note: [Both authors contributed equally to this research.],
        ),
        (
          name: [G.K.M. Tobin],
          email: "webmaster@marysville-ohio.com",
          note-mark: 1,
        ),
      ),
    ),
    (
      name: [Lars Thørväld],
      affiliations: "inst2",
      email: "larst@affiliation.org",
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
      email: "cpalmer@prl.com",
    ),
    (
      name: [John Smith],
      affiliations: "inst2",
      email: "jsmith@affiliation.org",
    ),
    (
      name: [Julius P. Kumquat],
      affiliations: "inst7",
      email: "jpkumquat@consortium.net",
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
  abstract: [A clear and well-documented #LaTeX document is presented as an article formatted for publication by ACM in a conference proceedings or journal publication. Based on the "acmart" document class, this article presents and explains many of the common variations, as well as many of the formatting elements an author may use in the preparation of the documentation of their work.],
)

= Introduction
ACM's consolidated article template, introduced in 2017, provides a consistent #LaTeX style for use across ACM publications, and incorporates accessibility and metadata-extraction functionality necessary for future Digital Library endeavors. Numerous ACM and SIG-specific #LaTeX templates have been examined, and their unique features incorporated into this single new template.

If you are new to publishing with ACM, this document is a valuable guide to the process of preparing your work for publication. If you have published with ACM before, this document provides insight and instruction into more recent changes to the article template.

The "`acmart`" document class can be used to prepare articles for any ACM publication --- conference or journal, and for any stage of publication, from review to final "camera-ready" copy, to the author's own version, with _very_ few changes to the source.

= Template Overview
As noted in the introduction, the "`acmart`" document class can be used to prepare many different kinds of documentation --- a double-anonymous initial submission of a full-length technical paper, a two-page SIGGRAPH Emerging Technologies abstract, a "camera-ready" journal article, a SIGCHI Extended Abstract, and more --- all by selecting the appropriate _template style_ and _template parameters_.

This document will explain the major features of the document class. For further information, the _#LaTeX User's Guide_ is available from #link("https://www.acm.org/publications/proceedings-template").

== Template Styles

The primary parameter given to the "`acmart`" document class is the _template style_ which corresponds to the kind of publication or SIG publishing the work. This parameter is enclosed in square brackets and is a part of the `documentclass` command:

`\documentclass[STYLE]{acmart}`

Journals use one of three template styles. All but three ACM journals use the `acmsmall` template style:

- `acmsmall`: The default journal template style.
- `acmlarge`: Used by JOCCH and TAP.
- `acmtog`: Used by TOG.


The majority of conference proceedings documentation will use the `acmconf` template style.

- `sigconf`: The default proceedings template style.
- `sigchi`: Used for SIGCHI conference articles.
- `sigplan`: Used for SIGPLAN conference articles.

== Template parameters

In addition to specifying the _template style_ to be used in
formatting your work, there are a number of _template parameters_
which modify some part of the applied template style. A complete list
of these parameters can be found in the _#LaTeX User's Guide._

Frequently-used parameters, or combinations of parameters, include:
- `anonymous,review`: Suitable for a "double-anonymous" conference submission. Anonymizes the work and includes line numbers. Use with the `\acmSubmissionID` command to print the  submission's unique ID on each page of the work.
- `authorversion`: Produces a version of the work suitable for posting by the author.
- `screen`: Produces colored hyperlinks.

This document uses the following string as the first command in the
source file: `\documentclass[acmsmall,screen,review]{acmart}`


= Modifications

Modifying the template --- including but not limited to: adjusting
margins, typeface sizes, line spacing, paragraph and list definitions,
and the use of the `\vspace` command to manually adjust the
vertical spacing between elements of your work --- is not allowed.

*Your document will be returned to you for revision if modifications are discovered.*

= Typefaces

The "`acmart`" document class requires the use of the
"Libertine" typeface family. Your #TeX installation should include
this set of packages. Please do not substitute other typefaces. The
"`lmodern`" and "`ltimes`" packages should not be used,
as they will override the built-in typeface families.

= Title Information

The title of your work should use capital letters appropriately -
#link("https://capitalizemytitle.com/") has useful rules for
capitalization. Use the `title` command to define the title of
your work. If your work has a subtitle, define it with the
`subtitle` command.  Do not insert line breaks in your title.

If your title is lengthy, you must define a short version to be used
in the page headers, to prevent overlapping text. The `title`
command has a "short title" parameter:

`\title[short title]{full title}`

= Authors and Affiliations

Each author must be defined separately for accurate metadata
identification.  As an exception, multiple authors may share one
affiliation. Authors' names should not be abbreviated; use full first
names wherever possible. Include authors' e-mail addresses whenever
possible.

Grouping authors' names or e-mail addresses, or providing an "e-mail alias," as shown below, is not acceptable:

```
  \author{Brooke Aster, David Mehldau}
  \email{dave,judy,steve@university.edu}
  \email{firstname.lastname@phillips.org}
```

The `authornote` and `authornotemark` commands allow a note
to apply to multiple authors --- for example, if the first two authors
of an article contributed equally to the work.

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
