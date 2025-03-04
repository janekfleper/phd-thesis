#import "../../header.typ": *

== Optical dipole traps <sec:setup-dipole>

#[
  #set text(red)
  - Move the comments about the cloud shape in the Ioffe-Pritchard trap to the Ioffe section?
  - Where to mention the lack of overlap between the Ioffe-Pritchard trap and the _horizontal_ dipole trap?
  - Just say "_horizontal_ beam" instead of "_horizontal_ dipole beam"?
  - What are the actual pumping steps? First into $m_F = 9 slash 2$ and then into $m_F = - 9 slash 2$? Or does the pumping directly target the high-field seeking states?
  - Where to mention the linewidth broadening?
  - Actually go into detail about the evaporative cooling? E.g. magnetic fields and multiple steps?
]

After the evaporative cooling in the Ioffe-Pritchard trap, the next step for the atoms in the sequence is an optical dipole trap.
The optical dipole trap consists of two crossed red-detuned laser beams at $lambda approx #qty[1064][nm]$, see #text(red)[figure].
There is a _horizontal_ dipole beam that propagates along the $x$-axis and there is a _dimple_ dipole beam in the $y z$-plane at an angle of $~45^degree$ relative to the $x y$-plane.
To achieve a strong confinement along the vertical $z$-axis, the _horizontal_ dipole beam has a waist of $w_z approx #qty[12][μm]$.
A small atom cloud in the $z$-direction is desired to only load a few planes of the vertical lattice #text(red)[ref z-lattice].

For the transfer of the atoms from the Ioffe-Pritchard trap to the dipole trap only the _horizontal_ dipole beam is used to match the shape of the two potentials.
In the Ioffe-Pritchard trap the atom cloud is elongated (cigar-shaped) in the $x$-direction since the strong confinenement is created by the Ioffe-bars in the $y$-direction.
A similar potential is realized by the _horizontal_ dipole beam since the confinement in the $x$-direction is only created by the Rayleigh length for the vertical waist, whereas the confinement in the $y z$-plane is created by the waists themselves.
While ramping up the _horizontal_ dipole beam, a small magnetic bias field is applied along the $x$-axis in addition to the Ioffe-Pritchard trap.
This field is required to conserve the quantization axis after the Ioffe-Pritchard trap is turned off.
Using a static RF frequency and a sweep of the magnetic bias field, the atoms are transfered to the state $F = 9 slash 2, m_F = 9 slash 2$.
The magnetic bias field is then turned off while the vertical magnetic field (created by the so-called _Slow Feshbach_ coils) is turned on.
If this is done sufficiently slow, the spins will follow the changing quantization axis that now points along the $z$-axis for the rest of the experimental sequence.
With another static RF frequency and a sweep of the vertical magnetic field, the atoms are transfered to the high-field seeking state $F = 9 slash 2, m_F = - 9 slash 2$.
This state is the actual ground state of the $F = 9 slash 2$ HFS manifold.
Since it is a high-field seeking state, it could not be used for any of the magnetic traps, but in the optical dipole trap the magnetic state is not relevant for the trapping potential as long as the electronic state is the ground state.

The _dimple_ dipole beam is turned on after the atoms are already loaded into the optical potential created by the _horizontal_ dipole beam.
The total dipole potential is now cylindrical-like? with the strong confinement along the $z$-axis and a medium confinement in the $x y$-plane.
The atom cloud is then evaporatively cooled by reducing the power of the dipole beams (and therefore the trap depth) in several steps.
To make the evaporative cooling efficient, there should be an equal number of atoms in the two lowest HFS states $m_F = -9 slash 2$ and $m_F = -7 slash 2$.
This is realized by so-called _spin-mixing_ pulses that are optimized to turn a (mostly) polarized atom cloud into a 50:50 mixture of the two lowest HFS states.
Durign the initial evaporative cooling step, the interaction (#text(red)[ref what?]) is slightly repulsive at $a_s approx #qty[140][_a_#sub[0]]$ and $B_0 approx #qty[235][G]$.
In a later evaporation step the magnetic field is tuned to $B_0 approx #qty[204][G]$ where the interaction is attractive at $a_s approx #qty[-500][_a_#sub[0]]$.
This attractive evaporation allows optimal loading of doubly-occupied lattice sites?
At the end of the dipole trap we have a three-dimensional Fermi gas with $~ #num[5e5]$ atoms in each of the two lowest hyperfine states at a temperature of $T slash T_F approx 0.1$, where $T_F$ is the Fermi temperature.
