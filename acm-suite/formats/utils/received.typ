#let received-state = state("received", ())

#let received(when: none, status: [Received]) = context {
  received-state.update(arr => arr + ((when: when, status: status),))
}

#let print-received() = context {
  let entries = received-state.final()
  entries.map(e => [#e.status #e.when]).join([; ])
}
