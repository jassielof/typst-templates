#import "languages.typ": get-terms

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
        note-map.insert(note-key, counter)
        notes.push((id: counter, text: author.note))
        counter += 1
      }
    }
  }

  return (notes: notes, map: note-map)
}

// Get note mark for an author
#let get-note-mark(author, note-info) = {
  if "note-mark" in author and author.note-mark != none {
    return author.note-mark
  }

  if "note" in author and author.note != none {
    let note-key = repr(author.note)
    return note-info.map.at(note-key, default: none)
  }

  return none
}

// Print authors in ACM format
#let print-acm-authors(authors, affiliations, language) = {
  if authors == none or authors.len() == 0 {
    return none
  }

  let groups = group-authors-by-affiliation(authors, affiliations)
  let note-info = collect-author-notes(authors)

  let output = ()

  // Process each affiliation group
  for (aff-id, group-authors) in groups {
    let author-names = ()

    for author in group-authors {
      let name = upper(author.name)
      let note-mark = get-note-mark(author, note-info)

      if note-mark != none {
        author-names.push([#name#super[#note-mark]])
      } else {
        author-names.push(name)
      }
    }

    // Join author names
    let authors-text = if author-names.len() == 1 {
      author-names.at(0)
    } else if author-names.len() == 2 {
      author-names.join([ #context get-terms(language).and ])
    } else {
      author-names.join([, ], last: [, #context get-terms(language).and ])
    }

    // Add affiliation if exists
    if aff-id != "no-affiliation" and aff-id in affiliations {
      let aff-text = format-affiliation-short(affiliations.at(aff-id))
      output.push([#authors-text, #aff-text])
    } else {
      output.push(authors-text)
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

  for author in authors {
    let parts = ()

    // Name
    parts.push(author.name)

    // Email (if exists)
    if "email" in author and author.email != none {
      parts.push(author.email)
    }

    // Full affiliation (if exists)
    if "affiliations" in author and author.affiliations != none {
      let primary-aff = if type(author.affiliations) == array and author.affiliations.len() > 0 {
        author.affiliations.at(0)
      } else if type(author.affiliations) == str {
        author.affiliations
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

// Example usage:
#let example-authors = (
  (
    name: [Ben Trovato],
    affiliations: ("inst1",),
    email: [trovato@corporation.com],
    note: [Both authors contributed equally to this research.],
  ),
  (
    name: [G.K.M. Tobin],
    affiliations: ("inst1",),
    email: [webmaster@marysville-ohio.com],
    note-mark: 1, // References Ben's note
  ),
  (
    name: [Lars Thørväld],
    affiliations: ("inst2",),
    email: [larst@affiliation.org],
  ),
  (
    name: [John Smith],
    affiliations: ("inst2",),
    email: [jsmith@affiliation.org],
  ),
)

#let example-affiliations = (
  "inst1": (
    institution: [Institute for Clarity in Documentation],
    country: [USA],
  ),
  "inst2": (
    institution: [The Thørväld Group],
    city: [Hekla],
    country: [Iceland],
  ),
)

#let result = print-acm-authors(example-authors, example-affiliations, "en")

// Display authors
#result.authors

// Display author notes
#if result.notes.len() > 0 {
  parbreak()
  for note in result.notes {
    [#super[#note.id] #note.text\ ]
  }
}

// Display contact information
#parbreak()
[Authors' Contact Information: #print-contact-info(example-authors, example-affiliations)]
