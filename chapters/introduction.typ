#import "/header.typ": *

= Introduction <ch:intro>

#notes[
  - Where to introduce difference between analog and digital quantum simulation?
  - Really mention optical lattices for atomic clocks?
  - Is the lattice configuration from the Esslinger group really a superlattice?
  - Mention strength of _many_ atoms in optical lattices (compared to tweezers)
  - Already mention the Feshbach resonances before the lattices? E.g. for the cooling?
  - Mention optical lattice with Photon BEC?
  - Quickly mention high-temperature superconductivity?
]

Since the first realization of a degenerate Fermi gases #tr[cite deMarco (1999?)], experimental setups using ultracold fermionic atoms have pushed the boundaries in/of quantum simulations.
Reaching this regime required earlier advancements in trapping and cooling neutral atoms.
The development of the magneto-optical trap (or the molasses first?) #tr[cite what?] based on laser cooling #tr[cite what?] set off a series of advancements in cooling techniques.
Laser cooling uses scattering of near-resonant photons to reduce the momentum of the atoms.
With alkali atoms, this cooling technique is limited to the Doppler temperature by the linewidths of the available electronic/optical transitions #tr[cite Doppler cooling limit?].
Lower temperatures can be achieved with evaporative cooling, where the atoms with the highest kinetic energy in the cloud are removed from the trap.
With continuous thermalization, this technique can achieve significantly lower temperature than laser cooling and the required phase-space density for a degenerate Fermi gas.
Evaporative cooling can be used in both magnetic traps as well as optical dipole traps.

#tr[Cite Greiner 3D lattice paper here somewhere...]
The development of optical lattices enabled the quantum simulation of solid state systems where the valence electrons tunnel between the #tr[ions] that make up the crystal structure.
In an optical lattice, the neutral atoms take on the role of the valence electrons and the potential minima define the lattice sites in place of the ions.
Optical lattices are created by interfering multiple #tr[far-detuned] laser beams to form a periodic optical pattern.
The optical dipole potential is proportional to the intensity of the interference pattern, where the sign depends on the detuning of the wavelength of the lattice beams from the optical transitions of the atoms #tr[discuss the frequency instead?].
#tr[If the wavelength of the lattice beams is shorter (longer) than the optical transition(s), the lattice is blue (red) detuned and the corresponding dipole potential is repulsive (attractive).]
This forms the basis of the tunability of the optical lattice potential.
The dynamics and the confinement of the atoms in the optical lattice depend on the lattice depth which can be directly varied through the beam power.
This is a powerful advantage over (real) solid state systems that are (usually) not tunable.

The most common type of optical lattice uses two interfering laser beams.
The lattice period depends on the wavelength of the laser beams as well as their angle of intersection.
If the lattice is formed with a single laser beam that is reflected onto itself, a standing wave pattern emerges.
With two individual laser beams, the counterpropagating configuration can be used to create a #tr[moving/conveyor belt] lattice by slightly detuning the frequency of the two beams #tr[cite the first paper here?].
This can be useful to transport atoms in an optical lattice over macroscopic distances #tr[cite Lukas? Alberti/Meschede?].
A smaller angle between the interfering laser/lattice beams results in a longer lattice period.
If the intersection angle is tunable, the optical lattice has a dynamic lattice period that can be changed during the experiment.
This can be used to improve the loading of the atoms into an optical lattice #tr[cite OG shallow-angle/accordion lattice], or to increase the lattice spacing for an improved detection of the atoms #tr[cite Greiner cryogenic?].
Compared to counterpropagating beam configurations, a shallow-angle lattice can be constructed with an inherently stable lattice phase.
If the two laser/lattice beams share (most of) the optical path, their optical phase will accumulate/propagate equally?

Advanced lattice geometries can be created with more than two lattice beams #tr[cite something general like the Windpassinger review?].
By interfering three laser/lattice beams at angles of #deg[120] a hexagonal lattice structure (like graphene) can be created #tr[cite something specific here].
A(nother) common type of (advanced) geometry are optical superlattices, which also have a non-trivial unit cell just like the hexagonal lattice #tr[cite what?].
There are two (common) approaches to create a superlattice potential.
The first approach is based on perpendicular lattice beams that interfere to form an optical lattice along their diagonal axis #tr[cite something from the Esslinger group].
With an additional (independent) optical lattice along one of the two axes, a complex two-dimensional lattice potential can be created.
Depending on the intensity/power of the three beams, the lattice potential can be tuned from a cubic pattern to an array of dimers which allow a study of atoms in individual double wells.
This type of lattice potential was also recently used to realize a cryogenic atom cloud to access new regimes in the phase diagram of the Hubbard model #tr[cite Greiner paper].
A fundamental strength of the kind of lattice potential is the fine control of the confining/radial potential due to the Gaussian envelopes of the laser/lattice beams.
A redistribution of the atoms is detrimental for/to the temperature of a/the many-body system.
Being able to conserve the confinement while tuning the lattice geometry is, therefore, essential to achieve (ultra)cold temperatures in optical lattices #tr[cite Jean-Sebastien here already?].

#tr[mention bichromatic early in the paragraph?]
The other/second type of superlattice configuration is based on two superimposed lattices with commensurate lattice periods #tr[cite some OG paper here?].
The most common configuration uses two lattices with periods differing by the factor two.
This can be achieved by using commensurate wavelengths #tr[cite?] or with appropriate intersection angles #tr[is there something to cite here?].
In this thesis, we use the former approach to create a superlattice potential with two lattices at the wavelengths $lambda = #qty[1064][nm]$ and $lambda = #qty[532][nm]$.
Such a superlattice potential enables the investigation of topological phenomena/systems that are described by the SSH model #tr[cite] or the Rice-Mele model #tr[cite].
Besides the lattice depths of the individual lattices, the superlattice potential features an additional degree of freedom, namely the superlattice phase.
By tuning the relative phase of the individual lattices, one/we can adjust the configuration of the superlattice from coupled dimers to a staggered potential.
This opens up a variety of static and dynamic lattice potentials.
The bichromatic superlattice potential is mostly suitable for (extended) one-dimensional systems.
The overlap of the individual lattices results in a strong sensitivity of the confining/radial potential to the superlattice phase.
In a two-dimensional lattice potential, a change of the confinement leads to a redistribution of the atoms, which is detrimental for their temperature.

While the lattice depths govern the timescale of the dynamics in the optical lattices through the tunneling amplitude, the interaction of atoms on the same lattice site can be tuned with magnetic Feshbach resonances #tr[cite review Chin and paper Shin?].
In the case of fermionic atoms, this interaction is restricted to atoms with a different spin according to the Pauli principle, which prevents fermionic particles from occupying the exact same state.
Close to a Feshbach resonance, the interaction between two atoms can be tuned from the attractive to the repulsive regime, giving access to a rich variety of possible systems/models.

Besides analog quantum simulators, optical lattices are also useful for digital quantum simulators such as quantum computers using neutral atoms.
While optical tweezers are used to address and rearrange individual atoms, optical lattices can provide an underlying potential to pin/trap the individual atoms/qubits.
Compared to (two-dimensional) arrays of optical tweezers, optical lattices are spatially robust and easy? to maintain.
In the context of quantum computers, the lattices are only/mainly used to confine the atoms without ever allowing tunneling between the lattice sites.
Nevertheless, a calibration of the lattice potential is essential for a long-term operation of the optical lattice.
For this, the same calibration techniques can be used as for the "regular" lattices, which we explore in this thesis.

The Fermi Hubbard model provides a minimal description of neutral atoms in an optical lattice #tr[cite OG Hubbard paper?].
The atoms in the optical lattice can tunnel between the lattice sites and they experience an interaction energy if two atoms of opposite spin occupy the same lattice site.
In the framework of second quantization, only the occupation of each lattice site is counted instead of using the spatial wavefunction of each atom.
This provides a significant simplification of the many-body states and the Hamiltonian to describe the dynamics in the Hubbard model.
Nevertheless, the Fermi Hubbard model can only be solved numerically in very small systems due to the exponentially increasing size of the #tr[basis]?
Neutral atoms in optical lattices allow us to study the Fermi Hubbard model with an analog quantum simulation.

The idea behind/advantage of quantum simulations using neutral atoms is the tunability of the system parameters/properties (compared to solid state systems) and the scalability compared to the simulation on classical computers #tr[cite Feynman?].
