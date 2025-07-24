#import "@local/fancy-thesis:0.1.0": floating-figure
#import "@preview/physica:0.9.5" as phy
#import "@preview/fancy-units:0.1.1": num, qty, unit

#let subref(label, index) = {
  show ref: it => link(it.element.location(), it + index)
  ref(label)
}

#let cexp(body) = $upright(e)^(upright(i) #body)$
#let ncexp(body) = $upright(e)^(- upright(i) #body)$

#let asc = $a_upright("sc")$
#let fita0 = sym.alpha

#let vx1064 = $v_(x 1064)$
#let Vx1064 = $V_(x 1064)$
#let vx532 = $v_(x 532)$
#let Vx532 = $V_(x 532)$
#let vy1064 = $v_(y 1064)$
#let Vy1064 = $V_(y 1064)$
#let vz532 = $v_(z 532)$
#let Vz532 = $V_(z 532)$

#let band = $epsilon$
#let cband = $tilde(epsilon)$

#let eL = $epsilon_L$
#let eR = $epsilon_R$
#let tin = $t_"in"$
#let tout = $t_"out"$

// a shortcut for red text to be used as an annotation
#let tr = text.with(red)

#let notes(body) = {
  show list: set text(red)
  body
}

// make this a global function in header.typ?
#let table-stroke(x, y, stroke: none) = {
  if (y == 0) { (bottom: stroke) }
  if (x == 0) { (right: stroke) }
}
