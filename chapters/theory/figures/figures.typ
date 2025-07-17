#import "@preview/physica:0.9.5" as phy
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

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
  let lattice-gradient = gradient.radial(..range(
    n-samples + 1,
  ).map(n => color.lighten(
    50% - 50% * calc.cos(n * calc.pi / n-samples),
  )))

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

#figure(block(stroke: black, lattice-configurations(debug: 3)))
