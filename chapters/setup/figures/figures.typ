#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/cetz:0.4.1"
#import "/header.typ": *

#set page(width: auto, height: auto, margin: 0.9em)


/* Figure for the hyperfine level structure with the MOT transitions */

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


/* Figure for the minimal working experimental sequence */

#let arrow-style = (
  mark: (end: "triangle", fill: black, scale: 0.7),
  stroke: 0.5pt,
)

#let sine-squared(start, stop, ..args) = {
  let dx = 0.5 * (stop.at(0) - start.at(0))
  cetz.draw.bezier(
    start,
    stop,
    (start.at(0) + dx, start.at(1)),
    (stop.at(0) - dx, stop.at(1)),
    ..args,
  )
}

#let image-fill(color, inner: true) = block(
  width: 100%,
  height: 100%,
  stroke: 0.3pt,
  clip: true,
  {
    place(
      horizon,
      block(
        width: 100%,
        height: 200%,
        fill: gradient.radial(radius: 60%, color.darken(30%), white),
      ),
    )
    if inner {
      place(
        center + horizon,
        dx: 5%,
        block(
          width: 40%,
          height: 60%,
          fill: gradient.radial(white.transparentize(10%), white.transparentize(100%)),
        ),
      )
    }
  },
)

#let atom-cloud(radius, shape, color, kx: 1, ky: 1, xscale: 100%, yscale: 100%) = block(
  width: radius * shape.at(0),
  height: radius * shape.at(1),
  // stroke: black + 0.5pt,
  // clip: true,
  {
    let atom-fill-steps = (0%, 10%, 20%, 40%, 60%, 80%, 90%, 100%, 100%)
    let atom-fill = gradient.radial(radius: 40%, ..atom-fill-steps.map(p => color.transparentize(p)))
    place(block(width: 100%, height: 100%, clip: true, {
      for x in range(shape.at(0) * kx) {
        for y in range(shape.at(1) * ky) {
          let mark = scale(x: xscale / kx, y: yscale / ky, circle(radius: radius, fill: atom-fill))
          place(top + left, dx: (x - 1 / 2) * radius / kx, dy: (y - 1 / 2) * radius / ky, mark)
        }
      }
    }))

    let outer-fill-steps = (100%, 100%, 80%, 50%, 10%, 0%)
    let outer-fill = gradient.radial(focal-radius: 10%, ..outer-fill-steps.map(p => white.transparentize(p)))
    place(block(width: 100%, height: 100%, stroke: white + 2pt, outset: 1pt, fill: outer-fill))
  },
)


#let experimental-sequence-hfs(position, height, width, start-gap, end-gap, timings, style) = {
  import cetz.draw: *

  let offset = 0.4
  let spacing = 0.5
  let lines = (
    (height: offset, name: "mF9", label: mF(9)),
    (height: offset + spacing, name: "mF7", label: mF(7)),
    (height: offset + 2 * spacing, name: "mF5", label: mF(5)),
    (height: offset + 3 * spacing, name: "mF3", label: mF(3)),
    (height: height - offset, name: "shelf", label: $FmF(7/2, -7/2)$),
  )

  let occupation-height = 0.2
  let occupation-radius = 0.1
  let occuptation(state, color, start, end, name: none) = {
    rect(
      (rel: (start, -occupation-height / 2), to: state + ".start"),
      (rel: (end, occupation-height / 2), to: state + ".start"),
      radius: occupation-radius,
      fill: color.lighten(50%),
      stroke: black + 0.3pt,
    )
    line(
      (rel: (start + occupation-radius, 0), to: state + ".start"),
      (rel: (end - occupation-radius, 0), to: state + ".start"),
      stroke: none,
      name: name,
    )
  }

  let dt = 0.6
  let t0 = timings.at("freeze-x1064") + 0.5
  let t = (
    start: timings.at("start"), // initial state
    rf1-sd: t0,
    rf2-97: t0 + 2 * dt,
    rf3-75: t0 + 4 * dt,
    rf4-97: t0 + 7 * dt,
    mw1: t0 + 6 * dt,
    mw2: t0 + 9 * dt,
    im1: t0 + 9 * dt,
    im2: t0 + 11 * dt,
    im3: t0 + 13 * dt,
    end: timings.at("end"), // final state
  )

  let arrow-padding = 0.15
  let arrow(initial, final) = {
    line(
      (initial + ".end", arrow-padding, final + ".start"),
      (final + ".start", arrow-padding, initial + ".end"),
      ..arrow-style,
    )
  }

  group(name: "hfs", {
    translate(..position)
    rect((0, 0), (width, height), name: "rect", ..style.at("rect"))
    for l in lines {
      line(
        (rel: (start-gap, l.height), to: "rect.south-west"),
        (rel: (-end-gap, l.height), to: "rect.south-east"),
        stroke: luma(50%) + 0.3pt,
      )
      line(
        (rel: (0, l.height), to: "rect.south-west"),
        (rel: (width, l.height), to: "rect.south-west"),
        stroke: none,
        name: l.name,
      )
      content(
        (rel: (start-gap - 0.5, 0), to: l.name + ".start"),
        block(fill: white, outset: (right: 0.5mm), l.label),
        anchor: "west",
      )
    }

    occuptation("mF9", blue, t.at("start"), t.at("rf2-97"), name: "down-0")
    occuptation("mF7", blue, t.at("rf2-97") + dt, t.at("rf3-75"), name: "down-1")
    occuptation("mF5", blue, t.at("rf3-75") + dt, t.at("end"), name: "down-2")

    occuptation("mF7", orange, t.at("start"), t.at("rf1-sd"), name: "up-0")
    occuptation("mF5", yellow, t.at("rf1-sd") + dt, t.at("rf3-75"), name: "double-0")
    occuptation("mF7", yellow, t.at("rf3-75") + dt, t.at("rf4-97"), name: "double-1")
    occuptation("mF9", yellow, t.at("rf4-97") + dt, t.at("im1"), name: "double-2")

    occuptation("mF7", red, t.at("rf1-sd") + dt, t.at("rf2-97"), name: "single-0")
    occuptation("mF9", red, t.at("rf2-97") + dt, t.at("mw1"), name: "single-1")
    occuptation("shelf", red, t.at("mw1") + dt, t.at("mw2"), name: "single-2")
    occuptation("mF9", red, t.at("mw2") + dt, t.at("im2"), name: "single-3")

    arrow("up-0", "double-0")
    arrow("double-0", "double-1")
    arrow("double-1", "double-2")

    // arrow("up-0", "single-0")
    arrow("down-0", "down-1")
    arrow("down-1", "down-2")
    arrow("single-0", "single-1")
    arrow("single-1", "single-2")
    arrow("single-2", "single-3")

    let im-shape = (0.9, 0.45)
    let image(timing, label, atoms: true) = {
      let x = t.at(timing)
      rect(
        (x, -0.6),
        (rel: im-shape),
        name: timing,
        anchor: "north-east",
        stroke: none,
      )
      content(
        timing + ".south",
        (rel: im-shape),
        anchor: "north",
        image-fill(red, inner: atoms),
      )
      line(
        (x, offset - 0.15),
        (rel: (0, 0.05), to: timing + ".north"),
        ..arrow-style,
      )
      content(
        (rel: (0, -0.1), to: timing + ".south"),
        text(11pt, label),
        anchor: "north",
      )
    }

    image("im1", "OD1")
    image("im2", "OD2")
    image("im3", "bright", atoms: false)
  })
}

#let experimental-sequence-xy(position, height, width, start-gap, end-gap, timings, style) = {
  import cetz.draw: *

  let dt-freeze = 0.2
  let px1064 = (
    (timings.at("ramp-xy") - 0.5, 0),
    (timings.at("ramp-xy"), 0),
    (timings.at("freeze-xy"), 0.4),
    (timings.at("freeze-xy") + dt-freeze, 1.0),
    (timings.at("freeze-x1064"), 1.0),
    (timings.at("freeze-x1064") + dt-freeze, 2.9),
    (timings.at("end"), 2.9),
  )
  let py1064 = (
    (timings.at("ramp-xy") - 0.5, 0),
    (timings.at("ramp-xy"), 0),
    (timings.at("freeze-xy"), 0.4),
    (timings.at("freeze-xy") + dt-freeze, 2.0),
    (timings.at("end"), 2.0),
  )
  let px532 = (
    (timings.at("ramp-x532") - 0.5, 0),
    (timings.at("ramp-x532"), 0),
    (timings.at("ramp-x532") + 0.4, 0.6),
    (timings.at("end"), 0.6),
  )

  let offset = 0.2
  group(name: "xy", {
    translate(..position)
    rect((0, 0), (width, height), name: "rect", ..style.at("rect"))

    translate(y: offset)
    line((0, 0), (width, 0), stroke: 0.1pt) // mark the zero-level
    set-style(stroke: (thickness: 1pt, cap: "round"))

    // y1064 lattice
    set-style(stroke: (paint: red.darken(20%)))
    line(py1064.at(2), py1064.at(3))
    line(py1064.at(3), py1064.at(4))
    content((rel: (0.5, 0.1), to: py1064.at(3)), Vy1064, anchor: "south")

    // x1064 lattice
    set-style(stroke: (paint: red))
    line(px1064.at(0), px1064.at(1))
    sine-squared(px1064.at(1), px1064.at(2))
    line(px1064.at(2), px1064.at(3))
    line(px1064.at(3), px1064.at(4))
    line(px1064.at(4), px1064.at(5))
    line(px1064.at(5), px1064.at(6))
    content((rel: (0.5, 0.1), to: px1064.at(3)), Vx1064, anchor: "south")

    // x532 lattice
    set-style(stroke: (paint: green))
    line(px532.at(0), px532.at(1))
    sine-squared(px532.at(1), px532.at(2))
    line(px532.at(2), px532.at(3))
    content((rel: (2, 0.1), to: px532.at(2)), Vx532, anchor: "south")
  })
}

#let experimental-sequence-confine(position, height, width, start-gap, end-gap, timings, style) = {
  import cetz.draw: *

  let t0 = start-gap
  let pdipole = (
    (timings.at("start"), 0.4),
    (timings.at("ramp-xy"), 0.4),
    (timings.at("freeze-xy"), 0.0),
    (timings.at("freeze-xy") + 0.5, 0.0),
  )
  let pz532 = (
    (timings.at("start"), 0),
    (timings.at("ramp-z532"), 0),
    (timings.at("ramp-xy") - 0.1, 2.5),
    (timings.at("end"), 2.5),
  )

  let offset = 0.2
  group(name: "confine", {
    translate(..position)
    rect((0, 0), (width, height), name: "rect", ..style.at("rect"))

    translate(y: offset)
    line((0, 0), (width, 0), stroke: 0.1pt) // mark the zero-level
    set-style(stroke: (thickness: 1pt, cap: "round"))

    // dipole trap
    set-style(stroke: (paint: red))
    line(pdipole.at(0), pdipole.at(1))
    sine-squared(pdipole.at(1), pdipole.at(2))
    line(pdipole.at(2), pdipole.at(3))
    content((rel: (1.6, 0.1), to: pdipole.at(0)), "Dipole trap", anchor: "south-west")

    // z532 lattice
    set-style(stroke: (paint: green))
    for i in range(pz532.len() - 1) {
      line(pz532.at(i), pz532.at(i + 1))
    }
    content((rel: (0.5, 0.1), to: pz532.at(2)), Vz532, anchor: "south")

    // label the different segments
    set-style(stroke: (paint: black, thickness: 0.9pt), mark: (start: "|", end: "|", scale: 1.0))
    let loading-start = 0
    let loading-end = start-gap + timings.at("ramp-x532")
    let loading-width = loading-end - loading-start
    let experiment-end = timings.at("freeze-x1064")
    let experiment-width = experiment-end - loading-end
    let detection-end = width
    let detection-width = detection-end - experiment-end
    line(
      (rel: (loading-start, 0.3), to: "rect.north-west"),
      (rel: (loading-width, 0)),
      name: "loading",
    )
    line(
      (rel: (loading-end, 0.3), to: "rect.north-west"),
      (rel: (experiment-width, 0)),
      mark: none,
      name: "experiment",
    )
    line(
      (rel: (experiment-end, 0.3), to: "rect.north-west"),
      (rel: (detection-width, 0)),
      name: "detection",
    )
    content((rel: (0, 0.35), to: "loading"), "Loading")
    content((rel: (0, 0.35), to: "experiment"), "Experiment")
    content((rel: (0, 0.35), to: "detection"), "Detection")
  })
}

#let experimental-sequence() = {
  let width = 16

  cetz.canvas({
    import cetz.draw: *

    let start-gap = 0.7
    let end-gap = 0.3
    let height-hfs = 3.5
    let height-xy = 3.5
    let height-confine = 3.5
    let pos-hfs = (x: 0, y: 0)
    let pos-xy = (x: 0, y: height-hfs)
    let pos-confine = (x: 0, y: height-hfs + height-xy)

    let timings = (
      start: start-gap,
      ramp-z532: 1.4,
      ramp-xy: 3.5,
      freeze-xy: 4.5,
      ramp-x532: 5.5,
      freeze-x1064: 7.0,
      end: width - end-gap,
    )
    let style = (
      rect: (stroke: black + 0.9pt),
      atom: (radius: 3mm, shape: (6, 5)),
    )
    let args = (width, start-gap, end-gap, timings, style)
    experimental-sequence-hfs(pos-hfs, height-hfs, ..args)
    experimental-sequence-xy(pos-xy, height-xy, ..args)
    experimental-sequence-confine(pos-confine, height-confine, ..args)


    let atom-radius = 2.5mm
    let atom-shape = (7, 5)
    content(
      (rel: (1.2, 2.5), to: "confine.rect.south-west"),
      name: "atom-dipole",
      atom-cloud(atom-radius, atom-shape, blue.lighten(20%), xscale: 500%, yscale: 500%),
    )
    line("atom-dipole", (rel: (2, 0.2)), ..arrow-style)

    content(
      (rel: (2.2, 1.2), to: "xy.rect.south-west"),
      name: "atom-ramp-xy",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), xscale: 100%, yscale: 100%),
    )
    line("atom-ramp-xy", (rel: (2.2, -0.5)), ..arrow-style)

    content(
      (rel: (3.2, 2.5), to: "xy.rect.south-west"),
      name: "atom-freeze-xy",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), xscale: 80%, yscale: 60%),
    )
    line("atom-freeze-xy", (rel: (1.4, -0.3)), ..arrow-style)

    content(
      (rel: (6.0, 1.0), to: "confine.rect.south-west"),
      name: "atom-ramp-x532",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), kx: 2, xscale: 100%, yscale: 60%),
    )
    line("atom-ramp-x532", (rel: (-0.1, -3.6)), ..arrow-style)

    content(
      (rel: (8.0, 1.3), to: "confine.rect.south-west"),
      name: "atom-freeze-x1064",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), kx: 2, xscale: 60%, yscale: 60%),
    )
    line("atom-freeze-x1064", (rel: (-0.7, -1.6)), ..arrow-style)
  })
}

#figure(block(stroke: black, experimental-sequence()))

