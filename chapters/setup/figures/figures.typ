#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/cetz:0.4.1"
#import "/header.typ": *

#set page(width: auto, height: auto, margin: 0.9em)

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
#pagebreak()

#let experimental-sequence-hfs(position, width) = {
  let height = 3.5
  let start-gap = 0.7
  let end-gap = 0.3
  let offset = 0.4
  let spacing = 0.5
  let lines = (
    (height: offset, name: "mF9", label: mF(9)),
    (height: offset + spacing, name: "mF7", label: mF(7)),
    (height: offset + 2 * spacing, name: "mF5", label: mF(5)),
    (height: offset + 3 * spacing, name: "mF3", label: mF(3)),
    (height: height - offset, name: "shelf", label: mF("?")),
  )

  let occupation-height = 0.2
  let occupation-radius = 0.1
  let occuptation(state, color, start, end, name: none) = {
    cetz.draw.rect(
      (rel: (start, -occupation-height / 2), to: state + ".start"),
      (rel: (end, occupation-height / 2), to: state + ".start"),
      radius: occupation-radius,
      fill: color.transparentize(50%),
      stroke: black + 0.3pt,
    )
    cetz.draw.line(
      (rel: (start + occupation-radius, 0), to: state + ".start"),
      (rel: (end - occupation-radius, 0), to: state + ".start"),
      stroke: none,
      name: name,
    )
  }

  let dt = 0.7
  let t = (
    0.0, // initial state
    6.5, // singles-doubles separation
    7.9, // 97 swap
    9.3, // 75 swap
    10.7, // MW shelving
    11.4, // 97 swap
    12.8, // MW shelving
    12.8, // OD1 pulse
    14.2, // OD2 pulse
    14.6, // bright pulse
    15.0, // final state
  )

  let arrow-padding = 0.15
  let arrow(initial, final) = {
    cetz.draw.line(
      (initial + ".end", arrow-padding, final + ".start"),
      (final + ".start", arrow-padding, initial + ".end"),
      mark: (end: "triangle", fill: black, scale: 0.7),
      stroke: 0.6pt,
    )
  }

  cetz.draw.group(name: "hfs", {
    cetz.draw.translate(x: position.at(0), y: position.at(1))
    cetz.draw.rect((0, 0), (width, height), name: "rect")
    for l in lines {
      cetz.draw.line(
        (rel: (start-gap, l.height), to: "rect.south-west"),
        (rel: (-end-gap, l.height), to: "rect.south-east"),
        stroke: luma(50%) + 0.3pt,
        name: l.name,
      )
      cetz.draw.content((rel: (-0.1cm, 0), to: l.name + ".start"), l.label, anchor: "east")
    }

    occuptation("mF9", blue, t.at(0), t.at(2), name: "down-0")
    occuptation("mF7", blue, t.at(2) + dt, t.at(3), name: "down-1")
    occuptation("mF5", blue, t.at(3) + dt, t.at(-1), name: "down-2")

    occuptation("mF7", orange, t.at(0), t.at(1), name: "up-0")
    occuptation("mF5", yellow, t.at(1) + dt, t.at(3), name: "double-0")
    occuptation("mF7", yellow, t.at(3) + dt, t.at(5), name: "double-1")
    occuptation("mF9", yellow, t.at(5) + dt, t.at(7), name: "double-2")

    occuptation("mF7", red, t.at(1) + dt, t.at(2), name: "single-0")
    occuptation("mF9", red, t.at(2) + dt, t.at(4), name: "single-1")
    occuptation("shelf", red, t.at(4) + dt, t.at(6), name: "single-2")
    occuptation("mF9", red, t.at(6) + dt, t.at(8), name: "single-3")

    arrow("up-0", "double-0")
    arrow("double-0", "double-1")
    arrow("double-1", "double-2")

    arrow("up-0", "single-0")
    arrow("down-0", "down-1")
    arrow("down-1", "down-2")
    arrow("single-0", "single-1")
    arrow("single-1", "single-2")
    arrow("single-2", "single-3")
  })
}

#let experimental-sequence-xy(position, width) = {
  import cetz.draw: *

  let sine-squared(start, stop, ..args) = {
    let dx = 0.5 * (stop.at(0) - start.at(0))
    bezier(
      start,
      stop,
      (start.at(0) + dx, start.at(1)),
      (stop.at(0) - dx, stop.at(1)),
      ..args,
    )
  }

  let end-gap = 0.3cm
  let t0 = 4
  let px1064 = (
    (t0, 0),
    (t0 + 1, 0),
    (t0 + 2, 0.4),
    (t0 + 2.2, 1.0),
    (t0 + 5.0, 1.0),
    (t0 + 5.2, 3.0),
    (width - end-gap, 3.0),
  )
  let py1064 = (
    (t0, 0),
    (t0 + 1, 0),
    (t0 + 2, 0.4),
    (t0 + 2.2, 2.0),
    (width - end-gap, 2.0),
  )
  let px532 = (
    (t0 + 2.5, 0),
    (t0 + 3.0, 0),
    (t0 + 3.4, 0.6),
    (width - end-gap, 0.6),
  )

  let height = 3.5cm
  group(name: "xy", {
    translate(x: position.at(0), y: position.at(1))
    rect((0, 0), (width, height), name: "rect")

    translate(x: 0, y: 0.2cm)
    set-style(stroke: (thickness: 1pt, cap: "round"))

    set-style(stroke: (paint: red.darken(20%)))
    line(py1064.at(2), py1064.at(3))
    line(py1064.at(3), py1064.at(4))

    set-style(stroke: (paint: red))
    line(px1064.at(0), px1064.at(1))
    sine-squared(px1064.at(1), px1064.at(2))
    line(px1064.at(2), px1064.at(3))
    line(px1064.at(3), px1064.at(4))
    line(px1064.at(4), px1064.at(5))
    line(px1064.at(5), px1064.at(6))

    set-style(stroke: green + 1pt)
    line(px532.at(0), px532.at(1))
    sine-squared(px532.at(1), px532.at(2), stroke: (paint: green, cap: "round"))
    line(px532.at(2), px532.at(3))
  })
}

#let experimental-sequence() = {
  let width = 16cm

  cetz.canvas({
    import cetz.draw: *

    experimental-sequence-hfs((0cm, 0cm), width)
    experimental-sequence-xy((0cm, 3.5cm), width)
  })
}

#figure(block(stroke: black, experimental-sequence()))

