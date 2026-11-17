// Spanish professional-manuscript starting point. Replace the metadata, authors, affiliations, and author note.
#import "../lib.typ": versatile-apa, title-page, abstract-page, appendix, language-terms

#set text(font: "Inter", lang: "es")
#set document(
  title: [La retroalimentación entre pares en la escritura académica],
  description: "Ejemplo didáctico de un manuscrito profesional en español con resúmenes en español, inglés, chino tradicional y japonés.",
  keywords: ("retroalimentación", "escritura académica"),
)

#show: versatile-apa.with(
  // Check the APA 50-character limit; the template does not validate it.
  running-head: "Retroalimentación y escritura académica",
)

// Use explicit mappings when professional coauthors have different affiliations. This dictionary contains named author records; its keys (lopez and perez) are not printed. An array of the same records is also accepted, as shown in paper.typ.
// Each record requires name and can supply one affiliation ID or an array of IDs. Every referenced ID must exist in the affiliations dictionary below. A single unnamed affiliation cannot resolve IDs; the error explains how to correct that input.
// Superscripts are generated automatically from the mappings. Identical assignments need no superscripts, unused affiliations are omitted, and an author record without IDs stays unassigned when other records use IDs. Keep affiliations as they were when the work was carried out; explain relevant changes in the author note.
#title-page(
  authors: (
    lopez: (name: [María López], affiliations: ("educacion",)),
    perez: (name: [Diego Pérez], affiliations: ("educacion", "psicologia")),
  ),
  affiliations: (
    "educacion": [Departamento de Educación, Universidad de Ejemplo],
    "psicologia": [Departamento de Psicología, Universidad de Ejemplo],
  ),
  author-note: [
    Este documento es un ejemplo didáctico con autores ficticios. No presenta resultados de investigación ni declara una publicación real.

    La correspondencia sobre este ejemplo puede dirigirse a #link("mailto:autoria@example.org").
  ],
)

// Four separate abstract pages demonstrate language selection. Spanish and English use built-in labels; Traditional Chinese (Taiwan) and Japanese need custom terms. Keep the languages required by your institution or journal.
// Inter remains the document font. Chinese and Japanese glyphs use the compiler’s font fallback; install suitable CJK fonts if your environment lacks them.

// 1. Native language: Spanish. The template supplies Resumen and Palabras clave.
#abstract-page(
  body: [Este ejemplo didáctico presenta un manuscrito profesional en español con resúmenes en cuatro idiomas. Ilustra las afiliaciones de los autores, la selección del idioma, el encabezado y el material complementario. No presenta resultados de investigación.],
  keywords: ("retroalimentación entre pares", "escritura académica", "diseño de documentos"),
)

// 2. Another supported language: English. Changing the text language also selects the built-in abstract and keyword labels.
#set text(lang: "en")
#abstract-page(
  body: [This instructional sample presents a Spanish professional manuscript with abstracts in four languages. It illustrates author affiliations, language selection, a running head, and supplementary material. It reports no empirical findings.],
  keywords: ("peer feedback", "academic writing", "document design"),
)

// 3. Unsupported language: Traditional Chinese as used in Taiwan, selected with lang and region. Use the English keys expected by the template and translate their values.
#let chinese-terms = (
  "and": "與",
  "Author Note": "作者註",
  "Abstract": "摘要",
  "Keywords": "關鍵詞",
  "Appendix": "附錄",
  "Note": "註",
)
#set text(lang: "zh", region: "TW")
// The language-terms state changes labels for the following content without reapplying the document style or changing the running head.
#language-terms.update(chinese-terms)
#abstract-page(
  body: [本教學範例展示一份西班牙文專業論文，並提供四種語言的摘要。內容示範作者所屬機構、語言設定、頁首與補充資料的排版。本範例不呈現實證研究結果。],
  // Keyword arrays use comma-space separators; content preserves language-specific list punctuation.
  keywords: [同儕回饋、學術寫作、文件設計],
)

// 4. Unsupported language: Japanese. Replace the complete term dictionary so Chinese labels do not carry into this abstract.
#let japanese-terms = (
  "and": "と",
  "Author Note": "著者注",
  "Abstract": "要旨",
  "Keywords": "キーワード",
  "Appendix": "付録",
  "Note": "注",
)
#set text(lang: "ja", region: "JP")
#language-terms.update(japanese-terms)
#abstract-page(
  body: [この教材用サンプルは、四つの言語による要旨を備えたスペイン語の専門論文の構成を示します。著者の所属、言語の設定、ページ上部の見出し、補足資料の組版を例示しています。実証研究の結果は報告していません。],
  // Japanese keyword content uses ideographic list commas rather than Latin commas.
  keywords: [ピアフィードバック、学術的文章作成、文書設計],
)

// Restore the native language and built-in labels before the body. State updates persist until changed again, so both resets are needed.
#language-terms.update((:))
#set text(lang: "es", region: none)

#context [= #document.title]
La retroalimentación entre pares permite revisar un texto desde la perspectiva de sus lectores. Este ejemplo muestra cómo organizar un manuscrito profesional y combinar idiomas sin cambiar la configuración del resto del documento.

== Organización del manuscrito
Describa el propósito del trabajo y explique los ejemplos antes de presentarlos. Consulte paper.typ para ver tablas, figuras, citas, ecuaciones y referencias en contexto.

// Custom appendix names also work without changing the library.
#show: appendix.with(supplement: "Adenda")
= Lista de revisión
Compruebe los nombres y las afiliaciones, el idioma del resumen y las referencias internas antes de entregar el documento.
