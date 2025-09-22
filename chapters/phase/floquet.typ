#import "/header.typ": *

== Floquet engineering of the superlattice potential <sec:phase-floquet>

To implement Floquet-driven double wells in the superlattice potential, we apply a periodic modulation of the superlattice phase $phi$ around the symmetric configuration.
This allows a realization of an effective Hamiltonian that can not be achieved in a static system.
We used the Floquet-driven double wells to realize the crossover from density-assisted tunneling to enhanced pair tunneling @klemmer_floquet-driven_2024.
The technical details about the Floquet driving of the superlattice potential are covered in the thesis @klemmer_ultracold_2024.
In this section, I will briefly introduce the theoretical description of Floquet engineering and summarize the experimental results of the modified tunneling amplitudes in singly-occupied and doubly-occupied double wells.
The evaluation of the data we acquired in the Floquet-driven superlattice heavily relied on the calibration of the lattice depths and the superlattice phase in @ch:mod and @ch:phase respectively.
With the independent calibration of the double-well parameters, we could compute the global average of the time evolutions according to the Floquet theory, and compare it to the experimental data.
Unless noted otherwise, the content in this section was adapted from @klemmer_floquet-driven_2024.


=== Floquet theory <ssec:phase-floquet-theory>

#notes[
  - Add any figure here to introduce the modulation/the parameters?
  - Fix $hat(K)$ in @eq:phase-floquet-theory-evolution...
]

In the framework of Floquet engineering, we apply a periodic modulation $Vmod(tau)$ to a system that is described by the static Hamiltonian #H0.
The total Hamiltonian of the system is then

$
  hat(H)(tau) = H0 + Vmod(tau)
$ <eq:phase-floquet-theory-hamiltonian>

where the periodicity $hat(H)(tau + T) = hat(H)(tau)$ is inherited from the modulation.
The Floquet theory makes use of the periodicity of the modulation $Vmod(tau + T) = Vmod(tau)$ to describe the modulated system with an effective Hamiltonian #Heff that is time-independent again @goldman_periodically_2014.
Additionally, the system is also subject to the kick operator $hat(K)(tau)$ that takes the effect of the modulation at the initial time $tau_i$ and the final time $tau_f$ into account.
Using the effective Hamiltonian and the kick operator, we can express the time evolution operator as

$
  U(tau_i -> tau_f) = e^(-i kick(tau_f)) e^(-i (tau_f - tau_i) Heff) e^(i kick(tau_i))
$ <eq:phase-floquet-theory-evolution>

where the kick operator $kick(tau + T) = kick(tau)$ has the same periodicity as the modulation and averages to zero over one modulation period.
Only the phase of the modulation is relevant for the initial kick and the final kick that are applied to the system.
To actually compute the time evolution of an initial state $phy.ket(psi(tau_i))$, we need to find the expressions for the effective Hamiltonian #Heff and the kick operator $kick(tau)$.
If the frequency $nu = 1 slash T$ of the applied modulation is significantly higher than the energy scales of the static Hamiltonian #H0, a common approach to determine #Heff and $kick(tau)$ is a high-frequency expansion

$
  Heff = sum_(n=0)^infinity Heff^((n)) quad "and" quad kick(tau) = sum_(n=0)^infinity kick^((n)) (tau)
$ <eq:phase-floquet-theory-expansion>

in powers of the inverse modulation frequency where $Heff^((n)) prop 1 slash nu^n$ and $kick^((n))(tau) prop 1 slash nu^n$ @rahav_effective_2003 @desbuquois_controlling_2017.

In the context of the superlattice potential, we use the phase $phi$ to apply a periodic modulation to the system.
If we use a superlattice configuration where $tout slash tin << 1$, we can reduce the system to individual double wells where the modulation is then applied to the offset $Delta prop phi$.
Depending on the number of particles in the double well, we use the static Hamiltonian in @eq:theory-double-one-hamiltonian or in @eq:theory-double-two-hamiltonian and add the modulation

$
  Delta(tau) = h nu K0 cos(2 pi nu tau)
$ <eq:phase-floquet-theory-modulation>

to the static offset $Delta$, where #K0 is the dimensionless modulation amplitude.
In the double-well potentials, the tunneling amplitude $t$ is the primary energy scale.
The condition for the high-frequency expansion in @eq:phase-floquet-theory-expansion is therefore $h nu >> t$.
If the double well is only occupied by a single particle, the tunneling amplitude is modified according to

$
  teff = t Jn(0)(K0)
$ <eq:phase-floquet-theory-teff-high>

in the lowest order $Heff^((0))$ of the effective Hamiltonian @desbuquois_controlling_2017.
The zeroth-order Bessel function $Jn(0)$ reduces the tunneling amplitude as a function of the modulation amplitude.
At $K0 = 2.4$, the Bessel function $Jn(0)(K0)$ completely suppresses the tunneling amplitude.
The first order $Heff^((1))$ of the high-frequency expansion vanishes and the second order only amounts to a tiny correction $t^((2)) prop t^3 slash nu^2$ of the effective tunneling amplitude @desbuquois_controlling_2017.

With two particles in the double well, the interaction energy $U$ introduces an additional energy scale to the system.
This requires a separation of two different regimes to compute the effective Hamiltonian @desbuquois_controlling_2017.
In the off-resonant regime, the modulation frequency is also much larger than the interaction energy $h nu >> abs(U)$.
As a result, the tunneling amplitude is again rescaled by the zeroth-order Bessel function as in @eq:phase-floquet-theory-teff-high.
In the lowest two orders of the effective Hamiltonian, the interaction energy $U$ does not change.
The first correction only appears in the second order $U^((2)) prop t^2 U slash nu^2$.
On the other hand, the near-resonant regime describes a modulation where an integer multiple of the frequency $nu$ is comparable to the interaction energy $U approx l h nu$.
The resulting double-well parameters are

$
  teff^((l)) = t Jn(l)(K0) quad "and" quad Ueff = U - l h nu
$ <eq:phase-floquet-theory-near>

in the lowest order of the effective Hamiltonian.
Compared to the off-resonant regime, additional corrections to the effective interaction energy already appear in the first expansion order.
For the description of the effective Hamiltonian in the Floquet-driven double wells, we include terms in the high-frequency expansion up to the order $1 slash nu^3$ and Bessel functions up to $Jn(3)$.

In addition to the effective Hamiltonian, the time evolution operator in @eq:phase-floquet-theory-evolution also contains the kick operator $kick(tau)$.
Depending on the phase of the modulation at the initial time $tau_i$ and the final time $tau_f$, the kick operator results in the micromotion of the system @desbuquois_controlling_2017.
In the singly-occupied double well and in the off-resonant regime of the doubly-occupied double well, the first order of the kick operator is $kick^((1))(tau) prop t Jn(1) (K0) slash nu$.
For the near-resonant modulation, an additional term $t Jn(0) (K0) slash nu$ shows up in the first order.
Terms proportional to the interaction energy $U$ only appear in the second order $kick^((2)) (tau)$, regardless of the modulation regime.
As long as the modulation frequency $nu$ is much larger than the tunneling amplitude $t$, the micromotion introduced by the kick operator is only a small perturbation of the system.
We therefore do not take the kick into account for the evaluation of the time evolution in the Floquet-driven double wells.


=== Implementation of the double-well modulation <ssec:phase-floquet-setup>

In the experimental setup, we use the superlattice phase $phi$ to realize the modulation of the offset $Delta(tau)$ according to @eq:phase-floquet-theory-modulation.
Around the symmetric configuration $phi = 0$, the offset is directly proportional to the phase, which is in turn proportional to the frequency $f$ in @eq:phase-measure-frequency.
We therefore use a periodic modulation of the frequency $f(tau) prop cos(2 pi nu tau)$ to drive the offset $Delta(tau)$.
Since the DDS in @fig:phase-setup is only capable of linear frequency ramps, we implement the modulation with the frequency #faom of the double-pass AOM.
The modulation frequency is only limited by the finite response time of #qty[1][μs] of the AOM, while the modulation amplitude is capped at $plus.minus #qty[10][MHz]$ by the bandwidth of the AOM.
In terms of the superlattice phase, the accessible range is $phi = plus.minus pi slash 15$.
The corresponding offset $Delta$ is proportional to the lattice depth #Vx1064, while the relative offset $Delta slash t$ depends on both #Vx1064 and #Vx532.
In order to achieve a large offset $Delta slash t >> 1$ that is required for the Floquet driving, we need to select a superlattice configuration where $Delta slash t$ is very sensitive to the superlattice phase $phi$.
This tunability of the offset always goes hand in hand with the sensitivity to the shot-to-shot fluctuations and long-term drifts of the superlattice phase.
The phase stabilization introduced in @sec:phase-stability is therefore essential for the implementation of the Floquet driving in the superlattice potential.

If we apply the modulation $faom(tau) prop cos(2 pi nu tau)$ to the AOM with the arbitrary waveform generator (AWG) in @fig:phase-setup, the beam power is also modulated due to the diffraction efficiency of the AOM.
At $faom = #qty[90][MHz]$, the efficiency is reduced by approximately #qty[20][%] compared to the center frequency at #qty[80][MHz].
We calibrate this diffraction efficiency and reduce the signal amplitude around the center frequency accordingly.
Unless the beam position in the AOM changes significantly, we only need to calibrate the diffraction efficiency once for each lattice depth #Vx1064.
In addition to this static correction based on the AOM frequency, we also apply a time-independent correction.
This is required to limit the intensity noise of the #x1064 lattice during the Floquet driving.
In the first feedback iteration, we apply the static correction to the signal $faom(tau)$ with the Floquet parameters $nu$ and #K0.
We then use the signal of the regulation photodiode to improve the amplitude of the AWG signal.
In a few iterations, we can reduce the intensity noise during the modulation to a level that is only slightly above the typical noise level without the modulation.
The time-dependent correction is applied automatically at the start of each experimental sequence.
During the evaporative cooling in the magnetic trap, we can use the #x1064 lattice path up to the regulation photodiode in @fig:super-setup without affecting the atom cloud.
An additional shutter behind the relay lens blocks the lattice beam while the time-dependent correction is calibrated.
This technique was implemented by Valentin Jonas and the technical details are compiled in @klemmer_ultracold_2024.

Based on the Floquet theory introduced in @ssec:phase-floquet-theory, we expect the tunneling amplitude to be modified by the periodic modulation of the offset $Delta(tau)$.
In the Bessel functions $Jn(l)$ in @eq:phase-floquet-theory-teff-high and @eq:phase-floquet-theory-near, only the modulation amplitude #K0 shows up as a parameter.
The modulation frequency $nu$ is included implicitly, since the absolute amplitude in @eq:phase-floquet-theory-modulation is $h nu K0$.
For the Floquet-driven double wells occupied by a single particle, the only condition for the modulation frequency is $h nu >> t$.
In practice, the limitation for the modulation parameters is always the amplitude #K0.
If we increase the modulation frequency $nu$, we also need to increase the range of the AOM frequency to conserve the dimensionless amplitude #K0.
As discussed earlier, this is limited to $plus.minus #qty[10][MHz]$ or $phi = plus.minus pi slash 15$ in terms of the superlattice phase.
To apply the Floquet driving, we use a slightly different approach compared to the measurement of the time evolution in the static double well (see @fig:phase-measure-sequence).
Initially, we load the atoms into the #x1064 lattice at the depth $Vx1064 = #qty[15][Erec]$.
At the phase $phi = -pi slash 4$, we ramp up the #x532 lattice to the depth $Vx532 = #qty[30][Erec]$ to prepare the state #ketL or #ketLL in the double wells depending on the occupation.
After the phase ramp $-pi slash 4 --> 0$, the tunneling amplitude is $t slash h approx #qty[10][Hz]$ in this superlattice configuration, which effectively freezes the time evolution.
This allows us to adiabatically turn on the Floquet driving in a few milliseconds around the symmetric configuration @desbuquois_controlling_2017.
Only after the modulation amplitude #K0 is reached, we diabatically lower the #x532\-lattice depth to $Vx532 = #qty[12][Erec]$, where the static tunneling amplitude is $t slash h = #qty[488][Hz]$, to start the time evolution of the initial state.
After the time $tau$, we diabatically turn off the Floquet driving and ramp the phase back to $phi = -pi slash 4$ to stop the time evolution.
For the detection of the final state, we use the band-mapping technique shown in @fig:setup-sequence-imaging-tof to measure the contrast in @eq:phase-measure-detect-contrast between the sites in each double well.
In a measurement with only singly-occupied double wells, the atom cloud is already polarized and we can directly release the atoms from the optical lattices to measure their momentum distribution.
If we are working with doubly-occupied double wells, two additional steps are required for the detection of the occupation contrast #calC between the states #ketLL and #ketRR.
At first, we use the singles-doubles separation (see @ssec:setup-sequence-detect) to separate the states #ketLL and #ketRR from the split state #kets and the singly-occupied states #ketL and #ketR.
After the singles-doubles separation, the atoms occupy the three $m_F$ states #mF(9), #mF(7) and #mF(5).
The information about the occupation of the states #ketLL and #ketRR is contained in the $m_F$ state #mF(5), and we can discard the other two $m_F$ states with two imaging pulses ahead of the band mapping#footnote[
  We also use this spin-cleaning technique to prepare the polarized atom cloud in @sec:phase-measure.
].
With only a single $m_F$ state remaining, we turn off the optical lattices to resolve the momentum distribution of the atoms.
Removing the other $m_F$ states earlier is required to avoid an interaction between the atoms during the time-of-flight expansion.
The details about the experimental sequence to realize the Floquet driving can be found in @klemmer_ultracold_2024.

#floating-figure(
  image("figures/phase_floquet_bessel.png"),
  caption: [
    Effective tunneling amplitudes in Floquet-driven double wells.
    *a*, Time evolution of singly-occupied (orange) and doubly-occupied (blue) static double wells with $Delta slash t approx 0$.
    The single particles oscillate between the states #ketL and #ketR at the frequency $2t$, while we can not observe an oscillation in the doubly-occupied double wells.
    Since the data points are acquired with the band-mapping technique, we measure the weighted average of the time evolution across the atom cloud.
    *b*, Floquet-driven double wells with the modulation amplitude $K0 = 2.4$.
    The oscillation in the singly-occupied double wells is suppressed since the effective tunneling amplitude is zero.
    For the doubly-occupied double wells, we select the modulation frequency $h nu = U$ to realize a system with $Ueff approx 0$.
    The corresponding tunneling amplitude according to the first-order Bessel function $Jn(1)$ is $teff slash t approx 0.5$.
    *c*, Effective tunneling amplitudes of singly-occupied (orange) and doubly-occupied (blue) double wells as a function of the modulation amplitude.
    The dashed lines show the Bessel functions $Jn(0)(K0)$ and $Jn(1)(K0)$ corresponding to the effective tunneling amplitudes.
    The dotted vertical line marks the amplitude $K0 = 2.4$ used in *b*.
    The superlattice parameters are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, and the interaction energy is $U slash t approx -9$.
    This figure was adapted from @klemmer_floquet-driven_2024.

    #notes[
      - Move the *abc* labels outside of the axes...
      - Mention the micromotion here? Is the residual signal in *b* really the micromotion? #emoji.eyes
    ]
  ],
  label: <fig:phase-floquet-setup>,
)

To study the effective tunneling amplitudes in singly-occupied and doubly-occupied double wells, we prepare the corresponding systems and apply the Floquet driving according to the scheme described earlier.
As a reference, we first measure the time evolution in the static double wells.
In #subref(<fig:phase-floquet-setup>, "a"), we observe an oscillation with a significant dephasing for the singly-occupied double wells.
The oscillation frequency corresponds to the weighted average of $2t$ across the atom cloud.
In the doubly-occupied case, the tunneling of a single particle with the tunneling amplitude $t$ is suppressed due to the interaction energy $U slash t approx = -9$.
However, we would expect an oscillation between the states #ketLL and #ketRR with the frequency $J slash t approx 0.5$ according to the superexchange constant in @eq:theory-double-two-superexchange.
Due to the reduced frequency and the strong sensitivity to the offset $Delta$ (see #subref(<fig:theory-double-two-general>, "a")), we are not able to observe any oscillation in this case.
If we turn on the Floquet driving with the amplitude $K0 = 2.4$, we expect the effective tunneling amplitude to vanish in the singly-occupied case according to @eq:phase-floquet-theory-teff-high.
In the near-resonant regime at $h nu = U$ on the other hand, the effective tunneling amplitude is enhanced to $teff slash t approx 0.5$ according to @eq:phase-floquet-theory-near.
However, since the effective interaction in this case is $Ueff = U - h nu = 0$, we only realize a density-assisted tunneling where the time evolution between the states #ketLL and #ketRR is mediated by the split state #kets.
The resulting oscillation as well as the frozen occupation of the singly-occupied double wells is shown in #subref(<fig:phase-floquet-setup>, "b").
By varying the modulation amplitude from $K0 = 0$ to $K0 approx 4.3$, we are able to confirm the rescaling of the effective tunneling amplitudes according to the zeroth-order Bessel function $Jn(0)(K0)$ and the first-order Bessel function $Jn(1)(K0)$ in #subref(<fig:phase-floquet-setup>, "c").


=== Crossover from density-assisted tunneling to enhanced pair tunneling <ssec:phase-floquet-crossover>

According to the near-resonant Floquet theory, the interaction energy @eq:phase-floquet-theory-near[] in the lowest order of the effective Hamiltonian vanishes if the static interaction energy is an integer multiple of the modulation frequency.
We can therefore only use the resonant Floquet driving to realize a density-assisted tunneling between the states #ketLL, #kets and #ketRR.
The mediation of the tunneling through the split state #kets prevents an interpretation of the time evolution as the pair tunneling between the states #ketLL and #ketRR.
In the Hamiltonian that describes two particles in a double well, the matrix element #VCT quantifies the correlated tunneling that directly connects the pair states #ketLL and #ketRR @desbuquois_controlling_2017.
However, in a static double well, #VCT is only a higher-order correction#footnote[
  Other higher-order corrections are the nearest-neighbor interaction $V_"NN"$ and the direct spin exchange $V_"DE"$ @dutta_non-standard_2015.
] and we can neglect it in the Hamiltonian @eq:theory-double-two-hamiltonian[].
In the Floquet-driven double wells, our goal is to enhance the pair tunneling, while keeping the single-particle tunneling #teff suppressed with the modulation amplitude $K0 = 2.4$.

To investigate the effective Hamiltonian of the Floquet-driven double wells, we measure the contrast $calC(tau)$ for different modulation frequencies $nu$.
The evaluation of the oscillation signals uses an elaborate scheme based on the near-resonant Floquet theory and the independent determination of the static system parameters.
Since we are measuring the global average of the occupation contrast $calC$, we need to manually take the inhomogeneity of the double-well parameters $t(x, y)$, $Delta(x, y)$ and $U(x, y)$ into account.
To determine these parameters, we use the in-situ calibration of the lattice depths $V(x, y)$ introduced in @ch:mod.
While the tunneling amplitude $t$ and the phase-induced offset $Delta_phi$ only depend on the #x1064 lattice and the #x532 lattice, the interaction energy $U$ additionally depends on the #y1064 lattice and the #z532 lattice (see @sec:phase-parameters).
In addition to the regular tunneling amplitude $t$ extracted from the BPO Hamiltonian @eq:theory-super-hamiltonian-bpo[], we also consider the density-induced tunneling #tcorr proportional to the scattering length #asc @jurgensen_density-induced_2012.
This correction modifies the total tunneling amplitude and is part of the extended Hubbard parameters @dutta_non-standard_2015.
Compared to the pair-tunneling amplitude #VCT, the density-induced tunneling #tcorr is already relevant in the static double well.
We therefore use the total tunneling amplitude $t + tcorr$ as the reference value for the static tunneling amplitude.
To take the residual superlattice phase $phi(x, y)$ into account, we run regular measurements of the zero-phase frequency $f_0(x, y)$ as shown in @fig:phase-measure-detect-result between the measurements of the oscillation signals $calC(tau)$.
Instead of applying an active feedback based on the residual phases, we compute the corresponding offset $Delta_phi (x, y)$ and include it in the computation of the time evolution according to the Floquet theory.
Additionally, we also consider the offset $Delta_y1064 (x, y)$ due to the radial confinement by the #y1064 lattice.
For the interaction energy $U(x, y)$ we employ the calibration method introduced in @sec:phase-parameters.
However, instead of directly using the measured interaction energy, we use the extended evaluation to determine the scattering length $asc(B)$.
This allows a variation of the scattering length as a fit parameter later.
Besides the inhomogeneous double-well parameters, the initial occupation of the double wells is also essential for the computation of the global average of the time evolution.
We therefore calibrate the initial atomic density $n(x, y)$ of the doubly-occupied sites in the #x1064 lattice and use this atomic density as the weight for the global average.
In total, the evaluation takes the parameters $t(x, y)$, $tcorr(x, y)$, $Delta(x, y)$, $U(x, y)$, $K0(x, y)$, $nu$ and $n(x, y)$ into account, and we fit the effective Hamiltonian #Heff in @eq:phase-floquet-theory-expansion up to the inverse frequency $1 slash nu^3$ and the Bessel function $Jn(3)$.
With an exact diagonalization of the effective Hamiltonian, we can find the eigenvalues $epsilon_1$ to $epsilon_4$ (c.f. @fig:theory-double-two-symmetric) and we can compute the time evolution starting with the initial state #ketLL.
The only actual fit parameters are the #x532\-lattice depth #Vx532 in the center of the atom cloud and the scattering length #asc.
These two fit parameters are required to achieve a variation of the double-well parameters to adjust the theoretical time-evolution signals to the measured oscillation signals $calC(tau)$.

#floating-figure(
  image("figures/phase_floquet_spectrum.png", width: 80%),
  caption: [
    Floquet spectrum of the effective Hamiltonian.
    We evaluate the oscillation signals (insets) with the Floquet theory to determine the matrix elements of the effective Hamiltonian for the doubly-occupied double well.
    The data points show the eigenvalues $epsilon_n$ of the effective Hamiltonian in the center of the atom cloud.
    Compared to the static spectrum in @fig:theory-double-two-symmetric, the triplet state $epsilon_3 = #kett$ is not included here since it is decoupled from the other three eigenstates.
    The shaded areas show the near-resonant theory including the expected uncertainty based on the experimental parameters.
    Around $h nu = U$, the first-order ($l = 1$) of the Floquet theory is used, while the second-order theory ($l = 2$) is used around $h nu = U slash 2$.
    To completely suppress the single-particle tunneling, the modulation amplitude is always set to $K0 = 2.4$.
    The superlattice parameters are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, and the interaction energy is $U slash t approx -9$.
    This figure was adapted from @klemmer_floquet-driven_2024.

    #notes[
      - Find nicer colors for the spectrum!
    ]
  ],
  label: <fig:phase-floquet-crossover-spectrum>,
)

The spectrum of the effective Hamiltonian for the orders $l = 1$ and $l = 2$ is shown in @fig:phase-floquet-crossover-spectrum.
For each modulation frequency $nu$, we compare the eigenvalues $epsilon_1$, $epsilon_2$ and $epsilon_4$ of the effective Hamiltonian in the center of the atom cloud to the theoretical spectrum $epsilon_n (nu)$.
The energy is normalized by the modulation frequency, which leads to the visual distortion of the eigenvalues compared to the spectrum of the static Hamiltonian in @fig:theory-double-two-symmetric.
Furthermore, there are two copies of the spectrum centered around $h nu = U$ and $h nu = U slash 2$ respectively.
The color gradients around $h nu = #qty[0.7][U]$ indicate that we can not directly connect the theory of the different orders.
Instead, we select the appropriate order $l$ for each evaluation based on the proximity of an integer multiple of the modulation frequency $nu$ to the interaction energy $U$.
The insets in @fig:phase-floquet-crossover-spectrum show the measured oscillation signals $calC(tau)$ and the theoretical time evolution according to the effective Hamiltonian determined from the fit.
At $l h nu approx U$, the oscillations only show a single frequency since the effective interaction energy is $Ueff approx 0$ (see #subref(<fig:phase-floquet-setup>, "b")).
In the spectrum, this requires two equal gaps between the eigenvalues $(epsilon_1, epsilon_2)$ and $(epsilon_2, epsilon_4)$.
According to the theory of the static double well, this is only expected when the interaction energy vanishes.
For any finite interaction energy $U$, two of the eigenvalues approach each other while the third eigenvalue converges to $epsilon = 0$.
In the time evolution, this is expressed as a beat of two different frequencies for weak to intermediate interactions#footnote[
  If the interactions are strong $abs(U) slash t >> 1$, the coupling to the third state becomes weak and only a single frequency equal to the superexchange constant $J$ @eq:theory-double-two-superexchange[] remains.
  However, we are not able to access this regime with effective interaction energy #Ueff in the Floquet-driven double wells.
].
We can observe this beating in the insets of the two near-resonant oscillation signals at $h nu approx #qty[0.65][U]$ and $h nu approx #qty[1.05][U]$.

#floating-figure(
  image("figures/phase_floquet_result.png", width: 80%),
  caption: [
    Pair tunneling in the Floquet-driven double wells.
    The different orders $l$ are now overlapped as a function of the effective interaction $Ueff = U - l h nu$ in @eq:phase-floquet-theory-near.
    *a*, Minimal energy gap between the three eigenstates shown in @fig:phase-floquet-crossover-spectrum.
    The solid line shows the minimal energy gap in the static spectrum as a function of the interaction energy $U slash t$.
    *b*, Correlated-tunneling amplitude extracted from the effective Hamiltonian.
    The first-order modulation only results in a small amplitude #VCT, while the second-order modulation raises the amplitude up to $VCT slash abs(teff) approx 0.4$.
    *c*, Pair-tunneling fidelity #Fpair @eq:phase-floquet-crossover-fidelity[] to quantify the mean occupation of the split state #kets during the tunneling depending on the detuning from the resonance $l h nu = U$.
    *d*, Enhanced pair-tunneling amplitude at $Ueff slash ateffn(2) = 6$ compared to the time evolution in a static double well with $U slash t = 6$ in *e*.
    The superlattice parameters are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, and the modulation amplitude is $K0 = 2.4$ to suppress the single-particle tunneling.
    This figure was adapted from @klemmer_floquet-driven_2024.

    #notes[
      - Add all the "exponents" $(l)$ to the tunneling amplitudes #teff etc...
      - Show the static theory in *a* above the Floquet theory?
      - Change y-label of *b* to $VCT^"eff"$?
    ]
  ],
  label: <fig:phase-floquet-crossover-result>,
)

The main difference between the Floquet spectrum in @fig:phase-floquet-crossover-spectrum and the static spectrum in @fig:theory-double-two-symmetric is the asymmetry of the eigenvalues around the interaction energy $U = 0$.
In the Floquet spectrum, the minimal energy gap between the two closest eigenvalues is larger towards one side of the spectrum for each order $l$.
The minimal energy gap #DEmin determines the primary timescale of the oscillation between the states #ketLL and #ketRR.
In #subref(<fig:phase-floquet-crossover-result>, "a"), we can see the comparison of the minimal energy gap in the static double well to the orders $l = 1$ and $l = 2$ of the Floquet-driven double well.
The minimal energy gap of the first-order spectrum appears to be centered around $Ueff slash abs(teff) approx -0.5$.
For attractive interactions in the effective Hamiltonian, the minimal energy gap is slightly increased compared to the static Hamiltonian.
In the second-order spectrum, the minimal energy gap is shifted to $Ueff slash abs(teff) approx 2$ and we can observe a significant increase compared to the static Hamiltonian.
If we take a closer look at the matrix elements of the effective Hamiltonian, we can attribute the difference between the Floquet-driven double wells and the static double wells to the tunneling amplitude #VCT.
As discussed earlier, the correlated tunneling #VCT is much smaller than the tunneling amplitude $t$ in the static double wells.
However, in the Floquet-driven double wells, the correlated tunneling #VCT shown in #subref(<fig:phase-floquet-crossover-result>, "b") can reach the same order of magnitude as the effective tunneling amplitude $teff^((l))$.
The total pair-tunneling amplitude in the near-resonant Floquet theory is

$
  Jeff approx (4 teff^2) / Ueff + (-1)^l 2 VCT
$ <eq:phase-floquet-crossover-tunneling>

where the first term corresponds to the superexchange constant based on the effective parameters #teff and #Ueff.
The enhancement of the pair tunneling in the Floquet-driven double wells is therefore primarily caused by the enhanced parameter #VCT.
For the second-order near-resonant Floquet driving, we can achieve $VCT slash ateffn(2) approx 0.4$ at the effective interaction energy $Ueff slash ateffn(2) approx 6$.

In addition to the tunneling amplitude #Jeff in @eq:phase-floquet-crossover-tunneling, we also have to consider the effective interaction energy #Ueff to quantify the fidelity of the pair tunneling.
As discussed for the oscillation in #subref(<fig:phase-floquet-setup>, "b"), the time evolution between the states #ketLL and #ketRR is completely mediated by the split state #kets if the interaction energy is zero.
Since the pair is broken during the tunneling, we can not interpret this as pair tunneling that directly connects the states #ketLL and #ketRR.
To specify the residual contribution by the split state #kets, we introduce the pair-tunneling fidelity

$
  Fpair = 1 - 4 dot overline(abs(phy.braket(L R, psi(tau)))^2 + abs(phy.braket(R L, psi(tau)))^2)
$ <eq:phase-floquet-crossover-fidelity>

that quantifies the mean amplitude of the basis states #ketLR and #ketRL during the time evolution.
As illustrated in #subref(<fig:phase-floquet-crossover-result>, "c"), the fidelity is $Fpair = 0$ at $U = 0$ and approaches $Fpair = 1$ for $abs(U) -> oo$.
For an effective interaction energy $abs(Ueff) slash ateffn(l) >= 6$, the fidelity is greater than $0.6$, which indicates a dominant pair tunneling compared to the density-assisted tunneling mediated by the split state #kets.
The oscillation between the states #ketLL and #ketRR in the Floquet-driven double wells is shown in #subref(<fig:phase-floquet-crossover-result>, "d"), where the mean occupation of the split state #kets is approximately $0.1$.
However, compared to the corresponding oscillation in the static double wells in #subref(<fig:phase-floquet-crossover-result>, "e"), the pair-tunneling amplitude is enhanced by a factor greater than $2$.

In conclusion, we can use the modulation frequency $nu$ to tune the near-resonant Floquet theory in the crossover from density-assisted tunneling around the effective interaction $Ueff approx 0$ to dominant pair tunneling with an enhanced tunneling amplitude at $Ueff slash ateffn(2) approx 6$.
The enhancement is primarily enabled by the amplitude #VCT of the correlated tunneling process between the states #ketLL and #ketRR.
In addition to the enhancement compared to the corresponding tunneling amplitude in the static double wells, the pair tunneling amplitude is also significantly larger than the single-particle tunneling $teff = t Jn(0)$.
With the modulation amplitude $K0 = 2.4$, we can use the Floquet-driving to completely suppress the single-particle tunneling, while the near-resonant tunneling amplitudes $teffn(l)$ remain finite.
