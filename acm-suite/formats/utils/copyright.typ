#import "journals.typ": *

#let permissions = (
  acm-copyright: [Permission to make digital or hard copies of all or part of this work for personal or classroom use is granted without fee provided that copies are not made or distributed for profit or commercial advantage and that copies bear this notice and the full citation on the first page. Copyrights for components of this work owned by others than ACM must be honored. Abstracting with credit is permitted. To copy otherwise, or republish, to post on servers or to redistribute to lists, requires prior specific permission and#h(0.5pt)/or a fee. Request permissions from permissions\@acm.org.],
  acm-licensed: [Permission to make digital or hard copies of all or part of this work for personal or classroom use is granted without fee provided that copies are not made or distributed for profit or commercial advantage and that copies bear this notice and the full citation on the first page. Copyrights for components of this work owned by others than the author(s) must be honored. Abstracting with credit is permitted. To copy otherwise, or republish, to post on servers or to redistribute to lists, requires prior specific permission and#h(0.5pt)/or a fee. Request permissions from permissions\@acm.org.],
  rights-retained: [Permission to make digital or hard copies of all or part of this work for personal or classroom use is granted without fee provided that copies are not made or distributed for profit or commercial advantage and that copies bear this notice and the full citation on the first page. Copyrights for third-party components of this work must be honored. For all other uses, contact the owner#h(0.5pt)/author(s).],
  us-gov: [This paper is authored by an employee(s) of the United States Government and is in the public domain. Non-exclusive copying or redistribution is allowed, provided that the article citation is given and the authors and agency are clearly identified as its source.],
  us-gov-mixed: [ACM acknowledges that this contribution was authored or co-authored by an employee, contractor, or affiliate of the United States government. As such, the United States government retains a nonexclusive, royalty-free right to publish or reproduce this article, or to allow others to do so, for government purposes only. Request permissions from owner#h(0.5pt)/author(s).],
  ca-gov: [This article was authored by employees of the Government of Canada. As such, the Canadian government retains all interest in the copyright to this work and grants to ACM a nonexclusive, royalty-free right to publish or reproduce this article, or to allow others to do so, provided that clear attribution is given both to the authors and the Canadian government agency employing them. Permission to make digital or hard copies for personal or classroom use is granted. Copies must bear this notice and the full citation on the first page. Copyrights for components of this work owned by others than the Canadian Government must be honored. To copy otherwise, distribute, republish, or post, requires prior specific permission and/or a fee. Request permissions from owner#h(0.5pt)/author(s).],
  ca-gov-mixed: [ACM acknowledges that this contribution was co-authored by an affiliate of the national government of Canada. As such, the Crown in Right of Canada retains an equal interest in the copyright. Reprints must include clear attribution to ACM and the author's government agency affiliation. Permission to make digital or hard copies for personal or classroom use is granted. Copies must bear this notice and the full citation on the first page. Copyrights for components of this work owned by others than ACM must be honored. To copy otherwise, distribute, republish, or post, requires prior specific permission and/or a fee. Request permissions from owner#h(0.5pt)/author(s).],
  licensed-us-gov-mixed: [Publication rights licensed to ACM. ACM acknowledges that this contribution was authored or co-authored by an employee, contractor or affiliate of the United States government. As such, the Government retains a nonexclusive, royalty-free right to publish or reproduce this article, or to allow others to do so, for Government purposes only. Request permissions from owner#h(0.5pt)/author(s).],
  licensed-ca-gov: [This article was authored by employees of the Government of Canada. As such, the Canadian government retains all interest in the copyright to this work and grants to ACM a nonexclusive, royalty-free right to publish or reproduce this article, or to allow others to do so, provided that clear attribution is given both to the authors and the Canadian government agency employing them. Permission to make digital or hard copies for personal or classroom use is granted. Copies must bear this notice and the full citation on the first page. Copyrights for components of this work owned by others than the Canadian Government must be honored. To copy otherwise, distribute, republish, or post, requires prior specific permission and/or a fee. Request permissions from owner#h(0.5pt)/author(s).],
  licensed-ca-gov-mixed: [Publication rights licensed to ACM. ACM acknowledges that this contribution was authored or co-authored by an employee, contractor or affiliate of the national government of Canada. As such, the Government retains a nonexclusive, royalty-free right to publish or reproduce this article, or to allow others to do so, for Government purposes only. Request permissions from owner#h(0.5pt)/author(s).],
  other-gov: [ACM acknowledges that this contribution was authored or co-authored by an employee, contractor or affiliate of a national government. As such, the Government retains a nonexclusive, royalty-free right to publish or reproduce this article, or to allow others to do so, for Government purposes only. Request permissions from owner#h(0.5pt)/author(s).],
  licensed-other-gov: [Publication rights licensed to ACM. ACM acknowledges that this contribution was authored or co-authored by an employee, contractor or affiliate of a national government. As such, the Government retains a nonexclusive, royalty-free right to publish or reproduce this article, or to allow others to do so, for Government purposes only. Request permissions from owner#h(0.5pt)/author(s).],
  iw3c2w3: [This paper is published under the Creative Commons Attribution 4.0 International (CC-BY 4.0) license. Authors reserve their rights to disseminate the work on their personal and corporate Web sites with the appropriate attribution.],
  iw3c2w3g: [This paper is published under the Creative Commons Attribution-NonCommercial-NoDerivs 4.0 International (CC-BY-NC-ND 4.0) license. Authors reserve their rights to disseminate the work on their personal and corporate Web sites with the appropriate attribution.],
)

#let cc-permission(type: "by", version: "4.0") = {
  let url = if type == "zero" {
    "https://creativecommons.org/publicdomain/zero/1.0"
  } else {
    "https://creativecommons.org/licenses/" + type + "/" + version
  }

  let license-name = if type == "zero" {
    "CC0 1.0 Universal"
  } else if type == "by" {
    "Attribution"
  } else if type == "by-sa" {
    "Attribution-ShareAlike"
  } else if type == "by-nd" {
    "Attribution-NoDerivatives"
  } else if type == "by-nc" {
    "Attribution-NonCommercial"
  } else if type == "by-nc-sa" {
    "Attribution-NonCommercial-ShareAlike"
  } else if type == "by-nc-nd" {
    "Attribution-NonCommercial-NoDerivatives"
  } else {
    ""
  }

  let version-text = if type != "zero" {
    if version == "4.0" {
      " 4.0 International"
    } else {
      " 3.0 Unported"
    }
  } else {
    ""
  }

  [
    #link(url)[#image("doclicense-CC-" + type + "-88x31.png", height: 2.5em)]\
    #link(url)[This work is licensed under a Creative Commons #license-name#version-text License.]
  ]
}

#let owner = (
  acm-copyright: [ACM.],
  acm-licensed: [Copyright held by the owner/author(s). Publication rights licensed to ACM.],
  rights-retained: [Copyright held by the owner/author(s).],
  us-gov: [],
  us-gov-mixed: [Copyright held by the owner/author(s).],
  ca-gov: [Copyright Crown in Right of Canada.],
  ca-gov-mixed: [Copyright held by the owner/author(s).],
  licensed-us-gov-mixed: [Copyright held by the owner/author(s). Publication rights licensed to ACM.],
  licensed-ca-gov: [Copyright held by the owner/author(s).],
  licensed-ca-gov-mixed: [Copyright held by the owner/author(s). Publication rights licensed to ACM.],
  other-gov: [Copyright held by the owner/author(s).],
  licensed-other-gov: [Copyright held by the owner/author(s). Publication rights licensed to ACM.],
  iw3c2w3: [IW3C2 (International World Wide Web Conference Committee), published under Creative Commons CC-BY 4.0 License.],
  iw3c2w3g: [IW3C2 (International World Wide Web Conference Committee), published under Creative Commons CC-BY-NC-ND 4.0 License.],
  cc: [Copyright held by the owner/author(s).],
)

#let owner-keys = {
  let result = (:)

  for key in owner.keys() {
    result.insert(key, key)
  }

  result
}

#let permission-keys = {
  let result = (:)

  for key in permissions.keys() {
    result.insert(key, key)
  }

  result
}

#let processed(
  journal: none,
  copyright: none,
  permission: none,
  year: none,
  volume: none,
  number: none,
  article: none,
  month: none,
  doi: none,
) = {
  // Get the permission text
  let permission-text = permissions.at(copyright, default: [])

  // Get the copyright owner text
  let owner-text = owner.at(copyright, default: [])

  // Get journal info if provided
  let journal-info = if journal != none {
    journals.at(journal, default: none)
  } else {
    none
  }

  // Build the copyright notice
  let result = []

  // Add permission text
  if permission-text != [] {
    result += permission-text
    result += [ ]
  }

  // Add copyright symbol and year with owner
  if owner-text != [] {
    if year != none {
      result += [© #year #owner-text]
    } else {
      result += [© #owner-text]
    }
    result += [ ]
  }

  // Add ACM reference line (ISSN/Year/Month-Article or DOI format)
  if journal-info != none {
    // Determine which ISSN to use (prefer permission-code-2, fall back to permission-code-1)
    let issn = if journal-info.permission-code-2 != none {
      journal-info.permission-code-2
    } else {
      journal-info.permission-code-1
    }

    // Build the ACM reference string
    let acm-ref = [ACM ]

    // Add ISSN
    acm-ref += issn

    // Add year/month-article format
    if year != none {
      acm-ref += [/#year]

      if month != none {
        acm-ref += [/#month]
      }

      if article != none {
        acm-ref += [-ART#article]
      }
    }

    result += parbreak()
    result += acm-ref
  }

  // Add DOI link if provided
  if doi != none {
    result += parbreak()
    result += link("https://doi.org/" + doi)
  }

  return result
}
