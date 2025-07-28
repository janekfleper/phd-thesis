#import "/header.typ": *

== Preparing a degenerate fermi gas <sec:setup-prepare>

#notes[
]

=== Magneto-optical trap <sec:setup-prepare-mot>

#notes[
  - Cite the OG papers of the different locks?
]

The experimental sequence starts with a three-dimensional magneto-optical trap (MOT) that is loaded from a background gas at a pressure of #qty[1e-9][mbar] #tr[cite Fröhlich].
As shown in #subref(<fig:setup-k40-hfs>, "a"), the MOT uses two transitions on the D2 line between the ground state $sn(S, 1/2)$ and the excited state $sn(P, 3/2)$.
The closed transition $phy.ket(F = 9 slash 2) -> phy.ket(F' = 11 slash 2)$ is used for the _cooling_ of the atoms, and the transition $phy.ket(F = 7 slash 2) -> phy.ket(F' = 9 slash 2)$ is responsible for the _repumping_.
While the cooling transition itself is closed, a significant number of atoms will be excited to the state $phy.ket(F' = 9 slash 2)$ due to the small hyperfine splitting in the excited state.
From this excited state, the atoms can also decay to the ground state $phy.ket(F = 7 slash 2)$, which is dark for the cooling wavelength.
Therefore, the repumping transition is necessary to keep all atoms inside the cooling cycle.

The wavelengths of the cooling light and the repumping light are red-detuned from the respective transitions to make the absorption of photons sensitive to the position and the velocity of the atoms.
Due to the large hyperfine splitting in the ground state, we need to use two separate lasers that are detuned by $Delta nu approx #qty[1.3][GHz]$.
The frequency of the repumping laser#footnote[Toptica DL Pro + Eagleyard tapered amplifier] is stabilized with an FM-spectroscopy lock to the doppler-free absorption spectrum of $phy.isotope("K", a: 39)$.
The cooling laser#footnote[Coherent Verdi V18 + Coherent MBR-110] is then stabilized relative to the repumping laser with a frequency-offset lock.
The details of the laser system and the frequency locks can be found in #tr[cite Feld].

At the start of each experimental sequence, we operate the MOT for approximately #qty[4][s] to saturate the number of atoms in the MOT.
This makes the atom cloud insensitive to small fluctuations of the power in the cooling beams and in the repumping beams.
The theoretical limit for the temperature we can achieve inside the MOT is given by the Doppler temperature $T_D = #qty[145][μK]$ #tr[cite anything?].


=== Ioffe-Pritchard trap <sec:setup-prepare-ioffe>

The background pressure of #qty[1e-9][mbar] requires the MOT to be spatially separated from the glass cell where we achieve an ultrahigh vacuum with a pressure $<#qty[1e-11][mbar]$.
The two sections of the vacuum system are therefore connected by differential pumping tubes.
To move the atoms from the MOT into the glass cell, we are using a pair of coils mounted on a mechanical stage.
The coils create a strong magnetic quadrupole field that can trap atoms in low-field seeking states.
After the MOT, the atoms are optically pumped to the states $phy.ket(m_F = 9 slash 2)$ and $phy.ket(m_F = 7 slash 2)$ of the $F = 9 slash 2$ manifold in the ground state $sn(S, 1/2)$.
The coils on the mechanical stage will then move the atoms to the glass cell, where they are loaded into a Ioffe-Pritchard trap.
Compared to the quadrupole field of the transport coils, the Ioffe-Pritchard trap has an offset magnetic field in the center to prevent Majorana losses #tr[cite OG paper].
Inside the Ioffe-Pritchard trap, we are using forced evaporative cooling to remove the atoms with the highest temperatures from the trap.
The atoms initially populate the low-field seeking states highlighted in #subref(<fig:setup-k40-hfs>, "b") to maximize the collisions that are essential for the continuous thermalization.
We use a microwave transition to the high-field seeking states in the $F = 7 slash 2$ manifold to remove the hottest atoms from the trap.
An additional radio-frequency field is used to balance the occupation of the $m_F$ states.
After the evaporation, the atom cloud contains approximately #num[5e6] atoms at a temperature of $T approx #qty[2.5][μK]$.
The remaining atoms occupy the states $phy.ket(m_F = 9 slash 2)$ and $phy.ket(m_F = 7 slash 2)$ of the $F = 9 slash 2$ manifold.


=== Optical dipole trap <sec:setup-prepare-dipole>

#notes[
  - Really mention all the axes before introducing the coordinate system?
  - Mention the typical cloud size in the dipole trap? In preparation for the #x532 lattice...
]

After the evaporative cooling in the Ioffe-Pritchard trap, the atoms are transferred to an optical dipole trap #tr[cite Vogt (2013)].
Compared to the potential of a magnetic trap, the dipole potential introduced in @sec:theory-dipole does not depend on the $m_F$ state for a large detuning $Delta$.
Atoms in different $m_F$ states are therefore subject to the same potential, and we can use the lowest $m_F$ states in the $F = 9 slash 2$ manifold.
The optical dipole trap consists of two red-detuned laser beams with a wavelength of $lambda approx #qty[1064][nm]$.
Initially, the atoms are loaded from the Ioffe-Pritchard trap into the _horizontal_ dipole beam propagating along the $x$-axis.
The trap geometry of the horizontal dipole beam matches the elongated shape of the atom cloud in the Ioffe-Pritchard trap.
To achieve a variable three-dimensional confinement, we use the _dimple_ beam to create a crossed dipole trap.
The dimple beam propagates in the $y z$-plane at an angle of $~#num[45]degree$ relative to the $x y$-plane.

The horizontal beam has an elliptical shape with the waists $w_z approx #qty[12][μm]$ and $w_y approx #qty[140][μm]$.
This results in a strong vertical confinement that is required for the loading of the atoms into the optical lattices (see @ssec:setup-lattices-z).
The dimple beam has a circular shape with a waist of $w_0 approx #qty[150][μm]$, enabling an equal confinement of the atoms in the $x y$-plane.
Both dipole beams are created from the same laser#footnote[Eagleyard DFB diode + NKT Koheras BOOSTIK fiber amplifier] that is linewidth broadened to reduce the coherence length to $<#qty[10][mm]$ #tr[cite Marcell].
This is required to avoid an optical-lattice potential created by the horizontal dipole beam with its own reflection off the inner surfaces of the glass cell#footnote[Only the outer surfaces of the glass cell are anti-reflection coated].

After the atoms are loaded into the crossed-beam dipole trap, we gradually reduce the power of the beams to lower the dipole potential.
This will evaporate the hottest atoms again since they occupy the high-energy states inside the dipole trap.
During the evaporation, elastic collisions between the atoms are essential for a continuous thermalization.
The atoms occupy an equal mixture of the states #mF(9) and #mF(7) and we can tune the scattering properties with the magnetic Feshbach resonance introduced in @sec:setup-k40.
In the experimental setup, the magnetic field $B$ can be varied with two pairs of magnetic field coils #tr[cite Fröhlich].
The _slow_ Feshbach coils have a large diameter and create a homogeneous magnetic field around the Feshbach resonance $B_0 = #qty[202.1][G]$ of the $mF(9) \& mF(7)$ mixture.
The _fast_ Feshbach coils allow rapid changes of the magnetic field by $abs(B) < #qty[20][G]$, or they can be used to create a gradient magnetic field #tr[cite Luke].
In this thesis, we used the evaporation scheme developed in #tr[cite Marcell].
The magnetic field is initially set to $B = #qty[235][G]$ where the atoms are interacting repulsively.
During the evaporation, the magnetic field is reduced to $B approx #qty[204][G]$ to get a strong attractive interaction in the mixture $mF(9) \& mF(7)$.
At the end of the evaporation, we have a three-dimensional Fermi gas with approximately #num[8e4] atoms in each of the two $m_F$ states at a temperature of $T slash T_F approx #num[0.07]$, where $T_F$ is the Fermi temperature.
