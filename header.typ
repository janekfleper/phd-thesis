#import "@preview/physica:0.9.5" as phy
#import "@preview/fancy-units:0.1.1": num, unit, qty

#let cexp(body) = $upright(e)^(upright(i) #body)$
#let ncexp(body) = $upright(e)^(- upright(i) #body)$

#let asc = $a_upright("sc")$

// make this a global function in header.typ?
#let table-stroke(x, y, stroke: none) = {
  if (y == 0) { (bottom: stroke) }
  if (x == 0) { (right: stroke) }
}
