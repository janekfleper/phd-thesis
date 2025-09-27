#import "/header.typ": *

= Fermionic particles in optical lattices <ch:theory>

Neutral atoms trapped in optical lattices provide a versatile platform to study many-body quantum systems.
The foundation of experimental setups with optical lattices is the interaction of atoms with far-detuned light.
With a single laser beam, we can create an optical dipole trap to confine a cloud of atoms.
By interfering multiple laser beams, we can form an optical lattice potential that resembles the periodic structure of a solid-state crystal.
The neutral atoms trapped in the optical lattice potential take on the role of the free electrons in the crystal.
The main processes in the optical lattice potential are the tunneling of atoms between lattice sites and the interaction of atoms that occupy the same lattice sites.
Based on these two processes, we can formulate the theoretical model to describe the behavior of atoms in a many-body state.

In the first section of this chapter, I will introduce the theoretical concepts behind the interaction of far-detuned light and neutral atoms with a focus on optical lattice potentials.
We use the periodicity of the optical lattices to determine the eigenvalues and eigenstates using Bloch's theorem in @sec:theory-bloch.
The resulting band structure is a characteristic property of the optical lattices that we use for the calibration of the lattice depths in @ch:mod.
In deep optical lattice potentials, the particles are typically described by Wannier functions that are strongly localized to the lattice sites.
The Wannier functions are introduced in @sec:theory-wannier together with the computation of the tunneling amplitude $t$ and the interaction energy $U$.

If we overlap two optical lattices with different lattice periods, we can create an optical superlattice potential.
In addition to the lattice depths, the relative phase between the two lattices is also tunable.
As presented in @sec:theory-super, the superlattice has a non-trivial unit cell and a complex band structure.
While Bloch's theorem can be applied directly to the superlattice potential, the computation of the maximally localized Wannier functions requires an elaborate formalism where multiple energy bands are mixed.

Specific configurations of the superlattice potential can be approximated by an array of weakly-coupled double-well potentials.
The small system size of a double well allows an exact computation of the spectrum for a single particle and two interacting particles.
In @sec:theory-double, the theoretical description of the double-well potential is derived with a focus on the time evolution of the particles.
This provides the basis for the calibration and other measurements related to the superlattice phase $phi$ in @ch:phase.

#include "dipole.typ"
#include "bloch.typ"
#include "wannier.typ"
#include "superlattice.typ"
#include "doublewell.typ"
