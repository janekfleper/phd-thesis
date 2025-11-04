#import "/header.typ": *

// these rules are only applied in this file
#show heading.where(level: 2): set heading(numbering: none, outlined: false)

= Conclusion and outlook <ch:outlook>

In this thesis, I showed the characterization and stabilization of the in-plane superlattice potential, which is formed by two lattices with the wavelengths $lambda = #qty[1064][nm]$ and $lambda = #qty[532][nm]$.
I introduced the optical setup in @ch:super, and presented the calibration of the lattice depths and the radial potential in @ch:mod.
The control and stabilization of the superlattice phase and the Floquet engineering in the superlattice potential were discussed in @ch:phase.

We investigated the time-dependence of the individual lattice depths in great detail to analyze the thermally-induced focal shifts that previously resulted in a significant decrease of the lattice depths.
With an upgrade of the optical setups, we were able to achieve a significant improvement of the stability of the lattice depths.
While we still observe thermally-induced focal shifts, we adjusted the positions of the foci to minimize the variation of the lattice depth and the waists of the lattice beams at the position of the atoms.
For the infrared and green lattice the respective stability is better than #num[2e-3] and #num[3e-3].
This amounts to an improvement of the stability by one to two orders of magnitude compared to the previous optical setups.
In the upgraded optical setup of the infrared lattice, we cannot attribute the focal shift to a specific optical element.
Further reducing the residual focal shift in the optical setup of the green lattice would require a Faraday medium with a lower absorption than terbium gallium garnet.

For the lattice calibration, we have developed the in-situ #lms to locally resolve the lattice depths.
Compared to the time-of-flight detection that measures the quasimomentum of the atoms, we achieve a significant improvement of the measurement precision.
Furthermore, we can determine the waists of the lattice beams and the position of the optical lattice from the inhomogeneity of the lattice beams.
Combining the calibration of several parameters in a single measurement is an essential step towards an autonomous operation of the experimental setup.
The high precision of the in-situ #lms can detect tiny changes of the lattice alignment, which can be used to automate the entire alignment procedure of the lattice beams.
The possible automation of the alignment and calibration of optical lattices is of special interest in the context of neutral-atom quantum computers @gyger_continuous_2024.
Compared to an experimental setup in a research laboratory, commercial quantum computers will require a higher degree of automation.
With suitable hardware for the lattice modulation and the beam alignment, the in-situ #lms permits a fully automated operation of the optical lattices from the lattice alignment to the data analysis.

A comparable technique to the in-situ #lms uses the differential polarizability between the ground state and an excited state to measure the local intensity of the optical lattice @park_cavity-enhanced_2022.
While this technique also requires the optical lattice to be frozen, it imposes certain restrictions on the atomic species and the optical lattice.
The optical transition between the ground and excited state needs to be sufficiently narrow to resolve the differential light shift.
In the alkaline earth metals strontium @sansonetti_wavelengths_2010 and ytterbium @hoyt_observation_2005 this condition is fulfilled for the optical clock transition between the singlet ground state $attach(S, tl: 1, br: 0)$ and the triplet state $attach(P, tl: 3, br: 0)$.
The second restriction addresses the detuning of the lattice beams.
In a blue-detuned optical lattice, the atoms are trapped at the intensity minima such that only the running-wave component contributes to the differential light shift.
Therefore, the wavelength of the optical lattice must be red detuned in order to trap the atoms at the maxima of the intensity where the differential light shift is proportional to the local lattice depth and the running-wave component.
If the optical lattice has a finite running-wave component, it has to be calibrated in a separate measurement.
In comparison, none of these restrictions apply to the in-situ #lms.
The excitation from the lowest band to an excited band works for any atomic species that can be trapped in the optical lattice, and the detuning and the running-wave component only correspond to global energy offsets that do not affect the band structure.
So far, the only restrictions we found for the in-situ #lms are related to the possible lattice depths for the atom-loss mechanism.

For the superlattice we introduced the experimental setup to control the superlattice phase on short and long timescales.
The measurement of the superlattice phase uses the dynamics of singly-occupied double wells around the symmetric configuration ($Delta = 0$).
This measurement is mainly limited by the compromise between the local measurement of the superlattice phase and the resolution of both lattice sites in the unit cell.
We have developed an in-situ detection technique based on the targeted removal of atoms from one lattice site in the unit cell, which makes it sensitive to the atom number compared to the contrast between the two lattice sites in the unit cell.
However, resolving the local superlattice phase was essential for the compensation of the phase gradients and the single-shot measurement of the superlattice phase.

The stabilization of the superlattice phase is based on environmental sensors along the optical path between the position of the atoms and the retro-reflecting mirror.
We compute the required correction of the phase from the refractive indices and the readings of the environmental sensors.
With this active correction of the superlattice phase we achieve an excellent phase stability.
Other experimental setups with a comparable tunability of the superlattice phase rely on a passive stability through equal path lengths @li_high-powered_2021 or an evacuated beam path @chalopin_optical_2024.
For these superlattice setups, the short- and long-term phase stability is worse compared to our setup.
Additionally, the passive stability requires significant effort for the development of the hardware.
In comparison, the active stabilization technique can be used to upgrade an existing optical setup without any changes to the optical elements.

With the excellent control over the superlattice phase, we used Floquet engineering to modify the tunneling amplitudes in the superlattice potential.
With a near-resonant driving frequency with respect to the interaction energy, we were able to enhance the pair tunneling in the effective system, while suppressing the single-particle tunneling amplitude.


== Improving the in-situ superlattice phase measurement

A possible detection technique to resolve the occupation of the two lattice sites in the unit cells of the superlattice potential is based on the experimental scheme to imprint spin patterns in the two-dimensional lattice planes @wurz_coherent_2018.
In a Ramsey-type sequence, a $pi slash 2$ radio-frequency pulse is used to rotate the spins from the vertical axis of the Bloch sphere onto the equatorial plane.
With a magnetic field gradient $phy.grad B_z$ in the #xy-plane, the spins accumulate a phase depending on their position $(x, y)$ during the evolution time $tau$.
If the magnetic field gradient is aligned along the diagonal of the two in-plane lattices, the spin structure factor with the wave vector $phy.vb(q)_"AFM" = (pi slash a, pi slash a)$ can be imprinted to detect antiferromagnetic correlations.
To conclude the evolution of the spins in the #xy-plane, a second $pi slash 2$ radio-frequency pulse is applied that rotates the spins back to the quantization axis.

If we align the magnetic field gradient along the axis of the in-plane superlattice, we could imprint a spin pattern with a spatial periodicity equal to the lattice period of the infrared lattice.
The spins of the atoms on the two lattice sites in each unit cell accumulate the relative phase $pi$.
If all atoms initially occupy the spin state #ketup, the detection maps the atoms on the two different lattices sites per unit cell to the spin states #ketup and #ketdown.
Then, we can detect both populations in two different atom images at the end of the experimental sequence, and we can compute the contrast between the lattices site in the unit cell.
This technique requires the absolute phase of the superlattice potential and the magnetic field to be stable from sequence to sequence.
For the stabilization of the absolute superlattice phase, we need to apply the environmental correction to the green lattice in addition to the infrared lattice.
We estimate that the absolute stability of the magnetic field needs to be better than #qty[1][mG] if the magnetic field gradient is set to #iqty[10][G/cm].
In comparison, imprinting a spin pattern for detecting correlations only requires a stable magnetic field during the evolution time $tau = cal(O)(#qty[100][ms])$.


== Compensating the radial potential

The radial potential of the optical lattices determines the confinement of the atoms in the three-dimensional optical lattice.
In an optical superlattice, we found the radial potential to be strongly sensitive to the superlattice phase.
In the antisymmetric configuration ($phi = -pi slash 4$), the radial potential in the ground state is equal to the sum of the individual lattices since the potential minima of the two lattices overlap.
Towards the symmetric configuration ($phi -> 0$), the confinement by the infrared lattice is reduced since the positions of the atoms are determined by the potential minima of the green lattice.
Depending on the depths of the individual lattices, the radial potential can even be anticonfining around the symmetric configuration.
Since the redistribution of the atomic density is expected to be a major contribution to the heating of the system @soni_density_2016, understanding the radial potential is essential to conserve the confinement of the atoms.
This is a possible cause for the unsuccessful entropy cooling in the vertical superlattice potential @gall_quantum_2020 @wurz_quantum_2021.
A recent implementation of entropy cooling used a tunable lattice configuration, formed by interfering two perpendicular optical lattices, to realize an antiferromagnetic Mott insulator with a very low temperature @xu_neutral-atom_2025.
Since the individual lattices have the same detuning, the confinement can be conserved while splitting the band insulator.

Previous attempts to compensate the confinement of the atoms in the center of the optical lattices were done using a digital micromirror device (DMD) @gall_quantum_2020.
However, we found that the optical potential from the DMD introduces significant disorder to the system @fleper_long-range_2020.
Since the DMD shares its optical with the high-resolution imaging system, which is detrimental for creating a smooth optical potential that compensates the confinement by the optical lattices.
As an alternative, we propose to superimpose optical dipole beams along the optical paths of the in-plane optical lattices @reuter_akusto-optische_2024.
With beam waists between #qty[30][μm] and #qty[40][μm], we need approximately #num[10] beams to cover the atom cloud.
The intensity and position of the individual dipole beams are controlled with an acousto-optical deflector.
Compared to the optical potential created by the DMD, the optical dipole beams are not susceptible to disorder on small length scales.
Implementing the compensation of the radial potential with the optical dipole beams could enable studying of the Floquet driving in a two-dimensional system, which is currently hindered by the strong modulation of the radial potential.


== Preparing $eta$-pairs in the in-plane superlattice

The $eta$-pair state is a many-body state that consists of doubly-occupied lattice sites with an alternating sign $(-1)^i$ for each lattice site @yang_ensurematheta_1989.
As an excited eigenstate of the Hubbard Hamiltonian, the $eta$-pair state experiences long-range order which has been associated with superconducting states @fan_entanglement_2005.
An optical superlattice was proposed as a platform for preparing the $eta$-pair state from a band insulator with attractive interactions in the infrared lattice @kantian_eta_2010.
With all sites in the infrared lattice occupied, the green lattice is turned on at an asymmetric superlattice phase $phi != 0$.
The atoms are transferred to the excited state by switching from attractive to strongly-repulsive interactions.
In the last step of the preparation, the infrared lattice is turned off adiabatically to remove the energy offset $Delta$ and the different tunneling amplitude $tin != tout$.
This connects the doubly-occupied sites to the delocalized $eta$-pairs with the momentum $k = pi slash a$.

We are currently investigating the preparation of $eta$-pairs in the in-plane superlattice with a slightly different approach.
For a large energy offset $abs(Delta) > U$, the strongly-repulsive pairs still correspond to the ground state in the double-well potentials.
To transfer the atoms from the ground to the excited state, which connects to the $eta$-pair state in the extended lattice, we diabatically ramp the offset $Delta -> 0$ over the avoided crossing at $plus.minus Delta approx U slash 2$ (c.f. @fig:theory-double-two-general).
At $Delta = 0$ the excited state approaches $ketdm = (ketLL - ketRR) slash sqrt(2)$ in the double-well potential.
However, since we remove the energy offset by turning off the infrared lattice, the individual double wells are merged into an extended optical lattice.
Regardless of the preparation technique, the $eta$-pair state is limited by the initial band insulator at attractive interactions.
In previous experiments, a filling of approximately #qty[85][%] was achieved in the two-dimensional in-plane lattice after switching to strongly-repulsive interactions @wurz_quantum_2021.
The remaining sites are either empty or occupied by single atoms, where both cases are expected to be detrimental for preparing the $eta$-pair state @kantian_eta_2010.
For the detection of the $eta$-pairs, we are exploring a technique based on a large offset $abs(Delta) > U$ in the antisymmetric superlattice configuration ($phi = -pi slash 4$).
Diabatically turning on the infrared lattice induces coherent oscillations between the states #ketdm and #ketdp in the double wells, with the oscillation amplitude as the indicator for the initial occupation of the $eta$-pair state.
