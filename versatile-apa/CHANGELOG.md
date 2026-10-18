# Changelog

## 7.3.0

### Added

- Strict mode: `versatile-apa(strict: "student" | "professional")` turns the checkable rules of the APA 7 manual into compile errors that name the manual section. Disabled by default (`strict: false`). See the README for the list of rules.
- `title-page-spacing` state to configure the space above the title on the title page (`4em` by default; APA suggests three or four lines).
- `apa-figure` closes tables with a bottom rule, as APA tables have rules above and below the header and at the bottom. Plain `table` elements outside `apa-figure` are not affected.
- `reference/apa-manual.md`, a Markdown conversion of the APA manual used as the source for the rules.
- `title-page()` shows the names from `set document(author: ..)` when `authors` is not passed.

### Changed

- The introduction heading of the template uses the document title (`= #context document.title`) instead of `std.title()`.
- The space above the title on the title page is vertical spacing (`v()`) instead of four paragraph breaks.
- The appendix label and title are separated by a line break instead of a paragraph break.
- The `utils` folder is now `lib`.

### Removed

- **Breaking:** the `running-head-limit` parameter of `versatile-apa`. The 50 character limit no longer applies in the default mode; it is enforced only by `strict: "professional"`.
