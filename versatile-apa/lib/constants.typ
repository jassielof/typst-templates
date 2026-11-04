#let double-spacing = 1.5em
#let first-indent-length = 0.5in

/// The length required for the quotation to become a block quote.
#let quote-block-trigger = state("quote-word", 40)

/// The unit used for the quote length trigger. Can be `"words"` or `"characters"`.
#let quote-unit = state("quote-unit", "words")

/// Vertical space above the title on the title page. APA asks for the title in the upper half of the page, "three or four lines down from the top margin" (APA 7, section 2.4).
#let title-page-spacing = state("title-page-spacing", 4em)

/// Strict mode: `false`, `"student"` or `"professional"`. Set by `versatile-apa`.
#let apa-strict = state("apa-strict", false)

/// `true` once the appendices start; used to allow their numbering in strict mode.
#let in-appendix = state("in-appendix", false)
