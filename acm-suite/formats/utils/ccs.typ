/// Process ACM CCS XML, the content must be a parsed XML structure
#let process-ccs(ccs-concepts) = {
  let find-child(elem, tag) = {
    elem.children.filter(e => type(e) != str).find(e => "tag" in e and e.tag == tag)
  }

  let ccs = (
    ccs-concepts
      .first()
      .children
      .filter(e => type(e) != str)
      .map(concept => {
        let concept_desc = find-child(concept, "concept_desc").children.first()
        (
          concept_id: find-child(concept, "concept_id").children.first(),
          concept_significance: int(find-child(concept, "concept_significance").children.first()),
          topic: concept_desc.split("~").first(),
          sub_topic: concept_desc.split("~").last(),
        )
      })
  )

  ccs
    .fold(().to-dict(), (acc, e) => {
      let arr = acc.at(e.topic, default: ())
      arr.push(e)
      acc.insert(e.topic, arr)
      acc
    })
    .pairs()
    .map(p => {
      let topic = p.first()
      let subs = p.last()
      [*• #topic* → #subs.map(e => {
          if e.concept_significance == 500 { text(e.sub_topic, weight: "bold") } else if e.concept_significance == 300 {
            text(e.sub_topic, style: "italic")
          } else { [#e.sub_topic] }
        }).join("; ")]
    })
    .join("; ")
}

