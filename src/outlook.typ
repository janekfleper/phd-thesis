#import "/header.typ": *

// these rules are only applied in this file
#show heading.where(level: 2): set heading(numbering: none, outlined: false)

= Conclusion and outlook <ch:outlook>

In this thesis, I showed the characterization and stabilization of the in-plane superlattice potential formed by two lattices with wavelengths of #qty[1064][nm] and #qty[532][nm].
The calibration techniques we developed are essential for the operation of the in-plane superlattice, and they provide the basis for all future projects using the experimental setup.

With the excellent control over the superlattice phase, we were able to use Floquet engineering to modify the tunneling amplitudes in the double wells that make up the superlattice potential.
In singly-occupied double wells, the tunneling amplitude is rescaled by the zeroth-order Bessel function and we achieve dynamic localization where the tunneling in the double wells is fully suppressed.
Simultaneously, we used a near-resonant driving frequency with respect to the interaction energy to modify the pair-tunneling amplitude in doubly-occupied double wells.
While the single-particle tunneling amplitude is rescaled by higher-order Bessel functions, the atoms in the Floquet-driven double wells experience an effective interaction energy and an effective pair-tunneling amplitude, which can be enhanced through the correlated-tunneling amplitude #VCTeff.
We realized a system with the correlated tunneling amplitude $VCTeff slash teffn(2) approx 0.4$ in the near-resonant regime of the second-order driving frequency $h nu = abs(U) slash 2$, which results in an enhancement of the pair-tunneling amplitude by a factor greater than two compared to a static system with the equivalent interaction energy.

The Floquet driving of the double wells was enabled by the precise control and calibration of the superlattice phase that we developed during the course of this thesis.
We measure the superlattice phase using the dynamics in singly-occupied double wells around the symmetric configuration ($Delta = 0$).
With local resolution of the superlattice phase, we are able to compensate phase gradients due to a wavefront mismatch of the optical lattes making up the bichromatic superlattice.
For the long-term stability of the superlattice phase we developed an active stabilization using environmental sensors along the optical path between the position of the atoms and the retro-reflecting mirror.
We compute the phase correction from the refractive indices and the environmental parameters.
With the active correction of the superlattice phase, we achieve an excellent phase stability with a standard deviation $sqrt(Delta phi^2) = #qty[1.27][mrad]$ over more than #qty[16][h].
Other experimental setups with comparable tunability of the superlattice phase rely on a passive stabilization through equal path lengths @li_high-powered_2021 or an evacuated beam path @chalopin_optical_2025, which requires significant effort to develop the necessary hardware.
In contrast, the active stabilization technique presented in this thesis can be used to upgrade an existing optical setup, and we achieve a significantly better short- and long-term phase stability.

We have developed the in-situ #lms for calibrating the lattice depths with local resolution.
Compared to band mapping and time-of-flight detection to measure the global average of atoms in excited bands following the lattice modulation, this method significantly improves the precision of the calibration.
Furthermore, we can determine the waists of the lattice beams and the position of the optical lattice from the locally-resolved lattice depth.
These detection capabilities were essential for investigating the thermally-induced focal shifts of the lattice beams that make up the superlattice potential.
With an upgrade of the optical setups, we achieved a significant improvement in the stability of the lattice depths.
The respective stability of the infrared and green lattice depths is better than #qty[0.2][%] and #qty[0.3][%] over an interval of #qty[5][s], which amounts to an improvement in stability by one to two orders of magnitude compared to the previous optical setups.

Combining the calibration of several lattice parameters in short measurements is an essential step towards autonomous operation of an optical-lattice experiment.
Furthermore, the high precision of the in-situ #lms detects small changes in the lattice alignment, which can be used to automate the entire alignment procedure of the lattice beams.
This is especially interesting in the context of neutral-atom quantum computers @gyger_continuous_2024, which will require a higher degree of automation than an experimental setup in a research laboratory.
With suitable hardware for the lattice modulation and alignment, the in-situ #lms enables a fully automated operation of the optical lattices, from the alignment of the lattice beams to the data analysis of the acquired atom images.

A calibration technique similar to the in-situ #lms makes use of the differential polarizability between the ground and excited state of an atom to measure the local intensity of an optical lattice @park_cavity-enhanced_2022.
While this technique also requires the optical lattice to be frozen, it imposes further restrictions on both the atomic species and the detuning of the optical lattice.
First, the optical transition between the ground and excited state must be very narrow to resolve the differential light shift.
This condition is fulfilled for the optical clock transition between the singlet state $attach(S, tl: 1, br: 0)$ and the triplet state $attach(P, tl: 3, br: 0)$ in the alkaline earth metals strontium @sansonetti_wavelengths_2010 and ytterbium @hoyt_observation_2005.
The second restriction addresses the detuning of the lattice beams.
In a blue-detuned optical lattice, the atoms are trapped at the intensity minima where the differential light shift only depends on the running-wave component.
Thus, the wavelength of the optical lattice must be red detuned to trap the atoms at the intensity maxima where both the lattice depth and the running-wave component contribute to the differential light shift.
Furthermore, the running-wave component must be calibrated in a separate measurement to determine the absolute lattice depth from the measured light shifts.
In comparison, these restrictions do not apply to the in-situ #lms.
The excitation from the lowest band to an excited band works for any atomic species that can be trapped in an optical lattice, and the detuning and the running-wave component correspond to global energy offsets that do not affect the band structure.
The only restrictions we have found for the in-situ #lms are related to the width of the excited band and the atom-loss mechanism to remove the atoms in excited bands from the optical lattice.

== Improving the in-situ superlattice phase measurement

A possible detection technique for determining the double-well occupation in the superlattice potential uses the experimental scheme for imprinting spin patterns in the two-dimensional lattice planes @wurz_coherent_2018.
In a Ramsey-type sequence, a $pi slash 2$ radio-frequency pulse rotates the spins from the vertical axis of the Bloch sphere to the equatorial plane.
With a magnetic field gradient $phy.grad B_z$ in the #xy-plane, the spins accumulate a phase depending on their position during the evolution time $tau$.
Finally, a second $pi slash 2$ radio-frequency pulse is applied to rotate the spins back to the quantization axis, thus concluding the evolution of the spins in the #xy-plane.
When the magnetic field gradient is aligned along the diagonal of the two in-plane lattices, the spin structure factor $phy.vb(q)_"AFM" = (pi slash a, pi slash a)$ can be imprinted to detect antiferromagnetic correlations.
By aligning the magnetic field gradient along the axis of the in-plane superlattice, we can imprint a spin pattern to accumulate a relative phase $pi$ between the atoms in the states #ketL and #ketR.
If the initial atom cloud is spin-polarized, the states #ketL and #ketR are mapped to the spin states #ketup and #ketdown, respectively.
Then, at the end of the experimental sequence, we can detect both occupations with local resolution in two different atom images and compute the local contrast between the lattices site in the double wells.

This detection technique requires that the absolute phase of the superlattice potential and the magnetic field remain stable from sequence to sequence.
To stabilize the absolute superlattice phase, we need to apply the environmental correction to the green lattice in addition to the infrared lattice.
Compared to the relative superlattice phase, the required corrections for the absolute stability are greater by one order of magnitude.
Additionally, we estimate that the magnetic field must be stable to within #qty[1][mG] if the magnetic field gradient is set to #iqty[10][G/cm].
In contrast, imprinting a spin pattern to detect antiferromagnetic correlations only requires a stable magnetic field for $tau = cal(O)(#qty[100][ms])$ and a magnetic field gradient up to #iqty[1][G/cm].


== Compensating the radial superlattice potential

The radial potentials of the optical lattices determine the confinement of the atoms within the three-dimensional optical lattice.
In a bichromatic superlattice, we found the radial potential to be highly sensitive to the superlattice phase.
In the antisymmetric configuration ($phi = -pi slash 4$), the potential minima of the two lattices overlap and the radial potential in the lowest band is equal to the sum of the individual lattices.
Towards the symmetric configuration ($phi = 0$), the confinement by the infrared lattice decreases as the atom positions are determined by the potential minima of the green lattice.
Depending on the depths of the individual lattices, the radial potential becomes anticonfining towards the symmetric configuration.
Since the density redistribution is a major contribution to the heating of the atoms @soni_density_2016, understanding the radial potential is essential for conserving the confinement.
This could explain the unsuccessful entropy cooling in the vertical superlattice potential @gall_quantum_2020 @wurz_quantum_2021, where the radial potential was not adjusted according to the superlattice phase.
Recently, entropy cooling was demonstrated using a tunable lattice configuration formed by interfering two perpendicular optical lattices to create an antiferromagnetic Mott insulator with a very low temperature @xu_neutral-atom_2025.
Since the individual lattices have the same detuning, the confinement can be conserved with a third optical lattice, which is collinear with one of the optical lattices, while splitting the band insulator.

Previous attempts to compensate the confinement of the atoms in the center of the optical lattices used a digital micromirror device (DMD) @gall_quantum_2020.
However, we found that the optical potential from the DMD introduces significant disorder to the system @fleper_long-range_2020.
The DMD shares its optical path with the high-resolution imaging system, which is detrimental for creating a smooth optical potential.
As an alternative, we propose superimposing optical dipole beams along the optical paths of the in-plane optical lattices.
With beam waists ranging from #qty[30][μm] to #qty[40][μm], approximately #num[10] beams are needed to cover the atom cloud @reuter_akusto-optische_2024.
The intensity and position of the individual dipole beams are controlled with an acousto-optical deflector.
Unlike the optical potential created by the DMD, the optical dipole beams are not susceptible to disorder.
Using optical dipole beams to compensate for the radial potential could also enable the study of Floquet driving in a two-dimensional system, which is currently hindered by the strong variation of the radial potential during the phase modulation.


== Preparing $eta$ pairs in the in-plane superlattice

The $eta$-pair state is an excited eigenstate of the Fermi-Hubbard Hamiltonian formed by doubly-occupied lattice sites with an alternating sign $(-1)^i$ for each lattice site @yang_ensurematheta_1989.
This state exhibits off-diagonal long-range order, which has been associated with superconducting states @fan_entanglement_2005.
An optical superlattice has been suggested as a platform for preparing the $eta$-pair state from a band insulator with attractive interactions in the infrared lattice @kantian_eta_2010.
The short lattice is turned on at an asymmetric superlattice phase $phi != 0$, and the atoms are transferred to the excited state by switching from attractive to strongly-repulsive interactions.
In the final step, the long lattice is turned off adiabatically, thereby removing the energy offset $Delta$ and equalizing the tunneling amplitudes #tin and #tout.
This connects the doubly-occupied sites to the delocalized $eta$~pairs with momentum $k = pi slash a$.
The $eta$-pair condensate is limited by the initial band insulator at attractive interactions.
In previous experiments, a filling of approximately #qty[85][%] was achieved in the two-dimensional in-plane lattice after switching to strongly-repulsive interactions @wurz_quantum_2021.
The remaining sites are either empty or occupied by single atoms, which are expected to be detrimental for preparing the $eta$-pair condensate @kantian_eta_2010.

We have started investigating the preparation of $eta$ pairs in the in-plane superlattice with a scheme that makes use of the precise control over the superlattice phase.
For a large energy offset $abs(Delta) > U$, strongly-repulsive pairs correspond to the ground state in the double-well potentials.
To transfer the atoms from the ground state to the excited state that connects to the $eta$-pair state in the extended lattice, we diabatically ramp the energy offset $Delta -> 0$ over the avoided crossing at $plus.minus Delta approx U slash 2$ (compare @fig:theory-double-two-general).
At $Delta = 0$, the excited state in the double-well potential is equal to $ketdm = (ketLL - ketRR) slash sqrt(2)$.
By turning off the infrared lattice, we remove the energy offset, merging the individual double wells into an extended optical lattice.
While we cannot exactly realize the energy offset $Delta = 0$ across the entire atom cloud when the infrared lattice is still turned on, a reliable state preparation requires the superlattice phase to be very close to the symmetric configuration.
Otherwise, the excited states in the double wells are not reliably connected to the $eta$-pair state when merging to the extended optical lattice.
