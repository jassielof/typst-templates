# Versatile APA 7th Edition Template for Typst

A template for student and professional papers following APA 7th Edition conventions. Check the requirements of your instructor, institution, or journal before submitting a paper.

## Start with a sample

Open the template from Typst Universe, then choose the file that best matches your task:

- **[student.typ](template/student.typ)** — a short Spanish student paper using Inter, with custom wording, a table, and two appendices demonstrating table numbering.
- **[professional.typ](template/professional.typ)** — a Spanish professional manuscript using Inter, with author affiliations and abstracts in Spanish, English, Traditional Chinese (Taiwan), and Japanese.
- **[paper.typ](template/paper.typ)** — the introductory manual and feature gallery, with working examples of headings, quotations, code listings, equations, references, tables, figures, and appendices.

The template files contain the code examples and customization instructions. Edit a working example and compile it to see the result. Start with the document details and authors, then keep only the sections your paper needs.

## Features and examples

- **Authorship:** start with the single author and shared affiliation in [student.typ](template/student.typ). The [professional sample](template/professional.typ) explains coauthor affiliation mappings; [paper.typ](template/paper.typ) explains every accepted format beside its title-page setup. Superscripts are automatic, and errors explain invalid names and affiliation IDs.
- **Smart quotations:** automatic inline/block layout at 40 words, explicit block mode, and configurable character thresholds and quotation marks for non-Latin text. See [quotations](template/sections/quotes.typ).
- **Smart appendices:** a single appendix has no heading letter; multiple appendices receive A, B, and so on. The outlines show the appendix letters without repeating the label; a single appendix entry has no letter. Figures, tables, listings, and equations restart with an appendix prefix. The student sample demonstrates two appendices; remove its second appendix to see the single-appendix behavior. See the [appendix gallery](template/sections/appendix.typ).
- **Custom terms and languages:** built-in labels in English, Spanish, Portuguese, German, Italian, French, Dutch, Serbian, and Indonesian. The student sample changes individual labels; the professional sample supplies complete Chinese and Japanese translations and restores the defaults afterward.
- **Tables and figures:** APA-style captions, notes, multirow headers, and automatic header rules. See [tables](template/sections/tables.typ) and [figures](template/sections/figures.typ).
- **Other building blocks:** abstracts, keywords, headings, lists, footnotes, numbered equations, references, and Codly listings are demonstrated in paper.typ and its sections.

## Fonts and accessibility

The student and professional samples use **Inter**. Install it locally if your compiler cannot find it, or choose an available font that meets your institution’s requirements. The feature gallery uses Typst’s default fonts.

The examples include alternative descriptions for images and equations. Provide descriptions for your own content too. Passing Typst’s PDF/UA-1 checks does not replace reviewing reading order, descriptions, and screen-reader usability.

## Sources and contributions

The template is informed by the [APA Style guidelines](https://apastyle.apa.org/) and the LaTeX apa7 class. Journal-specific layouts are outside its scope. For corrections, translations, or additional examples, use the [repository](https://github.com/jassielof/typst-templates).

## License

Licensed under [Apache 2.0](LICENSE.txt). Versions before 7.2.0 may be used under MIT or MIT-0, as described by their original licensing history.
