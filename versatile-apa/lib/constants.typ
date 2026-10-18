#let double-spacing = 1.5em
#let first-indent-length = 0.5in
#let quote-word-trigger = state("quote-word-trigger", 40)

/// Vertical space above the title on the title page. APA asks for the title in the upper half of the page, "three or four lines down from the top margin" (APA 7, section 2.4). Change it with `title-page-spacing.update(3em)`.
#let title-page-spacing = state("title-page-spacing", 4em)

/// Strict mode: `false`, `"student"` or `"professional"`. Set by `versatile-apa`.
#let apa-strict = state("apa-strict", false)

/// `true` once the appendices start; used to allow their numbering in strict mode.
#let in-appendix = state("in-appendix", false)
