#import "@local/fancy-thesis-uni-bonn:0.1.0": thesis
#import "@preview/unify:0.5.0": num, qty

#show: thesis.with(
  title: "Ultracold Fermions in an\nUltrastable Optical Superlattice",
  author: "Janek Fleper",
  type: "phd",
  lang: "en",
  institute: "Physikalisches Institut",
  birthplace: "Köln",
  date: datetime.today(),
)

#include "chapters/theory/theory.typ"
#include "chapters/setup/setup.typ"
#include "chapters/superlattice/superlattice.typ"
#include "chapters/modulation/modulation.typ"
