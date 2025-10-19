#import "@preview/cetz:0.4.1"
#import "@preview/physica:0.9.5" as phy
#import "/header.typ": *

#let coupled-lattice(ax: 1, ay: 1, nx: 4, ny: 4, theta: -10deg, dx: 5%, dy: 5%) = {
  // to make sure the lattice period a is centered relative to the horizontal line...
  show math.equation: set text(top-edge: "x-height")

  let grid-stroke = red.darken(20%) + 0.7pt
  let arrow-stroke = 1.4pt
  let arrow-style = (mark: (end: "triangle", fill: black, scale: 0.9))

  cetz.canvas({
    import cetz.draw: *

    // lattice grid lines
    for i in range(nx) {
      let name = "x" + str(i)
      let x = i * ax
      let y = (ny - 1) * ay // * calc.cos(theta)
      let sx = -(ny - 1) * ay * calc.sin(theta)
      line((x, 0), (x + sx, y), name: name, stroke: none)
      line(
        (name + ".start", -dy, name + ".end"),
        (name + ".start", 100% + dy, name + ".end"),
        stroke: grid-stroke,
      )
    }
    for i in range(ny) {
      let name = "y" + str(i)
      let x = (nx - 1) * ax
      let y = i * ay
      let sx = -i * ay * calc.sin(theta)
      line((sx, y), (x + sx, y), name: name, stroke: none)

      line(
        (name + ".start", -dx, name + ".end"),
        (name + ".start", 100% + dx, name + ".end"),
        stroke: grid-stroke,
      )
    }

    // lattice vectors
    line(
      ("y1.start", 100% / (nx - 1), "y1.end"),
      ("y1.start", 100% / (nx - 1) * 2, "y1.end"),
      name: "a1",
      stroke: arrow-stroke,
      ..arrow-style,
    )
    line(
      ("x1.start", 100% / (ny - 1), "x1.end"),
      ("x1.start", 100% / (ny - 1) * 2, "x1.end"),
      name: "a2",
      stroke: arrow-stroke,
      ..arrow-style,
    )
    content((rel: (0, -0.3), to: "a1"), a1)
    content((rel: (-0.3, 0), to: "a2"), a2)

    // lattice spacing
    line(
      ((nx - 0.4) * ax, 0),
      ((nx - 0.4) * ax, ay),
      name: "a",
      mark: (start: "|", end: "|", scale: 1.0),
    )
    content((rel: (0.2, 0), to: "a.mid"), $a$)

    // lattice angle
    let radius = (ny - 1) * ay * 0.9
    line((0, 0), (0, (ny - 1) * ay), stroke: (dash: "dashed", thickness: 0.7pt))
    arc((0, radius), radius: radius, start: 90deg, stop: 90deg + theta, name: "arc", stroke: 0.4pt)
    content((rel: (-0.03, -0.3), to: "arc.mid"), fitang)

    // coordinate system
    group(name: "coordinates", {
      translate((-0.6, -0.6))
      line((-0.2, 0), (1, 0), name: "ex", ..arrow-style)
      line((0, -0.2), (0, 1), name: "ey", ..arrow-style)
      content((rel: (0.2, 0), to: "ex.end"), $x$)
      content((rel: (0, 0.2), to: "ey.end"), $y$)
    })
  })
}

#set page(width: 20cm, height: auto, margin: 0.9em)
#figure(block(stroke: none, coupled-lattice()))
