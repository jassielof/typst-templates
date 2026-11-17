#let to-string(content) = {
  if type(content) == str {
    content
  } else if content.has("text") {
    content.text
  } else if content.has("body") {
    to-string(content.body)
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content == [ ] {
    " "
  }
}
