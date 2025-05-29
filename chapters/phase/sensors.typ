#import "/header.typ": *

== Environmental sensors <sec:phase-sensors>

#[
  #set text(red)
  - Already reference this in @sec:phase-setup?
  - Discuss why mechanical/physical length is not (really) relevant?
  - Mention the old setup with the BME280 sensor? Just in the Floquet section?
  - Use $d$ instead of $L$ for the distances?
  - Find a cleaner expression for @eq:phase-sensors-phi.
]

The setup introduced in @sec:phase-setup allows us to control/stabilize the superlattice phase on short time scales from $cal(O)(#qty[1][μs])$ to $cal(O)(#qty[1][s])$.
If we would run the measurements from @sec:phase-measure continuously, we would however notice that the superlattice phase slowly changes despite the phase lock to stabilize the lattices frequencies relative to each other.
This drift is caused by the (relative) change of the refractive index in the retro-reflecting path.
While we could repeatedly run the phase calibration #text(red)[ref from @sec:phase-measure] to measure the superlattice phase $phi$, we also need the phase to be controlled/stable during other measurements.
Being able to predict the superlattice phase $phi$ without the atoms is therefore essential for the operation of the experiment.

In @sec:phase-setup (and @eq:phase-setup-delta-phi) we assumed that the path length $L$ is constant.
While this might be true for the mechanical/physical length between the atom position and the retro-reflecting mirror, it is not true for the optical (path) length that also takes the refractive index (or dispersion) $n(lambda)$ into account.
Since the individual lattices have (vastly) different wavelengths of #qty[532][nm] and #qty[1064][nm], the changes of the refractive index $phy.pdv(n(lambda), xi)$ as a function of the environmental parameters/properties $xi$ will also be different.
(Only) this difference between the wavelengths (actually) causes the superlattice phase $phi$ to change.
The phase shifts of the individual lattices will be higher by one order of magnitude but we are not able to observe this due to the lack of single-site resolution of the imaging system, see @sec:setup-detect.
We will therefore directly/only focus on the relative changes/phase shifts of the lattices/wavelengths.

If we look at the retro-reflecting path in #text(red)[ref figure superalttice setup], we can split the length $L$ into five different parts/sections.
Starting from the retro-reflecting mirror the lattice beams propagate $approx #qty[25][mm]$ in (the) air followed by the propagation/transmission through the 2 inch lens.
After/behind the lens there is another section of air with a length of $approx #qty[#text(red)[23]][mm]$ up to the glass cell.
The glass cell is made from UV fused silica with a thickness of #qty[4][mm] and the atom position is then #text(red)[#qty[17][mm]] further inside the glass cell.
Only the part/section inside the glass cell is not relevant for the change of the superlattice phase $phi$ because the refractive index is (just) $n = 1$ due to ultra-high vacuum.
The four remaining parts/sections each contribute to the drifts of the superlattice phase $phi$.
For the glass cell (wall) and the lens the (glass) temperature $T$ is the only relevant environmental parameter.
In the two parts/sections of air we also have to take the (ambient) pressure $P$ and the relative humidity $R H$ into account (on top of the temperature $T$).

With the convention chosen in @eq:theory-super-potential, we can express the superlattice phase $phi$ as a function of the (global) phases $phi^l$ and $phi^s$ that both depend on the (respective) optical path lengths.
The resulting expression will include @eq:phase-setup-delta-phi (as a static term) and terms for the glass cell, the lens and the air (sections)

$
  phi &= phi^(l) - 1 / 2 phi^(s)\
  &= (k^l + Delta k) dot L dot n(lambda = #qty[1064][nm]) - 1 / 2 k^s dot L dot n(lambda = #qty[532][nm])\
  &= Delta k dot L
  + phi.alt_"gc" dot Delta n_"gc"
  + phi.alt_"lens" dot Delta n_"lens"
  + phi.alt_"air" dot Delta n_"air"
$ <eq:phase-sensors-phi>

with the optical phase $phi.alt = k^l dot L$ and the (relative) refractive index $Delta n = n^l - n^s$.
