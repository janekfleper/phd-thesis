#import "/header.typ": *

== Measuring the phase <sec:phase-measure>

#notes[
  - Is there a way to measure the phase of a standing-wave optical lattice with a camera?
  - How to reference the measurement of changes in @sec:phase-sensors?
  - Add any comparison to the phase-sensitivity of the superlattice amplitude modulation technique?
  - Where to discuss the inhomogeneity of $v_l$ and $v_s$ for the symmetry point?
  - Where to introduce phase sensitivity as a function of $v_l$ and $v_s$?
  - Where to discuss the impact of the y-lattice inhomogeneity?
  - Mention "higher-order" symmetry point signals?
  - Mention outer well tunneling with $t_"out"$ anywhere? Highlight insensitivity of the phase measurement at the first minimum of the oscillation?
  - Mention "Rabi oscillations" anywhere?
  - Mention that most measurements are done with a spin-polarized atom cloud?
]

#tr[Find a nice(r) sentence as the introduction to the section...]
The measurement of the superlattice phase $phi$ can only be conducted with the atom cloud.
Unlike for the lattice depth, there is no technique available to observe the phase of a standing-wave optical lattice with a camera or a photodiode.
We therefore developed a measurement technique where the band structure is strongly sensitive to the superlattice phase $phi$.
In @sec:mod-super we found the minimal sensitivity to the superlattice phase at the antisymmetric configuration $phi = pi slash 4$.
Correspondingly, the symmetric configuration $phi = 0$ shows the maximal sensitivity.
As introduced in @sec:phase-setup, we tune the superlattice phase $phi$ with the DDS frequency #fdds.
While this does not include the frequency changes applied by the AOMs in @fig:phase-setup, it is sufficient to calibrate $phi$ as a function of #fdds.
The AOMs only add a frequency offset and we can take any deviations from their center frequencies manually into account.
According to @eq:phase-setup-delta-phi, the superlattice phase is perfectly linear in the frequency detuning $Delta nu$ and we only need to find the DDS frequency where the phase is $phi = 0$.
In practice, the superlattice phase $phi = 0$ is not uniquely defined since the band structure is $pi slash 2$ periodic.
With the DDS frequency, we can therefore find the symmetric configuration approximately every #qty[150][MHz].
In @sssec:phase-measure-resolve-period, we determine the exact periodicity of the DDS frequency.
This allows us to precisely compute any superlattice phase $phi(fdds)$.

For the phase measurement, we are using the superlattice potential as an array of isolated double wells.
This allows a robust preparation of the initial state and a simple interpretation of the detected occupation at the end of the measurement.
Furthermore, we are using a spin-polarized atom cloud where each double well is occupied by one atom at most.
For the preparation and loading of the atoms into the optical lattices, we are using the regular sequence shown in @fig:setup-sequence.
To polarize the atom cloud, we apply an imaging pulse to remove all atoms in the state #mF(9) just before the #tr[experimental] segment.
For the imaging pulse, the atoms in the state #mF(7) are temporarily transferred to the state #mF(5) to reduce the loss of atoms.
With the spin-polarized atom cloud, the detection is simplified significantly since we can directly detect the remaining atoms in the first image.

#floating-figure(
  image("figures/phase_symmetry_signal.png", width: 80%),
  caption: [
    Measurement of the superlattice phase $phi$.
    The three configurations *a* to *c* show the energy offsets $Delta slash t = -1, 0 "and" 0.5$ respectively #tr[with the corresponding double-well potential and the time evolution of the initial state #ketL.]
    In the two cases where $Delta slash t != 0$, the oscillation is faster and the amplitude is smaller compared to the time evolution at $Delta slash t = 0$.
    At the fixed time $tau_0 = #qty[0.25][_h_ / _t_]$ indicated by the vertical dashed lines, the occupation of the #tr[left/initial] site therefore varies significantly.
    In *d*, the resulting occupation at time $tau_0$ is shown as a function of $Delta slash t$.
    The local minima at $Delta slash t approx plus.minus 2.6$ occur when the second minimum of the oscillations occurs at the measurement time.

    #notes[
      - Show the double well occupation in second quantization (with a blue sphere)?
      - Reduce the amplitude/size of the initial states?
      - Draw any connection of the wave functions to the right site?
      - Add markers/lines in *d* to show the configurations *a*, *b* and *c*...
      - Find a good position for the abc indices in *a*, *b* and *c*...
      - Move *a*, *b* and *c* to the right... And add inset indicators/zooms
      - Add the value of $Delta slash t$ to each double-well potential
      - Where to mention first that we scan the frequency #fdds?
    ]
  ],
  label: <fig:phase-measure-theory>,
)

As discussed in @ssec:theory-double-one, the eigenstates of a single particle in the double-well potential only depend on $Delta slash t$.
In the symmetric configuration $Delta slash t = phi = 0$, the two eigenstates are equal mixtures of the localized states #ketL and #ketR, and the gap between the eigenenergies is $2t$.
Therefore, if we prepare the initial state #ketL, the atoms undergo a coherent Rabi oscillation between the two sites.
According to @eq:theory-double-one-rabi-parameters, the oscillation frequency is minimal at $Delta slash t = 0$ while the oscillation amplitude is maximal at $Delta slash t = 0$.
Since both parameters of the oscillation only depend on $abs(Delta) slash t$, we can find a symmetric signal around $Delta slash t = phi = 0$.
In @fig:phase-measure-theory, the origin of the signal is illustrated for a few offsets $Delta slash t$.
At the first minimum of the time evoluation of the symmetric configuration in #subref(<fig:phase-measure-theory>, "b"), the occupation $n_L$ is zero.
For any offset $abs(Delta) slash t > 0$, the occupation of $n_L$ at the same measurement time is greater than zero.
The strong sensitivity of the signal in #subref(<fig:phase-measure-theory>, "d") is a result of the two oscillation parameters both contributing to an increase of the occupation $n_L$ at the time $tau_0$.

In the experimental setup, the tunneling amplitude $t(x, y)$ varies across the atom cloud due to the inhomogeneity of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
The ideal measurement time therefore changes as a function of the position in the atom cloud.
We can nevertheless use the phase-sensitive signal since it is robust to small variations of the measurement time.
The symmetry of the signal is a consequence of the symmetry of the double-well eigenstates in @fig:theory-double-one.
A variation of the tunneling amplitude only slightly changes the shape of the signal, which does not affect the identification of the symmetric configuration $Delta slash t = phi = 0$.
Besides the tunneling amplitude, the superlattice phase itself can also change across the atom cloud.
If the wavefronts of the #x1064 lattice and the #x532 lattice are not parallel, we can observe a horizontal and a vertical phase gradient when measuring the symmetric configuration $phi = 0$.
#tr[ref the gradient sections...]


=== State initialization and projection <ssec:phase-measure-sequence>

#notes[
  - (Immediately) mention the actual lattice depths $v_l$ and $v_s$?
  - Use $phi = - pi slash 4$ for the antisymmetric configuration?
  - Flip the sign of $Delta$ in the double well potentials (compared to the dashboards)?
  - Always use $Delta slash t = 0$ instead of $Delta = 0$?
  - Really use the unit #unit[rad/ms] here for the ramp rates $dot(phi)$?
  - Use the term "quench" anywhere?
]

To measure the signal shown in #subref(<fig:phase-measure-theory>, "d"), we need to prepare the initial state #ketL and detect the state $phy.ket(psi(tau))$ after the time $tau_0$.
For the preparation, we are using a large offset $abs(Delta) >> t$ where the ground state in the double well is equal to #ketL.
We achieve this by initially loading the atoms into the lowest band of the #x1064 lattice.
The #x532 lattice is turned on adiabatically at the antisymmetric phase $phi = pi slash 4$ to keep the atoms in the lowest band of the superlattice potential.
As shown in @fig:phase-measure-sequence, the atoms are located on the left site in each unit cell, which corresponds to the state #ketL in the double-well potential.
For the initialization of the Rabi oscillation in each double well, we diabatically change the superlattice phase from $pi slash 4$ to the target phase that realizes the detuning $Delta(phi)$.
The relevant energy scale for the phase ramp is the energy gap $2t$ of the avoided crossing at $Delta slash t = 0$ (see #subref(<fig:theory-double-one>, "b")).
If the rate of change $dot(Delta)$ is too small, the atoms remain in the ground state which would reduce or completely disable the oscillation.
The diabatic preparation is therefore essential to conserve the initial state #ketL at any offset $Delta slash t$.
After the oscillation time $tau_0$, we need to stop the oscillation to freeze the current state $phy.ket(psi(tau))$.
We can achieve this with the phase ramp back to $phi = pi slash 4$ to project the final state onto the states #ketL and #ketR.
This phase ramp also needs to be diabatic to conserve the composition of the final state.

#floating-figure(
  image("figures/phase_preparation_and_projection.png", width: 100%),
  caption: [
    State initialization and projection for the phase measurement.
    Initially, only the left well is occupied by loading the superlattice at the antisymmetric phase $phi = pi slash 4$.
    After the initialization at the offset $Delta$, the two sites are connected by the tunneling as the eigenstates are delocalized.
    During the time evolution, the atom oscillates between the left and the right site with the parameters in @eq:theory-double-one-rabi-parameters.
    To stop the oscillation after the time $tau_0$, we use a diabatic phase ramp back to $phi = pi slash 4$ to project the state $phy.ket(psi(tau = tau_0))$ onto the states #ketL and #ketR.

    #notes[
      - Mention the lattice depths $v_l$ and $v_s$ that were used for these potentials?
      - Anything else to mention in this caption?
      - Draw energies of eigenstates? Should be symmetric around the offset of $phy.ket(psi)$ for the two double wells in the middle?
      - Really use $tau_0$ here instead of $tau$?
      - Add a plot/sketch of the superlattice phase $phi(tau)$ here?
      - Add *abc* here? Or make it I, II, III and IV?
    ]
  ],
  label: <fig:phase-measure-sequence>,
)

When we use the phase $phi = pi slash 4$ for the initial loading of the atoms, we need to increase the DDS frequency by approximately #qty[75][MHz] to reach the target phase around $phi = 0$.
For the projection, we use the identical phase ramp back to the antisymmetric configuration $phi = pi slash 4$.
While we can change the DDS frequency arbitrarily on nanosecond timescales, the rate of change of the superlattice phase is limited by the phase locked loop.
If we use the arbitrary waveform generator to add the auxiliary voltage signal to the output of the slow PID regulator#footnote[
  Without the auxiliary signal, the rate of change is even lower. #tr[Actually add a value here?]
] (see @fig:phase-setup), the maximum rate of change is $dot(phi) approx pi slash 2 #h(0.2em) #unit[rad/ms]$.
With the double-pass AOM, we can achieves rates up to $dot(phi) approx #qty[0.1][rad/μs]$ which is an improvement by a factor of more than $60$ compared to the DDS frequency and the phase locked loop.
The limitation when using the double-pass AOM is the maximum frequency detuning of #qty[20][MHz] which corresponds to the phase detuning $pi slash 15$.
While this range is too small to achieve the phase ramp $pi slash 4 -> 0$, it is generally sufficient for the initialization and projection of the states for the phase measurement.
According to the composition of the ground state in #subref(<fig:theory-double-one>, "c"), we can already neglect the mixture of the states #ketL and #ketR at $abs(Delta) slash t = 5$, which typically corresponds to the phase $phi approx pi slash 100$.
As soon as the ground state is equal to #ketL, there is no advantage in moving all the way to the antisymmetric phase $phi = pi slash 4$ for the state initialization and the projection onto the sites #ketL and #ketR.
However, the antisymmetric configuration can be required for the detection of the final state.
In that case we can use the two phase ramps #box[$pi slash 4 attach(-->, t: "DDS") pi slash 15 attach(-->, t: "AOM") 0$] to cover the entire phase range.
During the first phase ramp, the rate of change can be slower since the double-well potential is far detuned from $Delta slash t = 0$.
Only the rate of change during the second phase ramp is relevant for the initialization and projection in @fig:phase-measure-sequence.


=== In-situ detection of the double-well occupation <ssec:phase-measure-detect>

#notes[
  - Use "population" instead of "occupation"? Or really mix them?
  - Really introduce the contrast $cal(C)$ here?
  - Discuss error due to the y1064 lattice confinement?
  - Already mention the alternative technique from Chalopin (2024) here?
  - Use "upper" and "lower" instead of "right" and "left" everywhere? Or at least explain that this is very specific to our superlattice configuration.
  - Check if second-order excitations can be an issue?
  - Measure the in-situ detection efficiency with a few average sets?
  - Find a better name + value for the symmetry frequency $fdds^0$?
  - Really create so many paragraphs for the discussion of the figure @fig:phase-measure-detect-result?
]

The last step in @fig:phase-measure-sequence only stops the oscillation and projects the final state $phy.ket(psi(tau))$ onto the states #ketL and #ketR.
Since the spatial separation of #qty[266][nm] between the lattice sites is far below the resolution limit of the imaging system (see @ssec:setup-sequence-detect), we need an additional detection step to actually resolve the occupation of the double-well potentials.
If the atom cloud is spin-polarized, we can only use the band structure of the superlattice to tell the states #ketL and #ketR apart from each other.
After the projection, the atoms on the left sites occupy the lowest band while the atoms on the right sites occupy an excited band with index $n >= 2$.
The specific index of the excited band depends on the superlattice parameters #Vx1064, #Vx532 and $phi$.
For the detection of the double-well occupation, we would like to measure the populations $n_L = abs(phy.braket(L, psi(tau)))^2$ and $n_R = abs(phy.braket(R, psi(tau)))^2$ separately.
While the two signals are complementary due to the normalization $n_L + n_R = 1$, measuring both populations is beneficial to compute the contrast

$
  cal(C) = (n_L - n_R) / (n_L + n_R)
$ <eq:phase-measure-detect-contrast>

between the states #ketL and #ketR.
Compared to the individual populations $n_L$ and $n_R$, the contrast is insensitive to small fluctuations of the atom number between experimental sequences.
On the other hand, we would also like to measure $n_L (x, y)$ and $n_R (x, y)$ with a spatial resolution.
While we can not resolve the individual double wells, we are able to observe the variation of the tunneling amplitude $t(x, y)$ due to the inhomogeneity of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
Furthermore, we can measure the local superlattice phase $phi(x, y)$ to resolve phase gradients caused by #tr[a tilt/an angle] between the wavefronts of the #x1064 lattice and the #x532 lattice.
The perfect detection technique would therefore combine the contrast measurement and the spatial resolution.
Unfortunately, we are limited to one of the two #tr[attributes/properties] with the detection techniques that we can currently realize in the experimental setup.
For the measurement of the contrast in @eq:phase-measure-detect-contrast, we need to use the band-mapping technique where we release the atoms from the optical lattices (see @fig:setup-sequence-imaging-tof).
Consequently, the spatial distributions $n_L (x, y)$ and $n_R (x, y)$ are lost and we can only measure the global average across the atom cloud.
The measurement of the double-well occupation with spatial resolution is based on the removal of all atoms in the state #ketR.
The remaining atomic density is then equal to the population $n_L (x, y)$.
Despite its sensitivity to the total atom number, we are now exclusively using the in-situ technique.
#tr[Any further/detailed explanation?]
#tr[For the sake of completeness, ]the band-mapping technique is described in detail in @klemmer_ultracold_2024.

#floating-figure(
  image("figures/phase_measure_in-situ_technique.png"),
  caption: [
    Technique for the in-situ detection of the double-well occupation.
    *a*, Energy bands up to $n = 7$ and corresponding Wannier functions in a superlattice potential with the parameters $Vx1064 = #qty[60][Erec]$, $Vx532 = #qty[18][Erec]$ and $phi = pi slash 4$.
    The Wannier functions $w_n (x)$ are offset by the mean energy of the corresponding band $band_n (q)$.
    Based on the Wannier functions, we can relate the double-well states #ketL and #ketR to the bands $n = 1$ and $n = 3$ respectively.
    *b*, *c*, Transition frequencies from the bands $n = 3$ (*b*) and $n = 1$ (*c*) as a function of the distance $rho$ from the optical axis of the lattice beams.
    The horizontal dashed line shows the modulation frequency $fmod = #qty[185][kHz]$ to excite the atoms in the band $n = 3$ to the untrapped band $n = 7$, while the atoms in the band $n = 1$ are not affected.

    #notes[
      - Find a better color cycle! Ideally one with 7 unique colors?
      - Fix the y-axis of *a*? This should be $epsilon slash h$ instead of just $epsilon$... (Also just call it "energy"?)
      - Perfectly match the y-axis for *a*, *b* and *c*...
      - Use x-ticks $(0, 20, 40, 60)$ in *a* and *b*...
      - Flip the orientation of the y-label of *b* and *c*?
      - Add a vertical line in *b* and *c* for the typical atom cloud size?
      - Mention maximally-localized Wannier functions?
      - Just call the x-label of *b* and *c*: Radius $rho slash#unit[μm]$
    ]
  ],
  label: <fig:phase-measure-detect-technique>,
)

To remove the atoms in the double-well states #ketR, we use the loss mechanism from the in-situ #lms (see @sec:mod-loss).
If we excite the atoms on the right lattice sites to an untrapped band, they are lost from the optical lattice potential.
We therefore need to find a superlattice configuration where the lattice modulation at the frequency #fmod can excite the atoms in the states #ketR, while not affecting the atoms in the states #ketL.
In contrast to the in-situ #lms, the transition to the untrapped band must be resonant across the entire atom cloud.
While we used the inhomogeneity of the lattice beams to measure the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ in the first place, we need the in-situ detection to be insensitive to the varying lattice depths.
This imposes a strong restriction on the possible superlattice configurations for the in-situ detection technique.
#tr[Coindicentally/Conveniently], we found a possible modulation frequency #fmod in the superlattice configuration that we are also using for the in-situ #lms in @sec:mod-super.
The band structure and the transition frequencies in @fig:phase-measure-detect-technique show that we can realize the in-situ detection technique #tr[at/with] the modulation frequency $fmod = #qty[185][kHz]$.
For the atoms in the excited band, the transition $3 -> 7$ is resonant up to a distance of $rho = #qty[60][μm]$ from the optical axis.
With a typical radius #tr[$<#qty[40][μm]$] of the atom cloud (#tr[see/compare] @fig:setup-sequence-imaging-in-situ), this is sufficient to address all atoms in the state #ketR regardless of their position.
Additionally, the Wannier functions $w_3 (x)$ and $w_7 (x)$ have the same parity to allow an efficient excitation.
From the lowest band with index $n = 1$, there is no resonant transition available at the frequency $fmod = #qty[185][kHz]$ up to the radius $rho approx #qty[54][μm]$ where the band with the index $n = 3$ #tr[shows up].
While the modulation frequency is briefly resonant to the transition $1 -> 3$, the corresponding Wannier functions are localized on different lattice sites.
The transition is therefore suppressed compared to the transition $3 -> 7$ of the atoms in the states #ketR.
With the modulation time $tmod = #qty[5][s]$ and the modulation amplitude #tr[$delta V slash Vx532 = ?$], we find a detection efficiency of approximately #qty[95][%] for the state #ketR.
However, we also observe a #qty[10][%] loss of the atoms in the state #ketL.
We attribute this loss to the second-order transitions $1 -> 6$ and $1 -> 7$ that are resonant at twice the modulation frequency #fmod.
#tr[Add something about the "unknown" losses?]

#floating-figure(
  image("figures/phase_measure_signal.png", width: 80%),
  caption: [
    In-situ #tr[calibration/detection] of the superlattice phase.
    The grid shows the DDS frequencies corresponding to the local phases $phi(x, y) = 0$.
    // We can observe a phase gradient across the atom cloud that results in a variation of the frequency $fdds^0$ by up to #qty[2][MHz] in #tr[#qty[50][μm]].
    The two insets show typical signals of the population $n_L$ with the corresponding fits to extract the minima.
    For the evaluation, we apply a mask to the atom images to only include grid cells with a finite atomic density after the loading of the atoms in the lattices.
    Outside of the mask, a reliable evaluation of the phase measurement is not possible.
    The superlattice parameters for the phase measurement are $Vx1064 = #qty[40][Erec]$ and $Vx532 = #qty[14.4][Erec]$.
    The corresponding tunneling amplitude in the center of the cloud is $t slash h approx #qty[860][Hz]$, and we typically use evolution times of $tau_0 = #qty[200][μs]$ to $tau_0 = #qty[250][μs]$.
    Around the symmetric configuration $phi = 0$, we can compute the offset $Delta slash phi approx #qty[160][Hz / mrad]$.

    #notes[
      - Move the colorbar inside the main axes?
      - Plot the phase map in units of #unit[μm]...
      - Use the following y-label for the insets: "(Mean) population $n_L$" (What about the unit? Just say a.u.?)
    ]
  ],
  label: <fig:phase-measure-detect-result>,
)

For the phase measurement introduced in @fig:phase-measure-theory, we scan the DDS frequency of the target phase around the symmetric configuration $phi = 0$.
The minimum of the population $n_L$ shows the symmetry frequency $fdds^0$ where the phase $phi = 0$ is actually realized.
To evaluate the spatial variation of the phase, we divide the atom images into a grid with a cell size of $9 times 9$ pixels.
In each cell, we fit the minimum of the mean population $n_L$ to evaluate the symmetry frequency $fdds^0 (x, y)$ across the atom cloud.
The resulting phase map of a typical phase measurement with the in-situ detection technique is shown in @fig:phase-measure-detect-result.
We can observe a #tr[substantial] phase gradient $phy.dv(phi, y)$ across the atom cloud that shifts the symmetry frequency $fdds^0$ by up to #qty[2][MHz].
In terms of the phase $phi$, this corresponds to a variation of approximately #qty[20][mrad].
The compensation of the phase gradient to achieve a homogeneous superlattice phase is discussed in #tr[ref gradients subsection].

For the phase measurement, we usually select a measurement time $tau_0$ that is slightly shorter than the ideal value for the tunneling amplitude $t$ in the center of the lattices according to @fig:phase-measure-theory.
Due to the inhomogeneity of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$, the tunneling amplitude $t(x, y)$ always increases with the distance from the optical axis of the lattices.
The ideal measurement time therefore becomes shorter towards the edge of the atom cloud.
Taking a shorter time $tau_0$ for the center is a compromise to obtain a reliable phase measurement across the atom cloud.
A deviation of the measurement time $tau_0$ only changes the shape of the phase-sensitive signal, the position of the minimum is not affected.

The #tr[resolution/sensitivity] of the phase measurement is quantified by the offset $Delta slash t$ as a function of the phase.
For the superlattice parameters in @fig:phase-measure-detect-result, a phase detuning of #qty[10][mrad] corresponds to the offset $Delta slash t approx 1.9$.
The corresponding detuning of the DDS frequency is approximately #qty[1][MHz].
Qualitatively, the measured populations $n_L$ therefore match the expected signal in @fig:phase-measure-theory.
If we want to reduce the sensitivity of the phase measurement, we typically use the superlattice parameters $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$.
The resulting offset is $Delta slash t approx 1.3$ at a #qty[10][mrad] phase detuning.
Reducing the phase sensitivity of the offset can be required if the variation of the superlattice phase from sequence to sequence is too large.
In #tr[ref stability subsection], we are characterizing the sequence-to-sequence stability of the superlattice phase #tr[(add some kind of "transition" into this sentence?)].

#tr[Add some kind of conclusion?]


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
For each angle of the "horizontal" axis we will run the measurement as shown in @fig:phase-measure-detect-result and evaluate the strength of the gradient.
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
  image("figures/2024-11-04_symmetry_gradient_thesis_result.png", width: 70%),
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
#[
  #set text(red)
  - Mention the (lack of) comparison to a theoretical signal?
]

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
In the $x y$-plane the atoms often span up to #qty[100][μm] whereas the (individual) planes in the $z$-lattice are only spread over #qty[10][μm].
It is nevertheless important to cancel the vertical gradient if we are running a measurement across/with all lattice planes.
After the optimization of the vertical angle we can move the horizontal axis/angle back to the optimum from @fig:phase-measure-resolve-horizontal-gradient.
Thanks to the absolute positioning capabilities of the piezo mirror mount, we can reliably/quickly apply and cancel a specific horizontal (or vertical) gradient.

#figure(
  image("figures/2024-11-05_symmetry_vertical_gradient_thesis_result.png", width: 70%),
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


==== Superlattice period <sssec:phase-measure-resolve-period>

#[
  #set text(red)
  - This should be a separate subsection? The subsections in this section would then be "resolve", "gradients" and "period"...
  - Add references to this subsection/result wherever necessary!
  - Use sem instead of std for the error of the period?
  - Discuss changes to the horizontal gradient strength?
]

So far we have only estimated the period of the superlattice phase from the (optical path) distance $d approx #qty[50][cm]$ from the atoms to the retro-reflecting mirror #text(red)[add the correct reference here, probably @sec:super-setup?].
The resulting period/distance between two adjacent/neighbouring symmetric configuration is #qty[150][MHz].
Determining/knowing the period with a high precision is necessary for the conversion between the DDS frequency $f_"DDS"$ as the experimental parameter and the superlattice phase $phi$ (and the detuning/offset $Delta slash t$) as the theoretical parameters.
The most precise/sensitive tool for the measurement of the superlattice period is the phase-sensitive measurement introduced in this section.
We know that the superlattice potential @eq:theory-super-potential-dimensionless has the same band structure at all phases $phi = n dot pi slash 2, n in ZZ$.
Measuring the DDS frequency difference between two neighbouring phases will then yield the period of the superlattice.
The potential sketches in @fig:phase-measure-resolve-period shown the two different superlattice configurations that we are comparing/using.
Apart from the (absolute) positional shift (that we cannot resolve anyway) both sequences work just like @fig:phase-measure-sequence.
The atoms are initially prepared on the "lower" sublattice site and then projected to the target phase $phi$.
We then use the in-situ detection of the symmetric configuration as introduced in @ssec:phase-measure-detect with a finite horizontal phase gradient.
The (local) phase will then be encoded in the position of the phase-sensitive signal in the atom cloud.
We already used this technique in @sssec:phase-measure-resolve-vertical to minimize the vertical gradient based on the strength of the phase-sensitive line/signal.
The position of the line/signal was not relevant there and we could just choose a really strong gradient.
If we want to evaluate the position to measure the superlattice phase $phi$, we have to make sure that the position primarily depends on the phase.
For the z-imaging we can expect the (imaged) position of the atom cloud to vary by up to #qty[2][px] between sequences.
We therefore need the (average) changes of the position of the line/signal to be significantly greater.
Otherwise we would (significantly) overestimate the variation of the phase $phi$.
The optimal approach is to use the smallest possible in-plane/horizontal phase gradient where the line/signal remains within the atom cloud for all fluctuations of the superlattice phase.
With a typical atom cloud size of up to #qty[100][px], we can choose the variation of the line/signal position to be greater than the regular position uncertainty of the imaging by one order of magnitude.

#figure(
  grid(
    columns: (6.5cm, 1fr),
    image("figures/phase-measure-period-order0.png"),
    grid.cell(rowspan: 2, image("figures/2024-12-12_symmetry_period_histogram.png")),
    image("figures/phase-measure-period-order1.png"),
  ),
  caption: [
    Measurement of the superlattice period.
    The superlattice configuration for the data taken here was $(v_l, v_s) = (40, 14.4)$.
    The total number of measurements with the DDS frequencies $f_1$ and $f_2$ was #num[1120].

    #show list: set text(red)
    - Add the preparation phases in the first column.
    - Add the infrared lattice potential to the sketches?
    - Anything to add to this caption?
  ],
) <fig:phase-measure-resolve-period>

For the measurement of the superlattice period we set the in-plane/horizontal phase gradient to

$
  k = #qty[0.033(3)][MHz/px]
$ <eq:phase-measure-resolve-period-gradient>

which is around $1 slash 3$ of the phase gradient used for the optimization of the vertical phase gradient in @sssec:phase-measure-resolve-vertical.
The lines/signals are therefore wider by a factor of $approx 3$ than the optimized line/signal in @fig:phase-measure-resolve-vertical-gradient (#text(red)[Actually mention this comparison to the vertical gradient optimization?]).
For the DDS frequencies of the "target" phases $phi$ we selected $f_1 = #qty[406.4][MHz]$ and $f_2 = #qty[556.3][MHz]$ which are spaced by $approx #qty[150][MHz]$.
The DDS frequencies for the "preparataion" phase/configuration is lower by #qty[75][MHz] in both cases.
During the measurement we alternated between $f_1$ and $f_2$ every sequence to eliminate slow drifts of the superlattice phase $phi$.
The absolute frequency differences between successive sequences/measurements are shown in @fig:phase-measure-resolve-period and the resulting superlattice period is

$
  Delta f_"DDS" = #qty[149.79(18)][MHz]
$ <eq:phase-measure-resolve-period>

where the error denotes the standard deviation.
From the period $Delta f_"DDS"$ and the corresponding phase $Delta phi = pi slash 2$ we can now compute the conversion factor between the DDS frequencies and the superlattice phases as
$
  alpha = #qty[10.487(13)][mrad/MHz] thin .
$ <eq:phase-measure-resolve-period-conversion>

During the measurement the position of the line/signal varied in/across a range of #qty[25][px], allowing us to neglect changes to the position of the atom cloud/imaging.

