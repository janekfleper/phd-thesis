#import "@local/fancy-thesis:0.1.0": floating-figure
#import "@preview/physica:0.9.5" as phy
#import "@preview/fancy-units:0.1.1": num, qty, unit

#let subref(label, index) = {
  show ref: it => link(it.element.location(), it + index)
  ref(label)
}

#let cexp(body) = $upright(e)^(upright(i) #body)$
#let ncexp(body) = $upright(e)^(- upright(i) #body)$

#let sn(L, J) = {
  show math.frac: it => $it.num slash it.denom$
  $attach(#L, tl: 2, br: #J)$
}

#let mF(N) = $phy.ket(#N)$

#let K40 = $phy.isotope("K", a: 40)$
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

#let Vl = $V_l$
#let Vs = $V_s$
#let eL = $epsilon_L$
#let eR = $epsilon_R$
#let tin = $t_"in"$
#let tout = $t_"out"$

#let ketL = $phy.ket(L)$
#let ketR = $phy.ket(R)$
#let ketLL = $phy.ket(L L)$
#let ketLR = $phy.ket(L R)$
#let ketRL = $phy.ket(R L)$
#let ketRR = $phy.ket(R R)$

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
