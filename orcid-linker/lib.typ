#let logo = image("assets/images/ORCID_iD.svg")
#let base-url = "https://orcid.org/"

#let orcid-link(id) = {
  if orcid.contains(regex("^\d{4}-\d{4}-\d{4}-\d{3}[\dX]$")) == false {
    panic("ORCID format must be XXXX-XXXX-XXXX-XXXX: " + orcid)
  } else if type(orcid) != str {
    panic("ORCID must be of type string: " + type(orcid))
  }
}
