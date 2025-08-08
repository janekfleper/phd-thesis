#import "/header.typ": *

= Fermionic particles in optical lattices <ch:theory>

#notes[
  - Reference the sections in the introduction?
]

In this chapter, I will introduce the theoretical concepts behind the measurements presented in this thesis.
The interaction of far-detuned light with atoms is the foundation of the optical potentials we use to confine the atoms.
With a single laser beam, we can create an optical dipole trap for an entire atom cloud.
This is an essential tool for the trapping and cooling of quantum gases (see @sec:setup-prepare).
Multiple interfering laser beams form optical-lattice potentials that resemble the structure of a solid-state crystal.
The neutral atoms trapped in the optical-lattice potential take on the role of the free electrons in the crystal.
We can use the periodicity of the optical lattices to find the eigenstates of a particle with the Bloch theorem.
While the resulting Bloch waves are completely delocalized over the optical lattice, the Wannier functions provide a basis to describe localized particles.
If the particles are strongly localized to the lattice sites, we can use the tight-binding approximation to simplify the description of the system.
Instead of using spatial wavefunctions, each particle is just associated with a specific lattice site.
The particles can then tunnel to neighboring lattices sites, and they can interact with other particles on the same lattice site.

If we overlap two optical lattices with different lattice periods, we can create an optical superlattice.
In addition to the depths of both lattices, the relative phase between the two lattices is also tunable.
Therefore, compared to a regular lattice, the superlattice has a non-trivial unit cell and a complex band structure.
This requires an elaborate formalism to find the maximally localized Wannier functions.
In the tight-binding approximation, we can quantify the system with the tunneling amplitudes inside and outside of the unit cell, as well as an energy offset inside the unit cell.
If the tunneling amplitude outside of the unit cells is small, the superlattice potential resembles an array of weakly coupled double-well potentials.
The small system size of a double well enables us to determine the exact solution for a single particle and two interacting particles.

#include "dipole.typ"
#include "bloch.typ"
#include "wannier.typ"
#include "superlattice.typ"
#include "doublewell.typ"
