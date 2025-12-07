#import "@preview/cetz:0.4.2"
#import "/mpl2typ/lib.typ": axes
#import axes: abc
#import "/header.typ": *
#import "/style.typ": *


#let axes(vl: 1.1, vs: 3, phase: +1, xmin: -0.55, xmax: 0.55, dx: 0.01, xscale: 4) = {
  let xdata = range(int(xmin / dx), int(xmax / dx) + 1).map(x => x * dx)
  let potential-short(x, depth) = depth * calc.pow(calc.sin(2 * x * calc.pi), 2)
  let potential-long(x, depth, phase) = depth * calc.pow(calc.cos((x + phase / 4 + 1 / 4) * calc.pi), 2)

  cetz.canvas({
    import cetz.draw: *

    // the red-detuned lattice
    let color = color-red-detuned
    line(
      ..xdata.map(x => (x * xscale, potential-long(x, -vl, phase))),
      (xdata.at(-1) * xscale, 0),
      (xdata.at(0) * xscale, 0),
      stroke: none,
      fill: gradient.linear(color.transparentize(100%), color.transparentize(10%), angle: 90deg),
    )
    line(
      ..xdata.map(x => (x * xscale, potential-long(x, -vl, phase))),
      stroke: linewidth-very-narrow + color.darken(20%),
    )

    // the blue-detuned lattice
    let color = color-blue-detuned
    line(
      ..xdata.map(x => (x * xscale, potential-short(x, vs))),
      (xdata.at(-1) * xscale, 0),
      (xdata.at(0) * xscale, 0),
      stroke: none,
      fill: gradient.linear(color.transparentize(100%), color.transparentize(10%), angle: -90deg),
    )
    line(
      ..xdata.map(x => (x * xscale, potential-short(x, vs))),
      stroke: linewidth-very-narrow + color.darken(20%),
    )

    // the total potential
    line(
      ..xdata.map(x => (x * xscale, potential-long(x, -vl, phase) + potential-short(x, vs))),
      stroke: linewidth-narrow + black,
    )

    // the trapped atom
    let offset = potential-long(0, -vl, phase)
    circle((0, 0.7 + offset), ..atom-style)
  })
}

#let figure(width: 1.1 * 8cm + gutter, height: 1.1 * 4cm) = {
  let cell = block.with(width: 100%, height: 100%, stroke: spine-stroke, fill: none)

  show: figure-style
  block(
    width: width,
    height: height,
    stroke: none,
    fill: white,
    grid(
      columns: 2,
      column-gutter: gutter,
      cell({
        align(horizon, axes(phase: -1))
        abc(1, ..abc-style)
      }),
      cell({
        align(horizon, axes(phase: +1))
        abc(2, ..abc-style)
      }),
    ),
  )
}

#set page(width: 17cm, height: auto, margin: 0.9em)
#figure()
