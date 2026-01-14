// Ponte's font table
// \vbox{
//   \tabskip=1em
//   \halign{
//     \ttfamily\textbackslash#\hss&\hss#\thinspace pt&&\hss#\thinspace pt\crcr
//     \omit Size option\hss&8&9&10&11&12\cr\noalign{\smallskip\hrule\smallskip}
//     tiny&4&5&5&6&6\cr
//     scriptsize&5&6&7&8&8\cr
//     footnotesize&6&7&8&9&10\cr
//     small&7&8&9&10&10.95\cr
//     normalsize&8&9&10&10.95&12\cr
//     large&9&10&10.95&12&14.40\cr
//     Large&10&10.95&12&14.40&17.28\cr
//     LARGE&10.95&12&14.40&17.28&20.74\cr
//     huge&12&14.40&17.28&20.74&24.88\cr
//     Huge&14.4&17.28&20.74&24.88&24.88\cr\noalign{\smallskip\hrule}
//   }
// }

#let ex(unit) = unit * 0.6em

#let magstep-base = calc.pow(1.2, 0.5)

#let scaled-size(base, steps) = {
  base * calc.pow(magstep-base, steps)
}

#let font-sizes = (
  vpt: 5pt,
  vipt: 6pt,
  viipt: 7pt,
  viiipt: 8pt,
  ixpt: 9pt,
  xpt: 10pt,
  xipt: scaled-size(10pt, 1),
  xiipt: 12pt,
  xivpt: scaled-size(12pt, 2),
  xviipt: scaled-size(12pt, 4),
  xxpt: scaled-size(12pt, 6),
  xxvpt: scaled-size(12pt, 8),
  // we could possibly expand on later now with the scaled-size/magstep, probably (sob)
)

#let font-9pt = (
  margin: (
    top: 58pt,
    bottom: 44pt,
    inside: 46pt,
    outside: 46pt,
  ),
  leading: 11pt,
  tiny: font-sizes.vpt,
  script: font-sizes.vipt,
  footnote: font-sizes.viipt,
  small: font-sizes.viiipt,
  normal: font-sizes.ixpt,
  large: font-sizes.xpt,
  Large: font-sizes.xiipt,
  LARGE: font-sizes.xivpt,
  huge: font-sizes.xviipt,
  Huge: font-sizes.xxpt,
)

// Standard LaTeX 10pt definitions (AMS version)
#let font-10pt = (
  margin: (
    left: 1in + 62pt,
    right: 100% - 1in - 62pt - 345pt,
    top: 1in + 16pt + 12pt + 25pt,
    bottom: 100% - 1in - 16pt - 12pt - 25pt - 550pt,
  ),
  leading: 12pt,
  tiny: font-sizes.vpt,
  script: font-sizes.viipt,
  footnote: font-sizes.viiipt,
  small: font-sizes.ixpt,
  normal: font-sizes.xpt,
  large: font-sizes.xiipt,
  Large: font-sizes.xivpt,
  LARGE: font-sizes.xviipt,
  huge: font-sizes.xxpt,
  Huge: font-sizes.xxvpt,
)

#let font-10pt = (
  margin: (
    left: 1in + 62pt,
    right: 100% - 1in - 62pt - 345pt,
    top: 1in + 16pt + 12pt + 25pt,
    bottom: 100% - 1in - 16pt - 12pt - 25pt - 550pt,
  ),
  leading: 12pt,
  tiny: font-sizes.vpt,
  script: font-sizes.viipt,
  footnote: font-sizes.viiipt,
  small: font-sizes.ixpt,
  normal: font-sizes.xpt,
  large: font-sizes.xiipt,
  Large: font-sizes.xivpt,
  LARGE: font-sizes.xviipt,
  huge: font-sizes.xxpt,
  Huge: font-sizes.xxvpt,
)

#let font-11pt = (
  margin: (
    left: 1in + 62pt,
    right: 100% - 1in - 62pt - 345pt,
    top: 1in + 16pt + 12pt + 25pt,
    bottom: 100% - 1in - 16pt - 12pt - 25pt - 550pt,
  ),
  leading: 13.6pt,
  tiny: font-sizes.vipt,
  script: font-sizes.viiipt,
  footnote: font-sizes.ixpt,
  small: font-sizes.xpt,
  normal: font-sizes.xipt,
  large: font-sizes.xiipt,
  Large: font-sizes.xivpt,
  LARGE: font-sizes.xviipt,
  huge: font-sizes.xxpt,
  Huge: font-sizes.xxvpt,
)

#let font-12pt = (
  margin: 1.5in,
  leading: 14.5pt,
  tiny: font-sizes.vipt,
  script: font-sizes.viiipt,
  footnote: font-sizes.xpt,
  small: font-sizes.xipt,
  normal: font-sizes.xiipt,
  large: font-sizes.xivpt,
  Large: font-sizes.xviipt,
  LARGE: font-sizes.xxpt,
  huge: font-sizes.xxvpt,
  Huge: font-sizes.xxvpt,
)

#let get-font-size(font-size) = {
  if (font-size == 9pt) {
    return font-9pt
  } else if (font-size == 10pt) {
    return font-10pt
  } else if (font-size == 11pt) {
    return font-11pt
  } else if (font-size == 12pt) {
    return font-12pt
  } else {
    panic("Font size must be 10pt, 11pt, or 12pt.")
  }
}

