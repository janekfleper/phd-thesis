#import "/header.typ": *

== Interaction measurement/calibration <sec:phase-int>

#[
  #set text(red)
  - Figure out the correct signs for $Delta$, $phi$ etc...
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
Instead of determining the superlattice phase $phi = 0$, we can measure the offset/detuning where $Delta(phi) = - U slash 2$.
This detuning corresponds to the case where the energies of the non-interacting states $phy.ket(L)$ and $phy.ket(R)$ are equal to the interaction energy $U$.
The tunneling of one of the atoms is then equivalent to the tunneling of the atom/particle in a singly-occupied double well at the symmetric phase $phi = 0$.
The timescale of this so-called _density-assisted_ tunneling is the (single-particle) tunneling $t$ since the energy splitting at/of the avoided crossings at $plus.minus Delta = U slash 2$ is (also) $2t$.
Any detuning from this "resonance" condition will (again) result in a faster oscillation frequency.
We can/will therefore measure the phase-sensitive signal developed/introduced in @sec:phase-measure with an offset given by the condition $Delta(phi) = - U slash 2$.

Compared to the calibration technique based on the RF transitions, the phase-sensitive/phase-based technique can directly measure the interaction strength $U$.
If we use the (super)lattice configuration $(v_l, v_s, #text(red)[$v_y$], #text(red)[$v_z$])$ that we are also using for the (later) measurement, the only error in/of the interaction strength will be the change of the confinement due to the finite offset/detuning $Delta$.
For typical lattice configurations and scattering lengths this error is (however) really small.
As an example we will consider the lattice configuration $v_l = #num[40]$, $v_s = #num[14.4]$, $v_y = #num[60]$ and $v_z = #num[100]$.
For a scattering length of $asc = #qty[-500][a0]$, the relative error $epsilon_U = abs((U(phi) - U(0)) / U(0))$ is/would (only) be a little below #qty[1.1][%].
On the repulsive side with $asc = #qty[500][a0]$ this error is even smaller at below #qty[0.6][%].
Considering these small relative errors, we can use the phase-sensitive signal with the density-assisted tunneling to calibrate the (local) interaction energy $U$ without ever computing the interaction energy with @eq:theory-wannier-interaction-correction.
We only need to compute the detuning/offset $Delta(phi)$ as a function of the (measured) superlattice phase $phi(x, y)$ using the BPO formalism #text(red)[@ssec:theory-super-wannier].
As a reference for the measured phase $phi(x, y)$ we can use the zero-phase determined with a (non-interacting) in-situ measurement as shown in @fig:phase-measure-resolve-in-situ-result.
Subtracting the underlying superlattice phase will automatically correct the measurement for any residual phase gradients.

With the calibration/measurement of the local interaction $U(x, y)$, the scattering length #asc could be determined in a further evaluation step.
If we use the calibrated lattice depths from #text(red)[@ch:mod], the scattering length #asc is the only free parameter of the interaction energy.
Since #asc only depends on the magnetic field $B$, it is expected to be constant across the atom cloud.
The inhomogeneity of the interaction $U(x, y)$ is only caused by the inhomogeneity of the lattice depths.
A global fit to determine #asc shows that the inhomogeneity of $U(x, y)$ agrees with/matches the confinement by the lattices.
To estimate the error of the scattering length, we can evaluate the cells individually.
The standard deviation of the invidual scattering lengths can then be used as the error of the entire calibration/measurement.
