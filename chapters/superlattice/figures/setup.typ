#import "/header.typ": *
#import "/optics.typ": *
#import "/style.typ": *

#let label-pad = 0.3

#let figure() = {
  show: figure-style

  cetz.canvas({
    import cetz.draw: *
    set-style(stroke: black + linewidth-very-narrow, mark: (scale: 0.7))

    let overlap = (0, 0)
    let forward-dichroic = (-3.6, 0)
    let forward-lens = (-4, 2)
    let glass-cell = (-3.5, 6)
    let retro-lens = (-4, 10)
    let retro-dichroic = (-4.4, 12)
    let retro-mirror = (2, 12)

    // the optical elements...
    let t1 = 0.2
    let t2 = 0.3
    let h1 = 1
    let h2 = 2
    mirror(overlap, 45deg, t2, h2, backside: false, transparent: true, name: "overlap")
    mirror(forward-dichroic, -135deg, t2, h2, backside: false, transparent: true, name: "forward-dichroic")
    mirror(retro-dichroic, 135deg, t2, h2, backside: false, transparent: true, name: "retro-dichroic")
    mirror(retro-mirror, 0deg, t1, h1, backside: true, name: "retro-mirror")
    glasscell(glass-cell, 0deg, 3, 1.5, 0.2, fill: luma(0%), name: "glasscell")

    // fix gradients of doublets...
    doublet(forward-lens, -90deg, h2, name: "forward-lens")
    doublet(retro-lens, 90deg, h2, name: "retro-lens")

    // the lattice beam anchors...
    anchor("p0", "overlap.surface")
    anchor("p1", "forward-dichroic.surface")
    anchor("p2", (rel: (0.4, 0), to: "forward-lens"))
    anchor("p3", "glasscell.atoms")
    anchor("p4", (rel: (-0.4, 0), to: "retro-lens"))
    anchor("p5", "retro-dichroic.surface")
    anchor("p6", "retro-mirror.surface")
    anchor("p5b", (rel: (0, 1), to: "retro-dichroic.surface"))
    anchor("p1b", (rel: (0, -1), to: "forward-dichroic.surface"))

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
        (start: 47.0%, stop: 52.9%),
        (start: 47.0%, stop: 52.9%),
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
    line((rel: (-label-pad, 0.4), to: "p5"), (rel: (0, 0.6)), mark: (end: ">", fill: black))
    line((rel: (-label-pad, -0.4), to: "p1"), (rel: (0, -0.6)), mark: (end: ">", fill: black))

    // the labels...
    content((rel: (label-pad, 0), to: "forward-lens.east"), "Forward lens", anchor: "west")
    content((rel: (label-pad, 0), to: "glasscell.east"), "Glass cell", anchor: "west")
    content((rel: (label-pad, 0), to: "retro-lens.east"), "Retro lens", anchor: "west")
    content((rel: (label-pad, 0), to: "retro-mirror.east"), "Retro mirror", anchor: "west")
    content((rel: (0, label-pad), to: "p5b"), "Beam monitoring")
    content((rel: (0, -label-pad), to: "p1b"), "Beam monitoring")
  })
}

#set page(width: 17cm, height: auto, margin: 0.9em)
#std.figure(block(stroke: none, figure()))

