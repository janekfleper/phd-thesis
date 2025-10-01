#import "@preview/cetz:0.4.1"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
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
    (name: <P32>, position: (0, -2.5), label: $sn(P, 3/2)$),
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
    S12: 0.0005,
    P12: 0.006,
    P32: 0.008,
  )

  // this dummy edge is used to correctly draw the labels of the states
  let dummy-edge(x, name, label) = {
    let sign = if x > 0 { 1 } else { -1 }
    edge(
      (rel: (x, sign * 0.1), to: name),
      (rel: (x, -sign * 0.1), to: name),
      label,
      label-pos: 42%,
      stroke: none,
    )
  }

  diagram(
    debug: debug,
    spacing: 0cm,
    cell-size: (1.5cm, 1.7cm),
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
      text(0.9em, qty[766.7][nm]),
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
      (rel: (0.5 * hfs-width, 0), to: <S12-F92>),
      (rel: (0.5 * hfs-width, 0.01), to: <P32-F112>),
      text(0.9em, "cooling + imaging"),
      "-|>",
      label-side: right,
      label-angle: right,
      label-pos: 63%,
      stroke: blue + 0.6pt,
    ),

    edge(
      (rel: (0.1 * hfs-width, 0), to: <S12-F72>),
      (rel: (0.1 * hfs-width, 0.01), to: <P32-F92>),
      text(0.9em, "repumping"),
      "-|>",
      label-side: left,
      label-angle: right,
      label-pos: 42.5%,
      stroke: blue + 0.6pt,
    ),

    edge(
      (rel: (0.9 * hfs-width, -0.01), to: <S12-F92>),
      (rel: (0.9 * hfs-width, 0.01), to: <S12-F72>),
      text(0.9em, qty[1285.8][MHz]),
      "<|-|>",
      label-side: right,
      label-angle: top,
    ),

    edge(
      (rel: (0.3 * hfs-width, -0.01), to: <P32-F112>),
      (rel: (0.3 * hfs-width, 0.01), to: <P32-F92>),
      text(0.9em, qty[44][MHz]),
      "<|-|>",
      label-side: right,
      label-angle: top,
    ),
  )
}

#figure({
  set text(10pt)
  block(stroke: black, level-structure(debug: 0))
})
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
  let occupation(state, color, start, end, name: none) = {
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

    occupation("mF9", blue, t.at("start"), t.at("rf2-97"), name: "down-0")
    occupation("mF7", blue, t.at("rf2-97") + dt, t.at("rf3-75"), name: "down-1")
    occupation("mF5", blue, t.at("rf3-75") + dt, t.at("end"), name: "down-2")

    occupation("mF7", orange, t.at("start"), t.at("rf1-sd"), name: "up-0")
    occupation("mF5", yellow, t.at("rf1-sd") + dt, t.at("rf3-75"), name: "double-0")
    occupation("mF7", yellow, t.at("rf3-75") + dt, t.at("rf4-97"), name: "double-1")
    occupation("mF9", yellow, t.at("rf4-97") + dt, t.at("im1"), name: "double-2")

    occupation("mF7", red, t.at("rf1-sd") + dt, t.at("rf2-97"), name: "single-0")
    occupation("mF9", red, t.at("rf2-97") + dt, t.at("mw1"), name: "single-1")
    occupation("shelf", red, t.at("mw1") + dt, t.at("mw2"), name: "single-2")
    occupation("mF9", red, t.at("mw2") + dt, t.at("im2"), name: "single-3")

    arrow("up-0", "double-0")
    arrow("double-0", "double-1")
    arrow("double-1", "double-2")

    // arrow("up-0", "single-0")
    arrow("down-0", "down-1")
    arrow("down-1", "down-2")
    arrow("single-0", "single-1")
    arrow("single-1", "single-2")
    arrow("single-2", "single-3")

    // Label the HS1 pulse and the MW pulse
    content(
      (rel: (-0.3, 0.3), to: ("up-0.end", 50%, "double-0.start")),
      box(fill: white, "HS1"),
    )
    content(
      (rel: (0, -0.6), to: "single-2"),
      "MW",
    )

    let im-shape = (2.0, 1.0)
    let atom-image(timing, label, xy) = {
      let x = t.at(timing)
      rect(
        xy,
        (rel: im-shape),
        name: timing,
        anchor: "north-east",
      )
      content(
        timing + ".south",
        (rel: im-shape),
        anchor: "north",
        image-fill(red, inner: true),
      )
      line(
        (x, offset - 0.15),
        (x, xy.at(1) + im-shape.at(1) / 2 + 0.05),
        ..arrow-style,
      )
      content(
        (rel: (0, -0.15), to: timing + ".south"),
        label,
        anchor: "north",
      )
    }
    let bright-image(timing, label, xy) = {
      let x = t.at(timing)
      rect(
        xy,
        (rel: im-shape),
        name: timing,
        anchor: "north-east",
      )
      content(
        timing + ".south",
        (rel: im-shape),
        anchor: "north",
        image-fill(red, inner: false),
      )
      line(
        (x, offset + 0.15),
        (x, xy.at(1) - im-shape.at(1) / 2 - 0.05),
        ..arrow-style,
      )
      content(
        (rel: (0, 0.15), to: timing + ".north"),
        box(text(bottom-edge: "baseline", label), fill: white, outset: 1mm),
        anchor: "south",
      )
    }

    atom-image("im1", "OD1", (12.3, -0.9))
    atom-image("im2", "OD2", (14.7, -0.9))
    bright-image("im3", "bright", (14.7, 2.3))
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
    content((rel: (0.2, 0.2), to: py1064.at(3)), text(bottom-edge: "baseline", Vy1064), anchor: "south-west")

    // x1064 lattice
    set-style(stroke: (paint: red))
    line(px1064.at(0), px1064.at(1))
    sine-squared(px1064.at(1), px1064.at(2))
    line(px1064.at(2), px1064.at(3))
    line(px1064.at(3), px1064.at(4))
    line(px1064.at(4), px1064.at(5))
    line(px1064.at(5), px1064.at(6))
    content((rel: (0.2, 0.2), to: px1064.at(3)), text(bottom-edge: "baseline", Vx1064), anchor: "south-west")

    // x532 lattice
    set-style(stroke: (paint: green))
    line(px532.at(0), px532.at(1))
    sine-squared(px532.at(1), px532.at(2))
    line(px532.at(2), px532.at(3))
    content((rel: (0.2, -0.6), to: px1064.at(3)), Vx532, anchor: "south-west")
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
    let height-total = height-hfs + height-xy + height-confine
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

    // Mark the experiment segment with a shaded rectangle
    let experiment-shift = 0.4
    let experiment-width = timings.at("freeze-x1064") - timings.at("ramp-x532") - experiment-shift
    rect(
      (timings.at("ramp-x532") + experiment-shift, 0),
      (rel: (experiment-width, height-total)),
      fill: luma(80%),
      stroke: none,
      name: "experiment",
    )

    // Label the segments
    content(
      (rel: (0, 0.35), to: ((0, height-total), 50%, "experiment.north-west")),
      text(bottom-edge: "baseline", "Loading"),
    )
    content(
      (rel: (0, 0.35), to: "experiment.north"),
      text(bottom-edge: "baseline", "Experiment"),
    )
    content(
      (rel: (0, 0.35), to: ((width, height-total), 50%, "experiment.north-east")),
      text(bottom-edge: "baseline", "Detection"),
    )

    let style = (
      rect: (stroke: luma(50%) + 0.5pt),
      atom: (radius: 3mm, shape: (6, 5)),
    )
    let args = (width, start-gap, end-gap, timings, style)
    experimental-sequence-hfs(pos-hfs, height-hfs, ..args)
    experimental-sequence-xy(pos-xy, height-xy, ..args)
    experimental-sequence-confine(pos-confine, height-confine, ..args)

    let atom-radius = 2.0mm
    let atom-shape = (7, 5)
    let atom-y = -0.9
    content(
      (1.5, atom-y),
      name: "atom-dipole",
      atom-cloud(atom-radius, atom-shape, blue.lighten(20%), xscale: 500%, yscale: 500%),
    )

    content(
      (3.7, atom-y),
      name: "atom-ramp-xy",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), xscale: 100%, yscale: 100%),
    )

    content(
      (5.3, atom-y),
      name: "atom-freeze-xy",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), xscale: 80%, yscale: 60%),
    )

    content(
      (6.9, atom-y),
      name: "atom-ramp-x532",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), kx: 2, xscale: 100%, yscale: 60%),
    )

    content(
      (8.5, atom-y),
      name: "atom-freeze-x1064",
      atom-cloud(atom-radius, atom-shape, blue.darken(20%), kx: 2, xscale: 60%, yscale: 60%),
    )

    set-style(stroke: (paint: luma(50%), thickness: 0.9pt, dash: "dashed"))
    let h1 = -0.1
    let h2 = -0.3
    let h3 = -1
    line((timings.at("ramp-xy"), 0), (rel: (0, h1)), (2.6, h1 + h2), (rel: (0, h3)))
    line((timings.at("freeze-xy") + 0.2, 0), (rel: (0, h1)), (4.5, h1 + h2), (rel: (0, h3)))
    line((timings.at("ramp-x532") + 0.4, 0), (rel: (0, h1)), (6.1, h1 + h2), (rel: (0, h3)))
    line((timings.at("freeze-x1064"), 0), (rel: (0, h1)), (7.7, h1 + h2), (rel: (0, h3)))
  })
}

#figure({
  set text(10pt)
  block(stroke: none, experimental-sequence())
})

