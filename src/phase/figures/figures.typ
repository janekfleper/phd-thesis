#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import fletcher.shapes: triangle
#import "/header.typ": *
#import "/style.typ": *

#set text(10pt)

/* Figure for the control diagram of the superlattice phase */

#let control-diagram(debug: 0) = {
  let x1064-stroke = color-x1064
  let x532-stroke = color-x532
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

  show: figure-style
  diagram(
    debug: debug,
    spacing: 0cm,
    cell-size: (2.7cm, 1.5cm),
    node-stroke: linewidth-very-narrow + black,
    node-corner-radius: 2pt,
    edge-stroke: linewidth-very-narrow,
    edge-corner-radius: 2pt,
    mark-scale: 0.9,
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
      edge(<dds>, <mix>, "-|>", label: fdds, label-side: left, label-sep: 0.4em)
      edge(<pd>, <mix>, "-|>", label: $Delta nu$)

      // feedback loops
      node((-0.7, 2.7), [PID], name: <fast-pid>)
      node((-0.7, 3.4), [PID], name: <slow-pid>)
      node((rel: (0.2, 1.4), to: <x1064.center>), name: <slow-plus>, shape: circle, radius: circle-radius)
      node(<slow-plus>, draw-plus(radius: 0.25), stroke: none)
      node((rel: (0.8, 0.0), to: <slow-plus>), [AWG], name: <slow-awg>)
      edge(
        <mix>,
        (rel: (-0.5, 0.0), to: <fast-pid>),
        <fast-pid>,
        "-|>",
        label: [error\ signal],
        label-side: left,
        label-sep: 0.4em,
        label-pos: 22%,
      )
      edge(<mix>, (rel: (-0.5, 0.0), to: <slow-pid>), <slow-pid>, "-|>")
      edge(
        <fast-pid>,
        (rel: (-0.2, 0.7), to: <x1064.center>),
        (rel: (-0.2, 0.0), to: <x1064.center>),
        "-|>",
        label: "fast",
        label-pos: 28%,
        label-sep: 1pt,
        label-side: right,
      )
      edge(
        <slow-pid>,
        <slow-plus>,
        "-|>",
        label: "slow",
        label-pos: 30%,
        label-sep: 1pt,
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

      // separation of the optical tables
      edge((2.6, -0.235), (2.6, 2.235), stroke: (thickness: linewidth-very-narrow, dash: "dashed"))
    },
  )
}

#set page(width: 20cm, height: auto, margin: 0.9em)
#figure(block(stroke: none, control-diagram(debug: 0)))

#let table-thermal-properties = table(
  columns: 6,
  stroke: none,
  table.header([], [Air], [Lens 1], [Lens 2], [Air], [Glass cell]),
  table.hline(y: 1),
  table.vline(x: 1),
  $phy.pdv(Delta n_sigma, T) slash #qty[1e-6][1/K]$, $0.013$, $-0.274$, $-0.942$, $0.013$, $-0.618$,
  [$d_sigma slash#unit[mm]$], $240$, $9.0$, $3.7$, $220$, $4.0$,
  $phy.pdv(phi, T) slash #unit[mrad/K]$, $18.4$, $-14.5$, $-20.6$, $16.9$, $-14.6$,
)

#pagebreak()
#figure(table-thermal-properties)

#let table-other-properties = table(
  columns: 4,
  stroke: none,
  table.header([], "Pressure", "Relative humidity", [#CO2 concentration]),
  table.hline(y: 1),
  table.vline(x: 1),
  $phy.pdv(phi, xi)$,
  iqty[-11.1][mrad/hPa],
  iqty[-0.92][mrad/%],
  iqty[-5.9][μrad/ppm],
  // $#num[-0.59] #h(0.2em) #unit[mrad] / #qty[100][ppm]$,
)

#pagebreak()
#figure(table-other-properties)

#let floquet-sketch(xscale: 3, yscale: 3) = {
  let xmin = -1
  let xmax = 1
  let dx = 0.01
  let xdata = range(int(xmin / dx), int(xmax / dx) + 1).map(x => x * dx)

  let energy-style = (dash: "dotted", thickness: 0.7pt)
  let tunneling-style = (angle: 50deg, width: 0.46 * xscale)
  let arrow-symbol = "triangle"

  let potential(x, vl, vs, phi) = (
    vs * calc.pow(calc.cos(2 * x * calc.pi), 2) - vl * calc.pow(calc.sin((x - phi) * calc.pi), 2)
  )

  let draw-potential(color, phase: 0) = cetz.draw.line(
    ..xdata.map(x => (x * xscale, potential(x, 0.4 * yscale, yscale, phase))),
    stroke: color + linewidth-narrow,
  )

  let draw-single(
    x,
    y,
    radius: 0.2,
    stroke: none,
    color: blue,
  ) = cetz.draw.circle(
    (x * xscale, y),
    radius: radius,
    stroke: stroke,
    fill: gradient.radial(
      white,
      color,
      focal-center: auto,
      center: (40%, 40%),
    ),
  )

  let draw-double(x, y, alpha: 0%, ..args) = {
    draw-single(x + 0.02, y, color: red.transparentize(alpha), ..args.named())
    draw-single(x - 0.02, y, color: blue.transparentize(alpha), ..args.named())
  }

  let draw-tunneling(x, angle: 45deg, width: 0.9, name: none) = {
    assert.ne(name, none, message: "The name must not be none!")
    let color = luma(50%)
    cetz.draw.set-style(mark: (symbol: arrow-symbol, fill: color))

    let radius = width / 2 / calc.sin(angle)
    let x0 = x - calc.sin(angle) * radius
    let y0 = (calc.cos(angle) - 1) * radius
    cetz.draw.arc(
      (x0, y0),
      start: 90deg + angle,
      stop: 90deg - angle,
      radius: radius,
      stroke: color,
      name: name,
    )
  }

  // for the correct vertical alignment of the tunneling amplitudes...
  show math.equation: set text(top-edge: "x-height", bottom-edge: "baseline")

  let x-shift = 0.23 // the shift of the atoms from the double-well center
  let y-single = 0.35 * yscale
  let y-U = 0.15 * yscale
  let y-Ueff = 0.5 * yscale

  show: figure-style
  cetz.canvas({
    import cetz.draw: *
    set-style(mark: (scale: 0.9))

    // the static double wells
    draw-potential(black)

    // label the interaction energy...
    line((0.9 * xscale, y-single), (-0.85 * xscale, y-single), stroke: energy-style)
    line((0.9 * xscale, y-U), (0.14 * xscale, y-U), stroke: energy-style)
    line(
      (0.95 * xscale, y-single),
      (0.95 * xscale, y-U),
      mark: (end: arrow-symbol, fill: black),
      name: "arrow-U",
    )
    content((rel: (0.05 * xscale, 0), to: "arrow-U"), $U$, anchor: "west")

    // draw the atoms...
    draw-single(-0.5 - x-shift, y-single, color: blue)
    draw-single(-0.5 + x-shift, y-single, color: blue.transparentize(70%))
    draw-double(0.5 - x-shift, y-U)
    draw-double(0.5 + x-shift, y-U, alpha: 70%)

    // draw the tunneling arrows...
    scope({
      translate(y: 0.8 * yscale)
      draw-tunneling(-0.5 * xscale, ..tunneling-style, name: "static-single")
      draw-tunneling(0.5 * xscale, ..tunneling-style, name: "static-double")
    })

    content((rel: (0, 0.3), to: "static-single.arc-center"), $t$)
    content((rel: (0, 0.3), to: "static-double.arc-center"), $J = (4t^2) / U$)


    // the modulated double wells
    translate(x: 2 * xscale + 0.9)
    draw-potential(luma(70%), phase: 0.09)
    draw-potential(luma(40%), phase: -0.09)
    draw-potential(black)

    // label the interaction energy...
    line((0.93 * xscale, y-single), (-0.85 * xscale, y-single), stroke: energy-style)
    line((0.93 * xscale, y-Ueff), (0.12 * xscale, y-Ueff), stroke: energy-style)
    line(
      (0.98 * xscale, y-single),
      (0.98 * xscale, y-Ueff),
      mark: (end: arrow-symbol, fill: black),
      name: "arrow-Ueff",
    )
    content((rel: (0.05 * xscale, 0), to: "arrow-Ueff"), $Ueff$, anchor: "west")

    // draw the atoms...
    draw-single(-0.5 - x-shift, y-single, color: blue)
    draw-single(-0.5 + x-shift, y-single, color: blue.transparentize(70%))
    draw-double(0.5 - x-shift, y-Ueff)
    draw-double(0.5 + x-shift, y-Ueff, alpha: 70%)

    // draw the tunneling arrows...
    scope({
      translate(y: 0.8 * yscale)
      draw-tunneling(-0.5 * xscale, ..tunneling-style, name: "static-single")
      draw-tunneling(0.5 * xscale, ..tunneling-style, name: "static-double")
    })

    content((rel: (0, 0.3), to: "static-single.arc-center"), teff)
    content((rel: (0, 0.3), to: "static-double.arc-center"), Jeff)

    // label the modulation amplitude...
    line(
      (0.9 * xscale, -0.085 * yscale),
      (0.9 * xscale, -0.325 * yscale),
      mark: (symbol: arrow-symbol, fill: black),
      name: "amplitude",
    )
    content((rel: (0.05 * xscale, 0), to: "amplitude"), $h nu K0$, anchor: "west")
  })
}

#set page(width: 20cm, height: auto, margin: 0.9em)
#figure(block(stroke: none, floquet-sketch()))
