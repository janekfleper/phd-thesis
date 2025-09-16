#import "/header.typ": *

== Calibration of the double-well parameters <sec:phase-parameters>

#notes[
  - Highlight that initially the DDS frequency is measured? The phase $phi$ is only the final evaluated quantity...
]

The tunneling amplitude $t$ is the primary energy scale to determine the behavior of a single particle in the double-well potential.
As introduced in @ssec:theory-double-one, the eigenstates only depend on the relative offset $Delta slash t$.
If the double well is symmetric $(Delta slash t = 0)$, the eigenstates are equal superpositions of the states #ketL and #ketR with an energy gap of $2t$.
A second particle in the double-well potential extends the system by the on-site interaction energy $U$ that shows up as an additional energy scale (see @fig:theory-double-two-general).
With a finite interaction, the eigenstates and the energy spectrum depend on the interplay of the tunneling amplitude $t$, the offset $Delta$ and the interaction $U$.
When working with interacting particles in double-well potentials, it is therefore essential to accurately calibrate all three parameters.
While we have already extensively covered the calibration of the lattice depths $V(x, y)$, this can not completely replace a direct measurement of the tunneling amplitude $t(x, y)$ and the interaction energy $U(x, y)$.
Since the tunneling amplitude at $Delta slash t = 0$ depends on the difference of the lattice depths #Vx1064 and #Vx532, it is significantly more sensitive to the individual lattices and their relative alignment than the lattice-modulation spectroscopy.
For the on-site interaction, the scattering length #asc is uniform across the atom cloud and the local interaction energy $U(x, y)$ depends on the total confinement by all optical lattices.
In this section, I will present the measurements we use to calibrate the two double-well parameters $t(x, y)$ and $U(x, y)$ with in-situ resolution.

#floating-figure(
  image("figures/phase_parameters_result.png", width: 85%),
  caption: [
    In-situ calibration of the double-well parameters $t$ and $U$.
    *a*, Tunneling amplitude $t(x, y)$ measured with the Rabi oscillations in the symmetric superlattice configuration $phi = 0$.
    The inset shows a typical oscillation signal with the corresponding fit to extract the oscillation frequency $2t$.
    The superlattice parameters for the measurement are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$.
    With an outer tunneling amplitude of $tout slash tin approx 0.18$, we expect a complete dephasing after $4$ to $5$ oscillation periods.
    The other contributions to the dephasing are the residual superlattice phase and the integration across the different vertical lattice planes.
    *b*, Interaction energy $U(x, y)$ measured with the density-assisted tunneling between the interaction state #ketLL and the split state #kets.
    The lattice parameters for the measurement are $Vx1064 = #qty[15][Erec]$, $Vx532 = #qty[12][Erec]$, $Vy1064 = #qty[55][Erec]$ and $Vz532 = #qty[110][Erec]$.
    The atoms occupy the states #mF(9) and #mF(7) and the magnetic field is set to $B approx #qty[204.9][G]$.
    In both maps, empty cells are either located outside of the atom cloud or the evaluation failed because of the small signal at the edge of the atom cloud.

    #notes[
      - Add an inset (or multiple) for the interaction measurement?
      - Move the inset in *a* somewhere else? Or add a background to the x-label?
      - Divide $t$ and $U$ by $h$ in the colorbar labels...
    ]
  ],
  label: <fig:phase-parameters-result>,
)

For the calibration of the tunneling amplitude $t(x, y)$, we use the state preparation and the measurement technique introduced in @sec:phase-measure.
However, instead of varying the frequency $f$ @eq:phase-measure-frequency[], we scan the oscillation time $tau$ to resolve the full time evolution.
The superlattice phase is set to $phi(x, y) approx 0$ using the zero-phase frequency $f_0$ and a compensated phase gradient (see @ssec:phase-measure-gradient).
The main limitations for the oscillation are the shot-to-shot fluctuations of the superlattice phase characterized in @ssec:phase-stability-result and the tunneling amplitude #tout between adjacent double wells.
Compared to the phase-sensitive measurement in @fig:phase-measure-theory, we can not consider the double wells to be isolated from each other.
Depending on the superlattice parameters, the expected oscillation signal can decay rapidly in just a few periods associated with the tunneling amplitude #tin.
Additional contributions to the dephasing of the measured oscillations are the inhomogeneity of the #x532\-lattice depth along the #z-axis as well as the confinement by the radial potential of the #y1064 lattice (#tr[ref radial section]).
As shown in #subref(<fig:phase-parameters-result>, "a"), we can measure the tunneling amplitude $t(x, y)$ with the in-situ detection technique introduced in @ssec:phase-measure-detect.
Each cell of the grid has a size of $9 times 9$ pixels, and we evaluate the signal $n_L (tau)$ by fitting an oscillation at the frequency $2t$ with an exponential decay to qualitatively take the aforementioned dephasing contributions into account.
On the optical axis of the #x1064 lattice and the #x532 lattice, the mean tunneling amplitude is $t slash h = #qty[652(14)][Hz]$.
Towards the outside of the atom cloud, the tunneling amplitude increases due to the decreasing lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
Since the tunneling amplitude is generally more sensitive to the #x532\-lattice depth than to the #x1064\-lattice depth, we always expect the tunneling amplitude to increase away from the optical axis.
Additionally, the #x532 lattice has a smaller waist than the #x1064 lattice (see @tab:mod-super-result).
Besides the inhomogeneity along the #y-axis, the tunneling amplitude in #subref(<fig:phase-parameters-result>, "a") also shows a small gradient along the #x-axis.
We attribute this to the shift of the vertical focus of the forward-propagating #x532\-lattice beam to $x approx #qty[2.5][mm]$ to minimize the effect of the thermal lensing (see @ssec:super-stability-x532).
While the retro-reflected beam is shifted towards the opposite side of the atom cloud, it has a smaller amplitude due to the losses in the retro path.
The lattice depth $Vx532(x, y)$ therefore slightly increases as a function of the position $x$.
For the #x1064 lattice, we do not expect any inhomogeneity along the #x-axis across the atom cloud.
In the superlattice configuration The dephasing of the oscillation is dominated by the

At the lattice depths $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, the theoretical tunneling amplitude according to the BPO Hamiltonian @eq:theory-super-hamiltonian-bpo[] is $t slash h = #qty[488][Hz]$.
This value deviates significantly from the measured tunneling amplitude on the optical axis.
There are a multitude of possible reasons for this deviation.
Any offset $Delta slash t != 0$ results in an increase of the oscillation frequency acording to @eq:theory-double-one-rabi-parameters.
We even made use of this property for the measurement of the zero-phase frequency in @fig:phase-measure-theory.
The shot-to-shot fluctuations of the superlattice phase and a residual phase gradient can therefore only increase the local oscillation frequency.
A mean deviation of #qty[4][mrad] already corresponds to a mean offset of $Delta slash t approx 0.5$.
While we determined the shot-to-shot fluctuations to be significantly smaller in @ssec:phase-stability-result, this relied on the single-shot technique with a horizontal phase gradient.
In global measurements, the residual phase $phi$ is generally greater since we can not perfectly set the zero-phase frequency $f_0$.
Besides the superlattice phase, the second possible contribution to the increase of the tunneling amplitude are the lattice depths #Vx1064 and #Vx532.
In the symmetric superlattice configuration, the tunneling amplitude $t$ effectively depends on the difference $Vx532 - Vx1064$.
This makes the tunneling amplitude significantly more sensitive to the two lattice depths than the band structure we use for the lattice-modulation spectroscopy in @sec:mod-super.
Since we can only calibrate the lattice depth $Vx532(x, y)$ in the superlattice potential, we can not independently verify the #x532\-lattice potential.
If the actual #x532\-lattice depth would be lower than #qty[12][Erec] by only #qty[4][%], the theoretical tunneling amplitude already increases to $t slash h = #qty[550][Hz]$.
Correspondingly, the tunneling amplitude is also very sensitive to the alignment of the #x532 lattice.
In conclusion, the measurement in #subref(<fig:phase-parameters-result>, "a") shows the importance of the independent calibration of the tunneling amplitude $t(x, y)$ in each superlattice configuration.

To calibrate the interaction energy $U(x, y)$, we prepare the initial state #ketLL in the double-well potentials#footnote[
  Some double wells are prepared in the state #ketL and some double wells are empty, since we can not achieve a perfect filling of the superlattice.
  However, only the double wells with two particles in the initial state #ketLL actually contribute to the interaction-sensitive measurement.
].
If the particles are strongly interacting $abs(U) slash t >> 1$, we can use the density-assisted tunneling to find the superlattice phase where $2 Delta = -U$ #tr[cite Murmann].
The actual measurement of the interaction energy is then equivalent to the measurement of the superlattice phase $phi(x, y)$ in @fig:phase-measure-detect-result.
According to the spectrum of two interacting particles in @fig:theory-double-two-general, the oscillation between the states #ketLL and #kets behaves just like the oscillation between the states #ketL and #ketR at $Delta slash t = 0$.
Therefore, we scan the superlattice frequency $f$ to find the minimum of the occupation $n_(L L) = abs(phy.braket(L L, psi))^2$ after a fixed time $tau$.
Compared to the phase-sensitive measurement with the polarized atom cloud, we can use the singles-doubles separation introduced in @ssec:setup-sequence-detect to directly resolve the occupation $n_(L L) (x, y)$.
To compute the corresponding superlattice phase, we subtract the zero-phase frequency $f_0 (x, y)$ from the interaction frequency $f_U (x, y)$ and divide the result by the frequency period @eq:phase-measure-period.
From the resulting phase

$
  phi_U (x, y) = (f_U (x, y) - f_0 (x, y)) / (Delta f)
$ <eq:phase-parameters-interaction-phi>

we can compute the offset $Delta(phi)$ and subsequently the interaction energy $U(x, y)$.
In #subref(<fig:phase-parameters-result>, "b") a typical result is shown for the strongly attractive interaction of the mixture #mix(9, 7).
At the center of the atom cloud, the mean interaction energy is $U slash h = #qty[-8035(29)][Hz]$.
Even though we are using the superlattice along the #x-axis for the measurement itself, the lattice depths $Vy1064(x, y)$ and $Vz532(x, y)$ also affect the interaction energy.
Due to the inhomogeneous lattice depths, the confinement is reduced in all directions towards the edge of the atom cloud and the interaction becomes weaker accordingly.
The actual shape of $U(x, y)$ ultimately depends on all lattice depths as well as the scattering length #asc.

At the magnetic field $B approx #qty[204.9][G]$, the scattering length of the mixture #mix(9, 7) according to the Feshbach resonances in @fig:setup-k40-fesbhach is $asc slash a_0 approx -286$.
With the total confinement by the optical lattices and the correction according to @eq:theory-wannier-interaction-correction, the expected interaction energy in the center of the optical lattices is $U slash h approx #qty[-8980][Hz]$.
In terms of the magnetic field, the difference compared to the measured interaction only corresponds to a deviation of approximately #qty[0.1][G].
While the residual noise of the magnetic field is only #qty[2.5][mG] @cocchi_analogue_2016, we do not know the absolute value of magnetic field with the same precision in the entire range from #qty[187][G] to #qty[233][G] shown in @fig:setup-k40-fesbhach.
Therefore, we always have to rely on an independent calibration of the interaction energy.
If we can run the calibration in the target lattice configuration, we directly use the interaction energy $U(x, y)$ without any further evaluation.
The systematic error of the interaction energy due at the offset $Delta = - U slash 2$ compared to the symmetric configuration $Delta slash t = 0$ is negligible unless the scattering length exceeds $abs(asc) slash a_0 = 500$.
In that case, we would need to apply a small correction to take the difference of the confinement between the offsets into account.
In practice, weak interactions are more difficult to calibrate because of the condition $abs(U) slash t >> 1$.
If the avoided crossings corresponding to the density-assisted tunneling are not well separated from the symmetric configuration $Delta slash t = 0$, the minimal energy gaps are not located exactly at $Delta = plus.minus U slash 2$.
For the spectrum shown in @fig:theory-double-two-general where $U slash t = -4$, the interaction-sensitive measurement shows a minimum of the occupation $n_(L L)$ at the offset $Delta slash t approx 2.1$ instead of $Delta slash t = 2$.
We can still take this deviation into account based on the local tunneling amplitude $t(x, y)$ and the interaction energy $U(x, y)$.
However, for even weaker interactions, the measurement technique is no longer possible since the time evolution of the initial state #ketLL also involves the other interaction state #ketRR in addition to the split state #kets.
In that case, there are two overlapping oscillations and we could not differentiate the occupation of the states #ketLL and #ketRR with the singles-doubles separation.
For weak interactions, we therefore have to use a different lattice configuration for the calibration.
If we decrease the tunneling amplitude $t$, we can realize the condition $abs(U) slash t >> 1$ without changing the magnetic field or the mixture of hyperfine states.
While this also affects the confinement by the optical lattices, we can use the measured interaction energy $U(x, y)$ to calibrate the scattering length #asc.
With the calibrated lattice depths and the scattering length, we can then compute the interaction energy $U(x, y)$ in any lattice configuration.
Since this is mostly relevant for weak scattering lengths $abs(asc)$, the possible error due to different the lattice configurations is small, since the correction $Delta E(asc)$ in @eq:theory-wannier-interaction-correction will be linear in #asc.
