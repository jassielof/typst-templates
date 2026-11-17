# Changelog

## 7.3.0

### Added
- APA tables with flat or multirow header arrays, repeatable headers and footers, and automatic intermediate rules that respect row spans. The header separator can be customized or disabled.
- Configurable title-page spacing, defaulting to 4em.
- Word- or character-based quotation thresholds using wordometer 0.1.6.
- Title-page authors and abstract content can fall back to document metadata.
- Included student and professional samples using Inter: a Spanish student paper with custom terms, and a Spanish professional manuscript with Spanish, English, Traditional Chinese (Taiwan), and Japanese abstracts demonstrating built-in and custom labels.
- Appendix labels accept literal custom names, including Annex and Addendum.

### Changed
- The README is a short orientation guide; executable examples and customization instructions live in the template files. Authorship guidance is placed beside each sample’s title-page inputs, progressing from a single student author to professional coauthor mappings.
- Code listings use Codly in the feature gallery. The APA library no longer imposes raw-code styling.
- Table cells and footnotes use tighter spacing. Tables align left by default, and table figures support page breaks.
- Demographic-table categories use repeatable level-3 header rows.
- Title-page spacing uses a block inset instead of blank paragraphs. Appendix labels and titles are separated by a line break.
- Links use Typst’s default appearance instead of forced blue underlining.
- Quotations respect explicit block mode and avoid an extra first-line indent in block quotations.

### Fixed
- A single unlettered appendix still prefixes its figure and table numbers with A. The student sample demonstrates two appendices with separate A1 and B1 table counters.
- Authorship input validation reports missing author names, invalid affiliation formats, duplicate IDs, and unknown affiliation IDs before rendering. Shared affiliations stay simple; superscripts distinguish different assignments.
- Inline quotation marks respect smartquote settings, including Japanese marks.
- Outlines use appendix counters without repeating the appendix supplement; a single appendix has no counter. Nested headings retain their normal titles and indentation.
- Running heads remain visible across pages and show the current page number.
- Headings deeper than level 5 use level-5 styling while retaining their semantic level.
- Appendix figure numbering uses the preceding level-one heading; native appendix equations have their own appendix-prefixed counter.
- Math examples use native equation numbering, sentence punctuation, accessible descriptions, and references without figure captions. Corrected the Fibonacci example.
- Sample images, equations, and statistical notation have alternative descriptions for Typst’s PDF/UA-1 export checks.

### Breaking changes and migration
- Requires Typst 0.15.0 or later for the bundled Codly examples.
- Removed the running-head-limit parameter. Remove it from style calls and check APA’s 50-character limit yourself.
- Renamed quote-word-trigger to quote-block-trigger; update imports and state updates.
- Abstract bodies are now named arguments: replace abstract-page(content) with abstract-page(body: content).
- Abstracts no longer update document metadata by default. Enable modify-document-metadata to restore that behavior.
- Renamed authoring.typ to authorship.typ; update any direct imports of that module.
- Moved utils/ to lib/. Prefer public entrypoint imports; update any direct file imports. The entrypoint no longer exports to-string.
- Removed global APA table strokes. Use apa-table or configure your own table strokes.
