#import "/header.typ": *

== Preparing a degenerate Fermi gas <sec:setup-prepare>

Before the atoms can be loaded into the optical lattices, they need to be cooled down to quantum degeneracy.
We are using several trapping and cooling steps during the experimental sequence to achieve this.
I will briefly summarize the different techniques in this section, while referring to the previous PhD theses for the technical details.


=== Magneto-optical trap <sec:setup-prepare-mot>

The experimental sequence starts with a three-dimensional magneto-optical trap (MOT) that is loaded from a background gas at a pressure of #qty[e-9][mbar] @frohlich_strongly_2011.
As shown in #subref(<fig:setup-k40-hfs>, "a"), the MOT uses two transitions on the D2 line between the ground state $sn(S, 1/2)$ and the excited state $sn(P, 3/2)$.
The closed transition $phy.ket(F = 9 slash 2) -> phy.ket(F' = 11 slash 2)$ is used for the cooling of the atoms, and the transition $phy.ket(F = 7 slash 2) -> phy.ket(F' = 9 slash 2)$ is required for the repumping.
While the cooling transition itself is closed, a significant number of atoms are excited to the state $phy.ket(F' = 9 slash 2)$ due to the small hyperfine splitting $Delta E slash h = #qty[44.1][MHz]$.
From this excited state, the atoms can also decay to the ground state $phy.ket(F = 7 slash 2)$, which cannot be addressed with the cooling wavelength.
The repumping transition is therefore necessary to keep all atoms inside the cooling cycle.

The wavelengths of the cooling light and the repumping light are red-detuned from the respective transitions to enable the laser cooling of the atoms based on the position and the velocity of the atoms.
Due to the large hyperfine splitting in the ground state, we need to use two separate lasers that are detuned by $Delta nu approx #qty[1.3][GHz]$.
The frequency of the repumping laser#footnote[
  Toptica DL Pro + Eagleyard tapered amplifier
] is stabilized with an FM-spectroscopy lock to the Doppler-free absorption spectrum of $phy.isotope("K", a: 39)$.
The cooling laser#footnote[
  Coherent Verdi V18 + Coherent MBR-110
] is then stabilized relative to the repumping laser with a frequency-offset lock.
The details of the laser system and the frequency locks can be found in @feld_low_2011.


=== Ioffe-Pritchard trap <sec:setup-prepare-ioffe>

The background pressure of #qty[e-9][mbar] requires the MOT to be spatially separated from the glass cell where we achieve a pressure $<#qty[e-11][mbar]$.
The two sections of the vacuum system are connected by differential pumping tubes, and a pair of coils mounted on a mechanical stage moves the atoms from the MOT to the glass cell @frohlich_strongly_2011.
The coils create a strong magnetic quadrupole field that can trap atoms in the low-field seeking $m_F$ states.
After the MOT, the atoms are optically pumped to the states $FmF(9/2, 9/2)$ and $FmF(9/2, 7/2)$ of the electronic ground state $sn(S, 1/2)$.
The coils on the mechanical stage will then move the atoms to the glass cell, where they are loaded into a Ioffe-Pritchard trap.
Compared to the quadrupole field of the transport coils, the Ioffe-Pritchard trap has an offset magnetic field in the center to prevent Majorana losses @bergeman_magnetostatic_1987.
We use forced evaporative cooling inside the Ioffe-Pritchard trap by driving the microwave transition to the high-field seeking $m_F$ states in the $F = 7 slash 2$ hyperfine manifold to remove the hottest atoms.
An additional radio-frequency field is used to balance the occupation of the $m_F$ states @frohlich_strongly_2011.
After the evaporation, the atom cloud contains approximately #num[5e6] atoms in the states $FmF(9/2, 9/2)$ and $FmF(9/2, 7/2)$ at a temperature of $T approx #qty[2.5][μK]$.


=== Optical dipole trap <sec:setup-prepare-dipole>

After the evaporative cooling in the Ioffe-Pritchard trap, the atoms are transferred to an optical dipole trap @vogt_collective_2013.
Compared to the potential of a magnetic trap, the optical dipole potential introduced in @sec:theory-dipole does not depend on the $m_F$ state for a large detuning $Delta$.
Atoms in different $m_F$ states are therefore subject to the same potential, and we can use the lowest $m_F$ states in the $F = 9 slash 2$ hyperfine manifold.
The optical dipole trap consists of two red-detuned laser beams with a wavelength $lambda approx #qty[1064][nm]$.
In the first step, the atoms are loaded from the Ioffe-Pritchard trap into the horizontal dipole beam propagating along the #x-axis.
The trap geometry of the horizontal dipole beam matches the elongated shape of the atom cloud in the Ioffe-Pritchard trap.
To achieve a variable three-dimensional confinement, we add the dimple beam to create a crossed dipole trap.
The dimple beam propagates in the #yz-plane at an angle of $~#deg[45]$ relative to the #xy-plane.

The horizontal beam has an elliptical shape with the waists $w_z approx #qty[12][μm]$ and $w_y approx #qty[140][μm]$.
This results in a strong vertical confinement that is required for the loading of the atoms into the optical lattices (see @sec:setup-lattices).
The dimple beam has a circular shape with a waist of $w_0 approx #qty[150][μm]$, enabling an equal confinement of the atoms in the #xy-plane.
Both dipole beams are created from the same laser#footnote[
  Eagleyard DFB diode + NKT Koheras BOOSTIK #qty[10][W]
] with a broadened linewidth to reduce the coherence length below #qty[10][mm] @gall_quantum_2020.
This is required to avoid an optical lattice potential created by the horizontal dipole beam with its own reflection off the inner surfaces of the glass cell#footnote[
  Only the outer surfaces of the glass cell have an anti-reflection coating.
].

After the atoms are loaded into the crossed-beam dipole trap, we gradually reduce the power of the beams to lower the dipole potential.
This evaporates the hottest atoms again, since they occupy the high-energy states inside the dipole trap.
During the evaporation, elastic collisions between the atoms are essential for a continuous thermalization.
The atoms occupy an equal mixture of the states #mF(9) and #mF(7) and we can tune the scattering properties with the magnetic Feshbach resonance introduced in @sec:setup-k40.
In the experimental setup, the magnetic field $B$ can be varied with two pairs of magnetic field coils @frohlich_strongly_2011.
The slow Feshbach coils have a large diameter to create a homogeneous magnetic field around the Feshbach resonance of the #mix(9, 7) mixture at $B_0 = #qty[202.1][G]$.
With a large inductance of $tilde #qty[2.3][mH]$ per coil, the noise of the magnetic field $B$ of the slow Feshbach coils is minimized.
The fast Feshbach coils, on the other hand, have a small inductance of $tilde #qty[40][μH]$ per coil to allow rapid changes of the magnetic field by $abs(B) < #qty[20][G]$.
Additionally, the fast Feshbach coils can be used to create a gradient magnetic field @miller_ultracold_2016.
The gradient configuration is discussed in detail in @ssec:setup-sequence-detect.

For the measurements in this thesis, we used the evaporation scheme developed in @gall_quantum_2020.
The magnetic field is initially set to $B = #qty[235][G]$ where the atoms experience repulsive interactions.
During the evaporation, the magnetic field is reduced to $B approx #qty[204][G]$ to get a strongly attractive interaction in the mixture #mix(9, 7).
At the end of the evaporation, we have a three-dimensional Fermi gas with approximately #num[8e4] atoms in each of the two $m_F$ states at a temperature of $T slash T_F approx #num[0.07]$, where $T_F$ is the Fermi temperature.
