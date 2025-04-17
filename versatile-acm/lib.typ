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

#let versatile-acm(
  // Authoring
  // TODO: Support two types of title: title: [] as full title, and title: (short: none, full: []) as full title with short title
  title: [],
  subtitle: [],
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

  let full-title

  if (type(title) == content or type(title) == str) {
    full-title = title
  } else if type(title) == dictionary {
    if "full" not in title {
      panic("Title must have the 'full' key.")
    }

    full-title = title.full
  } else {
    panic(
      "Title must be a string, content, or dictionary with key 'full'.",
      title,
    )
  }

  set document(title: full-title)

  set page(
    paper: "us-letter",
    columns: 2,
  ) if format == "sig-conf"

  set text(
    lang: "en",
    region: "us",
    // One could use Linux Libertine as specified in the ACM template,  but Libertinus is basically a fork of it with more features and better support.
  )

  set par()

  set par.line(numbering: "1") if (format == "manuscript")

  let author-names = authors.map(author => author.name)

  let author-emails = authors.map(author => {
    if "email" in author {
      author.email
    } else {
      none
    }
  })

  let author-orcids = authors.map(author => {
    if "orcid" in author {
      author.orcid
    } else {
      none
    }
  })

  if make-title and format == "sig-conf" {
    set page(columns: 1)
    align(center, full-title)
    for i in range(calc.ceil(authors.len() / 3)) {
      let end = calc.min((i + 1) * 3, authors.len())
      let is-last = authors.len() == end
      let slice = authors.slice(i * 3, end)
      grid(
        columns: slice.len() * (1fr,),
        gutter: 1.2em,
        ..slice.map(author => align(
          center,
          {
            text(1.2em, author.name)
            if "department" in author [
              \ #author.department
            ]
            if "organization" in author [
              \ #author.organization
            ]
            if "location" in author [
              \ #author.location
            ]
            if "email" in author [
              \ #link("mailto:" + author.email)
            ]
          },
        ))
      )
    }
  }

  body
}

