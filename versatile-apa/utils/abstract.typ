#import "languages.typ": get-terms
#let abstract-page(body, keywords: none, as-description: false) = context {
  if body != none {
    set document(description: body)
    heading(level: 1, get-terms(text.lang).Abstract, outlined: false)
    par(first-line-indent: 0in, body)

    if keywords != none {
      if type(keywords) == array {
        emph[#get-terms(text.lang).Keywords: ]
        keywords.map(it => it).join(", ")
      } else if type(keywords) == str or type(keywords) == std.content {
        emph[#get-terms(text.lang).Keywords: ]
        keywords
      } else {
        panic("Invalid keyword type: ", type(keywords))
      }

      pagebreak()
    }
  }
}
