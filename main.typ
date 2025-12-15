#import "@local/fancy-thesis:0.1.0": optional-refs, thesis
#import "/header.typ": fancy-units
#import "src/titlepage.typ": titlepage
#import "src/examination.typ": examination

#set math.equation(number-align: bottom)
#show ref: optional-refs
#show: fancy-units

#show: thesis.with(
  lang: "en",
  debug: true,
)

#titlepage(
  title: "Ultracold Fermions in an\nUltrastable Optical Superlattice",
  author: "Janek Fleper",
  birthplace: "Köln",
  date: datetime(year: 2025, month: 12, day: 14),
)

#examination(
  supervisor: [Prof. Dr. Michael Köhl],
  examiner: [Prof. Dr. Simon Stellmer],
  date: none,
)

#{
  set page(numbering: "i")
  set heading(numbering: none, outlined: false)
  counter(page).update(1)
  include "src/dedication.typ"
  include "src/abstract.typ"
  include "src/thanks.typ"

  // do not include the table of contents itself in the table of contents...
  show outline: set heading(outlined: false)
  outline(title: [Table of Contents], target: heading)
}

#counter(page).update(1)
#include "src/introduction.typ"
#include "src/theory/theory.typ"
#include "src/setup/setup.typ"
#include "src/superlattice/superlattice.typ"
#include "src/modulation/modulation.typ"
#include "src/phase/phase.typ"
#include "src/outlook.typ"

#bibliography("refs.bib", style: "american-physics-society")
#outline(title: [List of Figures], target: figure.where(kind: image))
#outline(title: [List of Tables], target: figure.where(kind: table))
