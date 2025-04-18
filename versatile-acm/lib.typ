#let acm-formats = (
  "manuscript",
  "small",
  "large",
  "tog",
  "sig-conf",
  "plan",
  "engage",
  "cover-page",
)

#let font-sizes = (
  vpt: 5pt,
  vipt: 6pt,
  viipt: 7pt,
  viiipt: 8pt,
  ixpt: 9pt,
  xpt: 10pt,
  xipt: 10.95pt,
  xiipt: 12pt,
  xivpt: 14.4pt,
  xviipt: 17.28pt,
  xxpt: 20.74pt,
  xxvpt: 24.88pt,
)

#let font-9pt = (
  margin: (
    left: 1in + 62pt,
    right: 100% - 1in - 62pt - 345pt,
    top: 1in + 16pt + 12pt + 25pt,
    bottom: 100% - 1in - 16pt - 12pt - 25pt - 550pt,
  ),
  tiny: font-sizes.vpt,
  scriptsize: font-sizes.vipt,
  footnotesize: font-sizes.viipt,
  small: font-sizes.viiipt,
  normalsize: font-sizes.ixpt,
  large: font-sizes.xpt,
  Large: font-sizes.xipt,
  LARGE: font-sizes.xiipt,
  huge: font-sizes.xivpt,
  Huge: font-sizes.xviipt,
)


#let versatile-acm(
  // Authoring
  // TODO: Support two types of title: title: [] as full title, and title: (short: none, full: []) as full title with short title
  title: [],
  subtitle: none,
  authors: (),
  author-notes: (),
  affiliations: (),
  journal: [],
  conference: (
    short: [],
    name: [],
    date: [],
    venue: [],
  ),
  book: [],
  editor: [],
  format: "manuscript",
  teaser-figure: none,
  // Boolean options
  review: false,
  screen: false,
  anonymous: false,
  author-version: false,
  non-acm: false,
  timestamp: false,
  author-draft: false,
  balance: true,
  url-break-on-hyphen: true,
  make-title: false,
  body,
) = {
  if format not in acm-formats {
    panic(
      "Valid formats are: ",
      acm-formats,
      "but got: ",
      format,
    )
  }

  let short-title = none
  let full-title

  if (type(title) == content or type(title) == str) {
    full-title = title
  } else if type(title) == dictionary {
    if "full" not in title {
      panic("Title must have the 'full' key.")
    }

    full-title = title.full

    if "short" in title {
      short-title = title.short
    }
  } else {
    panic(
      "Title must be a string, content, or dictionary with keys 'full' and optional 'short'.",
      title,
    )
  }

  set document(title: full-title)

  set page(
    paper: "us-letter",
    columns: if format in ("sig-conf", "plan", "engage", "tog") { 2 } else { 1 },
  )

  set text(
    lang: "en",
    region: "us",
    font: "Libertinus Serif", // One could use Linux Libertine as specified in the ACM template,  but Libertinus is basically a fork of it with more features and better support.
    size: 9pt,
  )

  set par()

  set par.line(numbering: "1") if (review or format == "manuscript")

  let title-page-formatted-authors = (
    (
      name: ("Ben Trovato", "G.K.M. Tobin"),
      email: ("trovato@corporation.com", "webmaster@marysville-ohio.com"),
      orcid: "1234-5678-9012",
      affiliation: (
        institution: "Institute for Clarity in Documentation",
        city: "Dublin",
        state: "Ohio",
        country: "USA",
      ),
    ),
    (
      name: "Lars Thørvald",
      email: "larst@affiliation.org",
      affiliation: (
        institution: "The Thørvald Group",
        city: "Hekla",
        country: "Iceland",
      ),
    ),
    (
      name: "Valerie Béranger",
      affiliation: (
        institution: "Inria Paris-Rocquencourt",
        city: "Rocquencourt",
        country: "France",
      ),
    ),
    (
      name: "Aparna Patel",
      affiliation: (
        institution: "Rajiv Gandhi University",
        city: "Doimukh",
        state: "Arunachal Pradesh",
        country: "India",
      ),
    ),
    (
      name: "Huifen Chan",
      affiliation: (
        institution: "Tsinghua University",
        city: "Haidian Qu",
        state: "Beijing Shi",
        country: "China",
      ),
    ),
    (
      name: "Charles Palmer",
      email: "cpalmer@prl.com",
      affiliation: (
        institution: "Palmer Research Laboratories",
        city: "San Antonio",
        state: "Texas",
        country: "USA",
      ),
    ),
    (
      name: "John Smith",
      email: "jsmith@affiliation.org",
      affiliation: (
        institution: "The Thørvald Group",
        city: "Hekla",
        country: "Iceland",
      ),
    ),
    (
      name: "Julius P. Kumquat",
      email: "jpkumquat@consortium.net",
      affiliation: (
        institution: "The Kumquat Consortium",
        city: "New York",
        country: "USA",
      ),
    ),
  )

  if make-title and format == "sig-conf" {
    set page(columns: 1)
    set align(center)
    text(size: font-9pt.Huge, weight: "bold", full-title) // \Huge /sf family \bf family
    if subtitle != none and subtitle != [] {
      parbreak()
      text(size: font-9pt.LARGE, subtitle) // \LARGE \md series
    }

    for i in range(calc.ceil(title-page-formatted-authors.len() / 3)) {
      let end = calc.min((i + 1) * 3, title-page-formatted-authors.len())
      let is-final-author = title-page-formatted-authors.len() == end
      let sliced-authors = title-page-formatted-authors.slice(i * 3, end)
      // TODO: Support arbitrary position of affiliation/email render. Author should be printed with the other they input.
      // Author-> affiliation -> email or
      // Author -> email -> affiliation
      // Currently, it's just author -> affiliation -> email
      grid(
        columns: sliced-authors.len() * (1fr,),
        gutter: 12pt,
        ..sliced-authors.map(author => align(
          center,
          {
            if type(author.name) == array {
              text(size: font-9pt.LARGE, author.name.join(parbreak()))
              if type(author.email) == array {
                show link: set text(size: font-9pt.large)
                for i in author.email {
                  parbreak()
                  link("mailto:" + i)
                }
              }
            } else if type(author.name) == str or type(author.name) == content {
              text(size: font-9pt.LARGE, author.name)
            }

            if "affiliation" in author {
              set text(size: font-9pt.large)
              if "institution" in author.affiliation {
                parbreak()
                text(author.affiliation.institution)
              }
              if "city" in author.affiliation {
                parbreak()
                text(author.affiliation.city)
              }
              if "state" in author.affiliation {
                [, ]
                text(author.affiliation.state)
              }
              if "country" in author.affiliation {
                [, ]
                text(author.affiliation.country)
              }
            }

            if "email" in author {
              show link: set text(size: font-9pt.large)
              if type(author.email) == str {
                parbreak()
                link("mailto:" + author.email)
              }
            }
          },
        ))
      )

      if not is-final-author {
        v(16pt, weak: true)
      }
    }

    
  }

  body
}

