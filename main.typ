#import "@local/fancy-thesis:0.1.0": optional-refs, thesis
#import "@local/fancy-units:0.2.0": add-macros, configure, format-qty, format-unit-fraction, relative-uncertainties

#configure(
  num-transform: relative-uncertainties,
  unit-format: format-unit-fraction,
  qty-format: format-qty.with(separator: sym.wj + h(0.2em) + sym.wj),
)

#add-macros(
  Ohm: sym.Omega,
  Erec: [_E_#sub[rec]],
  Erecl: [_E_#sub[rec,l]],
  Erecs: [_E_#sub[rec,s]],
)

#show ref: optional-refs

#show: thesis.with(
  title: "Ultracold Fermions in an\nUltrastable Optical Superlattice",
  author: "Janek Fleper",
  type: "phd",
  lang: "en",
  institute: "Physikalisches Institut",
  birthplace: "Köln",
  date: datetime.today(),
  debug: true,
)

#include "chapters/introduction.typ"
#include "chapters/theory/theory.typ"
#include "chapters/setup/setup.typ"
#include "chapters/superlattice/superlattice.typ"
#include "chapters/modulation/modulation.typ"
#include "chapters/phase/phase.typ"
#include "chapters/outlook.typ"

#bibliography("refs.bib", style: "american-physics-society")
