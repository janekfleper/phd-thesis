#import "/header.typ": *

// these rules are only applied in this file
#show heading.where(level: 2): set heading(numbering: none, outlined: false)

= Conclusion and outlook <ch:outlook>

// TODO: Reference the individual chapters here?

In this thesis, I showed the characterization and stabilization of the in-plane superlattice potential, which is formed by two lattices with the wavelengths $lambda = #qty[1064][nm]$ and $lambda = #qty[532][nm]$.
I introduced the optical setup in @ch:super, and presented the calibration of the lattice depths and the radial potential in @ch:mod.
The control and stabilization of the superlattice phase and the Floquet engineering in the superlattice potential are discussed in @ch:phase.

We investigated the time-dependence of the individual lattice depths in great detail to analyze the thermally-induced focal shifts that previously resulted in a significant decrease of the lattice depths.
With an upgrade of the optical setups, we were able to achieve a significant improvement of the stability of the lattice depths.
While we can still observe thermally-induced focal shifts, we adjusted the positions of the foci to minimize the variation of the lattice depth and the waists of the lattice beams at the position of the atoms.
For the infrared and green lattice the respective stability is better than #num[2e-3] and #num[3e-3].
This amounts to an improvement of the stability by one to two orders of magnitude compared to the previous optical setups.
In the upgraded optical setup of the infrared lattice, we cannot attribute the focal shift to a specific optical element.
Further reducing the residual focal shift in the optical setup of the green lattice would require a Faraday medium with a lower absorption than terbium gallium garnet.

For the lattice calibration, we have developed the in-situ #lms to locally resolve the lattice depths.
Compared to the time-of-flight detection that resolves the quasimomentum of the atoms, we achieve a significant improvement of the measurement precision.
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
The excitation from the lowest band to an excited band works for any atomic species that can be trapped in the optical lattice.
Neither the detuning nor the running-wave component matter since they are global energy offsets that do not affect the band structure.
The only restrictions for the in-situ #lms are related to the possible lattice depths for the atom-loss mechanism.


Another approach using the hyperfine states is based on the spin-spiral technique that was used to detect magnetic correlations in the two-dimensional lattice #text(red)[ref setup section? + Nicola].
Instead of aligning the gradient angle along the diagonal of the x1064-lattice and the y1064-lattice, the magnetic field gradient would be/run parallel to the x1064-lattice.
To start the spin-spiral/Ramsey measurement a $pi slash 2$-pulse is used to transfer (the spin of) all the atoms onto the $x y$-plane.
Since the atoms are initially polarized they will all start with the same phase (in the $x y$-plane).
The evolution/precession/measurement time $tau$ is chosen such that the atoms/spins on each sublattice site accumulate the same phase $phi mod 2 pi$.
The atoms on the "other" sublattice will then have a (relative) phase offset by $pi$.
A second $pi slash 2$-pulse will then transfer the atoms/spins back onto the quantization axis where $n_L$ and $n_R$ will occupy different hyperfine states.
The (separate) densities can then be imaged sequentially as shown in @ssec:setup-sequence-detect.
While this technique sounds very tempting, it would have been even more difficult to set up than the spin spiral.
For the measurement of the correlations it was sufficient to imprint a relative spin pattern since the absolute position of the atoms/lattice sites was relevant.
The slope and the angle of the magnetic field gradient had to be carefully calibrated but the absolute value of the magnetic field along the $z$-axis could change from sequence to sequence.
In the case of the measurement in the x-superlattice we would need an absolute stability of the magnetic field and the position of the sublattice sites.
Otherwise the spin spiral/Ramsey technique will randomly/uncontrollably map the sublattice sites to the different hyperfine states.
Trying to set this up for the phase-sensitive measurement introduced in @ssec:phase-measure-sequence would not have been practical.

