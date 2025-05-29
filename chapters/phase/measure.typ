#import "/header.typ": *

#let fdds = $f_"DDS"$
#let fbeat = $f_"beat"$

== Measuring the phase <sec:phase-measure>

#[
  #set text(red)
  - Is there a way to measure the phase of a standing-wave optical lattice with a camera?
  - How to reference the measurement of changes in @sec:phase-sensors?
  - Where to mention the period of $approx #qty[150][MHz]$ before this section?
  - Add any comparison to the phase-sensitivity of the superlattice amplitude modulation technique?
  - Where to discuss the inhomogeneity of $v_l$ and $v_s$ for the symmetry point?
  - Where to introduce phase sensitivity as a function of $v_l$ and $v_s$?
  - Mention "higher-order" symmetry point signals?
  - Mention outer well tunneling with $t_"out"$ anywhere?
]

Measuring the (actual/absolute) superlattice phase $phi$ always requires the use of the atom cloud.
The primary goal of the measurement technique is to be strongly sensitive to the superlattice phase.
Due to the (perfect) linearity of the superlattice phase it is sufficient if we can measure one specific phase $phi mod pi slash 2$.
The same measurement at/with the phase shifted by $pi slash 2$ will then give/show us the period and we can infer/interpolate all other phases in between.
In @sec:mod-super (or @fig:mod-super-phase) we already learned that the phase-sensitivity is maximal around the symmetric configuration/phase $phi = 0$.
Since the Wannier functions are computed from the Bloch waves (see @ssec:theory-super-wannier) this sensitivity can also be observed/used when working with localized particles.

For the theoretical description of the phase measurement it is sufficient to regard the superlattice potential as an array if isolated double wells #text(red)[ref theory section].
We are also only using a spin-polarized atom cloud to further simplify the available energy scale(s) to the tunneling amplitude $t$.
(While similar measurements are also possible with half-filled double wells, the added complexity can not justify the (possible) gain in sensitivity.)
Inside/With the double wells we are using the dynamics/time evolution around the phase $phi = 0$ as the measurement tool #text(red)[ref theory double well].
The detuning $Delta prop phi$ results in/creates a signal that is (perfectly) symmetric around $phi = 0$ since the time evolution (only) depends on $abs(Delta)$.
To understand the origin of the (measurement) signal we are only looking at the dynamics/time evoluation inside a single double well for a specific superlattice configuration $(v_l, v_s)$.
In the actual superlattice $v_l$ and $v_s$ are not constant as already discussed/measured in @sec:super-setup (and @sec:mod-super).
Due to the varying (super)lattice depths the tunneling amplitude will (also) be a function of the position $t(x, y)$.
#text(red)[This is discussed in ?]
Besides the tunneling amplitude $t(x, y)$ the phase (or rather detuning) can also vary over the atom cloud $phi(x, y)$.
The primary cause for this inhomogeneity/imperfection is the relative alignment of the individual lattice beams.
(However), compared to the tunneling amplitude $t$ we can actually get the superlattice phase $phi$ to be constant across/over the atom cloud, see #text(red)[ref phase gradient section].

#figure(
  image("/figures/phase-measurement.png", width: 80%),
  caption: [
    Measurement of the superlattice phase $phi$.
    The (three) double wells (potentials) show the detunings/offsets $Delta slash t = [-1, 0, 0.5]$ and/with an initial occupation of the left site.
    With the time $tau$ the occupation of the left site will evolve according to the (corresponding) functions in the second column.
    The axes/figure on the right shows the occupation of the left site at the time $tau_"measure" = 1 slash 4t$ as a function of the detuning/offset $Delta slash t$.

    #show list: set text(red)
    - Show the double well occupation in second quantization (with a blue sphere)?
    - Use $tau = 1 slash 4t$ for the measurement or already the "optimized" time?
    - Show the symmetry point signal for multiple times $tau$?
    - Draw any connection of the wave function to the right site?
  ],
) <fig:phase-measure-theory>

We are first going to look at the theoretical model behind the phase-sensitive signal as illustrated in @fig:phase-measure-theory.
(The (actual) implementation of the measurement in the experiment will be explained later in this section.)
We are initializing/starting the measurement by preparing an atom in the state $phy.ket(psi_0) = phy.ket(L)$ of the double well potential (works equally on the right site with $phy.ket(R)$).
At the phase/detuning $phi = Delta = 0$ this state will be an equal superposition of the (eigen)states $phy.ket(+)$ and $phy.ket(-)$.
The time evolution is caused/governed by the energy gap $epsilon_- - epsilon_+ = 2t$ #text(red)[ref theory/double well and check the signs of $epsilon$].
After the time $tau = 1 slash 4t$ the state has evolved to $phy.ket(psi(tau)) = phy.ket(R)$.
The atom/particle is now located on the right/other site of the double well.
For all phases/detunings $phi = Delta eq.not 0$ the initial superposition will not have an equal amplitude/share of the eigenstates $phy.ket(+)$ and $phy.ket(-)$ and the time evolution will be faster according to #text(red)[ref equation in theory/double well].
Both effects reduce the population of the state $phy.ket(R)$ at time $tau = 1 slash 4t$ regardless of the sign of $Delta$.
The population of the left (right) site will therefore show a minimum (maximum) at the phase $phi = 0$.
By slightly increasing the measuring time $tau$ the width of the signal can be reduced with only a small reduction of the signal amplitude.
Since the oscillation/time evolution at $phi = 0$ is at a minimum (maximum) it will be less sensitive to small changes of the (measurement) time $tau$ than all phases $phi eq.not 0$.
For a strong detuning of $Delta slash t approx plus.minus 2.5$ there are secondary minima visible in the phase-sensitive signal.
Due to their much smaller amplitude compared to the minimum at $Delta = 0$ they do however not affect the measurement.
#text(red)[And we usually are not even able to see them in measurements due to inhomogeneities.]

=== Preparation and detection <ssec:phase-measure-sequence>

#[
  #set text(red)
  - Mention the spin polarization here or at the start of @sec:phase-measure?
  - Immediately mention the actual lattice depths $v_l$ and $v_s$?
  - Use $phi = - pi slash 4$ for the antisymmetric configuration?
  - Flip the sign of $Delta$ in the double well potentials (compared to the dashboards)?
  - Always use $Delta slash t = 0$ instead of $Delta = 0$?
  - Mention that $phi = pi slash 4$ is not actually necessary for a good preparation?
]

To measure the signal as shown in @fig:phase-measure-theory we need to prepare the initial state $phy.ket(L)$ to start the measurement and we need detect the state $phy.ket(psi(tau))$ after the time $tau$.
Our strategy is to prepare the double wells with a strong detuning $abs(Delta) >> t$ such that $phy.ket(L)$ is also the ground state.
We achieve this by initially loading the atoms into the lowest band of the infrared lattice/x1064-lattice.
The x532-lattice is then turned on at the (antisymmetric) superlattice phase $phi = pi slash 4$.
In the context of the superlattice potential the atoms are still (loaded) in(to) the lowest band.
However, in the context of (separated) double well potentials each atom is in the state $phy.ket(L)$ as illustrated in @fig:phase-measure-sequence.
For the initialization of the oscillation/measurement we then have to diabatically/rapidly change/move the (superlattice) phase from $pi slash 4$ to the target detuning/offset $Delta(phi) slash t$ around/near the symmetric configuration $phi = 0$.
The (only) relevant time scale for this change/ramp is the tunneling amplitude $t$ that depends on the lattice depths $v_l$ and $v_s$.
Changing $Delta$ diabatically/rapidly relative to the tunneling amplitude $t$ is important when the eigenstates (start to) become mixtures of the states $phy.ket(L)$ and $phy.ket(R)$ #text(red)[ref theory/double well again?].
As discussed earlier in @sec:phase-measure the equal superposition of the states is achieved/reached at $Delta slash t = 0$ and the width of the avoided crossing (the mixing) is the tunneling amplitude $t$.
We therefore have to make sure that the rate (of change) $dot(Delta)$ is fast (enough) during the preparation/projection around/near the detuning $Delta slash t = 0$.
#text(red)[Actually dive into the details here?]
If the preparation/projection is not be (completely?) diabatic, we would expect significant differences between the measurements for $Delta slash t > 0$ and $Delta slash t < 0$.
In the case of negative detunings/offsets we would get a larger error since the detuning/phase has to go/move across the symmetric configuration $Delta slash t = phi = 0$.
For a (completely) diabatic preparation the final detuning/phase does not matter and we always keep/prepare the state $phy.ket(L)$.
As shown in the second sketch/figure in @fig:phase-measure-sequence the initial density in/on the right well/site is zero.

#figure(
  image("/figures/phase-preparation-and-detection.png", width: 80%),
  caption: [
    State preparation and detection for the measurement of the superlattice phase $phi$.
    The blue lines show the densities at/after the specific steps in the sequence and the black? lines show the energies of the eigenstates.
    For the strong detuning at $phi = pi slash 4$ the densities for the two wells are not connected to indicate that there is no mixture of the states $phy.ket(L)$ and $phy.ket(R)$.
    #text(red)[Use the opposite argument here that the connected line equals a mixture of the states?]

    #show list: set text(red)
    - Mention the lattice depths $v_l$ and $v_s$ that were used for these potentials?
    - Anything else to mention in this caption?
    - Draw zero-density line for right site/well in initial double well.
    - Draw energies of eigenstates? Should be symmetric around the offset of $phy.ket(psi)$ for the two double wells in the middle?
    - Draw coefficients or densities here?
    - Is there any way to show the eigenstates here?
  ],
) <fig:phase-measure-sequence>


In @sec:phase-measure and @fig:phase-measure-theory we (simply) stated that the oscillation/measurement induced by the projection/preparation of the state $phy.ket(L)$ should stop at a specific time $tau$.
We can achieve this with the reverse/inverse detuning/phase ramp/change we used for the preparation of the initial state.
The diabatic condition for the rate (or change) $dot(Delta)$ only depends on the tunneling amplitude $t$ and will work just as well in the other direction.
By/after stopping the measurement/oscillation/time the state $phy.ket(psi(tau))$ is (automatically) projected on(to) the (new) eigenstates $phy.ket(L)$ and $phy.ket(R)$ as indicated by the (finite) densities in both wells after the last step in @fig:phase-measure-sequence.
The last step in the measurement of the superlattice phase $phi$ is the separation/resolution of the individual wells.
See #text(red)[ref next? subsection] for (the) two possible approaches.
