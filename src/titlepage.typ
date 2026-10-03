#let titlepage(title: none, author: none, birthplace: none, date: none) = {
  set document(title: title, author: author, date: date)
  set page(numbering: none, header: none, footer: none, margin: (left: auto, right: auto))
  set text(lang: "de", size: 12pt)
  set align(center)

  std.title()
  v(8em)
  [
    Dissertation\
    zur\
    Erlangung des Doktorgrades (Dr. rer. nat.)\
    der\
    Mathematisch-Naturwissenschaftlichen Fakultät\
    der\
    Rheinischen Friedrich-Wilhelms-Universität Bonn
  ]
  v(6em)
  [
    vorgelegt von\
    #text(author, size: 1.2em, weight: 600)\
    aus\
    #birthplace
  ]
  v(1fr)
  [Bonn #date.display("[year]")]
}
