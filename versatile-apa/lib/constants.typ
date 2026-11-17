// The spacing between lines and paragraphs in the document.
#let double-spacing = 1.5em

// The indentation length for the first line of a paragraph.
#let first-indent-length = 0.5in

/// The length required for the quotation to automatically become a block quote.
///
/// See https://apastyle.apa.org/style-grammar-guidelines/citations/quotations/
#let quote-block-trigger = state("quote-word", 40)

/// The unit used for the quote length trigger. Can be words or characters. Special for languages like Japanese.
///
/// See https://apastyle.apa.org/style-grammar-guidelines/citations/quotations/
#let quote-unit = state("quote-unit", "words")

/// The vertical space above the title on the title page.
///
/// See https://apastyle.apa.org/style-grammar-guidelines/paper-format/title-page
#let title-page-spacing = state("title-page-spacing", 4em)

/// See https://apastyle.apa.org/style-grammar-guidelines/paper-format/page-header
#let running-head-limit = state("running-head-limit", 50)
