#import "@local/fancy-thesis-uni-bonn:0.1.0": thesis
#import "@preview/fancy-units:0.1.1": add-macros

#add-macros(Erec: [_E_#sub[rec]])

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

#include "chapters/theory/theory.typ"
#include "chapters/setup/setup.typ"
#include "chapters/superlattice/superlattice.typ"
#include "chapters/modulation/modulation.typ"
