#import "/header.typ": *

= Controlling the superlattice phase <ch:phase>

#notes[
  - Mention that the stabilization introduced in @sec:phase-stability is already applied in all prior measurements in this chapter...
]

The superlattice phase $phi$ is the third parameter of the superlattice potential, in addition to the lattice depths $Vx1064$ and $Vx532$.
In this chapter, I will present the experimental setup to control the superlattice phase and introduce the measurements we use for the calibration of the local phase $phi(x, y)$.
The standing-wave configuration of the individual lattices makes the phase easily tunable with the optical frequencies of the lattices.
However, it also makes the phase sensitive to variations of the refractive indices along the optical path.
The long-term stabilization of the superlattice phase therefore requires an active correction based on the environmental parameters that affect the refractive indices.
With the environmental corrections, we achieve an excellent stability of the superlattice phase.
In addition to the phase $phi(x, y)$, we also calibrate the tunneling amplitude $t(x, y)$ and the interaction energy $U(x, y)$ in the superlattice potentials.
At the end of the chapter, I will show how we used Floquet engineering to realize double wells in the superlattice where the single-particle tunneling is suppressed and the pair tunneling is enhanced compared to static double-well potentials.

#include "setup.typ"
#include "measure.typ"
#include "stability.typ"
#include "parameters.typ"
#include "floquet.typ"
