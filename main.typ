#import "@local/fancy-thesis:0.1.0": optional-refs, thesis
#import "/header.typ": fancy-units

#set math.equation(number-align: bottom)
#show ref: optional-refs
#show: fancy-units

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
