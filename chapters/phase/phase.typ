#import "/header.typ": *

= Controlling the superlattice phase <ch:phase>

#notes[
  - Mention that the stabilization introduced in @sec:phase-sensors is already applied in all prior measurements in this chapter...
]

The superlattice phase $phi$ is the third parameter of the superlattice potential in addition to the lattice depths $Vx1064$ and $Vx532$.
In this chapter, I will present the experimental setup to control the superlattice phase and introduce the measurements we use for the calibration of the phase $phi(x, y)$.
The standing-wave configuration of the individual lattices makes the phase easily tunable with the optical frequencies of the lattices.
However, it also makes the phase sensitive to the variation of the refractive indices along the optical path.
The long-term stabilization of the superlattice phase therefore requires an automated correction based on the environmental parameters that affect the refractive indices.
With the environmental corrections, we achieve an excellent stability of the superlattice phase.
In addition to the phase, we also calibrate the tunneling amplitude $t(x, y)$ and the interaction energy $U(x, y)$ in the double-well potentials.
At the end of the chapter, I will present the project where we used the phase to apply a periodic modulation to the superlattice potential.
This modulation allowed us to modify the tunneling and the effective interaction of pairs of atoms in the double wells.

#include "setup.typ"
#include "measure.typ"
#include "stability.typ"
#include "interaction.typ"
