#import "@preview/fancy-units:0.1.0": num, unit, qty
#import "@preview/physica:0.9.4" as phy

== In-plane lattices <sec:setup-xy-lattices>

#[
  #set text(red)
  - What is the best way to separate the infrared lattices from the x532-lattice?
  - Where to mention the lasers for the infrared lattices?
  - Mention beam waists here or with the actual optical setups?
]

Along the $x$-axis and the $y$-axis of the experiment we have infrared in-plane lattices that are created by retroreflecting laser beams with a wavelength of $lambda = #qty[1064][nm]$.
The lattices are red-detuned and the lattice period is $a = #qty[0.532][μm]$ in both cases.
To avoid reflections off the surfaces of the glass cell both lattice axes are rotated relative to the glass cell.
And due to spatial constraints for the optical paths, the two lattices are not perfectly perpendicular with an intersection angle of $theta approx 85.6^degree$.
This angle has relevant implications for the band structure and the measurements of the lattice depths #text(red)[ref later chapter].

Both infrared in-plane lattices use beams with an $1 slash e^2$ waist of $~#qty[150][μm]$ and the retro-reflecting paths are $4f$-systems with a #qty[250][mm] lens to "mode" match the retro-reflected beam.
The relative (power) amplitude of the retro-reflected beams compared to the forward-propagating beams is $gamma approx #num[0.8]$ in both cases.
This is relevant for the running wave component that leads to an additional confinement #text(red)[ref sec:mu-map].
The optical setup of the infrared x-lattice is shown in detail in #text(red)[ref thermal lensing chapter] where I will present the signifcant upgrades necessary for the stability of the lattice.
For the optical setup of the infrared y-lattice see #text(red)[ref Eugenio + Luke or even earlier?]
We can typically achieve lattice depths of up to #qty[90][_E_#sub[rec]] with the infrared in-plane lattices, although more than #qty[90][_E_#sub[rec]] are rarely required.

The infrared in-plane lattices were designed with the two-dimensional Hubbard model in mind (#text(red)[Eugenio + Luke]) but for the measurements presented in this thesis the $y$-lattice is usually frozen and we are working with one-dimensional systems along the $x$-axis.
During the loading of the in-plane lattices it is nevertheless important to minimize the redistribution of the atoms since this would cause significant heating.
To minimize the redistribution of the atoms the confining potential created by the dipole traps is matched to the confining potential by the in-plane lattices (and the _short_ vertical lattice).
In a slow handover the dipole traps are turned off while the in-plane lattices are turned on to an amplitude of #qty[6][_E_#sub[rec]].
The final in-plane tunneling amplitude in that case is $t slash h approx #qty[220][Hz]$ which allows the atoms to thermalize during the loading.

In addition to the infrared lattice, there is also a green lattice with $lambda = #qty[532][nm]$ along the $x$-axis.
The two lattices are overlapped, creating a superlattice along the $x$-axis.
Compared to the phase of the $z$-superlattice, this one is nicely tunable since the phase of the $x$-superlattice accumulates along the optical path from the atoms to the retro-reflecting mirror #text(red)[ref x-superlattice chapter/section].
The source for the green lattice is a second-harmonic generation cavity that was built by Nick Klemmer #text(red)[ref Bachelor thesis.]
An $x$-superlattice was already used in the experiment more than ten years ago #text(red)[ref Pertot? 2013], but the optical path was not used for many years.
We were initally reusing the old optical path, but we eventually replaced most of the optics to improve the stability and tunability #text(red)[ref thermal lensing chapter].

For the green $x$-lattice an elliptical beam shape is used.
The in-plane waist $w_y$ is similar to the infrared $x$-lattice, and the vertical waist is much smaller at $w_z approx #qty[50][μm]$.
This allows us to achieve a greater lattice depth compared to a round beam similar to the infrared in-plane lattices.
The inhomogeneity over the vertical lattice planes is not an issue since the atom cloud only extends over $~#qty[10][μm]$ along the $z$-axis.
While the reduced waist makes the alignment procedure more sensitive, the pointing stability of the $x$-lattices is on the order of a few #unit[μm] which is significantly smaller than the waist $w_z$.
