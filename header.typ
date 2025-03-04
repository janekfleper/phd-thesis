#import "@preview/physica:0.9.4" as phy
#import "@preview/fancy-units:0.1.0": num, unit, qty

#let cexp(body) = [
  $upright(e)^(upright(i) #body)$
]

#let ncexp(body) = [
  $upright(e)^(- upright(i) #body)$
]

#let asc = $a_upright("sc")$
