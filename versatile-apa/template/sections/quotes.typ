#import "../../lib.typ": quote-block-trigger, quote-unit

= Quotation
== Short Quotation (fewer than 40 words)
Effective teams can be difficult to describe because #quote(attribution: [(Ervin et al., 2018, p. 470)])[high performance along one domain does not translate to high performance along another]

== Long Quotation (40 words or more)
=== Block quotation with parenthetical citation
Researchers have studied how people talk to themselves:
#quote(attribution: [(Alderson-Day & Fernyhough, 2015, p. 957)])[
  Inner speech is a paradoxical phenomenon. It is an experience that is central to many people’s everyday lives, and yet it presents considerable challenges to any effort to study it scientifically. Nevertheless, a wide range of methodologies and approaches have combined to shed light on the subjective experience of inner speech and its cognitive and neural underpinnings.
]

=== Block quotation with narrative citation
Flores et al. (2018) described how they addressed potential researcher bias when working with an intersectional community of transgender people of color:
#quote(attribution: [(p. 311)])[
  Everyone on the research team belonged to a stigmatized group but also held privileged identities. Throughout the research process, we attended to the ways in which our privileged and oppressed identities may have influenced the research process, findings, and presentation of results.
]

== Using characters as the threshold for Japanese text
#set text(lang: "ja")

#quote-unit.update("characters")
#quote-block-trigger.update(100)
#set smartquote(quotes: (
  double: ("「", "」"),
  single: ("『", "』"),
))

Automatically set as a block:

// "Kusamakura" (草枕 / Grass Pillow), a 1906 novel by Natsume Sōseki (夏目漱石).
// The famous opening passage of the novel. It explores the artist's internal struggle between intellect, emotion, and stubbornness in human society, concluding that art is born when one realizes there is no escape from life's hardships.
#quote(attribution: [夏目漱石『草枕』])[
  山路を登りながら、こう考えた。
  智に働けば角が立つ。情に棹させば流される。意地を通せば窮屈だ。とにかくに人の世は住みにくい。
  住みにくさが高じると、安い所へ引き越したくなる。どこへ引き越しても住みにくいと悟った時、詩が生まれて、画が出来る。
]

// "No Longer Human" (人間失格 / Ningen Shikkaku), a 1948 novel by Osamu Dazai (太宰治).
// The iconic opening line of the main character's journal. It captures the profound feelings of alienation, shame, and inability to understand or fit into normal human society that define the entire tragic narrative.
Inline quote: #quote(attribution: [太宰治『人間失格』])[恥の多い生涯を送って来ました。自分には、人間の営みというものが、見当つかないのです。]

// Revert to words as the threshold for English text
#quote-unit.update("words")
#quote-block-trigger.update(40)
