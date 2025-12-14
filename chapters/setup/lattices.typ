#import "/header.typ": *
#import "figures/lattices.typ": figure as figure-lattices

== Optical lattices <sec:setup-lattices>

After the evaporative cooling in the Ioffe-Pritchard trap and the optical dipole trap, the atoms are loaded into the optical lattices for the remainder of the experimental sequence.
The individual lattices axes are aligned with the coordinate axes#footnote[
  The lattices along the #x-axis are rotated slightly with respect to the coordinate axis.
  This results in a coupling to the lattice along the #y-axis (see @sec:mod-coupled).
] to create the three-dimensional optical lattice potential in @fig:setup-lattices.
In this section, I will introduce the individual lattice configurations and the shapes of the corresponding Gaussian beams.
Unless noted otherwise, the optical setups to create the lattices are unchanged compared to earlier theses.

#floating-figure(
  figure-lattices(),
  caption: [
    Beam configuration of the optical lattices.
    The #z532 lattice uses a shallow-angle configuration, while the in-plane lattices are created from counterpropagating beams.
    The lattice beams intersect at the position of the atoms inside the glass cell to achieve the maximum lattice depths.
  ],
  label: <fig:setup-lattices>,
  placement: bottom,
)


=== Vertical lattices <ssec:setup-lattices-z>

Since the first iteration of the experimental setup with a three-dimensional optical lattice potential, the vertical confinement is created with a shallow-angle optical lattice @cocchi_analogue_2016 @miller_ultracold_2016.
The lattice beams are powered by a laser#footnote[
  Coherent Verdi V10
] at the wavelength $lambda approx #qty[532][nm]$, making the optical lattice potential blue detuned relative to the D1 and D2 line of #K40.
To take the lattice axis and the wavelength into account, I will refer to this lattice as the #z532 lattice.
The angle of intersection (compare @fig:theory-lattice-intersection-angle) is $anglez = #num[14.5(1)]degree$, resulting in the lattice period $az532 = #qty[1.06(1)][μm]$ according to @eq:theory-lattice-period.
The lattice beams are circular with a waist of $wz532 approx #qty[120][μm]$ at the position of the atoms.
However, due to the shallow-angle configuration, the effective waist along the #box(y-axis) is greater by a factor of $2$.
The radial potential of the #z532 lattice is deconfining due to the blue detuning, preventing the lattice from confining atoms without the optical dipole trap or a red-detuned optical lattice.
The shallow-angle setup permits a power ratio of $gamma = #num[1.00(1)]$ and equal path lengths for the two lattice beams.
With the available optical power, we can typically achieve lattice depths up to $Vz532 = #qty[100][Erec]$.

The previous generation of PhD students added an additional vertical lattice with the wavelength $lambda approx #qty[1064][nm]$ @chan_quantum_2019 @gall_quantum_2020 @wurz_quantum_2021.
This #z1064 lattice is superimposed onto the #z532 lattice to create a superlattice potential along the #z-axis.
Since the optical setup of the vertical lattices was optimized for the wavelength $lambda = #qty[532][nm]$, the power ratio of the #z1064\-lattice beams is approximately $1 : 3$.
Together with its red detuning, the radial potential of the #z1064 lattice results in a significant confinement in the #xy-plane.
During the measurements in this thesis, the #z1064 lattice was turned off and we exclusively used the #z532 lattice for the vertical confinement of the atoms.
The #z1064 lattice is only mentioned here for the sake of completeness, and to highlight the possibility to create a vertical superlattice potential.


=== In-plane lattices <ssec:setup-lattices-xy>

In the #xy-plane, there are two red-detuned optical lattices with the wavelength $lambda approx #qty[1064][nm]$.
Together with the #z532 lattice, these two lattices are part of the initial setup for studying the two-dimensional Fermi-Hubbard model.
Following the naming convention based on the lattice axis and the wavelength, I will refer to them as #x1064 lattice and #y1064 lattice.
Both lattices use a standing-wave configuration and the resulting lattice periods are $ax1064 = ay1064 approx #qty[0.532][μm]$ (compare @fig:theory-lattice-intersection-angle).
To avoid reflections off the inner surfaces of the glass cell, the lattice axes are not perpendicular to the glass cell.
Furthermore, spatial constraints by the vacuum system and the Ioffe-Pritchard trap lead to an intersection angle of $theta approx 85 degree$ in the #xy-plane @cocchi_analogue_2016 @miller_ultracold_2016.
This results in a weak coupling of the band structures of the two lattices (see @sec:mod-coupled).

The lattices use circular beams with the waists $wx1064 approx #qty[140][μm]$ and $wy1064 approx #qty[160][μm]$.
We reduced the waist #wx1064 compared to the initial #x1064 lattice in the upgrade of the optical setup presented in @ch:super.
The lattices are powered by separate narrow-linewidth lasers.
For the superlattice phase control, the frequency of the #x1064\-lattice laser#footnote[
  External-cavity diode laser (interference filter) + NKT Koheras BOOSTIK #qty[5][W]
] needs to be rapidly tunable (see @sec:phase-setup).
The #y1064\-lattice laser#footnote[
  Innolight Mephisto MOPA #qty[20][W]
], on the other hand, should have a constant frequency without requiring external feedback.
Due to losses in the optical paths, the power ratios $gamma = P_"retro" slash P_"forward"$ for the lattices are $gamma_x1064 approx 0.84$ and $gamma_y1064 approx 0.77$.
We can typically achieve lattice depths up to #qty[80][Erec] with both lattices.

The #x1064 lattice is superimposed with the #x532 lattice to create a superlattice potential along the #x-axis.
As indicated by the name, the wavelength of the #x532 lattice is $lambda approx #qty[532][nm]$.
The light for the #x532 lattice is created in a second-harmonic generation cavity @klemmer_cavity_2018 that is pumped with a narrow-linewidth laser#footnote[
  Coherent Mephisto MOPA #qty[55][W]
] running at the wavelength $lambda approx #qty[1064][nm]$.
With the standing-wave configuration, the lattice period is $ax532 = ax1064 slash 2 approx #qty[0.266][μm]$ and the power ratio is $gamma_x532 approx 0.74$.
To maximize the achievable lattice depth, the #x532 lattice uses an elliptical beam shape.
The horizontal waist $wx532^y approx #qty[120][μm]$ is similar to the waist of the #x1064 lattice, while the vertical waist is only $wx532^z approx #qty[50][μm]$.
Along the #z-axis, the inhomogeneity is less of an issue due to the aspect ratio of the atom cloud.
The small waist $w_z$ of the horizontal dipole beam results in a vertical cloud size of approximately #qty[10][μm].
With this elliptical beam shape, we can typically realize lattice depths up to $Vx532 = #qty[30][Erec]$.
