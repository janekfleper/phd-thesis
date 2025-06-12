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
  - Where to discuss the impact of the y-lattice inhomogeneity?
  - Mention "higher-order" symmetry point signals?
  - Mention outer well tunneling with $t_"out"$ anywhere?
  - Introduce the sequence: Loading -> 1D -> spin-cleaning -> superlattice ...
  - Mention "Rabi oscillations" anywhere?
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


=== Resolving the double well occupation <ssec:phase-measure-resolve>

#[
  #set text(red)
  - Find a better name for the "detection" in the previous section. The actual detection should be reserved for this subsection?
  - Use the name "imaging" for this subsection to separate it from the "detection"?
  - Mention that this subsection is specific to polarized atom clouds?
  - Move the hyperfine state techniques to the outlook? Or clearly mark them as "just a thought"?
  - Where to properly introduce the TOF measurements?
  - Create an additional subsection for the TOF technique?
]

The detection step in @fig:phase-measure-sequence only stopped the (phase-sensitive) measurement to project the state $phy.ket(psi(tau))$ onto the sublattice sites $phy.ket(L)$ and $phy.ket(R)$.
For the (actual) detection/measurement of the state $phy.ket(psi(tau))$ (or the density thereof) we need to capture/measure the densities $n_L = abs(phy.braket(L))^2$ and $n_R = abs(phy.braket(R))^2$.
The spatial separation of #qty[266][nm] between the sublattice sites is far below the resolution limit of the imaging system as discussed in @sec:setup-detect.
We therefore need a technique to make the occupation of the sublattice sites "visible" to the absorption imaging.

The perfect solution would be to transfer the atoms on one sublattice site to a different hyperfine state.
In the vertical superlattice a similar technique is used for the selection of a single plane, see @sec:setup-z.
Instead of a single (HS1) frequency sweep we would however need to use a "comb" of sweeps to address all sublattice sites at the same time.
The magnetic field gradient would need to have the form $phy.pdv(B_z, x)$ since the atoms are only sensitive to the magnetic field along their quantization axis.
Achieving such a magnetic field gradient with the required strength is not possible since anti Helmholtz coils/configurations only produce gradients along the respective magnetic field components (in first/lowest order).
Rotating the quantization axis onto the optical axis of the x-superlattice is not practical either since we do not have a (large) pair of coils in Helmholtz configuration for the offset magnetic field.
Furthermore this technique would require an absolute positional stability of the sublattice sites which is a lot more difficult to achieve than a relative stability of the superlattice phase $phi$, see @sec:phase-sensors.

Another approach using the hyperfine states is based on the spin-spiral technique that was used to detect magnetic correlations in the two-dimensional lattice #text(red)[ref setup section? + Nicola].
Instead of aligning the gradient angle along the diagonal of the x1064-lattice and the y1064-lattice, the magnetic field gradient would be/run parallel to the x1064-lattice.
To start the spin-spiral/Ramsey measurement a $pi slash 2$-pulse is used to transfer (the spin of) all the atoms onto the $x y$-plane.
Since the atoms are initially polarized they will all start with the same phase (in the $x y$-plane).
The evolution/precession/measurement time $tau$ is chosen such that the atoms/spins on each sublattice site accumulate the same phase $phi mod 2 pi$.
The atoms on the "other" sublattice will then have a (relative) phase offset by $pi$.
A second $pi slash 2$-pulse will then transfer the atoms/spins back onto the quantization axis where $n_L$ and $n_R$ will occupy different hyperfine states.
The (separate) densities can then be imaged sequentially as shown in @sec:setup-detect.
While this technique sounds very tempting, it would have been even more difficult to set up than the spin spiral.
For the measurement of the correlations it was sufficient to imprint a relative spin pattern since the absolute position of the atoms/lattice sites was relevant.
The slope and the angle of the magnetic field gradient had to be carefully calibrated but the absolute value of the magnetic field along the $z$-axis could change from sequence to sequence.
In the case of the measurement in the x-superlattice we would need an absolute stability of the magnetic field and the position of the sublattice sites.
Otherwise the spin spiral/Ramsey technique will randomly/uncontrollably map the sublattice sites to the different hyperfine states.
Trying to set this up for the phase-sensitive measurement introduced in @ssec:phase-measure-sequence would not have been practical.

Instead of the two proposed techniques using the hyperfine states we decided/had to use the band structure of the superlattice to reveal/visuallize the sublattice site occupation.
We developed two techniques with different limitations compared to an in-situ measurement of the densities $n_L (x, y)$ and $n_R (x, y)$.
The techniques both make use of the fact that the atoms on the right sublattice site in @fig:phase-measure-sequence occupy/populate the excited band $n >= 2$.
The exact band index $n$ will depend primarily on the long lattice depth since the energy offset $Delta$ is (just) proportional to $v_l$.
If the long lattice depth is big/large enough, the Wannier functions corresponding to the lowest two bands will be located on the left/lower sublattice site.
This leaves the Wannier function of the third on the right/upper sublattice site as shown in @fig:phase-measure-resolve-band-mapping.
The state $phy.ket(R)$ from/in the double well basis will/would therefore be/get mapped/transferred to the Wannier function $w_3(x)$ in the Wannier/Bloch basis.
We can then use the band mapping technique as introduced in #text(red)[ref theory] and mentioned in #text(red)[ref modulation/introduction?] to measure the occupation of the different sublattice sites.
See #text(red)[ref PhD Nick?] for the details.
Since this technique involves the release of the atoms from the lattices the spatial resolution/information is completely lost.
@fig:phase-measure-resolve-tof-imaging shows the time-of-flight images corresponding to the global states $phy.ket(L)$ and $phy.ket(R)$.
From the time-of-flight images we can only count the number of atoms in the first Brillouin zone and in the higher Brillouin zone(s) to get the averaged/global population $n_L$ and $n_R$.
Neither the inhomogeneity of the tunneling amplitude $t$ due to the varying lattice depths $v_l (x, y)$ and $v_s (x, y)$ nor the (possible) inhomogeneity of the phase $phi(x, y)$ are (directly) observable.
If we want to (quantitatively) evaluate time-of-flight data, we always have to use another measurement for the (intrinsic/system) inhomogeneities and plug them into the theory.
This approach was used (extensively) for the data evaluation of the Floquet-driving measurements #text(red)[ref Floquet section].
We can (easily) get the lattice depths $v_l (x, y)$ and $v_s (x, y)$ from the in-situ lattice modulation measurement as introduced in @ch:mod #text(red)[ref a specific section here?].
The local measurement of the phase $phi(x, y)$ will be shown in #text(red)[ref next subsection?].

#figure(
  image("/figures/phase-measure-resolve-band-structure.png"),
  caption: [
    Band structure at $v_l = 40$, $v_s = 15$ and $phi = pi slash 4$.
    The bands up to $n = 6$ are shown with their corresponding widths.
    Since none of the bands are close/coupled for this lattice configuration, the BPO formalism is not required for the Wannier functions.
    The two Wannier functions $w_1(x)$ and $w_3(x)$ are computed directly/naively from the Bloch waves.

    #show list: set text(red)
    - Only show the band structure with the same x limits as @fig:phase-measure-sequence.
    - Add the band mapping/TOF sketch here
    - Turn off the Wannier function of band $n = 2$

  ],
) <fig:phase-measure-resolve-band-mapping>

For a superlattice configuration such as $v_l = 15$ and $v_s = 10$, the right/upper sublattice site will (only) be mapped to the second band.
Since the states $phy.ket(L)$ and $phy.ket(R)$ are localized on/to the sublattice sites, they will span the entire momentum space $q = [-a, a)$ in the Bloch wave basis.
In a time-of-flight measurement the atoms/populations $n_L$ and $n_R$ would therefore have no spatial/visual separation.
This would not be an issue for a (proper) time-of-flight measurement where $tau_"TOF"$ is sufficiently long to lose any information about the initial shape of the cloud.
Since this is not possible with our z-imaging setup, the atoms corresponding to the first and the second Brillouin zone will show some overlap.
We therefore decided to (always) use the third (and the fourth) band to achieve a clear spatial/visual separation as shown in @fig:phase-measure-resolve-tof-imaging.
The transfer/projection from the second (energy) band to those (energy) bands is also possible after the freezing/detection step in @fig:phase-measure-sequence.
If the superlattice is frozen, we can map/transfer the state $phy.ket(R)$ to a higher band by diabatically increasing the depth of the x1064-lattice.
The freezing/ramping timescale of the x1064-lattice is $<#qty[1][ms]$ which is sufficiently fast for all superlattice configurations discussed in this thesis.

#figure(
  rect(stroke: black),
  caption: [
    Time-of-flight measurement of the sublattice site occupation.
    The image on the left shows an initial state of $phy.ket(L)$ where all atoms end up in the first Brillouin zone.
    On the right the atoms were prepared in the state $phy.ket(R)$ and then mapped/transferred to the third (and fourth) band.
    The grid overlay shows the Brillouin zones for the pixel size in the atom plane and the time $tau_"TOF"$.

    #show list: set text(red)
    - Mention the contrasts corresponding to the images here?
  ],
) <fig:phase-measure-resolve-tof-imaging>

From the measured/averaged atom numbers $n_L$ and $n_R$ we then compute the contrast

$
  cal(C) = (n_L - n_R) / (n_L + n_R)
$ <eq:phase-measure-resolve-contrast>

to quantify the (global) population imbalance between the sublattice sites.
Since the populations $n_L$ and $n_R$ are closely related (in most cases) it makes sense to join them in a single quantity.
By design/definition the contrast $cal(C)$ is largely/very insensitive to fluctuations of the total atom number.
In isolated double wells we can use this to our advantage without any downsides.
Empty double wells will reduce the atom numbers $n_L$ and $n_R$ but they will not show up in the contrast $cal(C)$.
In a continuous superlattice, on the other hand, (initially) empty double wells will affect the rest of the system and we cannot just measure the contrast $cal(C)$ without considering the total atom number/filling.

#text(red)[Actually argue so much why we are only using a Gaussian function for the evaluation here?]
With the time-of-flight detection/imaging we can then measure the phase-sensitive signal introduced in @fig:phase-measure-theory.
By scanning the superlattice phase $phi$ that starts the measurement at $tau = 0$ we sweep across the symmetric configuration $phi = Delta slash t = 0$.
The resulting signal is shown on the left in @fig:phase-measure-resolve-tof-result.
For the evaluation of the phase-sensitive signal we are extracting the position of the minimum with a regular Gaussian function.
Since the only purpose of the measurement is to find the DDS frequency #text(red)[ref @sec:phase-setup] corresponding to the (globally averaged) symmetric configuration $phi = Delta slash t = 0$, the specific shape of the signal is not important.
This would require us to take the spatial variation of $v_l (x, y)$, $v_s (x, y)$ and the phase $phi(x, y)$ itself into account.
#text(red)[Mention this way earlier in this section/chapter!]
In addition the local detuning $Delta(x, y)$ is also affected by the confinement of the y1064-lattice $v_"y1064" (x, y)$.
While we know the lattice depths as a function of the position $(x, y)$, the phase $phi(x, y)$ requires a phase-sensitive measurement itself.
The technique to measure the phase $phi(x, y)$ with in-situ resolution will be introduced in the #text(red)[next subsection].
If we take all this into account to evaluate the data of the phase-sensitive measurement, the resulting DDS frequency $f_0$ would be exactly the same as from the simple evaluation using the Gaussian function.

#figure(
  image("/figures/phase-measure-resolve-tof-result.png", width: 90%),
  caption: [
    Time-of-flight measurement of the symmetric superlattice configuration.
    The figure on the left shows the phase-sensitive measurement from which we can extract the phase $phi = 0$.
    The x-axis is already converted to the superlattice phase $phi$ based on the (expected) period #text(red)[ref eq].
    The figure on the right then shows the same sequence/measurement as a function of the time $tau$ at the phase $phi = 0$.
    In both measurements the lattice depths were set to #text(red)[$v_l = ??$] and #text(red)[$v_s = ??$] with a theoretical tunneling amplitude of #text(red)[$t = ??$].

    #show list: set text(red)
    - Split this into two figures? If so, show the atom numbers $n_L$ and $n_R$ next to the contrast?
    - Mark point that is "shared" between the two plots?
    - Use the frequency RFFreqXOffHigh as the x-axis in the left figure?
    - Show the fit of the symmetry point here?
    - And show the fit of the Rabi oscillation as well?
    - Show the theoretical oscillation here? Not the fit but just the calculated (averaged) oscillation from $v_l (x, y)$, $v_s (x, y)$ etc...
  ],
) <fig:phase-measure-resolve-tof-result>

For the oscillation signal in the symmetric superlattice (configuration) the aforementioned inhomogeneities are all relevant since the target quantity is the tunneling amplitude $t$ (in the center of the cloud).
By measuring the average of the (Rabi) oscillations across all (occupied) double wells in the superlattice the resulting frequency will be a weighted average of all tunneling amplitudes $t(x, y)$ and detunings/offsets $Delta(x, y)$.
The corresponding (time-of-flight) signal is shown on the right in @fig:phase-measure-resolve-tof-result.
We can see that the oscillation decays significantly in the first few periods.
#text(red)[Can we compute the theory for this? Add a specific explanation why the tunneling amplitude increases with the distance from the optical axis.]
The leading contribution to this decay is the spatial variation of the tunneling amplitude $t(x, y)$ itself.
On the optical axis of the x-lattices the tunneling amplitude $t$ is always minimal (#text(red)[at least for the given waists of the x-lattices]).
Towards either side of the optical axis the tunneling amplitude $t$ will increase significantly.
This increase is caused by the decrease of the amplitude/depth $v_s$ of the short/x532 lattice.
The lower amplitude/depth $v_l$ of the long/x1064 lattice will decrease the tunneling amplitude $t$ again, but the scaling is "weaker" than for the short/x532 lattice.
In addition, any detuning/offset $Delta slash t != 0$ will cause a further increase of the oscillation frequency.
The (globally) averaged frequency will therefore always be greater than the expected frequency from the tunneling amplitude $t$ in the center of the atom cloud/the lattices.
#text(red)[Add evaluation of the Rabi oscillation here and compare the tunneling amplitude to the value obtained by $v_l$ and $v_s$.]


=== In-situ measurement technique <ssec:phase-measure-in-situ>

#[
  #set text(red)
  - Discuss the in-situ signal via lattice modulation? Maybe in the outlook?
  - Mention the preparation and oscillation here again? Or just ref the earlier stuff?
  - Discuss error due to the y1064 lattice confinement?
]

The (only/large) disadvantage of the time-of-flight measurement is the lack of spatial resolution.
A quantitative evaluation of time-of-flight data is only possible after further/other measurements to determine all inhomogeneities.
We therefore developed a second technique to locally resolve the superlattice phase $phi$ by removing the atoms on the right/upper sublattice site.
Instead of measuring the contrast @eq:phase-measure-resolve-contrast we can therefore only measure the occupation of the left/lower/remaining sublattice site.
As discussed earlier in @ssec:phase-measure-resolve this makes the data sensitive to fluctuations of the atom number.
We therefore have to ensure a constant/stable atom number for the duration of the measurement (or we have to measure a sufficient amount of averages).
This in-situ technique is based on an/the (empirical) observation of an atom loss after the freezing of the long/x1064 lattice to project the atoms on the right/upper sublattice site from the band $n = 2$ to a(n even) higher band.
Our understanding of the technique is that the final state after this projection has a contribution from higher bands in the y1064 lattice.
The mixing is enabled by the non-orthogonality of the x-lattices and the y1064 lattice which is discussed in detail in @sec:mod-coupled and #text(red)[ref appendix?].
If the atoms (partially) populate higher bands in the y1064 lattice, they are no longer frozen along the y-axis.
Since these atoms are (also) localized on the upper/right sublattice sites, they will experience the deconfining radial potential @eq:super-radial-minus by the superlattice as discussed in @sec:super-radial.
To optimize the loss of atoms we found that the depth of the y1064 should be as low as possible without compromising the freezing of the tunneling in the lowest band as discussed at the start of @ch:phase #text(red)[check this reference...].
We therefore chose $v_y = 20$ where the tunneling amplitude in the lowest band is $tau slash h approx #qty[10][Hz]$ #text(red)[check this value again...].
After the projection we then wait #qty[1][s] for the atoms to leave the trap.

#figure(
  grid(
    columns: 2,
    column-gutter: 1em,
    image("/figures/phase-measure-resolve-in-situ-initial.png"),
    image("/figures/phase-measure-resolve-in-situ-final.png"),
  ),
  caption: [
    Projection for the in-situ measurement of the superlattice phase.
    The figure on the left shows the superlattice configuration $(v_l, v_s) = (15, 12)$ and the phase $phi = pi slash 4$.
    On the right the long/x1064 lattice is frozen/ramped up to the depth $v_l = 55$.

    #show list: set text(red)
    - Share the y-axis here? Or does this make the explanation worse since the right/upper well is actually not affected by the freezing of the long lattice?
    - Draw the Wannier functions for $phy.ket(L)$ and $phy.ket(R)$.
    - Use the BPO Wannier function for the figure on the right? Or use an amplitude where the two bands are not actually mixed?
    - Anything to add to this caption?
  ],
) <fig:phase-measure-resolve-in-situ-theory>

The (actual) measurement before the projection onto the higher bands in the y1064 lattice is identical to the time-of-flight technique presented earlier #text(red)[ref anything?].
The (in-situ) image of the occupation $n_L (x, y)$ will therefore show the signal @fig:phase-measure-theory depending on the local detuning/offset $Delta(x, y) slash t(x, y)$.
Due to the noise in the absorption images it is not practical to evaluate individual pixels.
We are therefore dividing the atom images into a grid of $9 times 9$ pixels.
With the pixel size of $approx #qty[600][nm]$ (see @sec:setup-detect) the atom plane each cell corresponds to approximately $10 times 10$ double wells (#text(red)[check the exact pixel size again...]).
The average (atomic) density in each cell of the grid is then evaluated individually by fitting a Gaussian function to find the minimum that shows the detuning/offset $Delta slash t = 0$.
As already discussed earlier for the time-of-flight measurement, this qualitative evaluation is sufficient since we only need to know the position of the minimum of the density.
#text(red)[Actually mention the next sentence?]
If we would reverse the detection/imaging by removing the atoms on the left/lower sublattice site, the signal would show a maximum of the (local) occupation $n_R (x, y)$ instead.
From the evaluation of the individual cells we then get the zero-phase $phi = 0$ (or the detuning/offset $Delta slash t = 0$) as a function of the position $(x, y)$.

A typical result we obtain from this measurement is shown in @fig:phase-measure-resolve-in-situ-result.
The two individual signals from the marked cells show a (significant) frequency shift.
Across the entire atom cloud this shift shows up as a gradient of the symmetric configuration.
This is caused by an angle between the wavefronts of the x1064 lattice and the x532 as already discussed in @sec:super-setup (#text(red)[Where is the x532-plate mentioned first?]).
We can see a few outliers of the averaged density $n_L$ in the individual signals.
Their distance to the expected/fitted signal is however small enough to not (strongly) affect the (local) measurement of the symmetric configuration.
The difference of the baselines is caused by the varying density (envelope) of the atom cloud.
Since the cells are evaluated individually, we do not have to take this envelope into account as we did for the in-situ lattice modulation measurements in @ch:mod #text(red)[ref a section here instead?].
The next step in the evaluation of the map in @fig:phase-measure-resolve-in-situ-result is to fit a first-order polynomial to extract the gradient of the phase perpendicular to the optical axis of the x-lattices.
The polynomial can be rotated in the $x y$-plane to take the angle $theta.alt$ of the x-lattices into account.
This follows the (same) idea behind the evaluation of the in-situ lattice modulation measurements, see @sec:mod-eval.
The parameters resulting from the fit of the polynomial function are

$
  k &= #qty[0.033(3)][MHz / px] \
  theta.alt &= (#num[-5.9(6)])degree \
$ <eq:phase-measure-resolve-in-situ-result>

with the reference angle of #text(red)[grab the correct value here] from the in-situ lattice modulation measurements.
#text(red)[Where to metion that these results are averaged over 8 measurements?]

#figure(
  image("/figures/2024-12-12_symmetry_period_in-situ_result.png"),
  caption: [
    Phase-sensitive measurement with in-situ/spatial resolution.
    The superlattice configuration for the data taken here was $(v_l, v_s) = (40, 14.4)$.
    The first two axes show the local signals of the occupation $n_L$ in two different cells as a function of the DDS frequency.
    The axes on the right shows the zero-phase/zero-offset extracted from the Gaussian fits across the atom cloud.
    The marked squares show the cells corresponding to the signals shown in the first two axes.

    #show list: set text(red)
    - Use the cell coordinates for the pcolormesh?
    - Also mention the coordinates of the marked cells?
    - Do not show the orange lines!
    - Add y-label for the occupation $n_L$
    - Anything to add here?
    - Mention the tunneling amplitude $t$ given the lattice depths?
    - Address different widths of individual signals?
    - Use different data here, something around #qty[415][MHz]?
  ],
) <fig:phase-measure-resolve-in-situ-result>


==== Horizontal gradient <sssec:phase-measure-resolve-horizontal>

#[
  #set text(red)
  - Merge this with the sub-sub-section @sssec:phase-measure-resolve-vertical?
  - Mention that it does not matter which lattice is shifted!
  - Put the technical details in @sec:super-setup.
  - Find a nice introduction/explanation for the two different angles/axes.
]

To change the angle between the x1064 lattice and the x532 lattice we are using two #qty[10][mm] thick glass plates#footnote[#text(red)[Mention the exact part number from Eksma]] in the optical path of the x532 lattice.
A rotation of the glass plates will displace/shift the x532 lattice beam perpendicular to the optical axis.
The first glass plate is mounted in a piezo mirror mount#footnote(link("https://www.newport.com/p/AG-M100L", [Newport Agilis™ AG-M100L])) with a range of $plus.minus #num[2]degree$ for each axis.
This mirror mount offers absolute positioning with an accuracy of $#num[0.05]degree$ by using limit switches as reference points.
We can control the position of either axis of the mirror mount with the experiment control software to scan the "horizontal" shift and the "vertical" shift of the x532 lattice beam.// relative to the x1064 lattice beam.
The second glass plate is mounted in a mechanical mirror mount to apply a static displacement of the x532 lattice beam.

#text(red)[Evaluate the mean angle $theta.alt$ here again?]
For most/regular measurements in the superlattice we would like to have a homogeneous phase $phi$ across the atom cloud.
We are therefore scanning the "horizontal" axis of the glass plate to find the angle where the "in-plane" phase gradient vanishes.
For each angle of the "horizontal" axis we will run the measurement as shown in @fig:phase-measure-resolve-in-situ-result and evaluate the strength of the gradient.
The result of this measurement/evaluation is shown in @fig:phase-measure-resolve-horizontal-gradient.
We can see that the extracted gradients line up nicely as a function of the horizontal angle of the glass plate.
The solid line shows the expected gradients computed from the optical properties of the glass plate, the focal length of the (forward) 2 inch lens and the pixel size in the atom plane (#text(red)[ref equation for displacement by the glass plate?]).
The offset of the solid/theory line is chosen to get the best possible match to/with the data points.
Only the slope of the solid/theory line has an actual meaning.
The two maps on the right (clearly) show the difference between a finite phase gradient and the optimized horizontal angle.
In the upper area of the mask around the atom cloud there are quite a few cells missing.
This was caused by the local phase/frequency being outside of the frequency interval (#text(red)[Mention the actual interval?]).
The lower map in @fig:phase-measure-resolve-horizontal-gradient shows the optimized horizontal angle where the phase gradient is significantly suppressed.
The residual phase inhomogeneity is #text(red)[compute this with a mask or just from the shown cells?]
With the absolute positioning this is the best gradient cancellation we can achieve.
The x errorbars of the two data points close to the zero-gradient are already overlapping, we would therefore have to rely on the additional relative positioning of the piezo mirror mount.
This does however rule out the determination/interpolation of the zero-crossing of the gradient from the surrounding angles/positions.
If we would require a more homogeneous phase map as achieved/shown in @fig:phase-measure-resolve-horizontal-gradient, we would need to find a more sensitive measurement.
The easiest solution there would be to use a superlattice configuration $(v_l, v_s)$ where the offset/detuning $Delta slash t$ is (even) more sensitive to the superlattice phase $phi$.

#figure(
  image("/figures/2024-11-04_symmetry_gradient_thesis_result.png", width: 70%),
  caption: [
    Optimization of the horizontal phase gradient.
    The superlattice configuration for the data taken here was $(v_l, v_s) = (40, 14.4)$.
    The errorbars along the x-axis indicate the accuracy of $#num[0.05]degree$ of the absolute position of the piezo mirror mount.
    Each white cell in the maps on the right was either exluded by the initial mask around the atom cloud or the fit was not successful.

    #show list: set text(red)
    - y-label should be the gradient with some rescaling?
    - x-label should be the angle of the x532-plate
    - Anything else to write here?
    - Add lines to the markers corresponding to the images on the right.
    - Increase size of atom images.
    - Chooses tighter range for the colorbar of the images?
    - Mask pixels with large errors in the images?
    - Compute homogeneity (standard deviation) in the optimized cloud?
  ],
) <fig:phase-measure-resolve-horizontal-gradient>


==== Vertical gradient <sssec:phase-measure-resolve-vertical>

Finding the angle where the "vertical" phase gradient vanishes is less straight forward since the images taken with the z-camera show the accumulated optical density of all layers of the $z$-lattice.
We therefore have to rely on a measurement of the signal strength similar to the lattice alignment in @sec:mod-align #text(red)[Also reference @fig:mod-align-x1064-walking?].
If we apply a horizontal gradient on purpose, the phase-sensitive measurement will show the signal @fig:phase-measure-theory as a function of the position.
This will show up as a single line in the atom cloud similar to the resonance lines from/in @ch:mod (#text(red)[ref a specific section here?]).
From the contrast/strength of the line/signal we can then infer the "vertical" angle where the phase is equal in all planes along the $z$-lattice.
The result of this measurement is shown in @fig:phase-measure-resolve-vertical-gradient.
In the atom images we can see the "resonance" lines/signals where the local phase is $phi = 0$ on average across all vertical lattice planes.
If the local phase $phi = 0$ is reached at the same position in all (vertical) lattice planes, the line/signal strenght will be maximal.
The optical density images are evaluated with a two-dimensional Gaussian envelope and a one-dimensional Gaussian function that models the phase-sensitive signal.
The line/signal strength is then defined as the quotient of the line amplitude and the line width/standard deviation.
In @fig:phase-measure-resolve-vertical-gradient we can see that the optimum is achieved at the angle #text(red)[#num[350] (put the actual angle here...)].
Overall the signal here is less sensitive than the optimization of the horizontal gradient in @fig:phase-measure-resolve-horizontal-gradient, which is a direct cause of the aspect ratio of the atom cloud.
In the $x y$-plane the atoms often span up to #qty[100][μm] whereas the (individual) planes in the $z$-lattice are only spread over $approx #qty[10][μm]$.
It is nevertheless important to cancel the vertical gradient if we are running a measurement across/with all lattice planes.
After the optimization of the vertical angle we can move the horizontal axis/angle back to the optimum from @fig:phase-measure-resolve-horizontal-gradient.
Thanks to the absolute positioning capabilities of the piezo mirror mount, we can reliably/quickly apply and cancel a specific horizontal (or vertical) gradient.

#figure(
  image("/figures/2024-11-05_symmetry_vertical_gradient_thesis_result.png", width: 70%),
  caption: [
    Optimization of the vertical phase gradient.
    The horizontal phase gradient was set to $approx #qty[0.1][MHz/px]$ to get a narrow line in the optimized case.

    #show list: set text(red)
    - Use the actual angle here on the x-axis.
    - Add lines from the markers to the optical densities.
    - Change the evaluation to Lorentzian functions?
    - Normalize the line/signal strength to 1.0?
    - Anything to add to this caption?
    - Add colorbar for the images...
    - Add x errorbars to take the $#num[0.05]degree$ into account?
  ],
) <fig:phase-measure-resolve-vertical-gradient>
