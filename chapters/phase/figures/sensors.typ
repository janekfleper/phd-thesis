#import "/header.typ": *
#import "/optics.typ": *
#import "/style.typ": *

#let ioffe-bar(pos, width, length, color: none, name: none) = {
  assert.ne(color, none, message: "The fill color must not be none...")
  let colors = (color,) * 20 + (color.darken(50%),) * 1

  import cetz.draw: *
  group(
    name: name,
    {
      set-origin(pos)
      rect(
        (0, width / 2),
        (-length, -width / 2),
        fill: std.gradient.linear(..colors),
      )
    },
  )
}

#let pinch-coil(pos, width, length, color: none, name: none) = {
  assert.ne(color, none, message: "The fill color must not be none...")
  let colors = (color.darken(50%), color, color.darken(50%))

  import cetz.draw: *
  group(
    name: name,
    {
      set-origin(pos)
      rect(
        (width / 2, length / 2),
        (-width / 2, -length / 2),
        fill: std.gradient.linear(..colors, angle: 90deg),
      )
    },
  )
}

#let sensor-slow(pos, size, color: none, name: none) = {
  assert.ne(color, none, message: "The fill color must not be none...")

  import cetz.draw: *
  scope({
    set-origin(pos)
    rect((-size / 2, -size / 2), (size / 2, size / 2), fill: color, radius: 2pt, name: name)
  })
}

#let sensor-fast(pos, size, color: none, name: none) = {
  assert.ne(color, none, message: "The fill color must not be none...")

  import cetz.draw: *
  scope({
    // set-origin(pos)
    circle(pos, radius: size / 2, fill: color, name: name)
  })
}

#let sensor-other(pos, size, shape: cetz.draw.rect, color: none, label: none, name: none) = {
  assert.ne(color, none, message: "The fill color must not be none...")

  import cetz.draw: *
  scope({
    set-origin(pos)
    shape((-size / 2, -size / 2), (size / 2, size / 2), fill: color, name: name)
    if label != none { content((0, 0), align(center, label)) }
  })
}


#let figure() = {
  show: figure-style

  let metal-color = color.rgb("#b6b6b6")
  let copper-color = color.rgb("b87333")
  let temperature-sensor-color = red
  let pressure-sensor-color = blue.lighten(40%)
  let other-sensor-color = green.lighten(40%)

  cetz.canvas({
    import cetz.draw: *
    set-style(stroke: black + linewidth-very-narrow, mark: (scale: 0.9))

    anchor("pos-retro", (-0.3, -5))
    anchor("pos-dichroic", (-0.3, 0.3))
    anchor("pos-doublet", (-3.5, 0))
    anchor("pos-glasscell", (-10, -0.5))
    anchor("pos-0", (rel: (0, 0), to: "pos-retro"))
    anchor("pos-1", (rel: (0, 0), to: "pos-dichroic"))
    anchor("pos-2", (rel: (0, 0.3), to: "pos-doublet"))
    anchor("pos-3", (rel: (0, 0.5), to: "pos-glasscell"))

    // the lattice beams...
    let beam-radius = 0.1
    let beam-radius-focus = 0.04
    let angle-focus = 180deg + calc.asin(0.3 / 6.5)
    bichromatic-beam("pos-0", "pos-1", beam-radius, 90deg, color-x1064, color-x532)
    bichromatic-beam("pos-1", "pos-2", beam-radius, 180deg, color-x1064, color-x532)
    bichromatic-beam-focus(
      "pos-2",
      "pos-3",
      150%,
      beam-radius,
      beam-radius-focus,
      angle-focus,
      angle-focus,
      color-x1064,
      color-x532,
      (start: 45%, stop: 55%),
      (start: 46%, stop: 56.6%),
    )

    // the mirrors...
    mirror("pos-dichroic", 45deg, 0.3, 2, backside: false, name: "dichroic")
    mirror("pos-retro", -90deg, 0.2, 1, name: "retro")

    // the retro double lens with the mount
    let x0 = -3.5
    let radius = 0.75
    doublet("pos-doublet", 0deg, radius * 2, name: "doublet")

    let mount-thickness = 0.1
    rect((x0 - 0.7, radius), (x0 + 0.5, radius + mount-thickness), fill: metal-color, name: "mount-upper")
    rect((x0 - 0.7, -radius), (x0 + 0.5, -radius - mount-thickness), fill: metal-color, name: "mount-lower")

    let sensor-width = 0.5
    let sensor-thickness = 0.1
    rect(
      (x0 - sensor-width, radius + mount-thickness),
      (x0, radius + mount-thickness + sensor-thickness),
      fill: temperature-sensor-color,
      name: "sensor-lens",
    )

    // the standalone temperature sensors
    sensor-slow((-5.6, -0.4), 0.3, color: temperature-sensor-color, name: "TA")
    sensor-slow((-2.2, -0.4), 0.3, color: temperature-sensor-color, name: "TB")
    sensor-slow((-1, -3.5), 0.3, color: temperature-sensor-color, name: "TC")
    sensor-fast((-5.4, 0.6), 0.3, color: temperature-sensor-color, name: "Tfast")

    // the other environmental sensors
    let sensor-shape = rect.with(radius: 2pt)
    sensor-other((-2.2, -1.8), 0.6, shape: sensor-shape, color: pressure-sensor-color, label: $P$)
    sensor-other((-2.2, -2.8), 0.9, shape: sensor-shape, color: other-sensor-color, label: [#RH\ #CO2])

    // the glasscell
    glasscell("pos-glasscell", -90deg, 3, 1.5, 0.2, fill: luma(0%), name: "glasscell")

    // the pinch coils
    let x0 = -10
    let width = 0.15
    let length = 1.3
    let offset = 1
    for i in range(7) {
      pinch-coil((x0 + offset + i * width, 0), width, length, color: copper-color, name: "pinch-" + str(i))
    }

    // the Ioffe bars
    let x0 = -6
    let width = 0.15
    let length = 7
    for i in range(3) {
      let y0 = (i + 3) * width
      ioffe-bar((x0, y0), width, length, color: copper-color, name: "ioffe-upper-" + str(i))
      ioffe-bar((x0, -y0), width, length, color: copper-color, name: "ioffe-lower-" + str(i))
    }

    // the mu-metal
    let x0 = -4.8
    let thickness = 0.15
    rect((x0 - thickness, 0.5), (x0, 2), fill: metal-color, name: "mu-metal-upper")
    rect((x0 - thickness, -0.5), (x0, -3), fill: metal-color, name: "mu-metal-lower")

    // all the labels...
    content((rel: (0, -0.3 - mount-thickness), to: "doublet.L1.south"), "L2")
    content((rel: (0, -0.3 - mount-thickness), to: "doublet.L2.south"), "L1")
    content((rel: (0, -0.3), to: "retro.south"), "Retro mirror")
    content((rel: (0, -0.3), to: "glasscell.south"), "Glass cell")
    content((rel: (-0.9, 0.3), to: "ioffe-upper-2.north-east"), "Ioffe bars")
    content((rel: (0, -0.4), to: "pinch-4.south"), "Pinch coil")
    content((rel: (0, 0.3), to: "sensor-lens.north"), $T_"Lens"$)
    content((rel: (0, -0.3), to: "TA.south"), $T_"A"$)
    content((rel: (0, -0.3), to: "TB.south"), $T_"B"$)
    content((rel: (0, -0.3), to: "TC.south"), $T_"C"$)
    content((rel: (0, 0.3), to: "Tfast.north"), $T_"fast"$)
    content((rel: (0, -0.3), to: "mu-metal-lower.south"), mu-metal)
    content((rel: (0.3, 0.5), to: "mu-metal-lower.south"), "outside", anchor: "west")
    content((rel: (-0.3, 0.5), to: "mu-metal-lower.south"), "inside", anchor: "east")

    // the legend for the sensor models
    let rect-sensor = std.rect.with(width: 0.3cm, height: 0.3cm, radius: 2pt, stroke: linewidth-very-narrow)
    let circle-sensor = std.circle.with(radius: 0.15cm, stroke: linewidth-very-narrow)
    let surface-sensor = std.rect.with(
      width: sensor-width * 1cm,
      height: sensor-thickness * 1cm,
      stroke: linewidth-very-narrow,
    )
    let legend = std.table(
      columns: 2,
      stroke: none,
      align: (center + horizon, left + horizon),
      rect-sensor(fill: temperature-sensor-color), "Regular NTC thermistor",
      circle-sensor(fill: temperature-sensor-color), "Fast NTC thermistor",
      surface-sensor(fill: temperature-sensor-color), "Surface RTD",
      rect-sensor(fill: pressure-sensor-color), "Pressure sensor",
      rect-sensor(fill: other-sensor-color), [Humidity & #CO2 sensor],
    )
    content((-13, -2.2), legend, anchor: "north-west")

    // the coordinate system...
    scope({
      set-origin((-13.7, 1.7))
      set-style(mark: (end: ">", fill: black), stroke: (thickness: linewidth-very-narrow, cap: "round"))
      line((-0.1, 0), (1, 0), name: "x")
      line((0, 0.1), (0, -1), name: "y")

      content(("x.start", 115%, "x.end"), $x$)
      content(("y.start", 115%, "y.end"), $y$)
    })
  })
}

#set page(width: 17cm, height: auto, margin: 0.9em)
#std.figure(block(stroke: none, figure()))

