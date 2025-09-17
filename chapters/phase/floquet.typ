#import "/header.typ": *

== Floquet engineering with the superlattice phase <sec:phase-floquet>

#tr[Add a few sentences as an actual introduction...]
The details about the Floquet-driven superlattice phase are already covered in the thesis @klemmer_ultracold_2024, and the project where we used Floquet driving to enhance the pair-tunneling amplitude in the superlattice potential is published in @klemmer_floquet-driven_2024.
In this section, I will briefly introduce the theoretical description of Floquet engineering and summarize the experimental results regarding the modified tunneling amplitudes in singly-occupied and doubly-occupied double wells.
The evaluation of the data we acquired in the Floquet-driven superlattice heavily relied on the calibration of the lattice depths and the superlattice phase in @ch:mod and @ch:phase respectively.
#tr[I will therefore focus on the importance of the characterization of the lattice potentials...]


=== Floquet theory <ssec:phase-floquet-theory>

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
We therefore do not take it into account for the evaluation of the time evolution in the Floquet-driven double wells.
#tr[Reference figure here where we could actually observe a small micromotion?]
