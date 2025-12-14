#import "@local/fancy-thesis:0.1.0": optional-refs, thesis
#import "/header.typ": fancy-units
#import "src/titlepage.typ": titlepage

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

#include "src/introduction.typ"
#include "src/theory/theory.typ"
#include "src/setup/setup.typ"
#include "src/superlattice/superlattice.typ"
#include "src/modulation/modulation.typ"
#include "src/phase/phase.typ"
#include "src/outlook.typ"

#bibliography("refs.bib", style: "american-physics-society")
