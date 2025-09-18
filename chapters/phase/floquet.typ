#import "/header.typ": *

== Floquet engineering in the superlattice potential <sec:phase-floquet>

#tr[Add a few sentences as an actual introduction...]
The details about the Floquet-driven superlattice phase are already covered in the thesis @klemmer_ultracold_2024, and the project where we used Floquet driving to enhance the pair-tunneling amplitude in the superlattice potential is published in @klemmer_floquet-driven_2024.
In this section, I will briefly introduce the theoretical description of Floquet engineering and summarize the experimental results regarding the modified tunneling amplitudes in singly-occupied and doubly-occupied double wells.
The evaluation of the data we acquired in the Floquet-driven superlattice heavily relied on the calibration of the lattice depths and the superlattice phase in @ch:mod and @ch:phase respectively.
#tr[I will therefore focus on the importance of the characterization of the lattice potentials...]


=== Floquet theory <ssec:phase-floquet-theory>

#notes[
  - Add any figure here to introduce the modulation/the parameters?
]

In the framework of Floquet engineering, we apply a periodic modulation $Vmod(tau)$ to a system that is described by the static Hamiltonian #H0.
The total Hamiltonian of the system is then

$
  hat(H)(tau) = H0 + Vmod(tau)
$ <eq:phase-floquet-theory-hamiltonian>

where the periodicity $hat(H)(tau + T) = hat(H)(tau)$ is inherited from the modulation.
The Floquet theory makes use of the periodicity of the modulation $Vmod(tau + T) = Vmod(tau)$ to describe the modulated system with an effective Hamiltonian #Heff that is time-independent again #tr[cite Goldman (2014)].
Additionally, the system is also subject to the kick operator $hat(K)(tau)$ that takes the effect of the modulation at the initial time $tau_i$ and the final time $tau_f$ into account.
Using the effective Hamiltonian and the kick operator, we can express the time evolution operator as

$
  U(tau_i -> tau_f) = e^(-i kick(tau_f)) e^(-i (tau_f - tau_i) Heff) e^(i kick(tau_i))
$ <eq:phase-floquet-theory-evolution>

where the kick operator $kick(tau + T) = kick(tau)$ has the same periodicity as the modulation and averages to zero over one modulation period.
Only the phase of the modulation is relevant for the initial and the final kick that is applied to the system.
To actually compute the time evoluation of an initial state $phy.ket(psi(tau_i))$, we need to find the expressions for the effective Hamiltonian #Heff and the kick operator $kick(tau)$.
If the frequency $nu = 1 / T$ of the applied modulation is significantly higher than the energy scales of the static Hamiltonian $H0$, a common approach to determine #Heff and $kick(tau)$ is a high-frequency expansion

$
  Heff = sum_(n=0)^infinity Heff^((n)) quad "and" quad kick(tau) = sum_(n=0)^infinity kick^((n)) (tau)
$ <eq:phase-floquet-theory-expansion>

in powers of the inverse modulation frequency where $Heff^((n)) prop 1 slash nu^n$ and $kick^((n))(tau) prop 1 slash nu^n$ @rahav_effective_2003 @desbuquois_controlling_2017.
#tr[Anything to add here?]

In the context of the superlattice potential, we use the phase $phi$ to apply a periodic modulation to the system.
If we use a superlattice configuration where $tout slash tin << 1$, we can reduce the system to individual double wells where the modulation is then applied to the offset $Delta prop phi$.
Depending on the number of particles in the double well, we use the static Hamiltonian in @eq:theory-double-one-hamiltonian or in @eq:theory-double-two-hamiltonian and add the modulation

$
  Delta(tau) = h nu K_0 cos(2 pi nu tau)
$ <eq:phase-floquet-theory-modulation>

to the static offset $Delta$, where $K_0$ is the dimensionless modulation amplitude.
In the double-well potentials, the tunneling amplitude $t$ is the primary energy scale.
The condition for the high-frequency expansion in @eq:phase-floquet-theory-expansion is therefore $h nu >> t$.
If the double well is only occupied by a single particle, the tunneling amplitude is modified according to

$
  teff = t Jn(0)(K_0)
$ <eq:phase-floquet-theory-teff-high>

in the lowest order $Heff^((0))$ of the effective Hamiltonian @desbuquois_controlling_2017.
The zeroth-order Bessel function $Jn(0)$ reduces the tunneling amplitude as a function of the modulation amplitude.
At $K_0 = 2.4$, the Bessel function $Jn(0)(K_0)$ vanishes and the tunneling is completely suppressed.
This was already observed in a Floquet-driven optical lattice many years ago @lignier_dynamical_2007 #tr[(really mention this here? maybe in a footnote?)].
The first order $Heff^((1))$ of the high-frequency expansion vanishes and the second order only amounts to a tiny correction $t^((2)) prop t^3 slash nu^2$ of the effective tunneling amplitude @desbuquois_controlling_2017.

With two particles in the double well, the interaction energy $U$ introduces an additional energy scale to the system.
This requires a separation of two different regimes to compute the effective Hamiltonian @desbuquois_controlling_2017.
In the off-resonant regime, the modulation frequency is also much larger than the interaction energy $h nu >> abs(U)$.
As a result, the tunneling amplitude is again rescaled by the zeroth-order Bessel function as in @eq:phase-floquet-theory-teff-high.
In the lowest two orders of the effective Hamiltonian, the interaction energy $U$ does not change.
The first correction only appears in the second order $U^((2)) prop t^2 U slash nu^2$.
On the other hand, the near-resonant regime describes a modulation where an integer multiple of the  frequency $nu$ is comparable to the interaction energy $U approx l h nu$.
The resulting effective double-well parameters are

$
  teff^((l)) = t Jn(l)(K_0) quad "and" quad Ueff = U - l h nu
$ <eq:phase-floquet-theory-near>

in the lowest order of the effective Hamiltonian.
Compared to the off-resonant regime, additional corrections to the effective interaction energy already appear in the first expansion order.
For the description of the effective Hamiltonian in the Floquet-driven double wells, we include terms in the high-frequency expansion up to the order $1 slash nu^3$ and Bessel functions up to $Jn(3)$ #tr[cite Valentin?].

In addition to the effective Hamiltonian, the time evolution operator in @eq:phase-floquet-theory-evolution also contains the kick operator $kick(tau)$.
Depending on the phase of the modulation at the initial time $tau_i$ and the final time $tau_f$, the kick operator results in the micromotion of the system @desbuquois_controlling_2017.
In the singly-occupied double well and in the off-resonant regime of the doubly-occupied double well, the first order of the kick operator is $kick^((1))(tau) prop t Jn(1) (K_0) slash nu$.
For the near-resonant modulation, an additional term $t Jn(0) (K_0) slash nu$ shows up in the first order.
Terms proportional to the interaction energy $U$ only appear in the second order $kick^((2)) (tau)$, regardless of the modulation regime.
As long as the modulation frequency $nu$ is much larger than the tunneling amplitude $t$, the micromotion introduced by the kick operator is only a small perturbation of the system.
We therefore do not take the kick into account for the evaluation of the time evolution in the Floquet-driven double wells.
#tr[Reference figure here where we could actually observe a small micromotion?]


=== Implementation of the double-well modulation <ssec:phase-floquet-setup>

#notes[
  - Add citation to Nick's thesis in every paragraph?
]

In the experimental setup, we use the superlattice phase $phi$ to realize the modulation of the offset $Delta$ according to @eq:phase-floquet-theory-modulation.
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
Unless the beam position in the AOM changes significantly, we only need to calibrate the diffraction efficiency once for each lattice depth #Vx1064.
We then take this diffraction efficiency into account and reduce the signal amplitude around the center frequency accordingly.
In addition to this static correction based on the AOM frequency, we also apply a time-independent correction.
This is required to limit the intensity noise of the #x1064 lattice during the Floquet driving.
In the first feedback iteration, we apply the static correction to the signal $faom(tau)$ with the Floquet parameters $nu$ and #K0.
We then use the signal of the regulation photodiode to improve the amplitude of the AWG signal.
In a few iterations, we can reduce the intensity noise during the modulation to a level that is only slightly above the typical noise level without the modulation.
The time-dependent correction is applied automatically at the start of each experimental sequence.
During the evaporative cooling in the magnetic trap, we can use the #x1064 lattice path up to the regulation photodiode in @fig:super-setup without affecting the atom cloud.
An additional shutter behind the relay lens blocks the lattice beam while the time-dependent correction is calibrated.
This techniqe was implemented by Valentin Jonas and the technical details are compiled in @klemmer_ultracold_2024.

Based on the Floquet theory introduced in @ssec:phase-floquet-theory, we expect the tunneling amplitude to be modified by the periodic modulation of the offset $Delta(tau)$.
In the Bessel functions $Jn(l)$ in @eq:phase-floquet-theory-teff-high and @eq:phase-floquet-theory-near, only the modulation amplitude #K0 shows up as a parameter.
The modulation frequency $nu$ is included implicitely, since the actual amplitude in @eq:phase-floquet-theory-modulation is $h nu K0$.
For the Floquet-driven double wells occupied by a single particle, the only condition for the modulation frequency is $h nu >> t$.
In practice, the limitation for the modulation parameters is always the amplitude #K0.
If we increase the modulation frequency $nu$, we also need to increase the range of the AOM frequency to conserve the dimensionless amplitude #K0.
As discussed earlier, this is limited to $plus.minus #qty[10][MHz]$ or $phi = plus.minus pi slash 15$ in terms of the superlattice phase.
To apply the Floquet driving, we use a slightly different approach compared to the measurement of the time evolution in the static double well (see @fig:phase-measure-sequence).
Initially, we load the atoms into the #x1064 lattice at the depth $Vx1064 = #qty[15][Erec]$.
At the phase $phi = -pi slash 4$, we ramp up the #x532 lattice to the depth $Vx532 = #qty[30][Erec]$ to prepare the state #ketL or #ketLL in the double wells, depending on the occupation.
After the phase ramp $-pi slash 4 --> 0$, the time evolution does not start immediately since the tunneling amplitude is frozen at $t slash h approx #qty[10][Hz]$ in this superlattice configuration.
This allows us to adiabatically turn on the Floquet driving in a few milliseconds around the symmetric configuration @desbuquois_controlling_2017.
Only after the modulation amplitude #K0 is reached, we rapidly lower the #x532\-lattice depth to $Vx532 = #qty[12][Erec]$, where the static tunneling amplitude is $t slash h = #qty[488][Hz]$, to start the time evoluation of the initial state.
After the time $tau$, we abruptly turn off the Floquet driving and ramp the phase back to $phi = -pi slash 4$ to stop the time evolution.
For the detection of the final state, we use the band-mapping technique shown in @fig:setup-sequence-imaging-tof to measure the contrast in @eq:phase-measure-detect-contrast between the sites in each double well.
In a measurement with only singly-occupied double wells, the atom cloud is already polarized and we can directly release the atoms from the optical lattices to measure their momentum distribution.
If we are working with doubly-occupied double wells, two additional steps are required for the detection of the occupation contrast $cal(C)$ between the states #ketLL and #ketRR.
At first, we use the singles-doubles separation (see @ssec:setup-sequence-detect) to separate the states #ketLL and #ketRR from the split state #kets and the singly-occupied states #ketL and #ketR.
After the singles-doubles separation, the atoms occupy the three $m_F$ states #mF(9), #mF(7) and #mF(5).
The information about the occupation of the states #ketLL and #ketRR is contained in the $m_F$ state #mF(5), and we can discard the other two $m_F$ states with two imaging pulses ahead of the band mapping#footnote[
  We also use this technique to prepare the polarized atom cloud in @sec:phase-measure.
].
With only a single $m_F$ state remaining, we turn off the optical lattices to resolve the momentum distribution of the atoms.
Removing the other $m_F$ states earlier is required to avoid an interaction between the atoms during the time-of-flight expansion.

#floating-figure(
  image("figures/phase_floquet_bessel.png"),
  caption: [
    Effective tunneling amplitudes in Floquet-driven double wells.
    *a*, Time evolution of singly-occupied (orange) and doubly-occupied (blue) static double wells with $Delta slash t approx 0$.
    The single particles oscillate between the states #ketL and #ketR at the frequency $2t$, while we can not observe an oscillation in the doubly-occupied double wells.
    Since the data points are acquired with the band-mapping technique, we measure the mean time evolution across the atom cloud.
    *b*, Floquet-driven double wells with the modulation amplitude $K0 = 2.4$.
    The oscillation in the singly-occupied double wells is suppressed since the effective tunneling amplitude is zero.
    For the doubly-occupied double wells, we select the modulation frequency $h nu = U$ to realize a system with $Ueff approx 0$.
    The corresponding tunneling amplitude is $teff slash t approx 0.5$ according to the first-order Bessel function $Jn(1)$.
    *c*, Effective tunneling amplitudes of singly-occupied (orange) and doubly-occupied (blue) double wells as a function of the modulation amplitude.
    The dashed lines show the Bessel functions $Jn(0)(K0)$ and $Jn(1)(K0)$ corresponding to the effective tunneling amplitudes.
    The dotted vertical line marks the amplitude $K0 = 2.4$ used in *b*.
    The superlattice parameters are $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$, and the interaction energy is $U slash t approx -9$.
    This figure was adapted from @klemmer_floquet-driven_2024.

    #notes[
      - Move the *abc* labels outside of the axes...
      - Mention the micromotion here? Is the residual signal in *b* really the micromotion?
    ]
  ],
  label: <fig:phase-floquet-setup>,
)

To study the effective tunneling amplitudes in singly-occupied and doubly-occupied double wells, we prepare the corresponding systems and apply the Floquet driving according to the scheme described earlier.
As a reference, we first measure the time evolutions in the static double wells.
In #subref(<fig:phase-floquet-setup>, "a"), we can observe an oscillation with a significant dephasing for the singly-occupied double wells.
The oscillation frequency corresponds to the weighted average of $2t$ across the atom cloud.
In the doubly-occupied case, the tunneling of a single particle with the tunneling amplitude $t$ is suppressed due to the interaction energy $U slash t approx =-9$.
However, we would expect an oscillation between the states #ketLL and #ketRR with the frequency $J slash t approx 0.5$ according to the superexchange constant in @eq:theory-double-two-superexchange.
Due to the reduced frequency and the doubled sensitivity to the offset $Delta$, we are not able to resolve any oscillation in this case.
If we turn on the Floquet driving at the amplitude $K0 = 2.4$, we expect the effective tunneling amplitude to vanish in the singly-occupied case according to @eq:phase-floquet-theory-teff-high.
In the near-resonant regime at $h nu = U$ on the other hand, the effective tunneling amplitude is enhanced to $teff slash t approx 0.5$ according to @eq:phase-floquet-theory-near.
However, since the effective interaction in this case is $Ueff = U - h nu = 0$, we only realize a density-assisted tunneling where the time evolution between the states #ketLL and #ketRR is mediated by the split state #kets.
The resulting oscillation as well as the frozen occupation of the singly-occupied double wells is shown in #subref(<fig:phase-floquet-setup>, "b").
By varying the modulation ampitude $K0 = 0$ to $K0 approx 4.3$, we are able to confirm the rescaling of the effective tunneling amplitudes according to the zeroth-order Bessel function $Jn(0)(K0)$ and the first-order Bessel function $Jn(1)(K0)$ in #subref(<fig:phase-floquet-setup>, "c").


=== Crossover from density-assisted tunneling to enhanced pair tunneling


