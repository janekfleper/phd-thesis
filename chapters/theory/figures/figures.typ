#import "@preview/cetz:0.4.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/physica:0.9.5" as phy
#import "/header.typ": *

#let lattice-configurations(
  height: 6.5cm,
  color: red,
  n-samples: 6,
  lattice-period: 0.5cm,
  lattice-width: 4cm,
  n-standing: 8,
  n-shallow: 4,
  angle: 20deg,
  debug: 0,
) = {
  let lattice-period-shallow = lattice-period / calc.sin(2 * angle)
  let ky = 0.4 * lattice-width * calc.tan(angle) / lattice-period-shallow
  let lattice-gradient = gradient.radial(
    ..range(
      n-samples + 1,
    ).map(n => color.lighten(
      50% - 50% * calc.cos(n * calc.pi / n-samples),
    )),
  )

  grid(
    columns: (1fr, 1.7fr),
    rows: height,
    align: center + horizon,

    diagram(
      debug: debug,
      spacing: 0cm,
      cell-size: (lattice-period, 0.3cm),
      edge-stroke: 0.6pt,
      node-fill: lattice-gradient,

      edge(
        (-0.5, 1),
        (0.5, 1),
        $#h(0.25em) a = display(lambda / 2)$,
        "|-|",
        label-side: right,
        floating: true,
      ),
      edge((-3.0, -1), (-0.1, -1), $phy.vb(k)_1$, "-|>", floating: true),
      edge((3.0, -1), (0.1, -1), $phy.vb(k)_2$, "-|>", floating: true),

      for i in range(n-standing) {
        node((i - (n-standing - 1) / 2, 0), width: lattice-period, height: lattice-width)
      },
    ),

    diagram(
      debug: debug,
      spacing: 0cm,
      cell-size: (lattice-width, lattice-period-shallow),
      edge-stroke: 0.6pt,
      node-fill: lattice-gradient,

      node((-0.9, -ky), name: <k1-start>),
      node((-0.9, ky), name: <k2-start>),
      node((-0.5, 0.0), name: <k12-stop>),
      edge((<k1-start>, 0%, <k12-stop>), (<k1-start>, 95%, <k12-stop>), $phy.vb(k)_1$, "-|>"),
      edge((<k2-start>, 0%, <k12-stop>), (<k2-start>, 95%, <k12-stop>), $phy.vb(k)_2$, "-|>", label-side: right),
      edge(
        (0.53, -0.5),
        (0.53, 0.5),
        $a = display(lambda / (2 sin alpha))$,
        "|-|",
        label-side: left,
        label-anchor: "mid-west",
      ),
      edge(
        (<k1-start>, 20%, <k12-stop>),
        (<k2-start>, 20%, <k12-stop>),
        $2 dot alpha$,
        "<..>",
        mark-scale: 80%,
        bend: -1 * angle,
        label-side: right,
      ),

      for i in range(n-shallow) {
        node((0, i - (n-shallow - 1) / 2), width: lattice-width, height: lattice-period-shallow)
      },
    ),
  )
}

#set page(width: 16.6cm, height: auto, margin: 0.9em)
#figure(block(stroke: black, lattice-configurations(debug: 3)))

#let lattice-detuning(depth: 4, xmin: -1.5, xmax: 1.5, dx: 0.01, xscale: 3) = {
  let xdata = range(int(xmin / dx), int(xmax / dx) + 1).map(x => x * dx)
  let potential(x, depth) = depth * calc.pow(calc.sin(x * calc.pi), 2)

  let atom-style = (
    radius: 0.2,
    stroke: none,
    fill: gradient.radial(white, luma(20%), focal-center: auto, center: (40%, 40%)),
  )

  // to make sure the lattice period a is centered relative to the horizontal line...
  show math.equation: set text(top-edge: "x-height")

  cetz.canvas({
    import cetz.draw: *

    // the red-detuned lattice
    let cred = red
    line(
      ..xdata.map(x => (x * xscale, potential(x, depth))),
      stroke: black + 0.9pt,
      fill: gradient.linear(cred.transparentize(100%), cred.transparentize(10%), angle: 90deg),
    )
    for x in range(-1, 2) { circle((x * xscale, depth / 4), ..atom-style) }

    // the vertical line to mark the lattice depth
    line(
      (xscale * xmax + 0.2, 0),
      (xscale * xmax + 0.2, depth),
      mark: (symbol: "bar", scale: 1.5),
      stroke: 0.9pt,
      name: "V0",
    )
    content("V0", markrect($V_0$, outset: 0.4em, fill: white, stroke: none))

    // the blue-detuned lattice
    translate(x: xscale * (xmax - xmin) + 0.4, y: depth)
    let cblue = blue
    line(
      ..xdata.map(x => (x * xscale, potential(x, -depth))),
      stroke: black + 0.9pt,
      fill: gradient.linear(cblue.transparentize(100%), cblue.transparentize(10%), angle: -90deg),
    )
    for x in range(-1, 1) { circle(((x + 0.5) * xscale, -0.75 * depth), ..atom-style) }

    // the horizontal line to mark the lattice period
    let y0 = -depth / 10
    line(
      (-xscale, y0),
      (0, y0),
      mark: (symbol: "bar", scale: 1.5),
      stroke: 0.9pt,
      name: "a",
    )
    content("a", box($a$, fill: white, inset: 0.4em))
  })
}

#set page(width: 20cm, height: auto, margin: 0.9em)
#figure(block(stroke: none, lattice-detuning()))
