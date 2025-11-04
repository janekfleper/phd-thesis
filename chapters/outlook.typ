#import "/header.typ": *

// these rules are only applied in this file
#show heading.where(level: 2): set heading(numbering: none, outlined: false)

= Conclusion and outlook <ch:outlook>

In this thesis, I showed the characterization and stabilization of the in-plane superlattice potential formed by two lattices with wavelengths of #qty[1064][nm] and #qty[532][nm].
In @ch:super, I introduced the optical setup, and in @ch:mod I presented the calibration of the lattice depths and the radial potential.
@ch:phase discusses the control and stabilization of the superlattice phase and Floquet engineering in the superlattice potential.

We investigated the time dependence of the individual lattice depths in great detail to analyze the thermally-induced focal shifts, which had previously resulted in significant decreases in the lattice depth.
With an upgrade of the optical setups, we achieved a significant improvement in the stability of the lattice depths.
Although we still observe thermally-induced focal shifts, we adjusted the positions of the foci to minimize the variation in the lattice depth and the waists of the lattice beams at the position of the atoms.
The respective stability of the infrared and green lattice is better than #num[2e-3] and #num[3e-3].
This amounts to an improvement in stability by one to two orders of magnitude compared to the previous optical setups.
In the upgraded infrared lattice optical setup, we cannot attribute the focal shift to a specific optical element.
Reducing the residual focal shift further in the green lattice optical setup would require a Faraday medium with lower absorption than that of terbium gallium garnet.

We have developed the in-situ #lms for the lattice calibration to locally resolve the lattice depths.
Compared to time-of-flight detection, which measures the quasimomentum of the atoms, our method significantly improves the measurement precision.
Furthermore, we can determine the waists of the lattice beams and the position of the optical lattice from the inhomogeneity of the lattice beams.
Combining the calibration of several parameters in a single measurement is an essential step towards autonomous operation of the experimental setup.
The high precision of the in-situ #lms can detect tiny changes in the lattice alignment, which can be used to automate the entire alignment procedure of the lattice beams.
Automating the alignment and calibration of optical lattices is especially interesting in the context of neutral-atom quantum computers @gyger_continuous_2024.
Commercial quantum computers will require a higher degree of automation than an experimental setup in a research laboratory.
With suitable hardware for the lattice modulation and the beam alignment, the in-situ #lms enables a fully automated operation of the optical lattices, from the lattice alignment to the data analysis.

A technique similar to the in-situ #lms uses the differential polarizability between the ground state and an excited state to measure the local intensity of the optical lattice @park_cavity-enhanced_2022.
While this technique also requires the optical lattice to be frozen, it imposes restrictions on both the atomic species and the optical lattice.
First, the optical transition between the ground and excited state must be narrow enough to resolve the differential light shift.
This condition is fulfilled for the optical clock transition between the singlet state $attach(S, tl: 1, br: 0)$ and the triplet state $attach(P, tl: 3, br: 0)$ in the alkaline earth metals strontium @sansonetti_wavelengths_2010 and ytterbium @hoyt_observation_2005.
The second restriction addresses the detuning of the lattice beams.
In a blue-detuned optical lattice, the atoms are trapped at the intensity minima such that only the running-wave component contributes to the differential light shift.
Thus, the wavelength of the optical lattice must be red detuned to trap the atoms at the intensity maxima, where the differential light shift is proportional to the local lattice depth and the running-wave component.
If the optical lattice has a finite running-wave component, it must be calibrated in a separate measurement.
In comparison, none of these restrictions apply to the in-situ #lms.
The excitation from the lowest band to an excited band works for any atomic species that can be trapped in an optical lattice, and the detuning and the running-wave component correspond to global energy offsets that do not affect the band structure.
The only restrictions we have found for the in-situ #lms are related to the atom-loss mechanism.

For the superlattice, we introduced the experimental setup to control the superlattice phase over short and long timescales.
We measure the superlattice phase using the dynamics of singly-occupied double wells around the symmetric configuration ($Delta = 0$).
This measurement is primarily limited by the trade-off between locally measuring the superlattice phase and resolving both lattice sites in the unit cell.
We developed an in-situ detection technique that uses the targeted removal of atoms from one lattice site in the unit cell.
This technique is more sensitive to the number of atoms than the contrast between the two lattice sites in the unit cell.
However, resolving the local superlattice phase was essential for compensating the phase gradients and for single-shot measurements of the superlattice phase.

We stabilize the superlattice phase using environmental sensors along the optical path between the position of the atoms and the retro-reflecting mirror.
We compute the necessary phase correction from the refractive indices and the readings of the environmental sensors.
With this active correction of the superlattice phase, we achieve an excellent phase stability with a standard deviation $sqrt(Delta phi^2) = #qty[1.27][mrad]$.
Other experimental setups with comparable superlattice phase tunability rely on a passive stability through equal path lengths @li_high-powered_2021 or an evacuated beam path @chalopin_optical_2024.
These superlattice setups have worse short- and long-term phase stability compared to our setup.
Additionally, the passive stability requires significant effort to develop the necessary hardware.
In contrast, our active stabilization technique can be used to upgrade an existing optical setup without modifying the optical elements.

With the excellent control over the superlattice phase, we were able to use Floquet engineering to modify the tunneling amplitudes in the superlattice potential.
By using a near-resonant driving frequency with respect to the interaction energy, we enhanced the pair tunneling in the effective system while suppressing the single-particle tunneling amplitude.


== Improving the in-situ superlattice phase measurement

One detection technique for determining the occupation of the two lattice sites within the unit cells of the superlattice potential is based on an experimental scheme for imprinting spin patterns in the two-dimensional lattice planes @wurz_coherent_2018.
In a Ramsey-type sequence, a $pi slash 2$ radio-frequency pulse rotates the spins from the vertical axis of the Bloch sphere to the equatorial plane.
With a magnetic field gradient $phy.grad B_z$ in the #xy-plane, the spins accumulate a phase depending on their position during the evolution time $tau$.
Finally, a second $pi slash 2$ radio-frequency pulse is applied to rotate the spins back to the quantization axis, thus concluding the evolution of the spins in the #xy-plane.
When the magnetic field gradient is aligned along the diagonal of the two in-plane lattices, the spin structure factor with the wave vector $phy.vb(q)_"AFM" = (pi slash a, pi slash a)$ can be imprinted to detect antiferromagnetic correlations.

If we align the magnetic field gradient along the axis of the in-plane superlattice, we could imprint a spin pattern with a spatial periodicity equal to the infrared lattice period.
The spins of the atoms on the two lattice sites within the unit cells accumulate a relative phase $pi$.
If all the atoms initially occupy the spin state #ketup, the detection maps the atoms on the two different lattice sites per unit cell to the spin states #ketup and #ketdown.
Then, at the end of the experimental sequence, we can detect both populations in two different atom images and compute the contrast between the lattices site in the unit cell.
This technique requires that the absolute phase of the superlattice potential and the magnetic field remain stable from sequence to sequence.
To stabilize the absolute superlattice phase, we need to apply the environmental correction to the green lattice in addition to the infrared lattice.
We estimate that the magnetic field must be stable to within #qty[1][mG] if the magnetic field gradient is set to #iqty[10][G/cm].
In contrast, imprinting a spin pattern to detect correlations only requires a stable magnetic field for the evolution time $tau = cal(O)(#qty[100][ms])$ and a magnetic field gradient up to #iqty[1][G/cm].


== Compensating the radial potential

The radial potential of the optical lattices determines the confinement of the atoms within the three-dimensional optical lattice.
In an optical superlattice, we found that the radial potential is highly sensitive to the superlattice phase.
In the antisymmetric configuration ($phi = -pi slash 4$), the radial potential in the ground state is equal to the sum of the individual lattices because the potential minima of the two lattices overlap.
Towards the symmetric configuration ($phi = 0$), the confinement by the infrared lattice decreases because the positions of the atoms are determined by the potential minima of the green lattice.
Depending on the depths of the individual lattices, the radial potential becomes anticonfining towards the symmetric configuration.
Because the redistribution of the atomic density is expected to be a major contribution to the heating of the system @soni_density_2016, understanding the radial potential is essential for conserving the confinement.
This could explain the unsuccessful entropy cooling in the vertical superlattice potential @gall_quantum_2020 @wurz_quantum_2021.
Recently, entropy cooling was implemented using a tunable lattice configuration formed by interfering two perpendicular optical lattices to create an antiferromagnetic Mott insulator with a very low temperature @xu_neutral-atom_2025.
Since the individual lattices have the same detuning, the confinement can be conserved while splitting the band insulator.

Previous attempts to compensate for the confinement of the atoms in the center of the optical lattices used a digital micromirror device (DMD) @gall_quantum_2020.
However, we found that the optical potential from the DMD introduces significant disorder to the system @fleper_long-range_2020.
The DMD shares its optical path with the high-resolution imaging system, which is detrimental for creating a smooth optical potential.
As an alternative, we propose superimposing optical dipole beams along the optical paths of the in-plane optical lattices.
With beam waists ranging from #qty[30][μm] to #qty[40][μm], approximately #num[10] beams are needed to cover the atom cloud @reuter_akusto-optische_2024.
The intensity and position of the individual dipole beams are controlled with an acousto-optical deflector.
Unlike the optical potential created by the DMD, the optical dipole beams are not susceptible to disorder on small length scales.
Using optical dipole beams to compensate for the radial potential could enable the study of Floquet driving in a two-dimensional system, which is currently hindered by the strong modulation of the radial potential.


== Preparing $eta$-pairs in the in-plane superlattice

The $eta$-pair state is a many-body state consisting of doubly-occupied lattice sites with an alternating sign $(-1)^i$ for each lattice site @yang_ensurematheta_1989.
As an excited eigenstate of the Hubbard Hamiltonian, the $eta$-pair state exhibits off-diagonal long-range order, which has been associated with superconducting states @fan_entanglement_2005.
An optical superlattice has been suggested as a platform for preparing the $eta$-pair state from a band insulator with attractive interactions in the infrared lattice @kantian_eta_2010.
The green lattice is turned on at an asymmetric superlattice phase $phi != 0$, and the atoms are transferred to the excited state by switching from attractive to strongly-repulsive interactions.
In the final step, the infrared lattice is turned off adiabatically to remove the energy offset $Delta$ and the different tunneling amplitudes $tin != tout$.
This connects the doubly-occupied sites to the delocalized $eta$-pairs with momentum $k = pi slash a$.

We are currently investigating the preparation of $eta$-pairs in the in-plane superlattice using a slightly different approach.
For a large energy offset $abs(Delta) > U$, the strongly-repulsive pairs correspond to the ground state in the double-well potentials.
To transfer the atoms from the ground state to the excited state, which connects to the $eta$-pair state in the extended lattice, we diabatically ramp the offset $Delta -> 0$ over the avoided crossing at $plus.minus Delta approx U slash 2$ (c.f. @fig:theory-double-two-general).
At $Delta = 0$, the excited state approaches $ketdm = (ketLL - ketRR) slash sqrt(2)$ in the double-well potential.
However, by turning off the infrared lattice, we remove the energy offset, merging the individual double wells into an extended optical lattice.
Regardless of the preparation technique, the $eta$-pair state is limited by the initial band insulator at attractive interactions.
In previous experiments, a filling of approximately #qty[85][%] was achieved in the two-dimensional in-plane lattice after switching to strongly-repulsive interactions @wurz_quantum_2021.
The remaining sites are either empty or occupied by single atoms, which are expected to be detrimental for preparing the $eta$-pair state @kantian_eta_2010.
To detect the $eta$-pairs, we are exploring a technique using a large offset $abs(Delta) > U$ in the antisymmetric superlattice configuration ($phi = -pi slash 4$).
Turning on the infrared lattice diabatically induces coherent oscillations between the states #ketdm and #ketdp in the double wells, with the oscillation amplitude as the indicator for the initial occupation of the $eta$-pair state.
