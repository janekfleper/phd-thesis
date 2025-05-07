#import "/header.typ": *

== Magneto-optical trap <sec:setup-mot>

#[
  #set text(red)
  - Where should I mention the lasers? Or should I not mention them at all since we didn't change anything compared to Jeffrey/Marcell/Nicola
  - Should I even mention the different locks at all?
  - Should I actually mention the beam sizes? Or just say that large beams result in a large capture region.
  - Explain where the Doppler temperature comes from?
]

// In the first step of the experimental sequence a magneto-optical trap is used to capture atoms and to cool them down to
The magneto-optical trap (MOT) is the first step in the experimental sequence.
We are loading the MOT from a background gas at a pressure of #qty[1e-9][mbar] inside a glass cell.
The glass cell is surrounded by a pair of magnetic field coils in anti-Helmholtz configuration to create the quadrupole field that is required for a MOT.
Optical access to the glass cell is available along three perpendicular axes to allow three pairs of counterpropagating beams to be used.
The viewports/windows of the glass cell have diameters of #qty[50][mm] to allow large beams to be used which results in a large capture region for the MOT.

A closed transition is achieved on the D2 line between the states $F = 9 slash 2$ and $F' = 11 slash 2$ by using $sigma^+$-polarized _cooling_ beams.
// The so-called _cooling_ beams are $sigma^+$-polarized to target
// The closed D2 transition from $F = 9 slash 2$ to $F' = 11 slash 2$ is used as the _cooling_ transition (#text(red)[mention $sigma^+$ driving?]).
Due to imperfections of the polarization, the atoms can also be excited to the state $F' = 9 slash 2$.
If the atoms then decay to the ground state with $F = 7 slash 2$, they are in a dark state for the _cooling_ beams and they would neither be trapped nor cooled anymore.
To pump those atoms back into the closed transition, additional _repumping_ beams are used to drive the transition $F = 7 slash 2 -> F' = 9 slash 2$.
The power required in the _repumping_ beams is about 1/2 of the power in the _cooling_ beams since the splitting between the states $F' = 9 slash 2$ and $F' = 11 slash 2$ is to the linewidth of the D2 transition (#text(red)[#qty[6][MHz], mention this in K40 already?]).
#text(red)[Any comparison to e.g. Na here?]
The _repumping_ beams are therefore also directly contributing to the trapping and cooling in the MOT, despite the name suggesting otherwise.

Since the _cooling_ and _repumping_ beams have beam waists of a few #unit[cm], the initial capture region of the MOT will be equally/comparably large.
The MOT is therefore organized in several stages/steps to start with a large initial capture region and finish with a much smaller cloud and the maximum possible #text(red)[(phase-space)] density.
The initial stage lasts for $tilde #qty[4][s]$ until the loading from the background gas saturates.
In a second stage that lasts #qty[50][ms] the MOT is _compressed_ by increasing the strength of the quadrupole field and by reducing the detuning of the _cooling_ beams and the _repumping_ beams with respect to their transitions.
Those measures will reduce the size of the atom cloud and increase the scattering rates of the beams.
The probability that a spontaneously emitted photon is absorbed by another atom in the MOT again is therefore increased significantly.
This leads to an "inner" pressure that increases the size of the atom cloud again.
To counteract this, a _dark_ MOT stage is used where the power of the _repumping_ beams is decreased by a few orders of magnitude.
Most of the atoms will therefore end up in the dark state.
They can still collide/thermalize with the actively-cooled atoms (#text(red)[are atom-atom collisions actually relevant already?]), but they are no longer subjected to the laser cooling.
The cooling limit inside the MOT is defined by the Doppler temperature that is proportional to the linewidth $Gamma$ of the transition.
In the case of #phy.isotope("K", a: [40]) this amounts to $T_D = #qty[145][μK]$.
