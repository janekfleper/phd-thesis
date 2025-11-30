#import "/header.typ": *
#import "/optics.typ": *
#import "/style.typ": *

#let t1 = 0.3
#let t2 = 0.4
#let h1 = 1
#let h2 = 2
#let label-pad = 0.3

#let setup-x1064() = {
  import cetz.draw: *
  let color = color-x1064

  let overlap = (0, 0)
  let dth = (0, -1.8)
  let relay-lens = (0, -3)
  let fiber-lens = (-0.7, -11)
  let fiber = (-1.2, -11)
  let L1 = (2.5, -9)
  let L2 = (0.5, -9)
  let focus = (0.5, -9)
  let HWP = (1.5, -7)
  let PBS1 = (2.5, -7)
  let PBS2 = (0.5, -7)
  let PBS3 = (-1.9, -7)
  let iso = (-0.7, -7)
  let pickoff = (4, -5.5)
  let M1 = (0, -4)
  let M2 = (4, -4)
  let M3 = (4, -7)
  let M4 = (-3, -7)
  let M5 = (-3, -9)
  let M6 = (4, -9)
  let M7 = (4, -11)

  group(
    name: "x1064",
    {
      // the optical elements...
      lens(relay-lens, 90deg, 0.2, h1, 10, -6, name: "relay-lens")
      lens(fiber-lens, 0deg, 0.15, h1 / 2, 10, -1, name: "fiber-lens")
      lens(L1, 0deg, 0.2, h1, none, -3, name: "L1")
      lens(L2, 0deg, 0.3, h1, -1, none, name: "L2")
      plate(HWP, 0deg, t1, h1, name: "HWP")
      cube(dth, 0deg, 1.4, name: "dth")
      cube(PBS1, 90deg, 0.7, name: "PBS1")
      cube(PBS2, 90deg, 0.7, name: "PBS2")
      cube(PBS3, 90deg, 0.7, name: "PBS3")
      isolator(iso, 0deg, 1.5, 0.7, name: "iso")
      mirror(M1, -135deg, t1, h1, name: "M1")
      mirror(M2, 45deg, t1, h1, name: "M2")
      mirror(pickoff, 135deg, t1, h1, transparent: true, backside: false, name: "pickoff")
      mirror(M3, -45deg, t1, h1, name: "M3")
      mirror(M4, 135deg, t1, h1, name: "M4")
      mirror(M5, -135deg, t1, h1, name: "M5")
      mirror(M6, 45deg, t1, h1, name: "M6")
      mirror(M7, -45deg, t1, h1, name: "M7")

      // the lattice beams...
      let beam-radius = 0.1
      let factor = 2
      on-layer(-1, {
        beam(overlap, "M1.surface", beam-radius, -90deg, color)
        beam("dth", (rel: (1, 0), to: "dth.east"), beam-radius, 0deg, color)
        beam("M1.surface", "M2.surface", beam-radius, 0deg, color)
        beam("M2.surface", "M3.surface", beam-radius, -90deg, color)
        beam(
          "pickoff.surface",
          (rel: (1, 0), to: "pickoff.surface"),
          beam-radius,
          0deg,
          color.transparentize(50%),
        )
        beam("M3.surface", "M4.surface", beam-radius, 0deg, color)
        beam("M4.surface", "M5.surface", beam-radius, -90deg, color)
        beam("M5.surface", "L2", beam-radius, 0deg, color)
        beam-focus("L1", focus, factor * beam-radius, beam-radius, 0deg, color)
        beam("L1", "M6.surface", factor * beam-radius, 0deg, color)
        beam("M6.surface", "M7.surface", factor * beam-radius, -90deg, color)
        beam("M7.surface", "fiber-lens", factor * beam-radius, 0deg, color)
        beam-focus(fiber, "fiber-lens", 0.01, factor * beam-radius, 0deg, color)
      })

      cetz.decorations.brace(
        (rel: (0, 0.1), to: "PBS3.north-west"),
        (rel: (0, 0.1), to: "PBS2.north-east"),
        name: "iso-brace",
      )

      // some arrows...
      line(
        (rel: (label-pad, -label-pad), to: "pickoff.surface"),
        (rel: (1 - label-pad, 0)),
        mark: (end: ">", fill: black),
      )
      line(
        (rel: (-label-pad, 0), to: fiber),
        (rel: (-1 + label-pad, 0)),
        mark: (start: ">", fill: black),
        name: "start",
      )
      line(
        (rel: (label-pad, label-pad), to: "dth.east"),
        (rel: (1 - label-pad, 0)),
        mark: (start: ">", fill: black),
      )

      // the labels...
      content(
        (rel: (-label-pad, 0), to: "relay-lens.west"),
        text(bottom-edge: "baseline", "Relay lens"),
        anchor: "east",
      )
      content((rel: (label-pad, 0), to: "relay-lens.east"), qty[750][mm], anchor: "west")
      content((rel: (0, label-pad), to: "HWP.north"), text(bottom-edge: "baseline", $lambda slash 2$), anchor: "south")
      content((rel: (0, label-pad), to: "iso-brace.spike"), "Isolator")
      content((rel: (0, -label-pad), to: "L1.south"), qty[150][mm])
      content((rel: (0, -label-pad), to: "L2.south"), qty[-75][mm])
      content(
        (rel: (1 + label-pad, -label-pad / 2), to: "pickoff.surface"),
        [Power\ regulation],
        anchor: "west",
      )
      content((rel: (-label-pad, 0), to: "start.end"), [#x1064 lattice], anchor: "east")
      content(
        (rel: (1 + label-pad, label-pad / 2), to: "dth.east"),
        [Horizontal\ dipole trap],
        anchor: "west",
      )
    },
  )
}

#let setup-x532() = {
  import cetz.draw: *
  let color = color-x532

  let overlap = (0, 0)
  let P1 = (2.5, 0)
  let P2 = (3.2, 0)
  let fiber-lens = (15, -5.5)
  let fiber = (15, -4.5)
  let L1 = (6.5, -1)
  let L2 = (8.5, -1)
  let L3 = (9.5, -1)
  let L4 = (11.5, -1)
  let HWP = (13, -7.5)
  let PBS1 = (13, -4.3)
  let PBS2 = (13, -6.7)
  let iso = (13, -5.5)
  let M1 = (5.5, 0)
  let M2 = (5.5, -1)
  let M3 = (13, -1)
  let M3b = (13, 0)
  let M4 = (13, -9)
  let M5 = (15, -9)

  let lens-label(lens, label) = {
    content(
      (rel: (0, -label-pad / 2), to: lens + ".south"),
      std.rotate(-45deg, reflow: true, label),
      anchor: "north-east",
    )
  }

  group(
    name: "x532",
    {
      // the optical elements...
      lens(fiber-lens, -90deg, 0.15, 0.8 * h1, 10, -0.9, name: "fiber-lens")
      lens(L1, 0deg, 0.3, h1, none, 1, name: "L1")
      lens(L2, 0deg, 0.2, h1, none, -3, name: "L2")
      lens(L3, 0deg, 0.3, h1, 3, none, name: "L3")
      lens(L4, 0deg, 0.3, h1, none, 1, name: "L4")
      plate(HWP, 90deg, t1, h1, name: "HWP")
      cube(PBS1, 90deg, 0.7, name: "PBS1")
      cube(PBS2, 90deg, 0.7, name: "PBS2")
      isolator(iso, 90deg, 1.5, 0.7, name: "iso")
      plate(P1, -5deg, t2, h1, name: "P1")
      plate(P2, -10deg, t2, h1, name: "P2")
      mirror(M1, 45deg, t1, h1, name: "M1")
      mirror(M2, -135deg, t1, h1, name: "M2")
      mirror(M3, 45deg, t1, h1, backside: false, name: "M3")
      mirror(M3b, 135deg, t1, h1, background-layer: -0.7, name: "M3b")
      mirror(M4, -135deg, t1, h1, name: "M4")
      mirror(M5, -45deg, t1, h1, name: "M5")

      // the lattice beams...
      let beam-radius = 0.1
      let factor = 2
      on-layer(-1, {
        beam(overlap, "M1.surface", beam-radius, 0deg, color)
        beam("M1.surface", "M2.surface", beam-radius, -90deg, color)
        beam("M2.surface", "L1", beam-radius, 0deg, color)
        beam-focus("L1", "L2", beam-radius, 2 * beam-radius, 0deg, color)
        beam("L2", "M3.surface", factor * beam-radius, 0deg, color)
        beam("M3.surface", "M4.surface", factor * beam-radius, -90deg, color)
        beam("M4.surface", "M5.surface", factor * beam-radius, 0deg, color)
        beam("M5.surface", "fiber-lens", factor * beam-radius, -90deg, color)
        beam-focus(fiber, "fiber-lens", 0.01, 2 * beam-radius, -90deg, color)
      })

      on-layer(-0.8, {
        beam("M3.surface", "M3b.surface", factor * beam-radius, 90deg, color.transparentize(50%))
        beam("M3b.surface", (rel: (1, 0), to: "M3b.surface"), factor * beam-radius, 0deg, color.lighten(50%))
        beam-corner("M3.surface", factor * beam-radius, -factor * beam-radius, -90deg, color.lighten(50%))
      })

      cetz.decorations.brace(
        (rel: (-0.1, 0), to: "PBS2.south-west"),
        (rel: (-0.1, 0), to: "PBS1.north-west"),
        name: "iso-brace",
      )

      // some arrows...
      line(
        (rel: (label-pad, -label-pad), to: "M3b.surface"),
        (rel: (1 - label-pad, 0)),
        mark: (end: ">", fill: black),
      )
      line(
        (rel: (0, label-pad), to: fiber),
        (rel: (0, 1 - label-pad)),
        mark: (start: ">", fill: black),
        name: "start",
      )

      lens-label("L1", qty[-50][mm])
      lens-label("L2", qty[125][mm])
      lens-label("L3", qty[150][mm])
      lens-label("L4", qty[-50][mm])
      content(
        (rel: (0, label-pad / 2), to: ("L1.north", 50%, "L2.north")),
        align(center, [Spherical\ telescope]),
        anchor: "south",
      )
      content(
        (rel: (0, label-pad / 2), to: ("L3.north", 50%, "L4.north")),
        align(center, [Cylindrical\ telescope]),
        anchor: "south",
      )
      content(
        (rel: (-label-pad, 0), to: "HWP.west"),
        text(bottom-edge: "baseline", $lambda slash 2$),
        anchor: "east",
      )
      content((rel: (0, label-pad), to: ("P1.north", 50%, "P2.north")), "Glass plates")
      content((rel: (-label-pad, 0), to: "iso-brace.spike"), "Isolator", anchor: "east")
      content(
        (rel: (1 + label-pad, -label-pad / 2), to: "M3b.surface"),
        [Power\ regulation],
        anchor: "west",
      )
      content((rel: (0, label-pad), to: "start.end"), align(center, [#x532\ lattice]), anchor: "south")
    },
  )
}
#let figure() = {
  show: figure-style

  cetz.canvas({
    import cetz.draw: *
    scale(x: 0.7, y: 0.7)
    set-style(stroke: black + linewidth-very-narrow, mark: (scale: 0.7))

    let overlap = (0, 0)
    let forward-dichroic = (-3.7, 0)
    let forward-lens = (-4, 2)
    let glass-cell = (-3.5, 5)
    let retro-lens = (-4, 8)
    let retro-dichroic = (-4.3, 10)
    let retro-mirror = (0, 10)

    // the optical elements...
    mirror(overlap, 45deg, t2, h2, backside: false, transparent: true, name: "overlap")
    mirror(forward-dichroic, -135deg, t2, h2, backside: false, transparent: true, name: "forward-dichroic")
    mirror(retro-dichroic, 135deg, t2, h2, backside: false, transparent: true, name: "retro-dichroic")
    mirror(retro-mirror, 0deg, t1, h1, backside: true, name: "retro-mirror")
    glasscell(glass-cell, 0deg, 3, 1.5, 0.25, fill: luma(0%), name: "glasscell")

    // fix gradients of doublets...
    doublet(forward-lens, -90deg, h2, name: "forward-lens")
    doublet(retro-lens, 90deg, h2, name: "retro-lens")

    // the lattice beam anchors...
    anchor("p0", "overlap.surface")
    anchor("p1", "forward-dichroic.surface")
    anchor("p2", (rel: (0.3, 0), to: "forward-lens"))
    anchor("p3", "glasscell.atoms")
    anchor("p4", (rel: (-0.3, 0), to: "retro-lens"))
    anchor("p5", "retro-dichroic.surface")
    anchor("p6", "retro-mirror.surface")
    anchor("p5b", (rel: (0, 1.2), to: "retro-dichroic.surface"))
    anchor("p1b", (rel: (0, -1.2), to: "forward-dichroic.surface"))

    // the lattice beams...
    let beam-focus = 0.04
    let beam-radius = 0.1
    let angle-focus = 90deg + calc.asin(0.8 / 8)
    on-layer(-1, {
      bichromatic-beam("p0", "p1", beam-radius, 0deg, color-x1064, color-x532)
      bichromatic-beam("p1", "p2", beam-radius, -90deg, color-x1064, color-x532)
      bichromatic-beam-focus(
        "p2",
        "p3",
        200%,
        beam-radius,
        beam-focus,
        angle-focus,
        angle-focus + 0.1deg,
        color-x1064,
        color-x532,
        (start: 46.0%, stop: 53.9%),
        (start: 46.0%, stop: 53.9%),
      )
      bichromatic-beam("p4", "p5", beam-radius, -90deg, color-x1064, color-x532)
      bichromatic-beam("p5", "p6", beam-radius, 0deg, color-x1064, color-x532)
    })

    on-layer(-0.8, {
      bichromatic-beam("p5", "p5b", beam-radius, -90deg, color-x1064.lighten(50%), color-x532.lighten(50%))
      beam-corner("p5", -beam-radius, -beam-radius, 90deg, color-x532.lighten(50%))

      bichromatic-beam("p1", "p1b", beam-radius, -90deg, color-x1064.lighten(50%), color-x532.lighten(50%))
      beam-corner("p1", -beam-radius, beam-radius, 90deg, color-x532.lighten(50%))
    })

    // some arrows...
    line((rel: (-label-pad, 0.5), to: "p5"), (rel: (0, 0.7)), mark: (end: ">", fill: black))
    line((rel: (-label-pad, -0.5), to: "p1"), (rel: (0, -0.7)), mark: (end: ">", fill: black))

    // the labels...
    content((rel: (label-pad, 0), to: "forward-lens.east"), "Forward lens", anchor: "west")
    content((rel: (-label-pad, 0), to: "forward-lens.west"), qty[250][mm], anchor: "east")
    content((rel: (label-pad, 0), to: "glasscell.east"), "Glass cell", anchor: "west")
    content((rel: (label-pad, 0), to: "retro-lens.east"), "Retro lens", anchor: "west")
    content((rel: (-label-pad, 0), to: "retro-lens.west"), qty[250][mm], anchor: "east")
    content((rel: (label-pad, 0), to: "retro-mirror.east"), "Retro mirror", anchor: "west")
    content((rel: (0, label-pad), to: "p5b"), "Beam monitoring")
    content((rel: (0, -label-pad), to: "p1b"), "Beam monitoring")

    setup-x1064()
    setup-x532()
  })
}

#set page(width: 17cm, height: auto, margin: 0.9em)
#std.figure(block(stroke: none, figure()))

