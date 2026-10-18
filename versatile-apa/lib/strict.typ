// Strict mode: turns the APA 7 manual rules that can be checked mechanically into
// compile errors. It is disabled by default (`strict: false`).
//
// It is exactly as strict as the manual: only rules stated without an escape
// hatch are enforced. What the manual calls typical, optional or "unless the
// instructor requires otherwise" (fonts, abstract length, keywords, student
// title page contents, ...) is not checked. `"professional"` is the manuscript
// submitted for publication (sections 2.1 and 2.3), `"student"` the student paper
// (section 2.2). Section numbers refer to the APA Publication Manual, 7th edition.

#import "constants.typ": double-spacing, first-indent-length, quote-word-trigger
#import "to-string.typ": to-string

#let strict-modes = (false, "student", "professional")

#let running-head-limit = 50

#let fail(mode, section, message) = panic("APA strict mode (" + mode + "), section " + section + ": " + message)

#let validate-strict-mode(mode) = {
  assert(
    mode in strict-modes,
    message: "`strict` must be false, \"student\" or \"professional\", got " + repr(mode),
  )
}

/// Plain text of a string or content, descending into styled elements such as `emph`.
#let as-string(value) = {
  if value == none { return "" }
  if type(value) == str { return value }
  if value.has("text") {
    value.text
  } else if value.has("children") {
    value.children.map(as-string).join()
  } else if value.has("body") {
    as-string(value.body)
  } else if value == [ ] {
    " "
  } else {
    ""
  }
}

/// Checks that depend only on the arguments of `versatile-apa` (section 2.8).
///
/// The 50 character limit applies to any running head. A running head is required
/// for manuscripts submitted for publication and optional for student papers.
#let check-running-head(mode, running-head) = {
  if mode == false { return }

  if mode == "professional" and running-head == none {
    fail(mode, "2.8", "a manuscript submitted for publication requires a running head.")
  }
  if running-head != none {
    let length = as-string(running-head).len()
    if length > running-head-limit {
      fail(
        mode,
        "2.8",
        "the running head must have at most " + str(running-head-limit) + " characters, it has " + str(length) + ".",
      )
    }
  }
}

/// Resolves one side of `page.margin` to a length (or `none` if it is not an absolute length).
#let margin-side(margin, side, axis) = {
  let value = if type(margin) == dictionary {
    margin.at(side, default: margin.at(axis, default: margin.at("rest", default: auto)))
  } else {
    margin
  }
  if type(value) == relative {
    if value.ratio != 0% { return none }
    value.length
  } else if type(value) == length {
    value
  } else {
    none
  }
}

/// Checks the page and paragraph setup. Must run inside `context`, after the
/// user's own `set page(..)` / `set par(..)`, so it is called from the title page.
#let check-page-setup(mode) = {
  if mode == false { return }

  // Margins (2.22)
  for (side, axis) in (("top", "y"), ("bottom", "y"), ("left", "x"), ("right", "x")) {
    if margin-side(page.margin, side, axis) != 1in {
      fail(mode, "2.22", "the " + side + " margin must be 1 in (2.54 cm).")
    }
  }

  // Page number, flush right in the header of every page (2.18)
  if page.numbering == none or page.number-align != top + right {
    fail(mode, "2.18", "the page number must be in the header, flush right, on every page.")
  }

  // Quotations of 40 words or more are block quotations (8.26 and 8.27)
  if quote-word-trigger.get() != 40 {
    fail(mode, "8.27", "quotations of 40 words or more must be block quotations, the trigger is " + str(quote-word-trigger.get()) + ".")
  }

  // Line spacing (2.21), alignment and hyphenation (2.23) and indentation (2.24)
  if par.leading != double-spacing or par.spacing != double-spacing {
    fail(mode, "2.21", "the paper must be double-spaced, without extra spacing between paragraphs.")
  }
  if par.justify {
    fail(mode, "2.23", "do not use full justification; align the text to the left.")
  }
  if text.hyphenate == true {
    fail(mode, "2.23", "do not use hyphenation to break words at the end of a line.")
  }
  let indent = par.first-line-indent
  let amount = if type(indent) == dictionary { indent.amount } else { indent }
  if amount != first-indent-length {
    fail(mode, "2.24", "the first line of every paragraph must be indented 0.5 in.")
  }
}

/// Counts the affiliations of each author, when they can be told apart (section 2.6).
#let check-affiliations(mode, authors, affiliations) = {
  if type(authors) == array {
    for author in authors {
      if type(author) == dictionary and "affiliations" in author {
        let list = author.affiliations
        if type(list) == array and list.len() > 2 {
          fail(mode, "2.6", "no more than two affiliations per author; " + repr(author.name) + " has " + str(list.len()) + ".")
        }
      }
    }
  }
  if type(affiliations) == dictionary and affiliations.len() > 2 {
    let simple = authors == none or type(authors) != array or authors.all(a => type(a) != dictionary)
    if simple {
      fail(mode, "2.6", "all authors share " + str(affiliations.len()) + " affiliations; no more than two are allowed.")
    }
  }
}

/// Checks the title page (sections 2.3 to 2.7).
///
/// Every title page has a title and the name of the author. The affiliations and
/// the author note belong to the professional title page; the manual leaves the
/// rest of the student title page to the instructor, so it is not checked.
#let check-title-page(
  mode,
  title,
  authors,
  affiliations,
  author-note,
) = {
  if mode == false { return }

  if title == none and document.title == none {
    fail(mode, "2.4", "the title page requires a title (`title:` or `set document(title: ..)`).")
  }
  if authors == none {
    fail(mode, "2.5", "every paper includes the name of the author (byline).")
  }
  check-affiliations(mode, authors, affiliations)

  if mode == "professional" {
    if affiliations == none {
      fail(mode, "2.6", "the professional title page requires the affiliation of each author.")
    }
    if author-note == none {
      fail(mode, "2.7", "the professional title page requires an author note.")
    }
  }
}
