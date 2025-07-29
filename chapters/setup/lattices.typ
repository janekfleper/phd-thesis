#import "/header.typ": *

== Optical lattices <sec:setup-lattices>

#notes[
  - Where to mention the lattice-depth calibration?
  - Where to mention the lattice-depth stabilization with photodiodes + PID loops?
  - Mention lattice powers in Watt anywhere?
  - Add the large figure here in the "introduction"?
]

After the evaporative cooling in the Ioffe-Pritchard trap and the optical dipole trap, the atoms are loaded into optical lattices for the remainder of the experimental sequence.
The individual lattices are approximately perpendicular to each other to create a three-dimensional optical-lattice potential.
In this section, I will introduce the individual lattice configurations and the shapes of the corresponding Gaussian beams.
The optical setups to create the lattices are largely unchanged compared to earlier theses, and I will only...


=== Vertical lattices <ssec:setup-lattices-z>

#notes[
  - Find a "good" order for all the #z532\-lattice properties?
]

Since the first iteration of the experimental setup with a three-dimensional optical-lattice potential, the vertical confinement has been provided by a shallow-angle optical lattice #tr[cite Luke + Eugenio].
The lattice beams are powered by a laser#footnote[Coherent Verdi V10] at the wavelength $lambda approx #qty[532][nm]$, making the optical-lattice potential blue-detuned relative to the D-lines of #K40.
To take the lattice axis and the wavelength into account, I will refer to this lattice as the #z532 lattice.
The angle of intersection (see @fig:theory-lattice-intersection-angle) is $anglez = #num[14.5(1)]degree$, resulting in the lattice period $az532 = #qty[1.06(1)][μm]$ according to @eq:theory-lattice-period.
The lattice beams have a waist of $wz532 approx #qty[120][μm]$ at the position of the atoms.
However, due to the shallow-angle configuration, we can only observe this waist along the $x$ axis.
The effective waist along the $y$ axis is greater by a factor of #tr[#num[2]].
Due to the blue detuning and a power ratio of #num[1.00(1)] between the lattice beams, the atoms inside the lattice are only subject to the small deconfinement from the zero-point energy #tr[ref what?].
The #z532 can therefore not confine the atoms without the optical-dipole trap or another optical lattice.
The optical setup was optimized to have equal optical-path lengths for the two lattice beams, making the phase of the lattice insensitive to changes of any environmental parameters on the experiment table.
With the available optical power, we can typically achieve lattice depths up to $Vz532 = #qty[100][Erec]$.

The previous generation of PhD students added an additional vertical lattice with the wavelength $lambda approx #qty[1064][nm]$ #tr[cite Jeffrey, Marcell + Nicola].
This #z1064 lattice is superimposed onto the #z532 lattice to create a superlattice potential along the $z$ axis #tr[cite bilayer?].
Since the optical setup to split up the vertical-lattice beams was optimized for the wavelength $lambda = #qty[532][nm]$, the power ratio of the #z1064\-lattice beams is approximately $1 slash 4$.
Together with its red detuning, the #z1064 lattice causes a significant confinement in the $x y$ plane.
During the measurements in this thesis, the #z1064 lattice was turned off and we exclusively used the #z532 lattice for the vertical confinement of the atoms.
I only mentioned the #z1064 lattice here for the sake of completeness, and to highlight the possibility to create a vertical superlattice potential.


=== In-plane lattices <ssec:setup-lattices-xy>

#notes[
  - What is the best way to separate the infrared lattices from the x532-lattice?
  - Where to mention the lasers for the infrared lattices?
  - Mention beam waists here or with the actual optical setups?
  - Check all the power ratios!
  - Mention initial setup of the #x532 lattice?
]

In the $x y$ plane, there are two red-detuned optical lattices with the wavelength $lambda approx #qty[1064][nm]$.
Together with the #z532 lattice, these two lattices were part of the initial setup to study the two-dimensional Fermi-Hubbard model #tr[cite EOS and?].
Following the naming convention based on the lattice axis and the wavelength, I will refer to them as the #x1064 lattice and the #y1064 lattice.
Both lattices use a standing-wave configuration where the forward-propagating beam interfers with the retro-reflected beam.
As illustrated in @fig:theory-lattice-intersection-angle, the resulting lattice periods are $ax1064 = ay1064 = #qty[0.532][μm]$.
To avoid reflections off the inner surfaces of the glass cell, the lattice axes are not perpendicular to the glass cell.
Furthermore, spatial constraints by the vacuum system and the Ioffe-Pritchard trap lead to an intersection angle of $theta approx 85 degree$ in the $x y$ plane #tr[cite Luke + Eugenio].
This results in a weak coupling of the band structures of the two lattices.
The impact of this coupling on the calibration of the lattice depths is discussed in @sec:mod-coupled.

Due to losses in the optical path, the power in the retro-reflected beam is always smaller than the power in the forward-propagating.
The power ratios are $gamma_x1064 approx 0.84$ and $gamma_y1064 approx 0.77$, which results in an additional confinement from the running-wave component.
Both lattices use circular Gaussian beams with waists of $wx1064 approx #qty[140][μm]$ and $wy1064 approx #qty[160][μm]$.
We reduced the waist #wx1064 compared to the initial #x1064 lattice in the upgrade of the optical setup in @ch:super.
The setup of the #y1064 lattice is unchanged compared to #tr[cite Luke + Eugenio (and Feld + Fröhlich?)].
With both infrared lattices we can achieve lattice depths up to #qty[90][Erec], although we rarely #tr[need/use] more than #qty[60][Erec].
The lattices are powered by separate lasers to accomodate the experimental requirements.
For the tunability of the superlattice phase, the frequency of the #x1064 laser#footnote[#tr[Self-built interference-filter laser + NKT Koheras BOOSTIK fiber amplifier]] needs to be adjusted rapidly (see @sec:phase-setup).
The laser#footnote[#tr[Innolight Mephisto MOPA 20W]] for the #y1064 lattice has a narrow linewidth, but lacks the tunability.

The #x1064 lattice is superimposed with the #x532 lattice to create a superlattice potential along the $x$ axis.
As already indicated by the name, the #x532 lattice uses a wavelength of $lambda approx #qty[532][nm]$.
The resulting lattice period is $ax532 = #qty[0.266][μm]$, which is exactly $ax1064 slash 2$.
Even though the #x532 lattice and the #x1064 lattice share the optical path that is responsible for the power loss of the retro-reflected beam, the losses are greater due to the different wavelengths.
The power ratio between the forward-propagating beam and the retro-reflected beam is $gamma_x532 approx 0.74$, resulting in a substantial deconfinement by the running-wave component.
To maximize the achievable lattice depth, the #x532 lattice has an elliptical shape #tr[cite anything?].
The in-plane waist $wx532^y approx #qty[120][μm]$ is similar to the waist of the #x1064 lattice to limit the inhomogeneity of the lattice depth in the $x y$ plane.
The waist in the vertical direction is only $wx532^z approx #qty[50][μm]$, which improves the maximum lattice depth by a factor of $2$ compared to a circular beam.
Along the $z$ axis, the imhomogeneity is less of an issue due to the aspect ratio of the atom cloud.
The small waist $w_z$ of the horizontal dipole beam results in a vertical cloud size of $<#qty[10][μm]$.
With this elliptical beam shape, we can typically reach lattice depths up to $Vx532 = #qty[20][Erec]$.
The light for the #x532 lattice is created in a second-harmonic generation cavity#footnote[Self-built bow-tie cavity #tr[cite Nick Bachelor]] that is pumped by a narrow-linewidth laser#footnote[#tr[Coherent Mephisto MOPA #qty[55][W]]] running at the wavelength $lambda approx #qty[1064][nm]$.
