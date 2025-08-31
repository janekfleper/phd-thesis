#import "@preview/cetz:0.4.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import fletcher.shapes: triangle
#import "/header.typ": *

#set text(10pt)

/* Figure for the control diagram of the superlattice phase */

#let control-diagram(debug: 0) = {
  let x1064-stroke = red
  let x532-stroke = green.darken(20%)
  let circle-radius = 0.4cm

  let draw-mixer(radius: 0.3) = cetz.canvas({
    import cetz.draw: *
    rotate(45deg)
    line((-radius, 0), (radius, 0))
    line((0, -radius), (0, radius))
  })

  let draw-plus(radius: 0.2) = cetz.canvas({
    import cetz.draw: *
    line((-radius, 0), (radius, 0))
    line((0, -radius), (0, radius))
  })

  let draw-photodiode(radius: 0.2, shift: -0.05) = cetz.canvas({
    import cetz.draw: *
    circle((0, 0), radius: 0.4, stroke: none)
    polygon((shift, 0.0), 3, fill: black, radius: radius)
    line((radius + shift + 0.02, -radius), (radius + shift + 0.02, radius))
    line((-0.3, 0), (0.3, 0))
  })

  diagram(
    debug: debug,
    spacing: 0cm,
    cell-size: (2.7cm, 1.5cm),
    node-stroke: black,
    node-corner-radius: 2pt,
    edge-stroke: 0.6pt,
    edge-corner-radius: 2pt,
    label-sep: 0.2em,

    {
      // initial nodes
      node((0, 0), [#x532 pump], name: <pump>)
      node((-1.2, 0), [DDS], name: <dds>)
      node((0, 2), [#x1064 seed], name: <x1064>)

      // photodiode + mixing
      node((0, 1), name: <pd>, shape: circle, radius: circle-radius)
      node(<pd>, draw-photodiode(), stroke: none)
      node((-1.2, 1), name: <mix>, shape: circle, radius: circle-radius)
      node(<mix>, draw-mixer(radius: circle-radius), stroke: none)
      edge(<pump>, <pd>, "-|>", stroke: x1064-stroke, label: $nu_"pump"$, label-side: left)
      edge(<x1064-amp>, (1, 1), <pd>, "-|>", stroke: x1064-stroke, label: $nu_x1064$, label-side: right, label-pos: 25%)
      edge(<dds>, <mix>, "-|>", label: fdds, label-side: left)
      edge(<pd>, <mix>, "-|>", label: $Delta nu$)

      // feedback loops
      node((-0.7, 2.7), [PID], name: <fast-pid>)
      node((-0.7, 3.4), [PID], name: <slow-pid>)
      node((rel: (0.2, 1.4), to: <x1064.center>), name: <slow-plus>, shape: circle, radius: circle-radius)
      node(<slow-plus>, draw-plus(radius: 0.25), stroke: none)
      node((rel: (0.8, 0.0), to: <slow-plus>), [AWG], name: <slow-awg>)
      edge(<mix>, (rel: (-0.5, 0.0), to: <fast-pid>), <fast-pid>, "-|>")
      edge(<mix>, (rel: (-0.5, 0.0), to: <slow-pid>), <slow-pid>, "-|>")
      edge(
        <fast-pid>,
        (rel: (-0.2, 0.7), to: <x1064.center>),
        (rel: (-0.2, 0.0), to: <x1064.center>),
        "-|>",
        label: "fast",
        label-pos: 28%,
        label-sep: 0pt,
        label-side: right,
      )
      edge(
        <slow-pid>,
        <slow-plus>,
        "-|>",
        label: "slow",
        label-pos: 30%,
        label-sep: 0pt,
        label-side: right,
      )
      edge(<slow-plus>, (rel: (0.2, 0.0), to: <x1064.center>), "-|>")
      edge(<slow-awg>, <slow-plus>, "-|>")

      // x532 lattice
      node((1, 0), [SHG], name: <shg>)
      node((2, 0), [AOM], name: <x532-aom>)
      edge(<pump>, <shg>, "-|>", stroke: x1064-stroke)
      edge(<shg>, <x532-aom>, "-|>", stroke: x532-stroke)

      // x1064 lattice
      let amp-size = 0.4cm
      node((1, 2), name: <x1064-amp>, shape: triangle.with(dir: right), width: amp-size, height: amp-size)
      node((2, 2), [AOM], name: <x1064-aom>)
      node((2, 3.4), [AWG], name: <x1064-awg>)
      edge(<x1064>, <x1064-amp>, "-|>", stroke: x1064-stroke)
      edge(<x1064-amp>, <x1064-aom>, "-|>", stroke: x1064-stroke)
      edge(<x1064-awg>, <x1064-aom>, "-|>", label: $f_"AOM"$, label-side: right)

      // superlattice phase
      node((3, 1), text(top-edge: "bounds", $phi$), name: <phi>, shape: circle, radius: circle-radius)
      edge(<x532-aom>, "r,b", "-|>", stroke: x532-stroke)
      edge(<x1064-aom>, "r,t", "-|>", stroke: x1064-stroke)
    },
  )
}

#set page(width: 20cm, height: auto, margin: 0.9em)
#figure(block(stroke: none, control-diagram(debug: 0)))
