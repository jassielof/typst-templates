#let font-sizes = (
  vpt: 5pt,
  vipt: 6pt,
  viipt: 7pt,
  viiipt: 8pt,
  ixpt: 9pt,
  xpt: 10pt,
  xipt: 10.95pt,
  xiipt: 12pt,
  xivpt: 14.4pt,
  xviipt: 17.28pt,
  xxpt: 20.74pt,
  xxvpt: 24.88pt,
)

#let font-10pt = (
  margin: (
    left: 1in + 62pt,
    right: 100% - 1in - 62pt - 345pt,
    top: 1in + 16pt + 12pt + 25pt,
    bottom: 100% - 1in - 16pt - 12pt - 25pt - 550pt,
  ),
  tiny: font-sizes.vpt,
  scriptsize: font-sizes.viipt,
  footnotesize: font-sizes.viiipt,
  small: font-sizes.ixpt,
  normalsize: font-sizes.xpt,
  large: font-sizes.xiipt,
  Large: font-sizes.xivpt,
  LARGE: font-sizes.xviipt,
  huge: font-sizes.xxpt,
  Huge: font-sizes.xxvpt,
)

#let font-11pt = (
  margin: 1.75in,
  tiny: font-sizes.vipt,
  scriptsize: font-sizes.viiipt,
  footnotesize: font-sizes.ixpt,
  small: font-sizes.xpt,
  normalsize: font-sizes.xipt,
  large: font-sizes.xiipt,
  Large: font-sizes.xivpt,
  LARGE: font-sizes.xviipt,
  huge: font-sizes.xxpt,
  Huge: font-sizes.xxvpt,
)

#let font-12pt = (
  margin: 1.5in,
  tiny: font-sizes.vipt,
  scriptsize: font-sizes.viiipt,
  footnotesize: font-sizes.xpt,
  small: font-sizes.xipt,
  normalsize: font-sizes.xiipt,
  large: font-sizes.xivpt,
  Large: font-sizes.xviipt,
  LARGE: font-sizes.xxpt,
  huge: font-sizes.xxvpt,
  Huge: font-sizes.xxvpt,
)
