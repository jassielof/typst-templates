// Spanish student-paper starting point. Comments and customization guidance are in English. Replace the sample metadata, course details, and paper content.
#import "../lib.typ": versatile-apa, title-page, abstract-page, apa-figure, apa-table, appendix, appendix-outline, title-page-spacing

#set text(font: "Inter", lang: "es")
#set document(
  title: [La confianza en la escritura mediante la retroalimentación entre pares],
  // One author is sufficient for this simple student example. For coauthors sharing the same affiliation, use an array such as ("Alex Morgan", "Taylor Lee").
  author: "Alex Morgan",
  description: [La retroalimentación entre pares ofrece una oportunidad para revisar la claridad de un texto desde la perspectiva de sus lectores. Este ejemplo presenta actividades de revisión y una lista de criterios para orientar la escritura. Las cantidades de la tabla son ilustrativas y no corresponden a resultados de investigación.],
  keywords: ("retroalimentación entre pares", "escritura académica"),
)

// Custom terms override individual labels. Keep the default wording when your institution requires standard APA labels. For an unsupported language, provide all six keys: and, Author Note, Abstract, Keywords, Appendix, and Note.
#let custom-terms = (
  "Keywords": "Términos clave",
  "Appendix": "Material complementario",
)

#show: versatile-apa.with(custom-terms: custom-terms)

// Optional: adjust the space above the title. The default is 4em.
#title-page-spacing.update(3em)

// Authors and title fall back to the document metadata above, so there is no need to enter them twice. For a formatted name, pass authors: [Alex Morgan] here instead. This single affiliation is shared by every listed author; professional.typ demonstrates separate affiliations.
#title-page(
  affiliations: [Departamento de Educación, Universidad de Ejemplo],
  course: [EDUC 201: Escritura académica],
  instructor: [Dr. Jordan Rivera],
  due-date: [17 de noviembre de 2026],
)

// An abstract is optional for student papers unless the assignment requires one. Omitted body and keywords fall back to the document metadata above.
#abstract-page()

// This outline follows the actual appendix headings: the two below receive A and B. Remove the second appendix to see a single unlettered label.
#appendix-outline(title: [Material complementario])
#pagebreak()

#context [= #document.title]
La retroalimentación entre pares permite identificar preguntas que pueden surgir durante la lectura. Al revisar un borrador, quienes participan pueden señalar ideas poco claras y proponer formas de relacionar los argumentos con los ejemplos.

== Actividades de revisión
Las actividades de la @table:activities representan dos momentos del proceso de escritura: la lectura de un borrador y su revisión posterior. Las cantidades se incluyen únicamente para ilustrar la presentación de una tabla.

// Use a flat header array for one row. For grouped column headings, use an array of row arrays, as shown in sections/tables.typ. Row spans need no placeholder cells underneath them. Rules are automatic; header-separator: none disables the intermediate header rules.
#apa-figure(
  apa-table(
    columns: (1fr, auto),
    headers: ([Actividad], [Sesiones]),
    [Revisión entre pares], [3],
    [Taller de revisión], [2],
  ),
  caption: [Actividades ilustrativas de escritura],
  note: [Las cantidades son ilustrativas.],
) <table:activities>

// Specific-note and probability-note markers must be written explicitly; see sections/tables.typ for complete examples.
La revisión de un texto puede centrarse primero en su propósito y organización, y después en la claridad de cada párrafo. Esta secuencia permite relacionar las observaciones recibidas con decisiones concretas de escritura.

// The custom Appendix term changes the label to Material complementario. The following two level-one headings become appendices A and B; each starts a new page. With only one appendix, the heading has no letter, but its table still uses A1. Alternatively, pass supplement: "Annex" or "Addendum" to appendix.with(...).
#show: appendix
= Criterios para la retroalimentación
La lectura del borrador considera tres criterios: la claridad del propósito, la relación entre los argumentos y sus ejemplos, y la respuesta a las preguntas del lector.

// apa-table builds the tabular body. apa-figure makes it an APA table with a numbered caption, localized notes, a reference label, and the appendix prefix. A bare table would not provide these figure-level features. The wrapper is useful for tables presented and cited as academic objects; it is not needed for an uncaptioned layout table.
#apa-figure(
  apa-table(
    columns: (1fr, auto),
    headers: ([Criterio], [Preguntas]),
    [Claridad del propósito], [2],
    [Relación entre argumentos y ejemplos], [3],
  ),
  caption: [Criterios ilustrativos para la revisión],
  note: [Las cantidades son ilustrativas.],
) <table:checklist>

@table:checklist presenta los criterios del material complementario.


= Registro de revisiones
El registro relaciona cada criterio con una modificación del borrador. Las acciones descritas son ilustrativas y complementan los criterios de la @table:checklist.

// This is a second appendix, not a second table in appendix A. Its table counter restarts at 1 and its prefix changes to B, so the reference becomes Tabla B1. A second table before this heading would instead have been Tabla A2.
#apa-figure(
  apa-table(
    columns: (1fr, 1fr),
    headers: ([Criterio], [Revisión ilustrativa]),
    [Claridad del propósito], [Precisar el objetivo en el primer párrafo],
    [Relación entre argumentos y ejemplos], [Añadir una explicación después de cada ejemplo],
  ),
  caption: [Registro ilustrativo de revisiones],
  note: [Las acciones no corresponden a un estudio real.],
) <table:revisions>

@table:revisions organiza las acciones del material complementario.
