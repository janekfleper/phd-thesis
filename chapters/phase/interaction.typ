#import "/header.typ": *

== Interaction measurement/calibration <sec:phase-int>

#[
  #set text(red)
  - Figure out the correct signs for $Delta$, $phi$ etc... Change the sign definition of $phi$ to make all the signs equal?
  - Highlight that initially the DDS frequency is measured? The phase $phi$ is only the final evaluated quantity...
  - Evaluate #asc in each grid individually?
]

So far we have done all measurements in this thesis with spin-polarized atoms that do not interact with each other due to the Pauli exclusion principle.
For calibration measurements this is always/usually easier since a finite interaction energy $U$ introduces an additional energy scale and additional states #text(red)[ref double well theory].
The measurement of the superlattice phase would therefore get (significantly) more complex since there are three eigenstates that would/could be mixed, and there are (usually) two different time scales that show up in the time evolution.
If we (however) want to run experiments with interacting particles in double wells and/or in the superlattice, we also need to know the (local) interaction energy $U$.

While we could just compute the interaction energy $U$ from the scattering length $a(B)$ near the Feshbach resonances #text(red)[ref theory] and the confinement by the optical lattices, it is always better to calibrate the interaction energy at/for the desired/targeted magnetic field configuration.
Before the x-superlattice, the calibration of the interaction energy $U$ was done with RF spectroscopy #text(red)[cite Eugenio/Luke and Marcell/Nicola].
As illustrated in #text(red)[@sec:setup-detect, ref figure instead?], the frequency difference $Delta f$ between non-interacting particles and interacting particles is proportional to the difference $Delta U$ of the interaction energies.
From the Feshbach resonances of the participating hyperfine state pairs we could then determine the magnetic field $B$ and subsequently the scattering length $a(B)$.
Since the RF pulses require frozen in-plane lattices, the actual interaction strength $U$ in the two-dimensional lattice planes was then computed with @eq:theory-wannier-interaction-correction.
With $Delta U slash h = cal(O)(#qty[1][kHz])$ the resolution of this measurement is limited by the stability of the magnetic field (and the width of the RF pulse?).
If the RF pulse that "measures" $Delta U$ is also used for the separation of singles and doubles, there is a also lower limit for the difference $Delta U$.
With a second RF pulse for the separation of singles and doubles, the calibration of the interaction energy also works for $Delta U slash h = 0$ #text(red)[ref Eugenio].
#text(red)[Actually discuss this?]
The downside of this method is the reliance on the theory of the Feshbach resonances.
Depending on the magnetic field and the "participating" hyperfine state pairs, the difference $Delta U$ can be significantly less sensitive than the interactions $U$ themselves (#text(red)[e.g. U97 and U95 at #qty[215][G]]).
The (potential) measurement uncertainty would then be significant/large.
A second source for calibration/measurement errors is the difference in the lattice configurations.
The measurement of $Delta U$ requires completely frozen lattices, but the interaction $U$ is ultimately computed/used in much shallower lattices.
Ideally we would like to calibrate the interaction strength $U$ in a lattice configuration that is equal or very close to the configuration where we are ultimately running our measurements.

In the superlattice potential such a calibration is possible with a technique that is similar to the phase-sensitive measurement @fig:phase-measure-theory.
Instead of determining the superlattice phase $phi = 0$, we can measure the offset/detuning where

$
  2 Delta(phi) = - U
$ <eq:phase-int-condition>

which has already been used extensively in superlattices and double wells #text(red)[ref Trotzky/Fölling and Andrea?].
The tunneling of one of the atoms is then equivalent to the tunneling of the atom/particle in a singly-occupied double well at the symmetric phase $phi = 0$.
This configuration is shown in @fig:phase-int-theory for repulsive interactions as well as attractive interactions.
The timescale of this so-called _density-assisted_ tunneling is the (single-particle) tunneling $t$ since the energy splitting at/of the avoided crossings at $plus.minus 2 Delta = U$ is (also) $2t$.
Any detuning from this "resonance" condition will (again) result in a faster oscillation frequency.
We can/will therefore measure the phase-sensitive signal developed/introduced in @sec:phase-measure with an offset given by the condition $2 Delta(phi) = - U$.
#text(red)[Really put this here? Find the best spot for the next few sentences!]
A look at the double well states that are relevant for the density-assisted tunneling will "confirm" the similarity to the non-interacting tunneling at $phi = 0$.
The atoms are initially prepared in the state $phy.ket(L L)$ at $phi = pi slash 4$ with a large detuning $abs(Delta) >> abs(U), t$.
After the preparation at the detuning $2 Delta approx -U$ the actual oscillation happens between the state $phy.ket(L L)$ and the "singlet" state $phy.ket(s) = 1 / sqrt(2) (phy.ket(L R) + phy.ket(R L))$ #text(red)[ref theory double well].
The superposition of the "split" states captures the fact that either atom can tunnel to the other sublattice site.
In any case, we have to figure out a technique to detect the (local) population of the states $phy.ket(L L)$ and $phy.ket(s)$ after we stop the evolution at the time $tau$ by changing the superlattice phase back to $phi = pi slash 4$.
Due to the interaction energy $U$ between particles on the same sublattice site, we can now actually resolve the in-situ contrast.
With a "regular" singles-doubles separation pulse, the atoms in state $phy.ket(L L)$ will be detected as doubles and the atoms in state $phy.ket(s)$ will be detected as singles.
We are therefore able to measure the population contrast $cal(C)$ locally (or in-situ at least?).
There will however always be a significant offset from $cal(C) = 1$ because of the single-occupied double wells.
Because of the separation of the double wells they do not affect the time evolution of the double-occupied double wells.
For any reasonably sized interaction $U$ they will simply remain in their (initial) state $phy.ket(L)$.
We will however detect half of them (#text(red)[explain this in detail?]) as singles as the state $phy.ket(L)$ (and technically also the state $phy.ket(R)$) have the same RF transition frequency as the singlet state $phy.ket(s)$.

#figure(
  image("/figures/phase-interaction-sketch.png", width: 80%),
  caption: [
    Theory of the calibration of the interaction energy $U$.
    The double well on the left (right) shows the (prepared) state $phy.ket(L L)$ with repulsive (attractive) interactions.
    In both cases the offset/detuning is chosen as $2 Delta = -U$ where one of the particles can tunnel to the unoccupied sublattice site.

    #show list: set text(red)
    - Is there a way to (correctly) visualize this with wavefunctions? Maybe with $phy.ket(L L)$ and the split state?
    - Really show both interaction cases/signs here?
    - Anything else to add to this caption?
    - Show a spectrum here where the points $plus.minus 2 Delta = U$ are marked?
  ],
) <fig:phase-int-theory>

Compared to the calibration technique based on the RF transitions, the phase-sensitive/phase-based technique can directly measure the interaction strength $U$.
There are however two systematic errors that we have to consider.
If we use the (super)lattice configuration $(v_l, v_s, #text(red)[$v_y$], #text(red)[$v_z$])$ that we are also using for the (later) measurement, the interaction strength $U$ will change with the confinement due to the finite offset/detuning $Delta$.
For typical lattice configurations and scattering lengths this error is (however) really small.
As an example we will consider the lattice configuration $v_l = #num[40]$, $v_s = #num[14.4]$, $v_y = #num[60]$ and $v_z = #num[100]$.
For a scattering length of $asc = #qty[-500][a0]$, the relative error $epsilon_U = abs((U(phi) - U(0)) / U(0))$ is/would (only) be a little below #qty[1.1][%].
On the repulsive side with $asc = #qty[500][a0]$ this error is even smaller at below #qty[0.6][%].
The second (possible) error is related to the resonance condition $2 Delta = -U$.
The statement/assumption that the tunneling atom follows/creates the same signal as @fig:phase-measure-theory is only correct for $abs(U) >> t$.
If the interaction is/becomes weaker (relative to the tunneling), the smallest energy gap is no longer located at $2 Delta = U$.
As an example, for $abs(U) = 4t$ the minimal energy gap is located at $#num[1.9] Delta approx U$ (which would constitute an error of #qty[5][%]).
Furthermore, the contribution of the singlet state $phy.ket(s)$ to the (maximally) excited state $phy.ket(psi_4)$ will increase as $abs(U slash t)$ gets smaller.
If three (eigen)states are part of/contributing to the time evolution, there will be two time/energy scales and the oscillation is more complicated than in the non-interacting case.
We therefore have to simulate the expected signals to estimate the correction that we have to apply.

Considering these small relative errors, we can use the phase-sensitive signal with the density-assisted tunneling to calibrate the (local) interaction energy $U$ without ever computing the interaction energy with @eq:theory-wannier-interaction-correction.
We only need to compute the detuning/offset $Delta(phi)$ as a function of the (measured) superlattice phase $phi(x, y)$ using the BPO formalism #text(red)[@ssec:theory-super-wannier].
#text(red)[Explain this better with the DDS frequency maps for the interaction and the zero-phase...]
As a reference for the measured interaction frequency $f_U (x, y)$ we can use the zero-phase frequency $f_0 (x, y)$ determined with a (non-interacting) in-situ measurement as shown in @fig:phase-measure-resolve-in-situ-result.
Subtracting the underlying superlattice phase will (also) automatically correct the measurement for any residual phase gradients.

$
  phi(x, y) = alpha dot (f_U (x, y) - f_0 (x, y))
$ <eq:phase-int-phi>

With the lattice depths $v_l (x, y)$ and $v_s (x, y)$ we can then compute the offset/detuning $Delta(x, y)$ and subsequently the interaction strength $U(x, y)$ with the relation @eq:phase-int-condition.
The result of such a measurement/evaluation is shown in @fig:phase-int-result-maps.
We can see that the phase $phi(x, y)$ changes primarily along the x-axis.
This is caused by the confinement along the z-axis which is provided by the z532-lattice.
Due to the longer lattice spacing (compared to the xy-plane), the confinement along the z-axis is (already) the weakest.
With a waist of (only) #qty[115][μm] the z532-lattice depth also decreases the fastest (or all available lattices).
The "rapid" decrease of the interaction strength $U$ away from the center along the x-axis is therefore expected.

#figure(
  image("/figures/2023-09-28_U_calibration_thesis_map.png", width: 80%),
  caption: [
    Result of the interaction calibration with density-assisted tunneling.
    The lattice depths for this measurement were set to $v_l = 15$ and $v_s = 12$ and the magnetic field was set to $B = #text(red)[???]$.
    The figure on the left shows the measured phase $phi(x, y)$ where the density-assisted tunneling was resonant.
    The resulting offset/detuning $Delta(x, y)$ is shown on the right.
    The mask for both figures is computed based on the density (of doubles) $n(x, y)$.
    The figures only show the cells where $n(x, y) >= 0.1 n_max$ with $n_max$ being the maximal density in the center of the atom cloud.

    #show list: set text(red)
    - Really show $phi$ and $Delta$ here? Maybe $phi$ and $U$ would be better?
    - Mention the magnetic field and the hyperfine states?
    - How/where to include the units for the respective colorbars?
    - Show the expected interaction map somewhere?
    - Show any cuts here to visualize the change along the x-axis?
  ],
) <fig:phase-int-result-maps>

With the calibration/measurement of the local interaction $U(x, y)$, we can determine the scattering length #asc in a further evaluation step.
If we use the calibrated lattice depths from #text(red)[@ch:mod], the scattering length #asc is the only free parameter of the interaction energy.
Since #asc only depends on the magnetic field $B$, it is expected to be constant across the atom cloud.
As discussed earlier in this section, the inhomogeneity of the interaction $U(x, y)$ is only caused by the inhomogeneity of the lattice depths.
A global fit to determine (a scalar) #asc shows that the inhomogeneity of $U(x, y)$ agrees with/matches the confinement by the lattices.
To estimate the error of the scattering length, we can evaluate the cells individually.
The standard deviation of the individual scattering lengths can then be used as an estimated error of the entire calibration/measurement.
#text(red)[Figure out something to finish this section and transition to the Floquet stuff...]
