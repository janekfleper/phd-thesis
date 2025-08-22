#import "/header.typ": *

#set page(width: auto, height: auto, margin: 0.9em)

#let optical-properties = (
  UVFS: (rho1064: $6.15$, rho532: $6.60$, a1064: $<0.001$, a532: $#hide[$<$]0.002$),
  NBK7: (rho1064: $4.08$, rho532: $4.69$, a1064: $0.12$, a532: $0.16$),
  CAF2: (rho1064: $-0.36$, rho532: $-0.32$, a1064: $<0.1$, a532: $<0.1$),
  NSF5: (rho1064: $5.40$, rho532: $7.30$, a1064: $0.24$, a532: $0.48$),
  NSF6HT: (rho1064: $4.74$, rho532: $7.66$, a1064: $0.12$, a532: $1.0#hide[0]$),
  NSF11: (rho1064: $5.10$, rho532: $7.99$, a1064: $0.08$, a532: $0.88$),
  NBAF10: (rho1064: $8.11$, rho532: $9.70$, a1064: $0.24$, a532: $0.4#hide[0]$),
  NBALF4: (rho1064: $7.54$, rho532: $8.76$, a1064: $0.28$, a532: $0.2#hide[0]$),
  TGG: (rho1064: $3.31$, rho532: $3.29$, a1064: $0.24$, a532: $3.1#hide[0]$),
)

#let table-optical-properties = table(
  columns: optical-properties.len() + 1,
  stroke: none,
  table.header("", UVFS, NBK7, CAF2, NSF5, NSF6HT, NSF11, NBAF10, NBALF4, TGG),
  table.cell(x: 0, y: 1, rowspan: 2, align: horizon, $rho slash 10^(-6) #unit(per-mode: "fraction")[W / m]$),
  table.cell(x: 0, y: 3, rowspan: 2, align: horizon, $a slash #unit(per-mode: "fraction")[% / (10 mm)]$),
  table.hline(y: 1),
  table.hline(y: 3),
  table.vline(x: 1),
  ..for x in range(optical-properties.len()) {
    (
      ..optical-properties
        .at(optical-properties.keys().at(x))
        .values()
        .enumerate()
        .map(((y, value)) => table.cell(x: x + 1, y: y + 1, value)),
    )
  },
)

#figure(table-optical-properties)
