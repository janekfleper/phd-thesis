#import "/header.typ": *

== Optical lattices <sec:setup-lattices>

After the evaporative cooling in the Ioffe-Pritchard trap and the optical dipole trap, the atoms are loaded into optical lattices for the remainder of the experimental sequence.
The individual lattices axes are roughly perpendicular to each other to create the three-dimensional optical-lattice potential shown in @fig:setup-lattices.
In this section, I will introduce the individual lattice configurations and the shapes of the corresponding Gaussian beams.
Unless noted otherwise, the optical setups to create the lattices are unchanged compared to earlier theses.

The power in each optical lattice is measured with photodiodes on the experimental table.
By comparing the output of the photodiodes to the setpoints of the lattice depth, we can achieve a regulation of the optical power with PID loops that have a bandwidth of a few #unit[kHz].
For the calibration of the lattice depths, we are using the lattice modulation spectroscopy introduced in @ch:mod.

#floating-figure(
  image("figures/alpha_lattices.png"),
  caption: [
    Beam configuration of the optical lattices.
    The #z532 lattice shows a shallow-angle configuration, why the in-plane lattices are created from counterpropagating beams.
    A comparison of the two configurations is shown in @fig:theory-lattice-intersection-angle.
    The lattice beams intersect at the position of the atoms inside the glass cell to achieve the maximum lattice depths.

    #notes[
      - Remove the #z1064 lattice
      - Add labels or a legend?
      - Create a "secondary" figure that shows the lattice structure? Like the original version?
    ]
  ],
  label: <fig:setup-lattices>,
)


=== Vertical lattices <ssec:setup-lattices-z>

Since the first iteration of the experimental setup with a three-dimensional optical-lattice potential, the vertical confinement has been provided by a shallow-angle optical lattice @cocchi_analogue_2016 @miller_ultracold_2016.
The lattice beams are powered by a laser#footnote[Coherent Verdi V10] at the wavelength $lambda approx #qty[532][nm]$, making the optical-lattice potential blue-detuned relative to the D1 and D2 line of #K40.
To take the lattice axis and the wavelength into account, I will refer to this lattice as the #z532 lattice.
The angle of intersection as defined in @fig:theory-lattice-intersection-angle is $anglez = #num[14.5(1)]degree$, resulting in the lattice period $az532 = #qty[1.06(1)][μm]$ according to @eq:theory-lattice-period.
The lattice beams have a waist of $wz532 approx #qty[120][μm]$ at the position of the atoms.
However, due to the shallow-angle configuration, the effective waist along the $y$ axis is greater by a factor of #num[2].
With the blue detuning and a power ratio of #num[1.00(1)] between the lattice beams, the atoms inside the lattice are only subject to the small deconfinement from the zero-point energy @greiner_ultracold_2003.
The #z532 lattice can therefore not confine the atoms without the optical dipole trap or another optical lattice.
The optical setup was optimized to have equal optical path lengths for the two lattice beams, making the phase of the lattice insensitive to changes of any environmental parameters on the experimental table.
With the available optical power, we can typically achieve lattice depths up to $Vz532 = #qty[100][Erec]$.

The previous generation of PhD students added an additional vertical lattice with the wavelength $lambda approx #qty[1064][nm]$ @chan_quantum_2019 @gall_quantum_2020 @wurz_quantum_2021.
This #z1064 lattice is superimposed onto the #z532 lattice to create a superlattice potential along the $z$ axis.
Since the optical setup to split up the vertical-lattice beams was optimized for the wavelength $lambda = #qty[532][nm]$, the power ratio of the #z1064\-lattice beams is approximately $1 slash 4$.
Together with its red detuning, the #z1064 lattice therefore causes a significant confinement in the $x y$ plane.
During the measurements in this thesis, the #z1064 lattice was turned off and we exclusively used the #z532 lattice for the vertical confinement of the atoms.
I only mentioned the #z1064 lattice here for the sake of completeness, and to highlight the possibility to create a vertical superlattice potential.


=== In-plane lattices <ssec:setup-lattices-xy>

In the $x y$ plane, the experimental setup features two red-detuned optical lattices with the wavelength $lambda approx #qty[1064][nm]$.
Together with the #z532 lattice, these two lattices were part of the initial setup to study the two-dimensional Fermi-Hubbard model.
Following the naming convention based on the lattice axis and the wavelength, I will refer to them as the #x1064 lattice and the #y1064 lattice.
Both lattices use a standing-wave configuration where the forward-propagating beam interferes with the retro-reflected beam.
As illustrated in @fig:theory-lattice-intersection-angle, the resulting lattice periods are $ax1064 = ay1064 = #qty[0.532][μm]$.
To avoid reflections off the inner surfaces of the glass cell, the lattice axes are not perpendicular to the glass cell.
Furthermore, spatial constraints by the vacuum system and the Ioffe-Pritchard trap lead to an intersection angle of $theta approx 85 degree$ in the $x y$ plane @cocchi_analogue_2016 @miller_ultracold_2016.
This results in a weak coupling of the band structures of the two lattices.
The impact of this coupling on the calibration of the lattice depths is discussed in @sec:mod-coupled.

Due to losses in the optical path, the power in the retro-reflected beam is always smaller than the power in the forward-propagating.
The power ratios are $gamma_x1064 approx 0.84$ and $gamma_y1064 approx 0.77$, which results in an additional confinement from the running-wave component.
Both lattices use circular Gaussian beams with waists of $wx1064 approx #qty[140][μm]$ and $wy1064 approx #qty[160][μm]$.
We reduced the waist #wx1064 compared to the initial #x1064 lattice in the upgrade of the optical setup presented in @ch:super.
The #y1064 lattice is unchanged compared to the initial setup in @feld_low_2011 @frohlich_strongly_2011.
The lattices are powered by separate narrow-linewidth lasers to accommodate the experimental requirements.
For the superlattice phase, the frequency of the #x1064\-lattice laser#footnote[#tr[Self-built interference-filter laser + NKT Koheras BOOSTIK fiber amplifier]] needs to be rapidly tunable (see @sec:phase-setup).
The #y1064\-lattice laser#footnote[#tr[Innolight Mephisto MOPA 20W]], on the other hand, should have a constant frequency without requiring external feedback.
We can typically achieve lattice depths up to #qty[90][Erec] with both infrared lattices, although we rarely need more than #qty[60][Erec].

The #x1064 lattice is superimposed with the #x532 lattice to create a superlattice potential along the $x$ axis.
As already indicated by the name, the #x532 lattice uses a wavelength of $lambda approx #qty[532][nm]$.
The light for the #x532 lattice is created in a second-harmonic generation cavity#footnote[#tr[Self-built bow-tie cavity @klemmer_cavity_2018]] that is pumped with a narrow-linewidth laser#footnote[#tr[Coherent Mephisto MOPA #qty[55][W]]] running at the wavelength $lambda approx #qty[1064][nm]$.
The resulting lattice period is $ax532 = #qty[0.266][μm]$, which is exactly $ax1064 slash 2$.
The power ratio between the forward-propagating beam and the retro-reflected beam is $gamma_x532 approx 0.74$, resulting in a substantial deconfinement by the running-wave component.
Even though the #x532 lattice and the #x1064 lattice share the optical path for the retro-reflected beam, the losses for the #x532 lattice are greater due to the different wavelength.
To maximize the achievable lattice depth, the #x532 lattice uses an elliptical beam shape.
The horizontal waist $wx532^y approx #qty[120][μm]$ is similar to the waist of the #x1064 lattice, to limit the inhomogeneity of the lattice depth in the $x y$ plane.
The waist in the vertical direction is only $wx532^z approx #qty[50][μm]$, which improves the maximum lattice depth by a factor of $2$ compared to a circular beam.
Along the $z$ axis, the imhomogeneity is less of an issue due to the aspect ratio of the atom cloud.
The small waist $w_z$ of the horizontal dipole beam results in a vertical cloud size $<#qty[10][μm]$.
With this elliptical beam shape, we can typically reach lattice depths up to $Vx532 = #qty[20][Erec]$.
