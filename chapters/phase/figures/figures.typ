#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "/header.typ": *

/* Figure for the control diagram of the superlattice phase */

#let control-diagram(debug: 0) = {
  let x1064-stroke = red
  let x532-stroke = green.darken(20%)

  diagram(
    debug: debug,
    spacing: 0cm,
    cell-size: (2.7cm, 1.3cm),
    edge-stroke: 0.6pt,
    edge-corner-radius: 2pt,
    node-stroke: black,
    node-corner-radius: 2pt,

    {
      // initial nodes
      node((0, 0), [#x532 pump], name: <pump>)
      node((-1.2, 0), [DDS], name: <dds>)
      node((0, 2), [#x1064 seed], name: <x1064>)

      // photodiode + mixing
      node((0, 1), [PD], name: <pd>, shape: circle)
      node((-1.2, 1), $times.big$, name: <mix>, shape: circle)
      edge(<pump>, <pd>, "-|>", stroke: x1064-stroke)
      edge(<x1064-amp>, "t,l", "-|>", stroke: x1064-stroke)
      edge(<dds>, <mix>, "-|>")
      edge(<pd>, <mix>, "-|>") //, label: $Delta nu$)

      // feedback loops
      node((-0.7, 2.7), [PID], name: <fast-pid>)
      node((-0.7, 3.4), [PID], name: <slow-pid>)
      node((rel: (0.2, 1.4), to: <x1064.center>), $+$, name: <slow-plus>)
      node((rel: (0.8, 0.0), to: <slow-plus>), [AWG], name: <slow-awg>)
      edge(<mix>, (rel: (-0.5, 0.0), to: <fast-pid>), <fast-pid>, "-|>")
      edge(<mix>, (rel: (-0.5, 0.0), to: <slow-pid>), <slow-pid>, "-|>")
      edge(
        <fast-pid>,
        (rel: (-0.2, 0.7), to: <x1064.center>),
        (rel: (-0.2, 0.0), to: <x1064.center>),
        "-|>",
        label: "fast",
        label-pos: 35%,
        // label-pos: 60%,
        label-sep: 0pt,
        label-side: right,
      )
      edge(
        <slow-pid>,
        <slow-plus>,
        "-|>",
        label: "slow",
        label-pos: 35%,
        // label-pos: 60%,
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
      node((1, 2), [Amplifier], name: <x1064-amp>)
      node((2, 2), [AOM], name: <x1064-aom>)
      node((2, 3.4), [AWG], name: <x1064-awg>)
      edge(<x1064>, <x1064-amp>, "-|>", stroke: x1064-stroke)
      edge(<x1064-amp>, <x1064-aom>, "-|>", stroke: x1064-stroke)
      edge(<x1064-awg>, <x1064-aom>, "-|>")

      // superlattice phase
      node((3, 1), $phi$, name: <phi>)
      edge(<x532-aom>, "r,b", "-|>", stroke: x532-stroke)
      edge(<x1064-aom>, "r,t", "-|>", stroke: x1064-stroke)
    },
  )
}

#set page(width: 20cm, height: auto, margin: 0.9em)
#figure(block(stroke: none, control-diagram(debug: 3)))
