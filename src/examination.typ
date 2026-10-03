#let examination(supervisor: none, examiner: none, date: none) = {
  set page(numbering: none, header: none, footer: none)
  set par(first-line-indent: 0mm)
  set text(lang: "de", size: 11pt)

  let date-of-examination = if date != none { date.display("[day].[month].[year]") } else { none }
  let year-of-publication = if date != none { date.display("[year]") } else { none }

  v(3cm)
  align(center, [
    Angefertigt mit Genehmigung der Mathematisch-Naturwissenschaftlichen Fakultät\
    der Rheinischen Friedrich-Wilhelms-Universität Bonn
  ])

  v(1fr)
  table(
    columns: 2,
    column-gutter: 0.9em,
    inset: (left: 0mm),
    stroke: none,
    [Gutachter/Betreuer:], supervisor,
    [Gutachter:], examiner,
    table.cell(colspan: 2, []),
    [Tag der Promotion:], date-of-examination,
    [Erscheinungsjahr:], year-of-publication,
  )
}
