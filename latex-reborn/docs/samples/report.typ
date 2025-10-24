#set math.equawtion(numbering: )
== Introducción
<introducción>
Este capítulo introduce el contexto y los objetivos del trabajo.
Presenta el problema, la motivación y el alcance general del proyecto.

== Marco Teórico Extenso: Un recorrido exhaustivo por conceptos, definiciones, antecedentes, taxonomías y fundamentos necesarios para comprender la propuesta presentada en este Trabajo Final de Grado
<marco-teórico-extenso-un-recorrido-exhaustivo-por-conceptos-definiciones-antecedentes-taxonomías-y-fundamentos-necesarios-para-comprender-la-propuesta-presentada-en-este-trabajo-final-de-grado>
En este capítulo se desarrollan los conceptos clave, se revisa la
literatura relevante y se establecen las bases teóricas que sustentan la
solución propuesta.

== Trabajo Relacionado
<trabajo-relacionado>
== Metodología: Diseño, planificación, ejecución de experimentos, recolección y análisis de datos, y consideraciones éticas y prácticas en entornos reales y simulados con múltiples iteraciones y validaciones
<metodología-diseño-planificación-ejecución-de-experimentos-recolección-y-análisis-de-datos-y-consideraciones-éticas-y-prácticas-en-entornos-reales-y-simulados-con-múltiples-iteraciones-y-validaciones>
Se describe el enfoque metodológico, los pasos seguidos y las
herramientas empleadas. Asimismo, se detallan los criterios de
evaluación y los procedimientos de validación.

== Resultados
<resultados>
Se presentan los resultados principales, incluyendo métricas,
observaciones y hallazgos relevantes derivados de los experimentos
realizados.

== Conclusiones y Trabajo Futuro con un título extraordinariamente largo que estresa el diseño del índice, cabeceras y marcadores, verificando el manejo correcto de textos extensos sin desbordes ni truncamientos indeseados
<conclusiones-y-trabajo-futuro-con-un-título-extraordinariamente-largo-que-estresa-el-diseño-del-índice-cabeceras-y-marcadores-verificando-el-manejo-correcto-de-textos-extensos-sin-desbordes-ni-truncamientos-indeseados>
Se resumen los aportes del trabajo, se discuten las limitaciones y se
proponen líneas de trabajo futuro.

== Agradecimientos
<agradecimientos>
#heading(level: 2, numbering: none)[Glosario Ampliado y Lista de
Acrónimos con una Denominación Extensa para Probar Encabezados y Tabla
de Contenidos en Diferentes Anchos de Página]
<glosario-ampliado-y-lista-de-acrónimos-con-una-denominación-extensa-para-probar-encabezados-y-tabla-de-contenidos-en-diferentes-anchos-de-página>
Este apartado reúne términos clave y sus definiciones, así como los
acrónimos utilizados a lo largo del documento.

== Ejemplos exhaustivos de figuras, tablas, listados y ecuaciones
<ejemplos-exhaustivos-de-figuras-tablas-listados-y-ecuaciones>
Este capítulo muestra ejemplos completos de uso de figuras, tablas,
listados de código y ecuaciones, con referencias cruzadas.

=== Figuras (marcadores de imagen)
<figuras-marcadores-de-imagen>
En la figura @fig:placeholder1 se muestra un marcador simple. En la
figura @fig:placeholder2 se usa un recuadro con texto centrado. La
figura @fig:placeholder-side-by-side muestra dos marcadores en paralelo.

#figure([],
  caption: [
    Marcador de imagen vacío (proporción libre)
  ]
)
<fig:placeholder1>

#figure([],
  caption: [
    Marcador de imagen con texto centrado
  ]
)
<fig:placeholder2>

#figure([#block[
  \(a) Ejemplo A

  ]
  #block[
  \(b) Ejemplo B

  ]],
  caption: [
    Dos marcadores de imagen en paralelo
  ]
)
<fig:placeholder-side-by-side>

=== Tablas
<tablas>
La tabla @tab:basica muestra una tabla básica. La tabla @tab:agrupada
incluye cabeceras agrupadas.

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (left,center,right,),
    table.header([Columna A], [Columna B], [Columna C],),
    table.hline(),
    [Alfa], [10], [Sí],
    [Beta], [20], [No],
    [Gamma], [30], [Sí],
  )]
  , caption: [Tabla básica con tres columnas]
  , kind: table
  )

] <tab:basica>
#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (left,center,center,),
    table.header([], table.cell(align: center, colspan: 2)[Medidas],),
    table.hline(),
    [2-3 Ítem], [Ancho], [Alto],
    [A], [12], [5],
    [B], [7], [3],
    [C], [9], [8],
  )]
  , caption: [Tabla con cabecera agrupada]
  , kind: table
  )

] <tab:agrupada>
=== Listados de código
<listados-de-código>
A continuación, se muestran listados de código incluidos en un entorno
flotante para permitir pies de figura y etiquetas.

#figure([#block[
  ```
  # Python: función Fibonacci con memoización simple
  def fibonacci(n, cache=None):
      if cache is None:
          cache = {}
      if n < 2:
          return n
      if n in cache:
          return cache[n]
      cache[n] = fibonacci(n-1, cache) + fibonacci(n-2, cache)
      return cache[n]

  print([fibonacci(i) for i in range(10)])
  ```

  ]],
  caption: [
    Listado: función en Python
  ]
)
<lst:python>

#figure([#block[
  ```
  {
    "service": "api",
    "version": 1,
    "features": ["auth", "cache", "metrics"],
    "limits": { "rate_per_minute": 120, "burst": 30 }
  }
  ```

  ]],
  caption: [
    Listado: configuración JSON de ejemplo
  ]
)
<lst:json>

=== Ecuaciones
<ecuaciones>
A continuación se muestran ejemplos de ecuaciones en línea y
desplegadas. Véase la ecuación @eq:pitagoras y el sistema en
@eq:sistema.

Texto con matemática en línea: si $x \, y in bb(R)$, entonces
$z = x + y$.

Ecuación numerada: $ a^2 + b^2 = c^2 $<eq:pitagoras>

Derivación en varias líneas con alineación: $ S & = & sum_(i = 1)^n i\
 & = & 1 + 2 + dots.h.c + n\
 & = & frac(n \( n + 1 \), 2) $<eq:suma>

Matriz con notación de corchetes:
$ A = mat(delim: "[", 1, 0, 2; - 1, 3, 1) $

Función a trozos:
$ f \( x \) = cases(delim: "{", x^2 & upright("si ") x gt.eq 0 \,, - x & upright("si ") x < 0 .) $<eq:sistema>

Producto escalar y norma:
$ angle.l upright(bold(u)) \, upright(bold(v)) angle.r = sum_(i = 1)^n u_i v_i \, #h(2em) parallel upright(bold(u)) parallel = sqrt(angle.l upright(bold(u)) \, upright(bold(u)) angle.r) . $

Referencias cruzadas de ejemplo: figura @fig:placeholder2, tabla
@tab:agrupada, listado @lst:python y ecuación @eq:suma.

=== Short Section
<short-section>
==== Short Subsection
<short-subsection>
===== Short Subsubsection
<short-subsubsection>
====== Short Paragraph
<short-paragraph>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples>
==== Short
<short>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body>
====== Short
<short-1>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-1>
==== Short Subsection
<short-subsection-1>
===== Short Subsubsection
<short-subsubsection-1>
====== Short Paragraph
<short-paragraph-1>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-1>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-1>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-1>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-1>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-1>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-1>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-1>
==== Short
<short-2>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-1>
====== Short
<short-3>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-1>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-1>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-1>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-1>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-1>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-1>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-2>
==== Short Subsection
<short-subsection-2>
===== Short Subsubsection
<short-subsubsection-2>
====== Short Paragraph
<short-paragraph-2>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-2>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-2>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-2>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-2>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-2>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-2>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-2>
==== Short
<short-4>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-2>
====== Short
<short-5>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-2>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-2>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-2>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-2>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-2>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-2>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-3>
==== Short Subsection
<short-subsection-3>
===== Short Subsubsection
<short-subsubsection-3>
====== Short Paragraph
<short-paragraph-3>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-3>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-3>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-3>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-3>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-3>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-3>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-3>
==== Short
<short-6>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-3>
====== Short
<short-7>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-3>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-3>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-3>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-3>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-3>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-3>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-4>
==== Short Subsection
<short-subsection-4>
===== Short Subsubsection
<short-subsubsection-4>
====== Short Paragraph
<short-paragraph-4>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-4>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-4>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-4>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-4>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-4>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-4>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-4>
==== Short
<short-8>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-4>
====== Short
<short-9>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-4>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-4>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-4>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-4>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-4>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-4>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-5>
==== Short Subsection
<short-subsection-5>
===== Short Subsubsection
<short-subsubsection-5>
====== Short Paragraph
<short-paragraph-5>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-5>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-5>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-5>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-5>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-5>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-5>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-5>
==== Short
<short-10>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-5>
====== Short
<short-11>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-5>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-5>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-5>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-5>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-5>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-5>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-6>
==== Short Subsection
<short-subsection-6>
===== Short Subsubsection
<short-subsubsection-6>
====== Short Paragraph
<short-paragraph-6>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-6>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-6>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-6>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-6>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-6>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-6>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-6>
==== Short
<short-12>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-6>
====== Short
<short-13>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-6>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-6>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-6>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-6>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-6>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-6>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-7>
==== Short Subsection
<short-subsection-7>
===== Short Subsubsection
<short-subsubsection-7>
====== Short Paragraph
<short-paragraph-7>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-7>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-7>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-7>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-7>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-7>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-7>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-7>
==== Short
<short-14>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-7>
====== Short
<short-15>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-7>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-7>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-7>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-7>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-7>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-7>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-8>
==== Short Subsection
<short-subsection-8>
===== Short Subsubsection
<short-subsubsection-8>
====== Short Paragraph
<short-paragraph-8>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-8>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-8>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-8>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-8>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-8>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-8>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-8>
==== Short
<short-16>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-8>
====== Short
<short-17>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-8>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-8>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-8>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-8>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-8>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-8>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-9>
==== Short Subsection
<short-subsection-9>
===== Short Subsubsection
<short-subsubsection-9>
====== Short Paragraph
<short-paragraph-9>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-9>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-9>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-9>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-9>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-9>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-9>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-9>
==== Short
<short-18>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-9>
====== Short
<short-19>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-9>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-9>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-9>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-9>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-9>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-9>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-10>
==== Short Subsection
<short-subsection-10>
===== Short Subsubsection
<short-subsubsection-10>
====== Short Paragraph
<short-paragraph-10>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-10>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-10>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-10>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-10>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-10>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-10>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-10>
==== Short
<short-20>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-10>
====== Short
<short-21>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-10>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-10>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-10>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-10>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-10>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-10>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-11>
==== Short Subsection
<short-subsection-11>
===== Short Subsubsection
<short-subsubsection-11>
====== Short Paragraph
<short-paragraph-11>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-11>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-11>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-11>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-11>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-11>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-11>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-11>
==== Short
<short-22>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-11>
====== Short
<short-23>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-11>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-11>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-11>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-11>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-11>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-11>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-12>
==== Short Subsection
<short-subsection-12>
===== Short Subsubsection
<short-subsubsection-12>
====== Short Paragraph
<short-paragraph-12>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-12>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-12>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-12>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-12>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-12>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-12>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-12>
==== Short
<short-24>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-12>
====== Short
<short-25>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-12>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-12>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-12>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-12>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-12>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-12>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-13>
==== Short Subsection
<short-subsection-13>
===== Short Subsubsection
<short-subsubsection-13>
====== Short Paragraph
<short-paragraph-13>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-13>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-13>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-13>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-13>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-13>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-13>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-13>
==== Short
<short-26>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-13>
====== Short
<short-27>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-13>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-13>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-13>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-13>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-13>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-13>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-14>
==== Short Subsection
<short-subsection-14>
===== Short Subsubsection
<short-subsubsection-14>
====== Short Paragraph
<short-paragraph-14>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-14>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-14>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-14>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-14>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-14>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-14>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-14>
==== Short
<short-28>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-14>
====== Short
<short-29>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-14>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-14>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-14>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-14>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-14>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-14>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-15>
==== Short Subsection
<short-subsection-15>
===== Short Subsubsection
<short-subsubsection-15>
====== Short Paragraph
<short-paragraph-15>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-15>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-15>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-15>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-15>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-15>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-15>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-15>
==== Short
<short-30>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-15>
====== Short
<short-31>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-15>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-15>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-15>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-15>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-15>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-15>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-16>
==== Short Subsection
<short-subsection-16>
===== Short Subsubsection
<short-subsubsection-16>
====== Short Paragraph
<short-paragraph-16>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-16>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-16>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-16>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-16>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-16>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-16>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-16>
==== Short
<short-32>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-16>
====== Short
<short-33>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-16>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-16>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-16>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-16>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-16>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-16>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-17>
==== Short Subsection
<short-subsection-17>
===== Short Subsubsection
<short-subsubsection-17>
====== Short Paragraph
<short-paragraph-17>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-17>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-17>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-17>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-17>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-17>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-17>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-17>
==== Short
<short-34>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-17>
====== Short
<short-35>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-17>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-17>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-17>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-17>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-17>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-17>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-18>
==== Short Subsection
<short-subsection-18>
===== Short Subsubsection
<short-subsubsection-18>
====== Short Paragraph
<short-paragraph-18>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-18>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-18>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-18>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-18>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-18>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-18>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-18>
==== Short
<short-36>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-18>
====== Short
<short-37>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-18>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-18>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-18>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-18>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-18>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-18>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-19>
==== Short Subsection
<short-subsection-19>
===== Short Subsubsection
<short-subsubsection-19>
====== Short Paragraph
<short-paragraph-19>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-19>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-19>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-19>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-19>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-19>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-19>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-19>
==== Short
<short-38>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-19>
====== Short
<short-39>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-19>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-19>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-19>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-19>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-19>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-19>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-20>
==== Short Subsection
<short-subsection-20>
===== Short Subsubsection
<short-subsubsection-20>
====== Short Paragraph
<short-paragraph-20>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-20>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-20>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-20>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-20>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-20>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-20>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-20>
==== Short
<short-40>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-20>
====== Short
<short-41>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-20>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-20>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-20>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-20>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-20>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-20>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-21>
==== Short Subsection
<short-subsection-21>
===== Short Subsubsection
<short-subsubsection-21>
====== Short Paragraph
<short-paragraph-21>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-21>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-21>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-21>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-21>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-21>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-21>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-21>
==== Short
<short-42>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-21>
====== Short
<short-43>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-21>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-21>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-21>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-21>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-21>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-21>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-22>
==== Short Subsection
<short-subsection-22>
===== Short Subsubsection
<short-subsubsection-22>
====== Short Paragraph
<short-paragraph-22>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-22>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-22>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-22>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-22>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-22>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-22>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-22>
==== Short
<short-44>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-22>
====== Short
<short-45>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-22>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-22>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-22>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-22>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-22>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-22>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-23>
==== Short Subsection
<short-subsection-23>
===== Short Subsubsection
<short-subsubsection-23>
====== Short Paragraph
<short-paragraph-23>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-23>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-23>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-23>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-23>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-23>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-23>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-23>
==== Short
<short-46>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-23>
====== Short
<short-47>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-23>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-23>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-23>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-23>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-23>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-23>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-24>
==== Short Subsection
<short-subsection-24>
===== Short Subsubsection
<short-subsubsection-24>
====== Short Paragraph
<short-paragraph-24>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-24>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-24>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-24>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-24>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-24>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-24>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-24>
==== Short
<short-48>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-24>
====== Short
<short-49>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-24>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-24>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-24>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-24>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-24>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-24>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-25>
==== Short Subsection
<short-subsection-25>
===== Short Subsubsection
<short-subsubsection-25>
====== Short Paragraph
<short-paragraph-25>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-25>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-25>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-25>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-25>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-25>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-25>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-25>
==== Short
<short-50>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-25>
====== Short
<short-51>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-25>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-25>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-25>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-25>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-25>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-25>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-26>
==== Short Subsection
<short-subsection-26>
===== Short Subsubsection
<short-subsubsection-26>
====== Short Paragraph
<short-paragraph-26>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-26>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-26>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-26>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-26>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-26>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-26>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-26>
==== Short
<short-52>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-26>
====== Short
<short-53>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-26>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-26>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-26>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-26>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-26>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-26>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-27>
==== Short Subsection
<short-subsection-27>
===== Short Subsubsection
<short-subsubsection-27>
====== Short Paragraph
<short-paragraph-27>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-27>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-27>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-27>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-27>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-27>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-27>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-27>
==== Short
<short-54>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-27>
====== Short
<short-55>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-27>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-27>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-27>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-27>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-27>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-27>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-28>
==== Short Subsection
<short-subsection-28>
===== Short Subsubsection
<short-subsubsection-28>
====== Short Paragraph
<short-paragraph-28>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-28>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-28>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-28>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-28>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-28>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-28>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-28>
==== Short
<short-56>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-28>
====== Short
<short-57>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-28>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-28>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-28>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-28>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-28>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-28>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-29>
==== Short Subsection
<short-subsection-29>
===== Short Subsubsection
<short-subsubsection-29>
====== Short Paragraph
<short-paragraph-29>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-29>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-29>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-29>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-29>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-29>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-29>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-29>
==== Short
<short-58>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-29>
====== Short
<short-59>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-29>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-29>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-29>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-29>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-29>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-29>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

=== Short Section
<short-section-30>
==== Short Subsection
<short-subsection-30>
===== Short Subsubsection
<short-subsubsection-30>
====== Short Paragraph
<short-paragraph-30>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-30>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-30>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-30>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-30>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-30>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-30>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-30>
==== Short
<short-60>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-30>
====== Short
<short-61>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-30>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-30>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-30>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-30>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-30>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-30>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-1>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-1>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada>
=== Short Section
<short-section-31>
==== Short Subsection
<short-subsection-31>
===== Short Subsubsection
<short-subsubsection-31>
====== Short Paragraph
<short-paragraph-31>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-31>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-31>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-31>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-31>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-31>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-31>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-31>
==== Short
<short-62>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-31>
====== Short
<short-63>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-31>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-31>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-31>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-31>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-31>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-31>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-2>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-1>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-1>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-2>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-1>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-1>
=== Short Section
<short-section-32>
==== Short Subsection
<short-subsection-32>
===== Short Subsubsection
<short-subsubsection-32>
====== Short Paragraph
<short-paragraph-32>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-32>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-32>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-32>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-32>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-32>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-32>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-32>
==== Short
<short-64>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-32>
====== Short
<short-65>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-32>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-32>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-32>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-32>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-32>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-32>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-3>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-2>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-2>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-3>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-2>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-2>
=== Short Section
<short-section-33>
==== Short Subsection
<short-subsection-33>
===== Short Subsubsection
<short-subsubsection-33>
====== Short Paragraph
<short-paragraph-33>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-33>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-33>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-33>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-33>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-33>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-33>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-33>
==== Short
<short-66>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-33>
====== Short
<short-67>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-33>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-33>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-33>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-33>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-33>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-33>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-4>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-3>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-3>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-4>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-3>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-3>
=== Short Section
<short-section-34>
==== Short Subsection
<short-subsection-34>
===== Short Subsubsection
<short-subsubsection-34>
====== Short Paragraph
<short-paragraph-34>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-34>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-34>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-34>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-34>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-34>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-34>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-34>
==== Short
<short-68>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-34>
====== Short
<short-69>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-34>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-34>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-34>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-34>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-34>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-34>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-5>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-4>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-4>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-5>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-4>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-4>
=== Short Section
<short-section-35>
==== Short Subsection
<short-subsection-35>
===== Short Subsubsection
<short-subsubsection-35>
====== Short Paragraph
<short-paragraph-35>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-35>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-35>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-35>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-35>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-35>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-35>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-35>
==== Short
<short-70>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-35>
====== Short
<short-71>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-35>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-35>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-35>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-35>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-35>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-35>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-6>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-5>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-5>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-6>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-5>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-5>
=== Short Section
<short-section-36>
==== Short Subsection
<short-subsection-36>
===== Short Subsubsection
<short-subsubsection-36>
====== Short Paragraph
<short-paragraph-36>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-36>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-36>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-36>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-36>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-36>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-36>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-36>
==== Short
<short-72>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-36>
====== Short
<short-73>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-36>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-36>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-36>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-36>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-36>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-36>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-7>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-6>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-6>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-7>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-6>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-6>
=== Short Section
<short-section-37>
==== Short Subsection
<short-subsection-37>
===== Short Subsubsection
<short-subsubsection-37>
====== Short Paragraph
<short-paragraph-37>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-37>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-37>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-37>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-37>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-37>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-37>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-37>
==== Short
<short-74>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-37>
====== Short
<short-75>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-37>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-37>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-37>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-37>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-37>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-37>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-8>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-7>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-7>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-8>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-7>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-7>
=== Short Section
<short-section-38>
==== Short Subsection
<short-subsection-38>
===== Short Subsubsection
<short-subsubsection-38>
====== Short Paragraph
<short-paragraph-38>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-38>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-38>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-38>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-38>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-38>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-38>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-38>
==== Short
<short-76>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-38>
====== Short
<short-77>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-38>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-38>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-38>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-38>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-38>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-38>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-9>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-8>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-8>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-9>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-8>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-8>
=== Short Section
<short-section-39>
==== Short Subsection
<short-subsection-39>
===== Short Subsubsection
<short-subsubsection-39>
====== Short Paragraph
<short-paragraph-39>
This is a run-in paragraph heading; the text follows immediately in the
same paragraph for the default article class. It demonstrates how
paragraph headings behave without a line break.

======= Short Subparagraph
<short-subparagraph-39>
This subparagraph heading is also run-in. It continues directly with
text to show wrapping behavior across lines.

=== A Very Very Long Section Title Demonstrating Line Wrapping, Spacing, and Hyphenation in LaTeX Headings When the Title Spans Multiple Lines Across the Page Margin and Includes Punctuation and Parentheses (With Optional Short Title)
<a-very-very-long-section-title-demonstrating-line-wrapping-spacing-and-hyphenation-in-latex-headings-when-the-title-spans-multiple-lines-across-the-page-margin-and-includes-punctuation-and-parentheses-with-optional-short-title-39>
==== An Extremely Long Subsection Title That Should Wrap Nicely Across Multiple Lines to Show How Subsection Headings Are Set and Truncated in Headers and the Table of Contents
<an-extremely-long-subsection-title-that-should-wrap-nicely-across-multiple-lines-to-show-how-subsection-headings-are-set-and-truncated-in-headers-and-the-table-of-contents-39>
===== A Quite Long Subsubsection Title Showing Deep Heading Levels and How They Render in the Document Body
<a-quite-long-subsubsection-title-showing-deep-heading-levels-and-how-they-render-in-the-document-body-39>
====== A Very Long Paragraph Heading That Demonstrates How Run-In Headings Wrap When the Title Itself Exceeds the Line Width and Continues Onto the Next Line
<a-very-long-paragraph-heading-that-demonstrates-how-run-in-headings-wrap-when-the-title-itself-exceeds-the-line-width-and-continues-onto-the-next-line-39>
This text immediately follows the long run-in heading to make the
wrapping effect obvious. Subsequent sentences illustrate paragraph flow
after a long heading.

======= A Very Long Subparagraph Heading to Show Even Deeper Levels With Lots of Words and Punctuation, Causing Line Wraps as Needed
<a-very-long-subparagraph-heading-to-show-even-deeper-levels-with-lots-of-words-and-punctuation-causing-line-wraps-as-needed-39>
More run-in text after a long subparagraph heading. This helps visualize
spacing and punctuation handling.

=== Mixed Examples
<mixed-examples-39>
==== Short
<short-78>
===== Very Long Subsubsection Title To Trigger Wrapping And Examine Spacing Between the Heading and Following Text in the Body
<very-long-subsubsection-title-to-trigger-wrapping-and-examine-spacing-between-the-heading-and-following-text-in-the-body-39>
====== Short
<short-79>
Short run-in example. The paragraph begins right after the heading
without a line break.

======= Very Long Subparagraph Title To See How Deep Levels Wrap and Whether Indentation Changes With Class Options
<very-long-subparagraph-title-to-see-how-deep-levels-wrap-and-whether-indentation-changes-with-class-options-39>
This subparagraph shows continued text right after the heading,
demonstrating run-in style at the deepest standard level.

#heading(level: 3, numbering: none)[Unnumbered Section]
<unnumbered-section-39>
#heading(level: 4, numbering: none)[Unnumbered Subsection With a Long
Title to Demonstrate Wrapping Without a Section Number]
<unnumbered-subsection-with-a-long-title-to-demonstrate-wrapping-without-a-section-number-39>
#heading(level: 5, numbering: none)[Unnumbered Subsubsection]
<unnumbered-subsubsection-39>
#heading(level: 6, numbering: none)[Unnumbered Paragraph]
<unnumbered-paragraph-39>
Run-in heading without numbering; text follows immediately to show
behavior with starred forms.

#heading(level: 7, numbering: none)[Unnumbered Subparagraph]
<unnumbered-subparagraph-39>
Another run-in example without numbering; useful to compare spacing with
numbered counterparts.

= Introducción
<introducción-10>
= Marco teórico y revisión bibliográfica exhaustiva sobre los fundamentos conceptuales, metodológicos y tecnológicos del proyecto, incluyendo antecedentes, definiciones, taxonomías, patrones de diseño, estándares aplicables y trabajos relacionados en el ámbito local e internacional
<marco-teórico-y-revisión-bibliográfica-exhaustiva-sobre-los-fundamentos-conceptuales-metodológicos-y-tecnológicos-del-proyecto-incluyendo-antecedentes-definiciones-taxonomías-patrones-de-diseño-estándares-aplicables-y-trabajos-relacionados-en-el-ámbito-local-e-internacional-9>
Este es un texto de ejemplo para ilustrar contenido dentro de una parte.
Aquí se presenta un panorama general y se destacan los objetivos que
guían el resto del documento.

= Diseño de la solución, arquitectura de software, decisiones tecnológicas, compromisos y trade-offs, gestión de riesgos, lineamientos de calidad y plan de validación y verificación de la implementación propuesta
<diseño-de-la-solución-arquitectura-de-software-decisiones-tecnológicas-compromisos-y-trade-offs-gestión-de-riesgos-lineamientos-de-calidad-y-plan-de-validación-y-verificación-de-la-implementación-propuesta-9>
Contenido de ejemplo que describe la estructura de la solución, sus
componentes principales y las interacciones entre subsistemas. También
se indican criterios de aceptación y métricas de calidad.

= Resultados
<resultados-10>
Breve contenido de ejemplo con un resumen de hallazgos, métricas
comparativas y observaciones clave derivadas de las pruebas realizadas.

= Conclusiones y trabajo futuro
<conclusiones-y-trabajo-futuro-9>
= Apéndices y material complementario para consulta, incluyendo manuales de usuario, configuraciones de despliegue, scripts de migración, casos de prueba y documentación técnica detallada
<apéndices-y-material-complementario-para-consulta-incluyendo-manuales-de-usuario-configuraciones-de-despliegue-scripts-de-migración-casos-de-prueba-y-documentación-técnica-detallada-9>
