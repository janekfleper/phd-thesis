#import "/header.typ": *

= In-situ #lms <ch:mod>

The lattice depth #V0 is the primary tunable parameter of an optical lattice potential.
At a fixed lattice period $a$, the band structure (see @fig:theory-bloch-energy-bands) and, consequently, the tunneling amplitude $t$ defined in @eq:theory-wannier-tunneling-amplitude can only be varied with the lattice depth.
Additionally, the interaction energy $U$ @eq:theory-wannier-interaction-strength[] depends on the depths of the lattices that provide the confinement of the Wannier functions $w_n (phy.vb(r))$.
Precise knowledge of the lattice depth #V0 is, therefore, essential for any measurement in an optical lattice potential.

In the experimental setup, the lattice depth depends on the optical power of the laser beams that form the optical lattice.
While we can measure the optical power and the shape of the laser beams to estimate the lattice depth, a measurement using the atoms in the lattice potential is always required for a calibration of the lattice depth.
The most common approach for this calibration is the #lms where the band structure in the lattice potential is probed to measure the lattice depth @friebel_co_1998.
A small modulation of the lattice potential can excite the atoms from the lowest band to higher bands if the modulation frequency is resonant with the energy gap between the bands.
Using the band-mapping technique, the occupation of the bands can be measured in a time-of-flight image (see @fig:setup-sequence-imaging-tof) @kohl_fermionic_2005.
With a scan of the modulation frequency, we can find the resonance frequency for the excitation of the atoms to the higher bands and infer the average depth of the optical lattice potential.

In this chapter, I will introduce an advanced version of the #lms that does not rely on the band-mapping technique to quantify the occupation of the energy bands.
We found a mechanism to remove the atoms in the higher bands from the optical lattice potential without turning the lattices off.
After the excitation of the atoms from the lowest band to a higher band, we further excite them to an untrapped band to achieve an atom loss.
This allows the in-situ detection of the atomic density to measure the local lattice depth $V(x, y)$.
Since optical lattices are usually created by interfering Gaussian laser beams, the lattice depth decreases with the distance from the optical axis of the lattice beams.
At a single modulation frequency, we directly observe the loss of atoms along the equipotential lines of the optical lattice potential.
With a scan of the modulation frequency across the atom cloud, we determine the maximum lattice depth in the center, the waist of the underlying lattice beams and the position of the optical lattice.
In contrast, the spatial information is completely lost in favor of the quasimomentum resolution with the time-of-flight detection technique.

In @sec:mod-intro, I will introduce the general concept of the #lms, followed by additional considerations for the in-situ variant.
The evaluation uses an elaborate fit model that is discussed in @sec:mod-eval.
To investigate the atom-loss mechanism in @sec:mod-loss, we employ a secondary modulation frequency that excites the atoms to the untrapped bands.
In @sec:mod-coupled, we investigate the coupling of the infrared in-plane lattices, which are not perfectly perpendicular (see @ssec:setup-lattices-xy), and discuss the restrictions on the lattice-depth calibration with the coupled band structure.
Besides the lattice-depth calibration, we also rely on the #lms for the alignment of the optical lattices.
The improvements of the alignment procedure based on the in-situ #lms are discussed in @sec:mod-align.
The #x532 lattice that forms the superlattice along the #x-axis is not suitable for a standalone calibration since its maximum lattice depth is too small.
Therefore, in @sec:mod-super we calibrate the #x532\-lattice depth in the antisymmetric superlattice configuration.
In @sec:mod-radial, I will introduce the measurement of the radial potential of the in-plane superlattice and discuss the implications for the confinement of atoms in a two-dimensional optical lattice.

#include "introduction.typ"
#include "evaluation.typ"
#include "loss.typ"
#include "coupled.typ"
#include "alignment.typ"
#include "superlattice.typ"
#include "radial.typ"
