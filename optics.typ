#import "@preview/cetz:0.4.2"
#import "/header.typ": *

#let alphas = (40%, 90%, 40%)
#let default-fill = luma(0)
#let default-stroke = black + 0.9pt

#let lens(
  pos,
  angle,
  width,
  height,
  R1,
  R2,
  fill: auto,
  stroke: auto,
  name: none,
) = {
  if fill == auto { fill = default-fill }
  let _fill = std.gradient.linear(
    ..alphas.map(a => fill.transparentize(a)),
    angle: 90deg - angle,
  )
  let _stroke = if stroke == auto { default-stroke } else { stroke }

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
        stroke: _stroke,
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
  fill: auto,
  stroke: auto,
  name: none,
) = {
  if fill == auto { fill = default-fill }
  let _fill = std.gradient.linear(
    ..alphas.map(a => fill.transparentize(a)),
    angle: 90deg - angle,
  )
  let _stroke = if stroke == auto { default-stroke } else { stroke }

  import cetz.draw: *
  group(
    name: name,
    anchor: "center",
    {
      set-origin(pos)
      rotate(z: angle)
      set-origin((0, height / 2))
      rect(
        (0, 0),
        (width, -height),
        fill: _fill,
        stroke: _stroke,
      )
      if backside {
        rect(
          (width - 0.05, 0),
          (width, -height),
          fill: black,
          stroke: _stroke,
        )
      }
    },
  )
}

#let doublet(
  pos,
  angle,
  height,
  fill: auto,
  stroke: auto,
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
  stroke: auto,
  name: none,
) = {
  let _fill = if fill == auto { default-fill } else { fill }
  let _stroke = if stroke == auto { default-stroke } else { stroke }

  import cetz.draw: *
  group(
    name: name,
    anchor: "center",
    {
      set-origin(pos)
      rotate(z: angle)

      set-style(fill: _fill, stroke: _stroke)
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
