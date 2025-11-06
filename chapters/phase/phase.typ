#import "/header.typ": *

= Controlling the superlattice phase <ch:phase>

// TODO: Mention that the stabilization introduced in @sec:phase-stability is already applied in all prior measurements in this chapter...

The superlattice phase $phi$ controls the relative phase between the infrared (#qty[1064][nm]) lattice and the green (#qty[532][nm]) lattice that form the in-plane superlattice potential.
In this chapter, I will present the experimental setup to control the superlattice phase and introduce the measurements for calibrating the local phase $phi(x, y)$.
The standing-wave configuration of the individual lattices makes the phase easily tunable through the optical frequencies of the lattices.
In return, the phase is sensitive to variations of the refractive indices along the optical path.
The long-term stabilization of the superlattice phase, therefore, requires an active correction based on the environmental parameters that affect the refractive indices.
With the environmental corrections, we achieve an excellent stability of the superlattice phase.
Using the calibrated phase $phi(x, y)$, we measure the tunneling amplitude $t(x, y)$ and the interaction energy $U(x, y)$ in the superlattice potential.
At the end of the chapter, I will introduce Floquet engineering to realize double-well potentials in the superlattice where single-particle tunneling is suppressed and pair tunneling is enhanced compared to static double-well potentials.

#include "setup.typ"
#include "measure.typ"
#include "stability.typ"
#include "parameters.typ"
#include "floquet.typ"
