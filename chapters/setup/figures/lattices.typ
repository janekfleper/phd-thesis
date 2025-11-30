#import "/header.typ": *
#import "/style.typ": *

#let figure() = block({
  show: figure-style
  place(dx: 47%, dy: 77.4%, $x$)
  place(dx: 47.5%, dy: 93%, $y$)
  place(dx: 37.7%, dy: 64%, $z$)
  place(dx: 3%, dy: 76%, [#x1064 + #x532])
  place(dx: 8%, dy: 5%, y1064)
  place(dx: 87%, dy: 28%, z532)
  place(dx: 83%, dy: 89.5%, z532)
  image("alpha_lattices.png", width: 79%)
})

#set page(width: 17cm, height: auto, margin: 0.9em)
#std.figure(block(stroke: black, figure()))
