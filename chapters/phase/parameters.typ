#import "/header.typ": *
#import "figures/parameters_result/figure.typ": figure as figure-result

== Calibrating the double-well parameters <sec:phase-parameters>

The tunneling amplitude $t$ is the primary energy scale to govern the behavior of a single particle in a double-well potential.
As introduced in @ssec:theory-double-one, the eigenstates only depend on the relative energy offset $Delta slash t$.
For two particles, the system is extended by the on-site interaction energy $U$ (see @fig:theory-double-two-general).
The eigenstates and the energy spectrum depend on the interplay of the tunneling amplitude $t$, the energy offset $Delta$ and the interaction energy $U$.
In this section, I will present the calibration measurements for the two double-well parameters $t(x, y)$ and $U(x, y)$ with local resolution.
The energy offset $Delta(x, y)$ can be computed from the phase $phase(x, y)$ and the lattice depth $Vx1064(x, y)$.

For calibrating the tunneling amplitude $t(x, y)$, we employ the phase-sensitive measurement and the in-situ detection of the double-well occupation introduced in @sec:phase-measure.
However, we scan the oscillation time $tau$ to measure the time evolution instead of varying the phase #phase through the frequency $f$.
We set the superlattice phase $phase(x, y) approx 0$ using the zero-phase frequency #f0 and compensate the phase gradient according to the scheme introduced in @ssec:phase-measure-gradient.
The main limitations for the Rabi oscillations are shot-to-shot fluctuations of the superlattice phase (see @ssec:phase-stability-result) and the tunneling amplitude #tout between adjacent double wells.
Depending on the superlattice parameters, the oscillation signal decays rapidly in just a few periods of the tunneling amplitude #tin.
Compared to the phase-sensitive measurement in @fig:phase-measure-theory, we cannot consider the double wells to be isolated from each other unless the outer tunneling amplitude is negligible compared to the oscillation time ($tau0 dot tout << 1$).
Additionally, the inhomogeneity of the #x532\-lattice depth along the #z-axis contributes to the dephasing of the Rabi oscillations since we average the atomic density in all vertical lattice planes.

The measured tunneling amplitude $t(x, y)$ in a superlattice configuration with $tout slash tin approx 0.18$ is shown in #subref(<fig:phase-parameters-result>, "a").
Each cell of the grid has a size of $#qty[9][px] times #qty[9][px]$ and we evaluate the signal $n_L (tau)$ by fitting an oscillation with the frequency $2t$ and an exponential decay, which takes the aforementioned dephasing contributions into account.
Based on the outer tunneling amplitude, we already expect a complete dephasing in $4$ to $5$ oscillation periods.
On the optical axis of the #x1064 lattice and the #x532 lattice, the mean tunneling amplitude is $t slash h = #qty[652(14)][Hz]$.
The tunneling amplitude increases with the distance from the optical axis, which is expected due to the decreasing lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
Additionally, the tunneling amplitude in #subref(<fig:phase-parameters-result>, "a") also shows a small gradient along the #x-axis.
We attribute this to the shift of the vertical focus of the #forward #x532\-lattice beam to $x approx #qty[2.5][mm]$, which minimizes the thermal lensing (see @ssec:super-stability-x532).
In the #x1064 lattice, we do not expect a relevant inhomogeneity of the lattice depth along the optical axis across the atom cloud.

At the lattice depths $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, the theoretical tunneling amplitude according to the BPO Hamiltonian @eq:theory-super-hamiltonian-bpo[] is $t slash h = #qty[488][Hz]$.
This value deviates significantly from the measured tunneling amplitude on the optical axis.
There are a multitude of possible reasons for this deviation.
An offset $Delta slash t != 0$, due to shot-to-shot fluctuations of the superlattice phase or a residual phase gradient, results in an increase of the oscillation frequency according to @eq:theory-double-one-rabi-parameters.
In this superlattice configuration, a mean deviation of #qty[4][mrad] corresponds to the mean offset $Delta slash t approx 0.5$.
While we determined the shot-to-shot fluctuations to be smaller in @ssec:phase-stability-result, this relied on single-shot measurements using a horizontal phase gradient.
In global measurements, the residual phase #phase is generally greater since we cannot set the zero-phase frequency #f0 with the same accuracy as the shot-to-shot fluctuations.
The other possible contributions to an increased tunneling amplitude are the lattice depths #Vx1064 and #Vx532.
In a symmetric superlattice potential, the tunneling amplitude $t$ effectively depends on the difference $Vx532 - Vx1064$.
In contrast, the in-situ #slms introduced in @sec:mod-super measures the effective lattice depth $Vx532 + Vx1064$ in the antisymmetric configuration.
Consequently, the tunneling amplitude is significantly more sensitive to the two lattice depths than the band transitions used for the #slms.
A systematic error in the #x532\-lattice calibration or an imperfect alignment can, therefore, result in the deviation of the tunneling amplitude.
If the actual #x532\-lattice depth is lower than #qty[12][Erec] by #qty[4][%], the theoretical tunneling amplitude increases to $t slash h = #qty[550][Hz]$, which highlights the importance of an independent calibration of the tunneling amplitude $t(x, y)$.

#floating-figure(
  figure-result(),
  caption: [
    Local calibration of the double-well parameters $t$ and $U$.
    *a*, Tunneling amplitude $t(x, y)$ measured with the Rabi oscillations in the symmetric superlattice configuration $phase = 0$.
    The inset shows a typical oscillation signal $n_L (tau)$ with the corresponding fit to extract the oscillation frequency $2t$.
    The superlattice parameters for the measurement are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$.
    *b*, Interaction energy $U(x, y)$ measured with the density-assisted tunneling between the states #ketLL and #kets.
    The parameters for the measurement are $Vx1064 = #qty[15][Erec]$, $Vx532 = #qty[12][Erec]$, $Vy1064 = #qty[55][Erec]$ and $Vz532 = #qty[110][Erec]$.
    The atoms occupy the states #mF(9) and #mF(7) and the magnetic field is set to $B approx #qty[204.9][G]$.
    In *a* and *b*, empty cells are located outside of the atom cloud or the local evaluation failed.
  ],
  label: <fig:phase-parameters-result>,
)

For calibrating the interaction energy $U(x, y)$, we prepare the atoms in the initial state #ketLL in the double-well potentials#footnote[
  Some double wells are prepared in the state #ketL and some double wells are empty since we cannot achieve a perfect filling of the superlattice.
  However, only the double wells with two particles in the initial state #ketLL actually contribute to the interaction-sensitive measurement.
].
If the particles are strongly interacting $abs(U) slash t >> 1$, we can use density-assisted tunneling to find the superlattice phase where $2 Delta = -U$ @murmann_two_2015.
According to the spectrum of two interacting particles in a double-well potential (see @fig:theory-double-two-general), the oscillation between the states #ketLL and #kets mirrors the oscillation between the states #ketL and #ketR around $Delta slash t = 0$.
Therefore, we scan the superlattice frequency $f$ to find the minimum of the occupation $n_(L L) = abs(phy.braket(L L, psi))^2$ after a fixed time #tau0.
Compared to the phase-sensitive measurement with the polarized atom cloud, we use the singles-doubles separation introduced in @ssec:setup-sequence-detect to resolve the occupation $n_(L L) (x, y)$.
The superlattice phase that quantifies the interaction energy is

$
  phase_U (x, y) = (f_U (x, y) - f0(x, y)) / (Delta f)
$ <eq:phase-parameters-interaction-phi>

with the zero-phase frequency $f0(x, y)$ and the superlattice period #Df.
From the phase $phase_U (x,y)$, we compute the energy offset $Delta(phase_U)$ and, subsequently, the interaction energy $U(x, y)$.
In #subref(<fig:phase-parameters-result>, "b"), a typical result of the interaction calibration is shown for strongly attractive interactions of the mixture #mix(9, 7).
In the center of the atom cloud, the mean interaction energy is $U slash h = #qty[-8035(29)][Hz]$.
Even though we use the superlattice along the #x-axis for the measurement of the interaction energy, the lattice depths $Vy1064(x, y)$ and $Vz532(x, y)$ also affect the interactions.
The confinement is reduced in all directions towards the edge of the atom cloud, thereby resulting in weaker interactions.
Ultimately, the shape of $U(x, y)$ depends on all lattice depths as well as the scattering length #asc.

At the magnetic field $B approx #qty[204.9][G]$, the scattering length of the mixture #mix(9, 7) according to the Feshbach resonances in @fig:setup-k40-fesbhach is $asc slash a_0 approx -286$.
With the total confinement and the correction according to @eq:theory-wannier-interaction-correction, the expected interaction energy in the center of the optical lattices is $U slash h approx #qty[-8980][Hz]$.
In terms of the magnetic field, the difference to the measured interaction energy corresponds to a deviation of approximately #qty[0.1][G].
While the residual noise of the magnetic field is only #qty[2.5][mG] @cocchi_analogue_2016, we do not know the absolute value of the magnetic field with the same precision over the entire range from #qty[187][G] to #qty[233][G] shown in @fig:setup-k40-fesbhach.
Therefore, we always rely on the independent calibration of the interaction energy.

If we can run the calibration in the target lattice configuration, we directly use the interaction energy $U(x, y)$ without any further evaluation.
The systematic error of the interaction energy at the offset $Delta = - U slash 2$ compared to the symmetric configuration $Delta slash t = 0$ is negligible unless the scattering length exceeds $abs(asc) slash a_0 = 500$.
On the other hand, the calibration of weak interactions is limited by the condition $abs(U) slash t >> 1$.
If the avoided crossings of the density-assisted tunneling are not well separated from the symmetric configuration $Delta slash t = 0$, the minimal energy gaps are not located exactly at $Delta = plus.minus U slash 2$.
We correct for this deviation into account based on the local tunneling amplitude $t(x, y)$ and the interaction energy $U(x, y)$.
However, for even weaker interactions, the measurement technique is no longer possible since the time evolution of the initial state #ketLL also involves the interacting state #ketRR in addition to the singlet state #kets.
Therefore, we have to use a different lattice configuration for calibrating weak interactions.
With a decreased tunneling amplitude $t$, the condition $abs(U) slash t >> 1$ can be recovered without changing the magnetic field or the mixture of hyperfine states.
Then, we use the measured interaction energy $U(x, y)$ to calibrate the scattering length #asc.
With the calibrated lattice depths and the scattering length, we can compute the interaction energy $U(x, y)$ in any lattice configuration.
