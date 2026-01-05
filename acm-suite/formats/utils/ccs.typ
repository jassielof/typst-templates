/// Process ACM CCS XML, the content must be a parsed XML structure
#let process-ccs(ccs) = {
  // Extract concepts from parsed XML structure
  let concepts = ()

  // Navigate through the parsed structure
  for root in ccs {
    if type(root) == dictionary and root.at("tag", default: none) == "ccs2012" {
      // Process children of ccs2012
      for child in root.children {
        if type(child) == dictionary and child.at("tag", default: none) == "concept" {
          // Extract concept_desc from this concept
          let concept-desc = none
          let significance = none

          for elem in child.children {
            if type(elem) == dictionary {
              if elem.at("tag", default: none) == "concept_desc" {
                // Get the text content (first child)
                if elem.children.len() > 0 {
                  concept-desc = elem.children.at(0)
                }
              } else if elem.at("tag", default: none) == "concept_significance" {
                // Get the significance value
                if elem.children.len() > 0 {
                  significance = int(elem.children.at(0))
                }
              }
            }
          }

          if concept-desc != none and significance != none {
            concepts.push((desc: concept-desc, sig: significance))
          }
        }
      }
    }
  }

  // Format output
  if concepts.len() == 0 {
    return []
  }

  // Sort concepts by significance: 500 first, then 300, then rest
  let sig500 = concepts.filter(c => c.sig == 500)
  let sig300 = concepts.filter(c => c.sig == 300)
  let sigRest = concepts.filter(c => c.sig != 500 and c.sig != 300)

  // Helper function to replace ~ with arrow
  let replace-tilde(to-replace) = {
    // PLACEHOLDER: Replace "~" with arrow.r symbol here
    // Example: text.replace("~", arrow.r)
    to-replace.split("~").join(sym.arrow.r)
  }

  // Build formatted parts
  let parts = ()

  // Add 500 significance concepts (regular text)
  for c in sig500 {
    parts.push(strong(replace-tilde(c.desc)))
  }

  // Add 300 significance concepts (emphasized)
  for c in sig300 {
    parts.push(emph(replace-tilde(c.desc)))
  }

  // Add rest (regular text)
  for c in sigRest {
    parts.push(replace-tilde(c.desc))
  }

  // Join with semicolons and add period at the end
  parts.join([; ]) + [.]
}

