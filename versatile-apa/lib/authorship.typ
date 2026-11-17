#import "languages.typ": get-terms

#let is-name(value) = type(value) == str or type(value) == content

// Accept simple names, author records, or a dictionary whose values are author records.
#let normalize-authors(authors) = {
  if authors == none { return () }
  let entries = if is-name(authors) {
    (authors,)
  } else if type(authors) == array {
    authors
  } else if type(authors) == dictionary {
    if "name" in authors { (authors,) } else { authors.values() }
  } else {
    panic("authors: use a name, an array of names or author records, or a dictionary of author records")
  }
  assert(entries.len() > 0, message: "authors: provide at least one author, or omit authors to use document metadata")
  entries.map(entry => {
    let author = if is-name(entry) { (name: entry) } else { entry }
    assert(type(author) == dictionary and "name" in author,
      message: "authors: each author record needs a name, for example (name: [Alex]); add affiliation IDs in its affiliations field")
    assert(is-name(author.name), message: "authors: an author's name must be text or content")
    assert(if type(author.name) == str { author.name.trim() != "" } else { author.name != [] },
      message: "authors: an author's name must not be empty")
    let ids = author.at("affiliations", default: ())
    ids = if type(ids) == str { (ids,) } else { ids }
    assert(type(ids) == array, message: "authors: affiliations must be an affiliation ID or an array of IDs")
    assert(ids.all(id => type(id) == str and id != ""), message: "authors: each affiliation ID must be a nonempty string")
    assert(ids.dedup().len() == ids.len(), message: "authors: list each affiliation ID only once per author")
    (name: author.name, affiliations: ids)
  })
}

// Resolve and validate the relationship before deciding whether superscripts are needed.
#let normalize-authorship(authors, affiliations) = {
  let authors = normalize-authors(authors)
  let keyed = type(affiliations) == dictionary
  let supplied = if affiliations == none {
    (:)
  } else if is-name(affiliations) {
    (shared: affiliations)
  } else if keyed {
    affiliations
  } else {
    panic("affiliations: use one affiliation as text/content, or a dictionary mapping affiliation IDs to names")
  }
  for (id, name) in supplied {
    assert(type(id) == str and id != "", message: "affiliations: each dictionary key must be a nonempty ID")
    assert(is-name(name), message: "affiliations: each affiliation name must be text or content")
    assert(if type(name) == str { name.trim() != "" } else { name != [] }, message: "affiliations: affiliation names must not be empty")
  }
  let assigned = authors.any(author => author.affiliations.len() > 0)
  if assigned {
    assert(keyed, message: "affiliations: author records use affiliation IDs, so provide a dictionary mapping those IDs to names instead of a single affiliation or none")
    for author in authors {
      for id in author.affiliations {
        assert(id in supplied, message: "affiliations: unknown ID \"" + id + "\"; add it to the affiliations dictionary or correct the author's ID")
      }
    }
  } else {
    // With no explicit IDs, every author shares the supplied affiliation(s).
    authors = authors.map(author => (..author, affiliations: supplied.keys()))
  }
  let used = authors.map(author => author.affiliations).flatten()
  let affiliations = supplied.pairs().filter(pair => pair.first() in used)
    .enumerate().map(((index, pair)) => (id: pair.first(), name: pair.last(), number: index + 1))
  let numbered = authors.map(author => author.affiliations.sorted()).dedup().len() > 1
  (authors: authors, affiliations: affiliations, numbered: numbered)
}

#let print-authors(authors, affiliations, language, script) = {
  let data = normalize-authorship(authors, affiliations)
  let names = data.authors.map(author => {
    if not data.numbered or author.affiliations.len() == 0 { return author.name }
    let markers = author.affiliations.map(id => {
      let affiliation = data.affiliations.find(affiliation => affiliation.id == id)
      super(str(affiliation.number))
    })
    [#author.name#markers.join(super[, ])]
  })
  if names.len() <= 1 { names.join() } else {
    let conjunction = [ #context get-terms(language, script).and ]
    if names.len() == 2 { names.join(conjunction) } else { names.join([, ], last: [,] + conjunction) }
  }
}

#let print-affiliations(authors, affiliations) = {
  let data = normalize-authorship(authors, affiliations)
  data.affiliations.map(affiliation => {
    if data.numbered { [#super(str(affiliation.number)) #affiliation.name] } else { affiliation.name }
  }).join(parbreak())
}
