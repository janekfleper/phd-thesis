#import "@preview/cetz:0.4.2"
#import "/header.typ": *
#import "/style.typ": *

#set page(width: auto, height: auto, margin: 0.9em)

#let optical-properties = (
  UVFS: (rho1064: $6.15$, rho532: $6.60$, a1064: $<0.001$, a532: $<0.001$),
  NBK7: (rho1064: $4.08$, rho532: $4.69$, a1064: $0.12$, a532: $0.16$),
  CAF2: (rho1064: $-0.36$, rho532: $-0.32$, a1064: $<0.1$, a532: $<0.1$),
  NBALF4: (rho1064: $7.54$, rho532: $8.76$, a1064: $0.28$, a532: $0.2#hide[0]$),
  SiO2: (rho1064: $-0.22$, rho532: $-0.11$, a1064: $<0.001$, a532: $<0.001$),
  TGG: (rho1064: $3.31$, rho532: $3.29$, a1064: $0.24$, a532: $3.1#hide[0]$),
)

#let table-optical-properties = table(
  columns: optical-properties.len() + 2,
  stroke: none,
  table.header("", "", UVFS, NBK7, CAF2, NBALF4, SiO2, TGG),
  table.cell(x: 0, y: 1, rowspan: 2, align: horizon, $rho slash 10^(-6) #unit[W / m]$),
  table.cell(x: 1, y: 1, align: right, qty[1064][nm]),
  table.cell(x: 1, y: 2, align: right, qty[532][nm]),
  table.cell(x: 0, y: 3, rowspan: 2, align: horizon, $a slash #unit[% / (10 mm)]$),
  table.cell(x: 1, y: 3, align: right, qty[1064][nm]),
  table.cell(x: 1, y: 4, align: right, qty[532][nm]),
  table.hline(y: 1),
  table.hline(y: 3),
  table.vline(x: 2),
  ..for x in range(optical-properties.len()) {
    (
      ..optical-properties
        .at(optical-properties.keys().at(x))
        .values()
        .enumerate()
        .map(((y, value)) => table.cell(x: x + 2, y: y + 1, value)),
    )
  },
)

#figure(table-optical-properties)

#let thermal-lensing-simulation(color: red) = {
  // get the correct height for the bottom labels
  show math.equation: set text(bottom-edge: "baseline")

  let length-style = (
    mark: (symbol: "triangle", fill: black, scale: 0.7),
    stroke: linewidth-very-narrow,
  )

  let radius-style = (
    mark: (end: "triangle", fill: black, scale: 0.7),
    stroke: linewidth-very-narrow,
  )

  let height = 2.5
  let x-start = -0.9
  let x-thermal = 0
  let x-f1 = 2
  let x-f2 = 5
  let x-r1
  let x-f = 10
  let x-end = 14.9

  let w0 = 2
  let r1 = 1.0
  let angle-radius = 1.8

  let thermal-points = (
    (x-start, w0),
    (x-thermal, w0),
    (x-f1, w0 - 0.05),
    (x-f2, -(r1 + 0.1)),
    (x-f, -(r1 - 0.1)),
    (x-end, 0.75),
  )

  let normal-points = (
    (x-start, w0),
    (x-thermal, w0),
    (x-f1, w0),
    (x-f2, -r1),
    (x-f, -r1),
    (x-end, 0.4),
  )

  cetz.canvas({
    import cetz.draw: *

    // the optical axis
    line((-1, 0), (15, 0), stroke: black + linewidth-very-very-narrow)

    // the light rays
    set-style(stroke: (paint: color))
    intersections(
      "thermal",
      {
        line(..thermal-points)
        line(..thermal-points.map(((x, y)) => (x, -y)))
      },
    )
    set-style(stroke: (thickness: 0.5pt, dash: "dashed"))
    intersections(
      "normal",
      {
        line(..normal-points)
        line(..normal-points.map(((x, y)) => (x, -y)))
      },
    )
    intersections(
      "angle",
      {
        line(..thermal-points, stroke: none)
        circle("thermal.1", radius: angle-radius, stroke: none)
      },
    )

    // the lenses
    set-style(stroke: (paint: black, thickness: linewidth-narrow, dash: "solid"))
    line((x-thermal, -height), (x-thermal, height), name: "fthermal")
    line((x-f1, -height), (x-f1, height), name: "f1")
    line((x-f2, -height), (x-f2, height), name: "f2")
    line((x-f, -height), (x-f, height), name: "f")

    // the lens labels
    let label-shift = (0, 0.3)
    content((rel: label-shift, to: "fthermal.end"), $f_"thermal"$)
    content((rel: label-shift, to: "f1.end"), $f_1$)
    content((rel: label-shift, to: "f2.end"), $f_2$)
    content((rel: label-shift, to: "f.end"), $f$)

    // the telescope arrow
    line(
      (rel: (0.1, 0.1), to: "f1.start"),
      (rel: (-0.1, 0.1), to: "f2.start"),
      name: "L",
      ..length-style,
    )
    content((rel: (0, -0.3), to: "L"), $L = f_1 + f_2$)

    // the propagation arrow
    line(
      (rel: (0.1, 0.1), to: "f2.start"),
      (rel: (-0.1, 0.1), to: "f.start"),
      name: "d",
      ..length-style,
    )
    content((rel: (0, -0.3), to: "d"), $d$)

    // the waist arrow
    line(
      (rel: (-0.3, 0.00), to: "fthermal"),
      (rel: (-0.3, w0 - 0.03), to: "fthermal"),
      name: "w0",
      ..radius-style,
    )
    content((rel: (-0.3, 0.1), to: "w0"), $w_0$)

    // the radius arrow
    line(
      (rel: (-0.3, 0.00), to: "f"),
      (rel: (-0.3, -(r1 - 0.13)), to: "f"),
      name: "r1",
      ..radius-style,
    )
    content((rel: (-0.3, 0.1), to: "r1"), $r_1$)

    // the angle arrow
    cetz.angle.angle(
      "thermal.1",
      (rel: (-angle-radius, 0), to: "thermal.1"),
      "angle.0",
      radius: angle-radius,
      name: "theta1",
      ..radius-style,
    )
    content((rel: (-0.3, 0.0), to: "theta1"), $theta.alt_1$)

    // the shift arrow
    let delta-shift = -0.5
    line(
      (rel: (0.0, delta-shift), to: "thermal.1"),
      (rel: (0.0, delta-shift), to: "normal.1"),
      name: "delta",
      ..length-style,
    )
    content((rel: (0, -0.3), to: "delta"), $delta$)
  })
}

#set page(width: 20cm, height: auto, margin: 0.9em)
#figure(block(stroke: none, thermal-lensing-simulation()))
