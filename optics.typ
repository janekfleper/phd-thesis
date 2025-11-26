#import "@preview/cetz:0.4.2"
#import "/header.typ": *

#let alphas = (40%, 90%, 40%)
#let default-fill = luma(0)

#let lens(
  pos,
  angle,
  width,
  height,
  R1,
  R2,
  fill: auto,
  name: none,
) = {
  if fill == auto { fill = default-fill }
  let _fill = std.gradient.linear(
    ..alphas.map(a => fill.transparentize(a)),
    angle: 90deg - angle,
  )

  import cetz.draw: *
  group(
    name: name,
    anchor: "center",
    {
      set-origin(pos)
      rotate(z: angle)
      set-origin((-width / 2, height / 2))

      merge-path(
        close: true,
        fill: _fill,
        {
          if R1 == none {
            line((0, 0), (0, -height), name: "S1")
          } else {
            let angle1 = -calc.asin(0.5 * height / R1)
            arc(
              (0, 0),
              start: angle1,
              stop: -angle1,
              radius: -R1,
              name: "S1",
            )
          }

          line((), (rel: (width, 0)))

          if R2 == none {
            line((), (rel: (0, height)), name: "S2")
          } else {
            let angle2 = calc.asin(0.5 * height / R2)
            arc(
              (),
              start: 180deg + angle2,
              stop: 180deg - angle2,
              radius: R2,
              name: "S2",
            )
          }
        },
      )
    },
  )
}

#let mirror(
  pos,
  angle,
  width,
  height,
  backside: true,
  transparent: false,
  fill: auto,
  name: none,
) = {
  if fill == auto { fill = default-fill }
  let _fill = std.gradient.linear(
    ..alphas.map(a => fill.transparentize(a)),
    angle: 90deg - angle,
  )

  import cetz.draw: *
  group(
    name: name,
    anchor: "center",
    {
      set-origin(pos)
      rotate(z: angle)
      set-origin((0, height / 2))
      line((0, 0), (0, -height), stroke: blue, name: "surface")

      if not transparent { rect((0, 0), (width, -height), fill: white) }
      rect((0, 0), (width, -height), fill: _fill)
      if backside { rect((width - 0.05, 0), (width, -height), fill: black) }
    },
  )
}

#let doublet(
  pos,
  angle,
  height,
  fill: auto,
  name: none,
) = {
  let t1 = 0.3
  let t2 = 0.5
  let dt = 0.1
  let pos1 = (0, 0)
  let pos2 = ((t1 + t2) / 2 + dt, 0)
  let (R11, R12) = (20, 3)
  let (R21, R22) = (3, -4)

  import cetz.draw: *
  group(
    name: name,
    anchor: "center",
    {
      set-origin(pos)
      rotate(z: angle)
      set-origin((-(t1 + t2 + dt) / 2, 0))
      lens(pos1, 0deg, t1, height, R11, R12, name: "L1")
      lens(pos2, 0deg, t2, height, R21, R22, name: "L2")
    },
  )
}

#let glasscell(
  pos,
  angle,
  width,
  height,
  thickness,
  fill: auto,
  name: none,
) = {
  let _fill = if fill == auto { default-fill } else { fill }

  import cetz.draw: *
  group(
    name: name,
    anchor: "center",
    {
      set-origin(pos)
      rotate(z: angle)

      set-style(fill: _fill.transparentize(70%))
      rect(
        (height / 2, height / 2),
        (rel: (-width, -thickness)),
      )
      rect(
        (height / 2, -height / 2),
        (rel: (-width, thickness)),
      )
      rect(
        (height / 2, -height / 2 + thickness),
        (rel: (-thickness, height - 2 * thickness)),
      )
    },
  )
}

#let bichromatic-beam(pos0, pos1, radius, angle, C0, C1) = {
  let dx = calc.sin(angle) * radius
  let dy = calc.cos(angle) * radius

  import cetz.draw: *
  merge-path(
    close: true,
    fill: std.gradient.linear(C0, C0.transparentize(100%), angle: angle + 90deg),
    stroke: none,
    {
      line(pos0, pos1)
      line((), (rel: (-dx, -dy)))
      line((), (rel: (-dx, -dy), to: pos0))
    },
  )
  merge-path(
    close: true,
    fill: std.gradient.linear(C1, C1.transparentize(100%), angle: angle - 90deg),
    stroke: none,
    {
      line(pos0, pos1)
      line((), (rel: (dx, dy)))
      line((), (rel: (dx, dy), to: pos0))
    },
  )
}

#let bichromatic-beam-focus(pos0, pos1, length, radius, focus, angle, C0, C1, g0, g1) = {
  let dx0 = calc.round(calc.sin(angle), digits: 1) * radius
  let dy0 = calc.round(calc.cos(angle), digits: 1) * radius
  let dx1 = calc.round(calc.sin(angle), digits: 1) * focus
  let dy1 = calc.round(calc.cos(angle), digits: 1) * focus
  let dx2 = calc.abs(length - 100%) / 100% * (dx0 - dx1) + dx1
  let dy2 = calc.abs(length - 100%) / 100% * (dy0 - dy1) + dy1

  let fill0 = std.gradient.linear(
    (C0, 0%),
    (C0, g0.at("start")),
    (C0.transparentize(100%), g0.at("stop")),
    (C0.transparentize(100%), 100%),
    angle: -angle + 90deg,
  )
  let fill1 = std.gradient.linear(
    (C1, 0%),
    (C1, g1.at("start")),
    (C1.transparentize(100%), g1.at("stop")),
    (C1.transparentize(100%), 100%),
    angle: -angle - 90deg,
  )

  import cetz.draw: *
  merge-path(
    close: true,
    fill: fill0,
    stroke: none,
    {
      line(pos0, (pos0, length, pos1))
      line((), (rel: (-dx2, -dy2)))
      line((), (rel: (-dx1, -dy1), to: pos1))
      line((), (rel: (-dx0, -dy0), to: pos0))
    },
  )
  merge-path(
    close: true,
    fill: fill1,
    stroke: none,
    {
      line(pos0, (pos0, length, pos1))
      line((), (rel: (dx2, dy2)))
      line((), (rel: (dx1, dy1), to: pos1))
      line((), (rel: (dx0, dy0), to: pos0))
    },
  )
}
