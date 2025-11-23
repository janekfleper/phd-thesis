#import "/header.typ": fancy-units

#let _default-colors = (
  color.rgb("#1f77b4"),
  color.rgb("#ff7f0e"),
  color.rgb("#2ca02c"),
  color.rgb("#d62728"),
  color.rgb("#9467bd"),
  color.rgb("#8c564b"),
  color.rgb("#e377c2"),
  color.rgb("#7f7f7f"),
  color.rgb("#bcbd22"),
)

#let colors(i) = _default-colors.at(calc.rem(i, _default-colors.len()))

#let color-stability-initial = blue
#let color-stability-final = orange

#let color-x1064 = red
#let color-x532 = green.darken(20%)

#let gradient-atomic-density = std.gradient.linear(white, blue, angle: -90deg)
#let gradient-modulation-resonance = std.gradient.linear(white, green.darken(40%))
#let colormap-phase = color.map.turbo

#let gutter = 3mm
#let gutter-narrow = 2mm

#let fill-mask = black.transparentize(80%)

#let linewidth = 2pt
#let linewidth-narrow = 1.5pt
#let linewidth-very-narrow = 0.9pt

#let markersize = 3pt
#let markersize-small = 2pt

#let marker-colors(color) = (
  fill: color.lighten(20%),
  stroke: color.darken(20%) + linewidth-very-narrow,
)
#let error-color(color) = color.darken(20%)
#let theory-color(color) = color.lighten(20%)

#let floquet-theory-hatch(color) = (
  pattern: "..",
  stroke: black + 0.3pt,
  fill: theory-color(color),
  size: (20pt, 20pt),
)

#let abc-style = (
  location: top + left,
  outset: 0.3em,
  fill: white.transparentize(30%),
  frame: block.with(height: 4mm, width: 4mm),
  numbering: "a",
  text-style: (weight: 600),
)

#let spine-stroke = black + 0.9pt
#let spines = (
  left: (bounds: (100.0%, 0.0%), stroke: spine-stroke),
  right: (bounds: (100.0%, 0.0%), stroke: spine-stroke),
  bottom: (bounds: (0.0%, 100.0%), stroke: spine-stroke),
  top: (bounds: (0.0%, 100.0%), stroke: spine-stroke),
)

#let tick-direction = "out"
#let major-tick-stroke = black + 0.6pt
#let minor-tick-stroke = black + 0.48pt
#let xaxis-major-tick-style = (
  direction: tick-direction,
  line: (length: 4.0pt, angle: 90deg, stroke: major-tick-stroke),
)
#let xaxis-minor-tick-style = (
  direction: tick-direction,
  line: (length: 2.0pt, angle: 90deg, stroke: major-tick-stroke),
)

#let yaxis-major-tick-style = (
  direction: tick-direction,
  line: (length: 4.0pt, angle: 0deg, stroke: major-tick-stroke),
)
#let yaxis-minor-tick-style = (
  direction: tick-direction,
  line: (length: 2.0pt, angle: 0deg, stroke: major-tick-stroke),
)

#let label-style = (
  pad: 2.0pt,
  rotation: 0.0deg,
  text: (size: 1em, fill: black),
)
#let xaxis-major-label-style = label-style
#let xaxis-minor-label-style = label-style
#let yaxis-major-label-style = label-style
#let yaxis-minor-label-style = label-style

#let inset-indicator-stroke = black + 1.2pt
#let inset-connector-stroke = luma(50%) + 0.9pt

#let text-box = box.with(
  fill: white.transparentize(20%),
  stroke: black + linewidth-very-narrow,
  outset: 0.2em,
)

#let figure-style(body) = {
  set text(9pt, font: "New Computer Modern Sans")
  show math.equation: set text(font: "New Computer Modern Sans Math")
  show: fancy-units

  body
}
