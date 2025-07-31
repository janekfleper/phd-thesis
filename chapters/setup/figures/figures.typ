#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "/header.typ": *

#let level-structure(debug: 0) = {
  let fs-width = 0.6
  let gap = 0.3
  let hfs-width = 1

  let state-stroke = black + 1pt
  let gap-stroke = black + 0.5pt

  // define the fine-structure states
  let states = (
    (name: <S12>, position: (0, 0), label: $sn(S, 1/2)$),
    // (name: <P12>, position: (0, -2), label: $sn(P, 1/2)$),
    (name: <P32>, position: (0, -3), label: $sn(P, 3/2)$),
  )

  // define the hyperfine-structure states
  let hyperfine-states = (
    (ref: <S12>, name: <S12-F92>, detuning: -571.5, label: $F = 9 slash 2$),
    (ref: <S12>, name: <S12-F72>, detuning: 714.3, label: $F = 7 slash 2$),
    // (ref: <P12>, name: <P12-F72>, detuning: 86.3, label: $F' = 7 slash 2$),
    // (ref: <P12>, name: <P12-F92>, detuning: -69.0, label: $F' = 9 slash 2$),
    (ref: <P32>, name: <P32-F52>, detuning: 55.2, label: $F' = 5 slash 2$),
    (ref: <P32>, name: <P32-F72>, detuning: 31.0, label: $F' = 7 slash 2$),
    (ref: <P32>, name: <P32-F92>, detuning: -2.3, label: $F' = 9 slash 2$),
    (ref: <P32>, name: <P32-F112>, detuning: -46.4, label: $F' = 11 slash 2$),
  )

  // define scales for the hyperfine structure based on the fine-structure state
  let hyperfine-scale = (
    S12: 0.001,
    P12: 0.006,
    P32: 0.006,
  )

  // this dummy edge is used to correctly draw the labels of the states
  let dummy-edge(x, name, label) = {
    let sign = if x > 0 { 1 } else { -1 }
    edge(
      (rel: (x, sign * 0.1), to: name),
      (rel: (x, -sign * 0.1), to: name),
      label,
      stroke: none,
    )
  }

  diagram(
    debug: debug,
    spacing: 0cm,
    cell-size: (2cm, 3cm),
    edge-stroke: 0.6pt,

    for state in states {
      node(state.position, name: state.name)
      edge(state.name, (rel: (-fs-width, 0)), stroke: state-stroke)
      dummy-edge(-fs-width, state.name, state.label)
    },

    for state in hyperfine-states {
      node((rel: (gap, -state.detuning * hyperfine-scale.at(str(state.ref))), to: state.ref), name: state.name)
      edge(state.ref, state.name, stroke: gap-stroke)
      edge(state.name, (rel: (hfs-width, 0)), stroke: state-stroke)
      dummy-edge(hfs-width, state.name, state.label)
    },

    edge(
      (rel: (-0.5 * fs-width, 0), to: <S12>),
      (rel: (-0.5 * fs-width, 0), to: <P32>),
      qty[766.7][nm],
      "<|-|>",
      label-side: left,
      label-angle: right,
    ),

    // edge(
    //   (rel: (-0.8 * fs-width, 0), to: <S12>),
    //   (rel: (-0.8 * fs-width, 0), to: <P12>),
    //   qty[770.1][nm],
    //   "<|-|>",
    //   label-side: left,
    //   label-angle: right,
    // ),

    edge(
      (rel: (0.3 * hfs-width, 0), to: <S12-F92>),
      (rel: (0.3 * hfs-width, 0), to: <P32-F112>),
      [cooling],
      "-|>",
      label-side: left,
      label-angle: right,
      label-pos: 63%,
      stroke: blue + 1pt,
    ),

    edge(
      (rel: (0.6 * hfs-width, 0), to: <S12-F72>),
      (rel: (0.6 * hfs-width, 0), to: <P32-F92>),
      [repumping],
      "-|>",
      label-side: right,
      label-angle: right,
      label-pos: 35%,
      stroke: blue + 1pt,
    ),
  )
}


#figure(block(stroke: black, level-structure(debug: 3)))
