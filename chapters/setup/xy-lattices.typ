#import "../../header.typ": *

== In-plane lattices <sec:setup-xy-lattices>

#[
  #set text(red)
  - What is the best way to separate the infrared lattices from the x532-lattice?
  - Where to mention the lasers for the infrared lattices?
  - Mention beam waists here or with the actual optical setups?
]

Along the $x$-axis and the $y$-axis of the experiment we have infrared in-plane lattices that are created by retroreflecting laser beams with a wavelength of $lambda = #qty[1064][nm]$.
The lattices are red-detuned and the lattice period is $a = #qty[0.532][μm]$ in both cases.
To avoid reflections off the surfaces of the glass cell both lattice axes show/have an angle relative to the normal (vector) of the glass cell.
And due to spatial constraints for the optical paths, the two in-plane lattices are not perfectly perpendicular either.
The intersection angle is $theta approx 85^degree$ in the $x y$-plane, which has relevant implications for the band structure and the measurements of the lattice depths, see @fig:modulation-coupled-band-31 and @ssec:modulation-coupled-two-tone.

Both infrared in-plane lattices use gaussian beams with an $1 slash e^2$ waist of $~#qty[150][μm]$ and the retro-reflecting paths use a #qty[250][mm] lens in (a) $4f$-configuration to "mode" match the retro-reflected beam.
The relative (power) amplitudes of the retro-reflected beams compared to the forward-propagating beams are $gamma_"x1064" approx #num[0.8]$ and $gamma_"y1064" approx #num[0.8]$. #text(red)[Use the correct values here!]
This is relevant for the running wave component that leads to an additional confinement #text(red)[ref sec:mu-map].
The optical setup of the infrared x-lattice is shown in detail in #text(red)[ref thermal lensing chapter] where I will present the signifcant upgrades necessary for the stability of the lattice.
For the optical setup of the infrared y-lattice see #text(red)[ref Eugenio + Luke or even earlier?]
We can typically achieve lattice depths of up to #qty[90][_E_#sub[rec]] with the infrared in-plane lattices, although more than #qty[60][_E_#sub[rec]] are rarely required.

The infrared in-plane lattices were initially designed for a simulation of the two-dimensional Hubbard model (#text(red)[Eugenio + Luke]) with an isotropic tunneling amplitude in both lattices.
For the measurements presented in this the $y$-lattice is usually frozen and we are working with one-dimensional systems along the $x$-axis.
During the loading of the in-plane lattices it is nevertheless important to minimize the redistribution of the atoms since this would cause significant heating.
We do this by matching the confining potential created by the dipole traps with/to the confining potential by the in-plane lattices (and the _short_ vertical lattice).
In a slow handover the dipole traps are turned off while the in-plane lattices are turned on to an amplitude of #qty[6][_E_#sub[rec]].
The final in-plane tunneling amplitude in that case is $t slash h approx #qty[220][Hz]$ which allows the atoms to thermalize during the loading.

In addition to the infrared lattice, there is also a green lattice with $lambda = #qty[532][nm]$ along the $x$-axis.
The two lattices are overlapped, forming a superlattice along the $x$-axis.
Compared to the phase of the $z$-superlattice, the phase of the $x$-superlattice is nicely/easily tunable.
A (small) frequency change will show up/accumulate as a phase change at the position of the atoms due to the optical path between the atoms and the retro-reflecting mirror #text(red)[ref x-superlattice chapter/section].
The source for the green lattice is a second-harmonic generation cavity that was built by Nick Klemmer #text(red)[ref Bachelor thesis.]
An $x$-superlattice was already used in the experiment more than ten years ago #text(red)[ref Pertot? 2013], but the optical path was not used for many years.
We were initally reusing the old setup, but we eventually replaced most of the optics to improve the stability and tunability #text(red)[ref thermal lensing chapter].

For the green $x$-lattice an elliptical beam shape is used.
The in-plane waist $w_y$ is similar to the infrared $x$-lattice, and the vertical waist is much smaller at $w_z approx #qty[50][μm]$.
This allows us to achieve a greater lattice depth compared to a round beam similar to the infrared in-plane lattices.
The inhomogeneity over the vertical lattice planes is not an issue since the atom cloud only extends over $~#qty[10][μm]$ along the $z$-axis.
While the reduced waist makes the alignment procedure more sensitive, the pointing stability of the $x$-lattices is on the order of a few #unit[μm] which is still significantly smaller than the waist $w_z$.
