#import "/header.typ": *

= Theory <ch:theory>

In this chapter, I will introduce the theoretical concepts that form the basis of the measurements presented in this thesis.
Starting with the interaction of (far-detuned) light with atoms I will introduce the optical potentials that we are using in the experiment.

By interfering laser beams we can create so-called optical lattices which are periodic potentials for the atoms.
The periodicity of the potentials allows us to solve the Schrödinger equation using Bloch's theorem.
The so-called Bloch waves are the eigenstates of non-interacting atoms in optical lattices.
When an optical lattice is sufficiently deep, the atoms can also be described as localized particles.
The so-called Wannier functions are an alternative basis that can be computed directly from the Bloch waves.
Using the Wannier functions the system of atoms in an optical lattice can also be described in the tight-binding model.

By overlapping two optical lattices with different lattice periods along the same axis, we can create a so-called superlattice potential.
This allows us to create much more complex physical systems or to access states which would otherwise not be accessible in monochromatic lattices.
One special case of the superlattice potential is achieved when the lattice periods differ from each other by a factor of 2.
The potential landscape will then feature many double-well potentials where the offset $Delta$ between the sites can be changed by detuning the phase of the superlattice.

We use the two-site Hubbard model to explain the behavior of two interacting fermionic particles in a single double well...

#include "dipole.typ"
#include "bloch.typ"
#include "wannier.typ"
#include "superlattice.typ"
#include "doublewell.typ"
