#import "/header.typ": *
#import "/optics.typ": *

#let ioffe-bar(pos, width, length, fill: none, name: none) = {
  assert.ne(fill, none, message: "The fill color must not be none...")
  let colors = (fill,) * 20 + (fill.darken(50%),) * 1

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

#let figure() = {
  // TODO: Use motorized mirror mount for the retro mirror?

  let metal-color = color.rgb("#b6b6b6")
  let copper-color = color.rgb("b87333")

  cetz.canvas({
    import cetz.draw: *
    set-style(mark: (scale: 0.7))

    // the mirrors...
    mirror((0, 0), 45deg, 0.2, 2, name: "dichroic")
    mirror((0, -4), -90deg, 0.2, 1, name: "retro")

    // the retro double lens with the mount
    let x0 = -3.5
    let radius = 0.75
    doublet((x0, 0), 00deg, radius * 2, name: "doublet")

    let mount-thickness = 0.1
    rect((x0 - 0.7, radius), (x0 + 0.5, radius + mount-thickness), fill: metal-color, name: "mount-upper")
    rect((x0 - 0.7, -radius), (x0 + 0.5, -radius - mount-thickness), fill: metal-color, name: "mount-lower")

    // the glasscell
    glasscell((-10, -0.5), -90deg, 3, 1.5, 0.2, fill: luma(70%), name: "glasscell")

    // the Ioffe bars
    let x0 = -6
    let width = 0.15
    let length = 8
    for i in range(3) {
      let y0 = (i + 3) * width
      ioffe-bar((x0, y0), width, length, fill: copper-color, name: "ioffe-upper-" + str(i))
      ioffe-bar((x0, -y0), width, length, fill: copper-color, name: "ioffe-lower-" + str(i))
    }

    // all the labels...
    content((rel: (0, -0.3 - mount-thickness), to: "doublet.L1.south"), "L1")
    content((rel: (0, -0.3 - mount-thickness), to: "doublet.L2.south"), "L2")
    content((rel: (0, -0.3), to: "retro.south"), "Retro mirror")
    content((rel: (0, -0.3), to: "glasscell.south"), "Glass cell")
    content((rel: (-0.9, -0.3), to: "ioffe-lower-2.south-east"), "Ioffe bars")
  })
}

#set page(width: 17cm, height: auto, margin: 0.9em)
#std.figure(block(stroke: none, figure()))

