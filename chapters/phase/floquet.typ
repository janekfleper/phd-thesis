#import "/header.typ": *
#import "figures/figures.typ": floquet-sketch
#import "figures/floquet_bessel/figure.typ": figure as figure-bessel
#import "figures/floquet_spectrum/figure.typ": figure as figure-spectrum
#import "figures/floquet_result/figure.typ": figure as figure-result

== Floquet engineering of the superlattice potential <sec:phase-floquet>

Floquet engineering is based on the high-frequency modulation of a system parameter to realize an effective system.
We apply a periodic modulation of the superlattice phase #phase around the symmetric configuration to implement Floquet-driven double wells in the superlattice potential for studying a crossover from density-assisted tunneling to enhanced pair tunneling @klemmer_floquet-driven_2024.
The details about the Floquet-driven superlattice potential are covered in the thesis @klemmer_ultracold_2024.

In this section, I will briefly introduce the theoretical description of Floquet engineering and summarize the experimental results of the modified tunneling amplitudes in singly-occupied and doubly-occupied double wells.
The data analysis heavily relies on the calibration of the lattice depths, the superlattice phase and the double-well parameters in @ch:mod and @ch:phase.
Unless noted otherwise, the content in this section is adapted from @klemmer_floquet-driven_2024.


=== Floquet theory <ssec:phase-floquet-theory>

// TOOD: Fix $kick$ in @eq:phase-floquet-theory-evolution...

In the framework of Floquet engineering, we apply a periodic modulation $Vmod(tau + T) = Vmod(tau)$ to a system described by the static Hamiltonian #H0.
The total Hamiltonian of the system is

$
  hat(H)(tau) = H0 + Vmod(tau) eqc
$ <eq:phase-floquet-theory-hamiltonian>

where the periodicity $hat(H)(tau + T) = hat(H)(tau)$ is inherited from the modulation.
According to Floquet theory, the modulated system is described by an effective, time-independent Hamiltonian #Heff and a kick operator $kick(tau)$ that takes the effect of the modulation at the initial time $tau_i$ and the final time $tau_f$ into account @goldman_periodically_2014.
Using the effective Hamiltonian and the kick operator, we express the time evolution operator as

$
  U(tau_i -> tau_f) = e^(-i kick(tau_f)) e^(-i (tau_f - tau_i) Heff) e^(i kick(tau_i)) eqc
$ <eq:phase-floquet-theory-evolution>

where the kick operator $kick(tau + T) = kick(tau)$ has the same periodicity as the modulation and averages to zero over one modulation period.
To compute the time evolution of an initial state $phy.ket(psi(tau_i))$, we seek expressions for the effective Hamiltonian #Heff and the kick operator $kick(tau)$.
In the high-frequency limit, where the modulation frequency $nu = 1 slash t$ is significantly higher than the energy scales of the static Hamiltonian #H0, we find the expansions

$
  Heff = sum_(n=0)^infinity Heff^((n)) quad "and" quad kick(tau) = sum_(n=1)^infinity kick^((n)) (tau)
$ <eq:phase-floquet-theory-expansion>

in powers of the inverse modulation frequency $Heff^((n)), kick^((n)) prop 1 slash nu^n$ @rahav_effective_2003 @bukov_floquet_2017 @desbuquois_controlling_2017.

#floating-figure(
  floquet-sketch(yscale: 3, xscale: 3),
  caption: [
    Illustration of Floquet-driven double wells.
    In static double wells (left), the tunneling amplitude for a single particle is $t$ while a strongly-interacting pair tunnels according to the superexchange constant $J$ @eq:theory-double-two-superexchange[].
    In Floquet-driven double wells (right), the tunneling amplitudes are rescaled to #teff and #Jeff, respectively, while the interaction energy is #Ueff.
    This figure is adapted from @klemmer_floquet-driven_2024.
  ],
  label: <fig:phase-floquet-sketch>,
)

We use the superlattice phase #phase to apply a periodic modulation to the superlattice potential.
In a superlattice configuration where $tout slash tin << 1$, we reduce the system to an individual double well where the modulation is applied to the offset $Delta prop phase$.
We add the modulation

$
  Delta(tau) = h nu K0 cos(2 pi nu tau)
$ <eq:phase-floquet-theory-modulation>

to the static offset $Delta$, where #K0 is the dimensionless modulation amplitude.
Depending on the number of particles in the double well, we use the static Hamiltonians in @eq:theory-double-one-hamiltonian or in @eq:theory-double-two-hamiltonian.
The two different occupations are illustrated in @fig:phase-floquet-sketch.
In singly-occupied double-well potentials, the tunneling amplitude $t$ is the primary energy scale.
Therefore, the condition for the high-frequency expansion in @eq:phase-floquet-theory-expansion is $h nu >> t$, and the tunneling amplitude is modified according to

$
  teff = t Jn(0)(K0)
$ <eq:phase-floquet-theory-teff-high>

in the lowest order $Heff^((0))$ of the effective Hamiltonian @desbuquois_controlling_2017.
The zeroth-order Bessel function $Jn(0)$ reduces the tunneling amplitude as a function of the modulation amplitude.
At $K0 = 2.4$, the Bessel function $Jn(0)(K0)$ completely suppresses the tunneling amplitude, thereby realizing dynamic localization @lignier_dynamical_2007.
The first order $Heff^((1))$ of the high-frequency expansion vanishes and the second order amounts to a correction $t^((2)) prop t^3 slash nu^2$ of the effective tunneling amplitude @desbuquois_controlling_2017.

With two particles in the double well, the interaction energy $U$ introduces an additional energy scale to the system, requiring a separation of two different regimes to compute the effective Hamiltonian @desbuquois_controlling_2017.
In the off-resonant regime, the modulation frequency is also much larger than the tunneling amplitdue and the interaction energy $h nu >> t, abs(U)$.
As a result, the tunneling amplitude is rescaled by the zeroth-order Bessel function as in @eq:phase-floquet-theory-teff-high, while the interaction energy $U$ does not change in the lowest two orders of the effective Hamiltonian.
The first correction for the interaction energy appears in the second order as $U^((2)) prop t^2 U slash nu^2$.
On the other hand, the near-resonant regime describes a modulation where an integer multiple of the frequency $nu$ is comparable to the interaction energy $abs(U) approx l h nu$ but much larger than the detuning from the interaction $h nu >> abs(U) - l h nu$.
The resulting double-well parameters are

$
  teff^((l)) = t Jn(l)(K0) quad "and" quad Ueff = U + l h nu
$ <eq:phase-floquet-theory-near>

in the lowest order of the effective Hamiltonian in a system with attractive interactions#footnote[
  For repulsive interactions, the expression for the effective interaction energy is $Ueff = U - l h nu$ @desbuquois_controlling_2017.
].
Compared to the off-resonant regime, additional corrections to the effective interaction energy already appear in the first expansion order.
For computing the effective Hamiltonian, we include terms in the high-frequency expansion up to the order $1 slash nu^3$ and Bessel functions#footnote[
  The high-frequency expansions of the double-well parameters contain Bessel functions $Jn(n)$ with $n in NN$ @gorg_exploring_2019.
  Since the Bessel functions scale as $Jn(n)(K0) prop K0^n$ for small #K0, we restrict the expansions to $n <= 3$.
] up to $Jn(3)$.

In addition to the effective Hamiltonian, the time evolution operator in @eq:phase-floquet-theory-evolution also contains the kick operator $kick(tau)$, which results in a micromotion of the system depending on the initial time $tau_i$ and the final time $tau_f$ @desbuquois_controlling_2017.
In the singly-occupied double well and in the off-resonant regime of the doubly-occupied double well, the first order of the kick operator is $kick^((1))(tau) prop t Jn(1) (K0) slash nu$.
For the near-resonant regime, the additional term $t Jn(0) (K0) slash nu$ shows up in the first order.
Terms proportional to the interaction energy $U$ only appear in the second order $kick^((2)) (tau)$, regardless of the modulation regime.
As long as the modulation frequency $nu$ is much larger than the tunneling amplitude $t$, the micromotion introduced by the kick operator is only a small perturbation of the system.
Therefore, we do not take the initial and final kick into account for analyzing the time evolution in the Floquet-driven double wells.


=== Implementation of the double-well modulation <ssec:phase-floquet-setup>

In the experimental setup, we use the superlattice phase #phase to realize the modulation of the offset $Delta(tau)$ according to @eq:phase-floquet-theory-modulation.
Around the symmetric configuration $phase = 0$, the offset is directly proportional to the phase, which is in turn proportional to the frequency $f$ in @eq:phase-measure-frequency.
Therefore, we use a periodic modulation of the frequency $f(tau) prop cos(2 pi nu tau)$ to drive the offset $Delta(tau)$.
Since the DDS board in @fig:phase-setup is only capable of linear frequency ramps, we implement the modulation with the frequency #faom of the double-pass AOM.
The modulation frequency is limited by the AOM response time of around #qty[1][μs], while the modulation amplitude is capped at $plus.minus #qty[10][MHz]$ by the bandwidth of the AOM.
In terms of the superlattice phase, the accessible range is $phase = plus.minus pi slash 15$.
The corresponding offset $Delta$ is proportional to the lattice depth #Vx1064, while the relative offset $Delta slash t$ depends on both #Vx1064 and #Vx532.
In order to achieve a large modulation amplitude #K0, we select a superlattice configuration where $Delta slash t$ is very sensitive to the superlattice phase #phase.
The tunability of the offset goes hand in hand with the sensitivity to the shot-to-shot fluctuations and long-term drifts of the superlattice phase.
The active phase stabilization introduced in @sec:phase-stability is, therefore, essential for implementing the Floquet driving in the superlattice potential.

Since we apply the modulation $faom(tau) prop cos(2 pi nu tau)$ to the AOM with the AWG in @fig:phase-setup, the beam power is modulated due to the diffraction efficiency of the AOM.
At $faom = #qty[90][MHz]$, the double-pass efficiency is reduced by approximately #qty[50][%] compared to the center frequency at #qty[80][MHz].
We calibrate this diffraction efficiency and reduce the signal amplitude around the center frequency accordingly.
Additionally, we apply a time-dependent correction to reduce the intensity noise of the #x1064 lattice during the Floquet driving.
We use the signal of the regulation photodiode to improve the amplitude of the AWG signal.
In a few iterations, we can reduce the intensity noise during the modulation to a level that is only slightly above the typical noise level without the modulation.
The time-dependent correction is applied automatically at the start of each experimental sequence.
This technique was implemented by Valentin Jonas and the technical details are compiled in @klemmer_ultracold_2024.

According to the Floquet theory introduced in @ssec:phase-floquet-theory, the tunneling amplitude is modified by periodically modulating the offset $Delta(tau)$.
While the Bessel functions $Jn(l)$ in @eq:phase-floquet-theory-teff-high and @eq:phase-floquet-theory-near[] only depend on the modulation amplitude #K0, the modulation amplitude $nu$ is included implicitly since the absolute amplitude in @eq:phase-floquet-theory-modulation is $h nu K0$.
The practical limitation for the modulation parameters is the amplitude #K0 that is proportional to the detuning of the AOM frequency.
As discussed earlier, the detuning is limited to $plus.minus #qty[10][MHz]$, which corresponds to $phase = plus.minus pi slash 15$ in terms of the superlattice phase.
If we increase the modulation frequency $nu$, we also need to increase the detuning of the AOM frequency to conserve the dimensionless amplitude #K0.
For the Floquet-driven double wells occupied by a single particle, the high-frequency limit requires a modulation frequency $h nu >> t$.

To apply the Floquet driving, we use a different approach compared to measuring the time evolution in the static double wells according to @sec:phase-measure.
Initially, we load the atoms into the #x1064 lattice at the depth $Vx1064 = #qty[15][Erec]$.
Then, we ramp up the #x532 lattice to the depth $Vx532 = #qty[30][Erec]$ at the phase $phase = -pi slash 4$ to prepare the states #ketL or #ketLL in the double wells, depending on the occupation.
In this superlattice configuration, the tunneling amplitude after the phase ramp $-pi slash 4 --> 0$ is $t slash h approx #qty[10][Hz]$, which conserves the states #ketL or #ketLL.
At the symmetric phase ($phase = 0$), we adiabatically turn on the Floquet driving  in a few milliseconds @desbuquois_controlling_2017.
Only after reaching the modulation amplitude #K0, we diabatically lower the #x532\-lattice depth to $Vx532 = #qty[12][Erec]$, where the static tunneling amplitude is $t slash h = #qty[488][Hz]$, to start the time evolution of the initial state.
After the measuring time $tau$, we diabatically turn off the Floquet driving and ramp the phase back to $phase = -pi slash 4$, thereby stopping the time evolution.

For detecting the final state, we use the band-mapping technique shown in @fig:setup-sequence-imaging-tof to measure the contrast in @eq:phase-measure-detect-contrast between the sites in each double well.
When we prepare singly-occupied double wells, the atom cloud is already polarized and we can directly release the atoms from the optical lattices to measure their momentum distribution.
In a system with doubly-occupied double wells, we need to remove the atoms in all but one $m_F$ state prior to the band mapping to avoid an interaction between the atoms during the time-of-flight expansion.
At first, we use the singles-doubles separation (see @ssec:setup-sequence-detect) to separate the states #ketLL and #ketRR from the singlet state #kets and the singly-occupied states #ketL and #ketR.
Afterwards, the atoms occupy the three $m_F$ states #mF(9), #mF(7) and #mF(5), where the information about the occupation of the states #ketLL and #ketRR is contained in the state #mF(5).
We discard the states #mF(9) and #mF(7) using two imaging pulses ahead of the band mapping#footnote[
  We also use this spin-cleaning technique to prepare the polarized atom cloud in @sec:phase-measure.
].
With only a single $m_F$ state remaining, we turn off the optical lattices to resolve the momentum distribution of the atoms.
The details about the experimental sequence to realize the Floquet driving can be found in @klemmer_ultracold_2024.


#floating-figure(
  figure-bessel(),
  caption: [
    Effective tunneling amplitudes in Floquet-driven double wells.
    *a*, Time evolution of singly-occupied (orange) and doubly-occupied (blue) static double wells with $Delta slash t approx 0$.
    Since the data points are acquired with the band-mapping technique, we measure the weighted average of the entire atom cloud.
    The single particles oscillate between the states #ketL and #ketR at the frequency $2t$, while we cannot observe an oscillation in the doubly-occupied double wells.
    *b*, Floquet-driven double wells with the modulation amplitude $K0 = 2.4$.
    The oscillation in the singly-occupied double wells is suppressed since the effective tunneling amplitude is zero.
    The residual oscillation is the micromotion due to the kick operator (see @ssec:phase-floquet-theory).
    For the doubly-occupied double wells, we select the modulation frequency $h nu = abs(U)$ to realize a system with $Ueff approx 0$ and the effective tunneling amplitude $teff slash t approx 0.5$.
    *c*, Effective tunneling amplitudes of singly-occupied (orange) and doubly-occupied (blue) double wells.
    The dashed lines show the Bessel functions $Jn(0)(K0)$ and $Jn(1)(K0)$, and the dotted vertical line marks the amplitude $K0 = 2.4$ used in *b*.
    The superlattice parameters are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, and the interaction energy is $U slash t approx -9$.
    This figure is adapted from @klemmer_floquet-driven_2024.
  ],
  label: <fig:phase-floquet-setup>,
)

To study the effective tunneling amplitudes in singly-occupied and doubly-occupied double wells, we prepare the corresponding systems and apply the Floquet driving as described earlier.
Additionally, we measure the time evolutions in the static double wells as a reference.
In #subref(<fig:phase-floquet-setup>, "a"), we observe an oscillation with a significant dephasing for the singly-occupied, static double wells.
The oscillation frequency corresponds to the weighted average of $2t$ across the atom cloud.
In the doubly-occupied case, the single-particle tunneling is suppressed due to the interaction energy $U slash t approx -9$.
The superexchange between the states #ketLL and #ketRR at the frequency $J slash t approx 0.5$ according to @eq:theory-double-two-superexchange cannot be resolved due to the strong sensitivity to the offset $Delta$ (see #subref(<fig:theory-double-two-general>, "a")).

If we turn on the Floquet driving with the amplitude $K0 = 2.4$, the effective tunneling amplitude vanishes in the singly-occupied double wells according to @eq:phase-floquet-theory-teff-high.
On the other hand, the effective tunneling amplitude is enhanced to $teff slash t approx 0.5$ in the near-resonant regime $h nu = abs(U)$.
However, since the effective interaction in this case is $Ueff = U + h nu = 0$, we only realize density-assisted tunneling where the time evolution between the states #ketLL and #ketRR is mediated by the singlet state #kets.
The resulting oscillation, as well as the frozen occupation of the singly-occupied double wells, are shown in #subref(<fig:phase-floquet-setup>, "b").
By varying the modulation amplitude from $K0 = 0$ to $K0 approx 4.3$ in #subref(<fig:phase-floquet-setup>, "c"), we confirm the rescaling of the effective tunneling amplitudes according to the zeroth-order Bessel function $Jn(0)(K0)$ and the first-order Bessel function $Jn(1)(K0)$.


=== Crossover from density-assisted tunneling to enhanced pair tunneling <ssec:phase-floquet-crossover>

According to the near-resonant Floquet theory, the effective interaction energy @eq:phase-floquet-theory-near[] vanishes in the lowest order if the static interaction energy is an integer multiple of the modulation frequency.
Therefore, resonant Floquet driving only realizes a density-assisted
We can therefore only use the resonant Floquet driving to realize a density-assisted tunneling between the states #ketLL, #kets and #ketRR.
The mediation of the tunneling through the singlet state #kets prevents an interpretation of the time evolution as pair tunneling between the states #ketLL and #ketRR.
The correlated tunneling between the states #ketLL and #ketRR is quantified by the amplitude #VCT.
Together with the amplitudes #VNN and #VDE for the nearest-neighbor interaction and the direct spin exchange @dutta_non-standard_2015, the higher-order corrections of the double-well Hamiltonian are

$
  hat(H)_"corr" = mat(
    0, 0, 0, VCT;
    0, VNN, VDE, 0;
    0, VDE, VNN, 0;
    VCT, 0, 0, 0;
  ) eqp
$ <eq:phase-floquet-crossover-hamiltonian>

We neglect the higher-order corrections in the static Hamiltonian @eq:theory-double-two-hamiltonian[] since they are smaller than the tunneling amplitude $t$ by several orders of magnitude.
In the Floquet-driven double wells, we aim to enhance the pair tunneling through the correlated-tunneling amplitude #VCT, while suppressing the single-particle tunneling #teff with the modulation amplitude $K0 = 2.4$.

To investigate the effective Hamiltonian of the Floquet-driven double wells, we measure the contrast $calC(tau)$ for different modulation frequencies $nu$.
The evaluation of the oscillation signals uses an elaborate scheme based on the near-resonant Floquet theory and the independent calibration of the static system parameters $t(x, y)$, $Delta(x, y)$ and $U(x, y)$.
In addition to the regular tunneling amplitude $t$, we also consider density-induced tunneling amplitude #tcorr proportional to the scattering length #asc @jurgensen_density-induced_2012.
This correction modifies the total tunneling amplitude as part of the extended Hubbard parameters @dutta_non-standard_2015.
To take the residual superlattice phase $phase(x, y)$ into account, we run regular measurements of the zero-phase frequency $f_0(x, y)$ as shown in @fig:phase-measure-detect-result between the measurements of the oscillation signals $calC(tau)$.
Instead of applying feedback based on the residual phases, we compute the corresponding offset $Delta_phase (x, y)$ and include it in the computation of the time evolution according to the Floquet theory.
Additionally, we consider the offset $Delta_y1064 (x, y)$ due to the radial confinement by the #y1064 lattice.
For the interaction energy $U(x, y)$, we employ the calibration method introduced in @sec:phase-parameters.
However, instead of directly using the measured interaction energy, we use the generalized evaluation to determine the scattering length $asc(B)$, thereby allowing a variation of the scattering length as a fit parameter.
Finally, we calibrate the initial atomic density $n(x, y)$ of the doubly-occupied sites in the #x1064 lattice as the weights for the global average.
In total, the evaluation takes the parameters $t(x, y)$, $tcorr(x, y)$, $Delta(x, y)$, $U(x, y)$, $K0(x, y)$, $nu$ and $n(x, y)$ into account, and we fit the effective Hamiltonian #Heff in @eq:phase-floquet-theory-expansion up to the order $1 slash nu^3$ and the Bessel function $Jn(n <= 3)$.
With an exact diagonalization of the effective Hamiltonian, we find the eigenvalues $epsilon_1$ to $epsilon_4$ (compare @fig:theory-double-two-symmetric) and we compute the time evolution starting from the initial state #ketLL.
Additionally, we can read the parameters #teff, #Ueff and #VCTeff directly from the effective Hamiltonian.
The fit parameters to adjust the theoretical signals to the measured oscillation signals $calC(tau)$ are the #x532\-lattice depth #Vx532 in the center of the atom cloud and the scattering length #asc.

#floating-figure(
  figure-spectrum(),
  caption: [
    Floquet spectrum of the effective Hamiltonian.
    We evaluate the oscillation signals (insets) with the Floquet theory to find the matrix elements of the effective Hamiltonian for the doubly-occupied double well.
    The data points show the eigenvalues $epsilon_n$ of the effective Hamiltonian in the center of the atom cloud.
    Compared to the static spectrum in @fig:theory-double-two-symmetric, the triplet state $epsilon_3 = #kett$ is not included here since it is decoupled from the other three eigenstates.
    The shaded areas show the near-resonant Floquet theory based on the experimental parameters, while the uncertainties are determined with a Monte-Carlo simulation.
    Around $h nu = abs(U)$, the first order ($l = 1$) of the Floquet theory is used, while the second-order theory ($l = 2$) is used around $h nu = abs(U) slash 2$.
    To completely suppress the single-particle tunneling, the modulation amplitude is set to $K0 = 2.4$.
    The superlattice parameters are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, and the interaction energy is $U slash t approx -9$.
    This figure is adapted from @klemmer_floquet-driven_2024.
  ],
  label: <fig:phase-floquet-crossover-spectrum>,
)

The spectrum of the effective Hamiltonian for the orders $l = 1$ and $l = 2$ is shown in @fig:phase-floquet-crossover-spectrum.
For each modulation frequency $nu$, we compare the eigenvalues $epsilon_1$, $epsilon_2$ and $epsilon_4$ of the effective Hamiltonian in the center of the atom cloud to the theoretical spectrum $epsilon_n (nu)$.
The energies are normalized by the modulation frequency, which leads to the visual distortion of the eigenvalues compared to the spectrum of the static Hamiltonian in @fig:theory-double-two-symmetric.
Furthermore, there are two copies of the spectrum centered around $h nu = abs(U)$ and $h nu = abs(U) slash 2$ respectively.
The color gradients around $h nu = #qty[0.7][U]$ indicate that we cannot connect the different orders since the high-frequency condition $h nu >> abs(U) - l h nu$ is no longer fulfilled.
Instead, we select the appropriate order $l$ for each evaluation based on the proximity of the interaction energy $abs(U)$ to an integer multiple of the modulation frequency $h nu$.
The insets in @fig:phase-floquet-crossover-spectrum show the measured oscillation signals $calC(tau)$ and the theoretical time evolution according to the effective Hamiltonian determined from the fit.
At $l h nu approx abs(U)[]$, the oscillations show a single frequency since the effective interaction energy is $Ueff approx 0$ (see #subref(<fig:phase-floquet-setup>, "b")).
This requires two equal gaps in the spectrum between the eigenvalues $(epsilon_1, epsilon_2)$ and $(epsilon_2, epsilon_4)$, which only occurs when the interaction energy vanishes.
For any finite interaction energy $U$, two of the eigenvalues approach each other while the third eigenvalue converges to $epsilon = 0$.
In the time evolution, this is expressed as a beat of two different frequencies for weak to intermediate interactions#footnote[
  If the interactions are strong $abs(U) slash t >> 1$, the coupling to the third state becomes weak and only a single frequency equal to the superexchange constant $J$ @eq:theory-double-two-superexchange[] remains.
  However, we are not able to access this regime with the effective interaction energy #Ueff in the Floquet-driven double wells.
].
We can observe this beating in the two near-resonant oscillation signals at $h nu slash abs(U) approx 0.65$ and $h nu slash abs(U) approx 1.05$.

#floating-figure(
  figure-result(),
  caption: [
    Pair tunneling in the Floquet-driven double wells.
    The different orders $l$ are overlapped as a function of the effective interaction $Ueff = U + l h nu$ in @eq:phase-floquet-theory-near.
    The shaded areas show the parameters according to the near-resonant Floquet theory, and the uncertainties are computed using Monte-Carlo simulations.
    *a*, Minimal energy gap between the three eigenstates shown in @fig:phase-floquet-crossover-spectrum.
    The solid line shows the minimal energy gap in the static spectrum as a function of the interaction energy $U slash t$.
    *b*, Correlated-tunneling amplitude extracted from the effective Hamiltonian.
    The first-order modulation results in a small amplitude #VCTeff, while the second-order modulation enhances the amplitude up to $VCTeff slash abs(teff) approx 0.4$.
    *c*, Pair-tunneling fidelity #Fpair @eq:phase-floquet-crossover-fidelity[] to quantify the mean occupation of the singlet state #kets during the tunneling depending on the detuning from the resonance $l h nu = U$.
    *d*, Enhanced pair-tunneling amplitude at $Ueff slash ateffn(2) = 6$ compared to the time evolution in a static double well with $U slash t = 6$ in *e*.
    The superlattice parameters are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, and the modulation amplitude is $K0 = 2.4$ to suppress the single-particle tunneling.
    This figure is adapted from @klemmer_floquet-driven_2024.
  ],
  label: <fig:phase-floquet-crossover-result>,
)

The primary difference between the Floquet spectrum in @fig:phase-floquet-crossover-spectrum and the static spectrum in @fig:theory-double-two-symmetric is the asymmetry of the eigenvalues around the interaction energy $U = 0$.
The minimal energy gap #DEmin between the two closest eigenvalues, which determines the primary timescale of the oscillation between the states #ketLL and #ketRR, is larger towards one side of the Floquet spectrum for each order $l$.
In #subref(<fig:phase-floquet-crossover-result>, "a"), we see the comparison of the minimal energy gap in the static double well to the orders $l = 1$ and $l = 2$ of the Floquet-driven double well.
The minimal energy gap of the first-order spectrum appears to be centered around $Ueff slash abs(teff) approx -0.5$.
For attractive interactions in the effective Hamiltonian, the minimal energy gap is slightly increased compared to the static Hamiltonian.
In the second-order spectrum, the minimal energy gap is shifted to $Ueff slash abs(teff) approx 2$ and we observe a significant increase compared to the static Hamiltonian.
We attribute the difference between the Floquet-driven double wells and the static double wells to the correlated tunneling amplitude #VCTeff.
While the correlated tunneling amplitude #VCT is much smaller than the tunneling amplitude $t$ in the static double wells, the effective amplitude #VCTeff can reach the same order of magnitude as the effective tunneling amplitude $teff^((l))$ (see #subref(<fig:phase-floquet-crossover-result>, "b")).
The total pair-tunneling amplitude in the near-resonant Floquet theory is

$
  Jeff approx (4 teff^2) / Ueff + (-1)^l dot 2 VCTeff eqc
$ <eq:phase-floquet-crossover-tunneling>

where the first term corresponds to the superexchange constant based on the effective parameters #teff and #Ueff.
The enhancement of the pair tunneling in the Floquet-driven double wells is therefore primarily caused by the enhanced parameter #VCT.
For the second-order near-resonant Floquet driving, we can achieve $VCT slash ateffn(2) approx 0.4$ at the effective interaction energy $Ueff slash ateffn(2) approx 6$.

In addition to the pair-tunneling amplitude #Jeff in @eq:phase-floquet-crossover-tunneling, we consider the effective interaction energy #Ueff to quantify the fidelity of the pair tunneling.
As discussed for the oscillation in #subref(<fig:phase-floquet-setup>, "b"), the time evolution between the states #ketLL and #ketRR is completely mediated by the singlet state #kets if the effective interaction energy is zero.
Since the pair is broken during the tunneling, we cannot interpret the time evolution as pair tunneling that directly connects the states #ketLL and #ketRR.
To specify the residual contribution by the singlet state #kets, we introduce the pair-tunneling fidelity

$
  Fpair = 1 - 4 dot overline(abs(phy.braket(L R, psi(tau)))^2 + abs(phy.braket(R L, psi(tau)))^2)
$ <eq:phase-floquet-crossover-fidelity>

based on the average occupation of the basis states #ketLR and #ketRL during the time evolution.
The fidelity is $Fpair = 0$ at $U = 0$ and approaches $Fpair = 1$ for $abs(U) -> oo$ (see #subref(<fig:phase-floquet-crossover-result>, "c")).
For an effective interaction energy $abs(Ueff) slash ateffn(l) >= 6$, the fidelity is greater than $0.6$, which indicates a dominant pair tunneling compared to the density-assisted tunneling mediated by the singlet state #kets.
The oscillation between the states #ketLL and #ketRR in the Floquet-driven double wells is shown in #subref(<fig:phase-floquet-crossover-result>, "d"), where the average occupation of the singlet state #kets is approximately $0.1$.
However, compared to the corresponding oscillation in the static double wells in #subref(<fig:phase-floquet-crossover-result>, "e"), the pair-tunneling amplitude is enhanced by a factor greater than $2$.

In conclusion, we modulate the superlattice phase #phase to realize near-resonant Floquet systems where we investigate a crossover from density-assisted tunneling around the effective interaction energy $Ueff approx 0$ to enhanced pair tunneling at $Ueff slash ateffn(2) approx 6$.
The enhancement of the pair tunneling is primarily enabled by the correlated-tunneling amplitude #VCTeff between the states #ketLL and #ketRR.
In addition to the enhancement compared to static double wells, the pair tunneling amplitude is also significantly larger than the single-particle tunneling amplitude $teff = t Jn(0)$.
With the modulation amplitude $K0 = 2.4$, we suppress the single-particle tunneling while the near-resonant tunneling amplitudes $teffn(l)$ remain tunable.
