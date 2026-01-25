#import "languages.typ": get-terms
#import "@preview/datify:1.0.0": custom-date-format
#import "@preview/orchid:0.1.0"
#import "fonts.typ": get-font-size
#import "journals.typ": get-journal

// Format author name with optional ORCID link
#let format-author-name(name, orcid) = {
  if orcid != none {
    // Validate ORCID format (panics if invalid, returns void if valid)
    orchid.check-format(orcid)
    // If we reach here, ORCID is valid
    link("https://orcid.org/" + orcid, name)
  } else {
    name
  }
}

// Group authors by their primary (first) affiliation
#let group-authors-by-affiliation(authors, affiliations) = {
  let groups = (:)

  for author in authors {
    // Get primary affiliation (first one)
    let primary-aff = if "affiliations" in author and author.affiliations != none {
      if type(author.affiliations) == array and author.affiliations.len() > 0 {
        author.affiliations.at(0)
      } else if type(author.affiliations) == str {
        author.affiliations
      } else {
        none
      }
    } else {
      none
    }

    let aff-key = if primary-aff != none {
      primary-aff
    } else {
      "no-affiliation"
    }

    if aff-key not in groups {
      groups.insert(aff-key, ())
    }

    groups.at(aff-key).push(author)
  }

  return groups
}

// Format affiliation for display (institution, country)
#let format-affiliation-short(affiliation) = {
  if type(affiliation) == dictionary {
    let parts = ()
    if "institution" in affiliation {
      parts.push(affiliation.institution)
    }
    if "country" in affiliation {
      parts.push(affiliation.country)
    }
    return parts.join([, ])
  }
  return affiliation
}

// Format affiliation for contact info (institution, city, state, country)
#let format-affiliation-full(affiliation) = {
  if type(affiliation) == dictionary {
    let parts = ()
    if "institution" in affiliation {
      parts.push(affiliation.institution)
    }
    if "city" in affiliation {
      parts.push(affiliation.city)
    }
    if "state" in affiliation {
      parts.push(affiliation.state)
    }
    if "country" in affiliation {
      parts.push(affiliation.country)
    }
    return parts.join([, ])
  }
  return affiliation
}

// Collect unique author notes
#let collect-author-notes(authors) = {
  let notes = ()
  let note-map = (:)
  let counter = 1

  for author in authors {
    if "note" in author and author.note != none {
      let note-key = repr(author.note)
      if note-key not in note-map {
        // Use symbol numbering: *, †, ‡, §, ¶, ‖
        let symbol = numbering("*", counter)
        note-map.insert(note-key, symbol)
        notes.push((id: counter, symbol: symbol, text: author.note))
        counter += 1
      }
    }
  }

  return (notes: notes, map: note-map)
}

// Get note mark for an author
// Get note mark for an author
#let get-note-mark(author, note-info) = {
  if "note-mark" in author and author.note-mark != none {
    // If note-mark is a number, convert to symbol
    if type(author.note-mark) == int {
      return numbering("*", author.note-mark)
    }
    return author.note-mark
  }

  if "note" in author and author.note != none {
    let note-key = repr(author.note)
    return note-info.map.at(note-key, default: none)
  }

  return none
}

// Print authors in ACM format
#let print-acm-authors(author-groups-raw, affiliations, language) = {
  let author-groups = author-groups-raw.map(e => if "members" in e {
    e
  } else {
    (
      affiliations: e.affiliations,
      members: (e,),
    )
  })
  if author-groups == none or author-groups.len() == 0 {
    return none
  }

  // FIXME: Make this contextual on the base font size
  let font-sizes = get-font-size(10pt)
  let note-info = collect-author-notes(author-groups.map(e => e.members).flatten())

  let output = ()

  // Process each affiliation group
  for group-authors in author-groups {
    let author-names = ()
    let aff-id = group-authors.affiliations

    for author in group-authors.members {
      let name = text(upper(author.name), font: "Linux Biolinum")
      let orcid = if "orcid" in author { author.orcid } else { none }
      let formatted-name = format-author-name(name, orcid)
      let note-mark = get-note-mark(author, note-info)

      if note-mark != none {
        author-names.push([#formatted-name#note-mark])
      } else {
        author-names.push(name)
      }
    }

    // Join author names
    let authors-text = if author-names.len() == 1 {
      author-names.at(0)
      // i can simply use join with last, its the same either '2' or 'else'
    } else if author-names.len() == 2 {
      author-names.join([ #context get-terms(language).and ])
    } else {
      author-names.join([, ], last: [, #context get-terms(language).and ])
    }

    // Add affiliation if exists
    if aff-id != "no-affiliation" and aff-id in affiliations {
      let aff-text = format-affiliation-short(affiliations.at(aff-id))

      // FIXME: somehow size is 11 and not "normal"
      output.push([#text(size: 11pt)[#authors-text, ]#text(aff-text, size: font-sizes.small)])
    } else {
      output.push(text(authors-text, size: font-sizes.large))
    }
  }

  return (
    authors: output.join([\ ]),
    notes: note-info.notes,
  )
}

// Print contact information
#let print-contact-info(authors, affiliations) = {
  if authors == none or authors.len() == 0 {
    return none
  }

  let contacts = ()

  for author-group in authors {
    let parts = ()

    let members = author-group.at("members", default: (author-group,))

    let author-parts = ()
    for author in members {
      // Name
      let name = author.name
      let email = author.at("email", default: none)

      author-parts.push((name, email).filter(e => e != none).join(", "))
    }

    parts.push(author-parts.join("; "))
    // Full affiliation (if exists)
    if "affiliations" in author-group and author-group.affiliations != none {
      let primary-aff = if type(author-group.affiliations) == array and author-group.affiliations.len() > 0 {
        author-group.affiliations.at(0)
      } else if type(author-group.affiliations) == str {
        author-group.affiliations
      } else {
        none
      }

      if primary-aff != none and primary-aff in affiliations {
        let aff-text = format-affiliation-full(affiliations.at(primary-aff))
        parts.push(aff-text)
      }
    }

    contacts.push(parts.join([, ]))
  }

  return contacts.join([; ])
}

// Print authors in simple list format (for ACM Reference Format)
#let print-authors-list(author-groups, language) = {
  let authors = author-groups.map(e => if "members" in e { e.members } else { (e,) }).flatten()
  if authors == none or authors.len() == 0 {
    return none
  }

  let author-names = authors.map(author => {
    if type(author) == dictionary {
      author.name
    } else {
      author
    }
  })

  if author-names.len() == 1 {
    author-names.at(0)
  } else if author-names.len() >= 2 {
    author-names.join([ #context get-terms(language).and ])
  } else {
    author-names.join([, ], last: [, #context get-terms(language).and ])
  }
}

#let print-acm-reference-authors(author-groups, language) = {
  let authors = author-groups.map(e => if "members" in e { e.members } else { (e,) }).flatten()
  if authors == none or authors.len() == 0 {
    return none
  }

  let author-names = authors.map(author => {
    if type(author) == dictionary {
      author.name
    } else {
      author
    }
  })

  if author-names.len() == 1 {
    author-names.at(0)
  } else {
    author-names.join([, ], last: [, #context get-terms(language).and ])
  }
}

// Format ACM reference citation
#let format-acm-reference(
  authors,
  year,
  title,
  journal,
  volume,
  number,
  article,
  month,
  pages,
  doi,
  language,
) = {
  let parts = ()

  // Authors
  parts.push(print-acm-reference-authors(authors, language))

  // Year
  if year != none {
    parts.push(str(year))
  }

  // Title
  if title != none {
    parts.push(title)
  }

  // Journal info
  if journal != none {
    let short-journal = emph(get-journal(journal).short-name)
    let journal-part = short-journal

    if volume != none {
      journal-part = [#journal-part #volume]

      if number != none {
        journal-part = [#journal-part, #number]
      }
    }

    if article != none {
      journal-part = [#journal-part, Article #article]
    }

    parts.push(journal-part)
  }

  // Month and pages
  let extra = ()
  if month != none and year != none {
    let the-date = datetime(year: year, month: month, day: 1)
    extra.push(custom-date-format(the-date, pattern: "(MMMM yyyy)"))
  }

  if pages != none {
    extra.push([#pages pages])
  }

  if extra.len() > 0 {
    parts.push(extra.join([, ]))
  }

  // DOI
  if doi != none {
    parts.push(link("https://doi.org/" + doi))
  }

  return parts.join([. ])
}
