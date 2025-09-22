#import "/header.typ": *

== Measurement of the superlattice phase <sec:phase-measure>

#notes[
  - Already reference something related to the phase stability in @sec:phase-stability?
]

Besides the lattices depths #Vx1064 and #Vx532, the superlattice phase $phi$ is the remaining parameter to control the superlattice potential.
In @ch:mod, we have developed a technique to measure the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
Similarly, we also want to calibrate the superlattice phase $phi(x, y)$ to have the full control of the superlattice potential.
As introduced in @sec:phase-setup, we tune the superlattice phase $phi$ with the DDS frequency #fdds and the AOM frequency #faom of the #x1064 lattice.
To combine the two frequencies, we use

$
  f = fdds + 2 dot (faom - #qty[80][MHz])
$ <eq:phase-measure-frequency>

to quantify the total frequency detuning of the #x1064 lattice.
#qty[80][MHz] is the center frequency of the AOM, and the factor $2$ takes the double-pass configuration into account.
According to @eq:phase-setup-delta-phi, the superlattice phase is perfectly linear in the frequency detuning $Delta nu$ and we only need to find the frequency $f$ where the phase is $phi = 0$.
However, the superlattice phase $phi = 0$ is not uniquely defined since the superlattice potential is $pi slash 2$ periodic.
We can therefore find a symmetric configuration approximately every #qty[150][MHz].
In @ssec:phase-measure-period, we determine the exact periodicity of the frequency to precisely compute any superlattice phase $phi(f)$.

For the phase measurement, we use the superlattice potential as an array of isolated double wells#footnote[
  For the superlattice configuration in this section, the outer tunneling amplitude is typically $tout slash tin approx 0.016$ and we can completely neglect the coupling of the double wells.
].
This allows a robust preparation of the initial state and a simple interpretation of the detected occupation at the end of the measurement.
Furthermore, we prepare a spin-polarized atom cloud where each double well is occupied by one atom at most.
For the loading of the atoms into the optical lattices, we use the regular sequence shown in @fig:setup-sequence.
To polarize the atom cloud, we employ an imaging pulse to remove all atoms in the state #mF(9) just before the experiment segment.
During the imaging pulse, the atoms in the state #mF(7) are temporarily transferred to the state #mF(5) to reduce the loss of atoms.
With the spin-polarized atom cloud, the detection is simplified significantly since we can directly detect the remaining atoms in the first atom image.

#floating-figure(
  image("figures/phase_measure_symmetry_signal.png", width: 80%),
  caption: [
    Principle of the measurement of the superlattice phase $phi$.
    The three configurations *a* to *c* show the energy offsets $Delta slash t = -1, 0 "and" 0.5$ respectively, together with the corresponding double-well potential and the time evolution of the initial state #ketL.
    In the two cases where $Delta slash t != 0$, the oscillation is faster and the amplitude is smaller compared to the time evolution at $Delta slash t = 0$.
    At the fixed time $tau_0 dot t slash h = 0.25$ indicated by the vertical dashed lines, the occupation of the state #ketL therefore varies significantly.
    In *d*, the resulting occupation at time $tau_0$ is shown as a function of $Delta slash t$.
    The local minima at $Delta slash t approx plus.minus 2.6$ occur when the second minimum of the oscillations occurs at the measurement time $tau_0$.
    Since they are smaller than the minimum at $Delta slash t = 0$ by one order of magnitude, we can neglect them for the phase measurement.

    #notes[
      - Move *a*, *b* and *c* to the right... And add inset indicators/zooms instead of the labels?
    ]
  ],
  label: <fig:phase-measure-theory>,
)

As discussed in @ssec:theory-double-one, the eigenstates of a single particle in the double-well potential only depend on $Delta slash t$.
In the symmetric configuration $Delta slash t = phi = 0$, the two eigenstates are equal mixtures of the localized states #ketL and #ketR, and the gap between the eigenenergies is $2t$.
Therefore, if we prepare the initial state #ketL, the atoms undergo a coherent Rabi oscillation between the two states #ketL and #ketR.
According to @eq:theory-double-one-rabi-parameters, the oscillation frequency is minimal at $Delta slash t = 0$ while the oscillation amplitude is maximal at $Delta slash t = 0$.
Since both parameters of the oscillation only depend on $abs(Delta) slash t$, we can find a symmetric signal around $Delta slash t = phi = 0$.
In @fig:phase-measure-theory, the origin of the signal is illustrated for a few offsets $Delta slash t$.
At the first minimum of the time evolution of the symmetric configuration, the occupation $n_L$ is zero.
For any offset $abs(Delta) slash t > 0$, the occupation of $n_L$ at the same measurement time is greater than zero.
The strong sensitivity of the signal in #subref(<fig:phase-measure-theory>, "d") is a result of the two oscillation parameters that both contribute to an increase of the occupation $n_L$ at the time $tau_0$.

In the experimental setup, the tunneling amplitude $t(x, y)$ varies across the atom cloud due to the inhomogeneity of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
The ideal measurement time therefore changes as a function of the position in the atom cloud.
We can nevertheless use the phase-sensitive signal since it is robust to small variations of the measurement time $tau_0$.
The symmetry of the signal is a consequence of the symmetry of the double-well eigenstates in @fig:theory-double-one.
A variation of the tunneling amplitude only slightly changes the shape of the signal, which does not affect the identification of the symmetric configuration $Delta slash t = phi = 0$.
Besides the tunneling amplitude, the superlattice phase itself can also change across the atom cloud.
If the wavefronts of the #x1064 lattice and the #x532 lattice are not parallel, we can observe a horizontal and a vertical gradient component (see @ssec:phase-measure-gradient).


=== State initialization and projection <ssec:phase-measure-sequence>

To measure the signal shown in #subref(<fig:phase-measure-theory>, "d"), we need to prepare the initial state #ketL and detect the state $phy.ket(psi(tau))$ after the time $tau_0$.
For the preparation, we use a large offset $abs(Delta) >> t$ where the ground state in the double well is equal to #ketL.
We achieve this by initially loading the atoms into the lowest band of the #x1064 lattice.
The #x532 lattice is turned on adiabatically at the antisymmetric phase $phi = -pi slash 4$ to keep the atoms in the lowest band of the superlattice potential.
As shown in @fig:phase-measure-sequence, the atoms are located on the left site in each unit cell, which corresponds to the state #ketL in the double-well potential.
For the initialization of the Rabi oscillation in each double well, we diabatically change the superlattice phase from $-pi slash 4$ to the target phase that realizes the detuning $Delta(phi)$.
The relevant energy scale for the phase ramp is the energy gap $2t$ of the avoided crossing at $Delta slash t = 0$ (see #subref(<fig:theory-double-one>, "b")).
If the rate of change $dot(Delta)$ is too small, the atoms remain in the ground state which would reduce or completely disable the oscillation.
The diabatic preparation is therefore essential to conserve the initial state #ketL at any offset $Delta slash t$.
After the oscillation time $tau_0$, we need to stop the oscillation to freeze the current state $phy.ket(psi(tau))$.
We can achieve this with the phase ramp back to $phi = -pi slash 4$ to project the final state onto the states #ketL and #ketR.
This phase ramp also needs to be diabatic to conserve the composition of the final state.

#floating-figure(
  image("figures/phase_preparation_and_projection.png", width: 100%),
  caption: [
    State initialization and projection for the phase measurement.
    Initially, only the left well is occupied by loading the superlattice at the antisymmetric phase $phi = -pi slash 4$.
    After the initialization at the offset $Delta(phi)$, the two sites are connected by the tunneling amplitude $t$.
    During the time evolution, the atom oscillates between the left and the right site with the parameters in @eq:theory-double-one-rabi-parameters.
    To stop the oscillation after the time $tau_0$, we use a diabatic phase ramp back to $phi = -pi slash 4$ to project the state $phy.ket(psi(tau = tau_0))$ onto the states #ketL and #ketR.

    #notes[
      - Add arrows between the double wells to indicate the phase ramps + time evolution?
      - Add *abc* here? Or make it I, II, III and IV?
    ]
  ],
  label: <fig:phase-measure-sequence>,
)

When we use the phase $phi = -pi slash 4$ for the initial loading of the atoms, we need to increase the DDS frequency by approximately #qty[75][MHz] to reach the target phase around $phi = 0$.
For the projection, we use the identical phase ramp back to the antisymmetric configuration $phi = -pi slash 4$.
While we can change the DDS frequency arbitrarily on nanosecond timescales, the actual rate of change is limited by the phase locked loop.
If we use the arbitrary waveform generator to add the auxiliary voltage signal to the output of the slow PID regulator#footnote[
  Without the auxiliary signal, the rate of change is significantly lower.
] (see @fig:phase-setup), the maximal rate of change is $dot(phi) approx pi slash 2 #h(0.2em) #unit[/ms]$.
With the double-pass AOM, we can achieve rates up to $dot(phi) approx #qty[0.1][rad/μs]$ which is an improvement by a factor of more than $60$ compared to the DDS frequency and the phase locked loop.
The limitation when using the double-pass AOM is the maximal frequency detuning of #qty[40][MHz] which corresponds to the phase detuning $2 pi slash 15$.
While this range is too small to realize the phase ramp $-pi slash 4 -> 0$, it is generally sufficient for the initialization and projection of the states for the phase measurement.
According to the composition of the ground state in #subref(<fig:theory-double-one>, "c"), we can already neglect the mixture of the states #ketL and #ketR at $abs(Delta) slash t = 5$, which typically corresponds to the phase $abs(phi) approx pi slash 100$.
As soon as the ground state is equal to #ketL, there is no advantage in moving all the way to the antisymmetric phase $phi = -pi slash 4$ for the state initialization and the projection onto the sites #ketL and #ketR.
However, the antisymmetric configuration can be required for the detection of the final state.
In that case, we typically use the two phase ramps #box[$-pi slash 4 attach(-->, t: "DDS") -pi slash 15 attach(-->, t: "AOM") 0$] to cover the entire phase range.
During the first phase ramp, the rate of change can be slower since the double-well potential is far detuned from $Delta slash t = 0$.
Only the rate of change during the second phase ramp is relevant for the initialization and projection shown in @fig:phase-measure-sequence.


=== In-situ detection of the double-well occupation <ssec:phase-measure-detect>

The last step in @fig:phase-measure-sequence only stops the oscillation and projects the final state $phy.ket(psi(tau))$ onto the states #ketL and #ketR.
Since the spatial separation of #qty[266][nm] between the lattice sites is far below the resolution limit of the imaging system (see @ssec:setup-sequence-detect), we need an additional detection step to actually resolve the occupation of the double-well potentials.
If the atom cloud is spin-polarized, we can only use the band structure of the superlattice to tell the states #ketL and #ketR apart from each other.
After the projection, the atoms on the left sites occupy the lowest band while the atoms on the right sites occupy an excited band with index $n >= 2$.
The specific index of the excited band depends on the superlattice parameters #Vx1064, #Vx532 and $phi$.
For the detection of the double-well occupation, we would like to measure the occupations $n_L = abs(phy.braket(L, psi(tau)))^2$ and $n_R = abs(phy.braket(R, psi(tau)))^2$ separately.
While the two signals are complementary due to the normalization $n_L + n_R = 1$, measuring both occupations is beneficial to compute the contrast

$
  cal(C) = (n_L - n_R) / (n_L + n_R)
$ <eq:phase-measure-detect-contrast>

between the states #ketL and #ketR.
Compared to the individual occupations $n_L$ and $n_R$, the contrast is insensitive to small fluctuations of the atom number between experimental sequences.
On the other hand, we would also like to measure $n_L (x, y)$ and $n_R (x, y)$ with a spatial resolution.
While we can not resolve the individual double wells, we are able to observe the variation of the tunneling amplitude $t(x, y)$ due to the inhomogeneity of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
Furthermore, we can measure the local superlattice phase $phi(x, y)$ to resolve phase gradients caused by a relative tilt of the wavefronts of the #x1064 lattice and the #x532 lattice.
The ideal detection technique would therefore combine the contrast measurement and the spatial resolution.
Unfortunately, we are limited to one of the two features with the detection techniques that we can currently realize in the experimental setup.
For the measurement of the contrast in @eq:phase-measure-detect-contrast, we need to use the band-mapping technique where we release the atoms from the optical lattices (see @fig:setup-sequence-imaging-tof).
Consequently, the spatial distributions $n_L (x, y)$ and $n_R (x, y)$ are lost and we can only measure the global average across the atom cloud.
The band-mapping technique is described in detail in @klemmer_ultracold_2024.
The measurement of the double-well occupation with spatial resolution is based on the removal of all atoms in the state #ketR.
The remaining atomic density is then equal to the occupation $n_L (x, y)$.
Despite its sensitivity to the total atom number, we are now exclusively using the in-situ technique described in this subsection.

#floating-figure(
  image("figures/phase_measure_in-situ_technique.png"),
  caption: [
    Technique for the in-situ detection of the double-well occupation.
    *a*, Energy bands up to $n = 7$ and corresponding Wannier functions in a superlattice potential with the parameters $Vx1064 = #qty[60][Erec]$, $Vx532 = #qty[18][Erec]$ and $phi = pi slash 4$.
    The Wannier functions $w_n (x)$ are offset by the mean energies of the bands $band_n (q)$.
    Based on the Wannier functions, we can associate the double-well states #ketL and #ketR with the bands $n = 1$ and $n = 3$ respectively.
    *b*, *c*, Transition frequencies from the bands $n = 3$ (*b*) and $n = 1$ (*c*) as a function of the distance $rho$ from the optical axis of the lattice beams.
    The dotted vertical line indicates the typical size of the atom cloud.
    The dashed horizontal line shows the modulation frequency $fmod = #qty[185][kHz]$ to excite the atoms in the band $n = 3$ to the untrapped band $n = 7$, while the atoms in the band $n = 1$ are not affected.

    #notes[
      - Find a better color cycle! Ideally one with 7 unique colors?
      - Perfectly match the y-axis for *a*, *b* and *c*...
      - Find better spots for the *abc* labels.
    ]
  ],
  label: <fig:phase-measure-detect-technique>,
)

To remove the atoms in the double-well states #ketR, we use the loss mechanism from the in-situ #lms (see @sec:mod-loss).
If we excite the atoms on the right sites to an untrapped band, they are lost from the optical lattice potential.
We therefore need to find a superlattice configuration where the lattice modulation at the frequency #fmod can excite the atoms in the states #ketR, while not affecting the atoms in the states #ketL.
In contrast to the in-situ #lms, the transition to the untrapped band must be resonant across the entire atom cloud.
While we used the inhomogeneity of the lattice beams to measure the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ in the first place, we need the in-situ detection to be insensitive to the varying lattice depths.
This imposes a strong restriction on the possible superlattice configurations for the in-situ detection technique.
We found a suitable modulation frequency #fmod in the superlattice configuration that we are already using for the in-situ #lms in @sec:mod-super.
The band structure and the transition frequencies in @fig:phase-measure-detect-technique show that we can realize the in-situ detection technique with the modulation frequency $fmod = #qty[185][kHz]$.
For the atoms in the excited band, the transition $3 -> 7$ is resonant up to a distance of $rho = #qty[60][μm]$ from the optical axis.
With a typical radius $< #qty[50][μm]$ of the atom cloud (see @fig:setup-sequence-imaging-in-situ), this is sufficient to address all atoms in the state #ketR regardless of their position.
Additionally, the Wannier functions $w_3 (x)$ and $w_7 (x)$ have the same parity to allow an efficient excitation.
From the lowest band with index $n = 1$, there is no resonant transition available at the frequency $fmod = #qty[185][kHz]$ up to the radius $rho approx #qty[54][μm]$ where the transition $1 -> 3$ is briefly resonant.
However, the corresponding Wannier functions are localized on different lattice sites and the transition is suppressed compared to the transition $3 -> 7$.
With the modulation time $tmod = #qty[5][s]$ and the modulation amplitude #tr[$delta V slash Vx532 = ?$], we find a detection efficiency of approximately #qty[95][%] for the state #ketR.
However, we also observe a #qty[10][%] loss of the atoms in the state #ketL.
We attribute this loss to the second-order transitions $1 -> 6$ and $1 -> 7$ that are resonant at twice the modulation frequency #fmod.

#floating-figure(
  image("figures/phase_measure_signal.png", width: 80%),
  caption: [
    In-situ calibration of the superlattice phase.
    The grid shows the zero-phase frequency $f_0 (x, y)$ corresponding to the local symmetric configuration $phi(x, y) = 0$.
    The two insets show typical signals of the occupation $n_L$ with the corresponding fits to extract the minima.
    For the evaluation, we apply a mask to the atom images to only include grid cells with a finite atomic density after the loading of the atoms in the lattices.
    Outside of the mask, a reliable evaluation of the phase measurement is not possible.
    The superlattice parameters for the phase measurement are $Vx1064 = #qty[40][Erec]$ and $Vx532 = #qty[14.4][Erec]$.
    The corresponding tunneling amplitude in the center of the cloud is $t slash h approx #qty[860][Hz]$, and we typically use oscillation times $tau_0$ between #qty[200][μs] and #qty[250][μs].
  ],
  label: <fig:phase-measure-detect-result>,
)

For the phase measurement introduced in @fig:phase-measure-theory, we scan the target phase around the symmetric configuration with the frequency $f$.
The minimum of the occupation $n_L$ shows the zero-phase frequency $f_0$ where the phase $phi = 0$ is actually realized.
To evaluate the spatial variation of the phase, we divide the atom images into a grid with a cell size of $#qty[9][px] times #qty[9][px]$.
In each cell, we fit the minimum of the mean occupation $n_L$ to evaluate the zero-phase frequency $f_0 (x, y)$ across the atom cloud.
The resulting phase map of a typical phase measurement with the in-situ detection technique is shown in @fig:phase-measure-detect-result.
We can observe a substantial phase gradient $phy.dv(phi, y)$ across the atom cloud that shifts the zero-phase frequency $f_0$ by up to #qty[2][MHz].
In terms of the phase $phi$, this corresponds to a variation of approximately #qty[20][mrad].
The compensation of the phase gradient to achieve a homogeneous superlattice phase is discussed in @ssec:phase-measure-gradient.

For the phase measurement, we usually select a measurement time $tau_0$ that is slightly shorter than the ideal value for the tunneling amplitude $t$ in the center of the lattices according to @fig:phase-measure-theory.
Due to the inhomogeneity of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$, the tunneling amplitude $t(x, y)$ always increases with the distance from the optical axis of the lattices.
The ideal measurement time therefore becomes shorter towards the edge of the atom cloud.
Taking a shorter time $tau_0$ for the center is a compromise to obtain a reliable phase measurement across the atom cloud.
A deviation of the measurement time $tau_0$ only changes the shape of the phase-sensitive signal, the position of the minimum is not affected.

The sensitivity of the phase measurement is quantified by the offset $Delta slash t$ as a function of the phase.
For the superlattice parameters in @fig:phase-measure-detect-result, a phase detuning of #qty[10][mrad] realizes the offset $Delta slash t approx 1.9$.
The corresponding detuning of the DDS frequency is approximately #qty[1][MHz].
Qualitatively, the measured occupations $n_L$ therefore match the expected signal in @fig:phase-measure-theory.
If we want to reduce the sensitivity of the phase measurement, we typically use the superlattice parameters $Vx1064 = #qty[15][Erec]$ and $Vx532 = #qty[12][Erec]$ where the offset at #qty[10][mrad] is $Delta slash t approx 1.3$.
Reducing the phase sensitivity of the offset can be required if the shot-to-shot fluctuations of the superlattice phase are too large.


=== Compensation of the phase gradient <ssec:phase-measure-gradient>

The calibration of the in-situ superlattice phase $phi(x, y)$ in @fig:phase-measure-detect-result shows a phase gradient in the direction of the #y-axis.
Such a phase gradient is the result of a small imperfection of the relative alignment of the #x1064\-lattice beams and the #x532\-lattice beams.
If the standing-wave patterns of the individual lattices are not parallel, the zero-phase frequency $f_0$ varies as a function of the position $(x, y)$.
Consequently, the compensation of the phase gradient requires a tilt of the lattice beams at the atom position without affecting their overall alignment.
To adjust the angle of the lattice beams around the atom position, we apply a shift perpendicular to the optical axis in front of the forward lens.
In @fig:super-setup, there are two glass plates in the #x532\-lattice setup to shift the horizontal and vertical positions of the forward-propagating beam#footnote[
  The compensation of the phase gradient would also work by shifting the #x1064\-lattice beam.
].
A rotation of the glass plates displaces the beam in the corresponding direction due to the refraction at the surfaces.
As long as the surfaces of the glass plates are parallel, the angle of the forward-propagating beam is conserved.
The alignment of the #x532\-lattice beams at the atom position is therefore not affected by the rotation of the glass plates.

The first glass plate in the #x532\-lattice setup is mounted in a piezo mirror mount with a range of $plus.minus #num[2]degree$ and an absolute accuracy of $#num[0.05]degree$ for each axis.
The second glass plate is placed in a regular mirror mount with an adjustable pitch of $plus.minus #num[4]degree$ for the vertical axis.
We use the second glass plate to apply a static shift to the #x532\-lattice beam, while the first glass plate can be controlled by the experimental sequence to vary the horizontal and vertical shift.
With the degrees of freedom of the mirror mounts, we compensate the horizontal and vertical component of the phase gradient separately.
While we can resolve the horizontal component of the gradient with the in-situ measurement of the superlattice phase, the vertical component is not directly visible since the atom images show the integrated optical density.
Nevertheless, we found a technique to qualitatively optimize the vertical component of the phase gradient.

#floating-figure(
  image("figures/phase_measure_horizontal_gradient.png", width: 70%),
  caption: [
    Compensation of the horizontal component of the phase gradient.
    The gradient component is linear in the angle $gamma_"hor"$, as expected from the shift of the #x532\-lattice beam due to the refraction in the glass plate.
    The uncertainties take the $#num[0.05]degree$ accuracy of the piezo mirror mount into account.
    The dashed line shows the expected gradients based on the properties of the glass plate and the focal length of the forward lens.
    Empty cells in the insets on the right are either excluded by the initial mask around the atom cloud or the fit of the zero-phase frequency $f_0 (x, y)$ was not successful.
    The lattice depths for the measurement are $Vx1064 = #qty[40][Erec]$ and $Vx532 = #qty[14.4][Erec]$.
  ],
  label: <fig:phase-measure-gradient-horizontal>,
)

For the compensation of the horizontal gradient component, we repeat the measurement of the superlattice phase $phi(x, y)$ in @fig:phase-measure-detect-result at several angles $gamma_"hor"$ of the glass plate.
We evaluate the frequency $f_0 (x, y)$ by fitting a one-dimensional polynomial up to the degree one.
Analogous to the evaluation of the lattice depth $V(x, y)$ in @sec:mod-eval, the one-dimensional polynomial is expanded in the #xy-plane and can be rotated by the angle $theta.alt$ to account for the rotation of the optical axis of the lattice beams.
In @fig:phase-measure-gradient-horizontal, the measurement and compensation of the horizontal gradient component is shown.
We vary the glass-plate angle in steps of $#num[0.4]degree$ to find the zero-crossing of the gradient component at $gamma_"hor" approx #num[1.7]degree$.
The standard deviation of the zero-phase frequency $f_0 (x, y)$ across the atom cloud is $sigma(f_0) = #qty[0.11][MHz]$.
This corresponds to $sigma(phi) approx #qty[1.15][mrad]$, which is on par with the shot-to-shot stability of the superlattice phase (see @ssec:phase-stability-result).
During the scan of the angle $gamma_"hor"$, the frequency $f_0$ in the center of the atom cloud $(x, y) = (0, 0)$ varies by less than #qty[0.25][MHz].
We can therefore tune the horizontal gradient component without significantly affecting the mean zero-phase frequency.
While we want the superlattice phase $phi(x, y)$ to be homogeneous in most measurements, there are a few cases where applying a specific horizontal gradient component is useful.
If the phase $phi$ changes linearly across the atom cloud, the offset $Delta$ shows the same behavior.
This allows us to realize the offset scan in a single image where the phase measurement results in a local minimum of the atomic density.
In @ssec:phase-measure-period and @ssec:phase-stability-result, we use this technique for a single-shot measurement of the zero-phase frequency $f_0$.
The spatial variation of the phase $phi$ due to the horizontal gradient component encodes the offset $Delta slash t = 0$ in the position of the minimum in the atomic density.
We can therefore directly measure the shot-to-shot fluctuations of the phase, whereas a scan of the frequency as in @fig:phase-measure-detect-result only shows the phase fluctuations on a timescale of approximately #qty[10][min].

#floating-figure(
  image("figures/phase_measure_vertical_gradient.png", width: 70%),
  caption: [
    Compensation of the vertical component of the phase gradient.
    The contrast quantifies the ratio of the amplitude and the width of the minimum in the atomic densities.
    For the angle $gamma_"ver"$, the uncertainties take the $#num[0.05]degree$ accuracy of the piezo mirror mount into account, while the uncertainties of the contrast show the fit errors.
    The atomic densities in the insets highlight the different contrasts for the corresponding data points.
    The lattice depths for the measurement are $Vx1064 = #qty[40][Erec]$ and $Vx532 = #qty[14.4][Erec]$, and the horizontal gradient component is approximately #qty[0.17][MHz/μm].
  ],
  label: <fig:phase-measure-gradient-vertical>,
)

The compensation of the vertical component of the gradient also relies on a finite horizontal gradient component.
Since the image shows the integrated atomic density of the vertical lattice planes, we can use the shape of the local minimum to optimize the vertical component of the phase gradient#footnote[
  This technique is equivalent to the vertical alignment procedure of the #x1064 lattice in @ssec:mod-align-x1064, where we use the contrast of the lattice-modulation resonances to infer the overlap of the #x1064\-lattice beams.
].
If the superlattice phase is equal in all vertical lattice planes, the local minimum occurs at the same position $(x, y)$ in each lattice plane and the integrated signal shows a minimal width.
Conversely, a vertical gradient component causes a shift of the phase measurement in the lattice planes that broadens the integrated signal in the atomic density.
While we can not directly quantify the strength of the vertical gradient component, the technique is sufficient to find the zero-gradient angle of the glass plate.
In @fig:phase-measure-gradient-vertical, the contrast of the integrated signal shows a maximum at the glass-plate angle $gamma_"ver" approx #num[0.5]degree$.
Compared to the horizontal gradient component, the measurement of the vertical gradient component is significantly less sensitive.
This is primarily caused by the overall shape of the atom cloud that spans up to #qty[100][μm] in the #xy-plane, whereas the vertical lattice planes are only occupied over #qty[10][μm].
While this limits the measurement resolution, it also limits the possible inhomogeneity of the superlattice phase due to the vertical component of the phase gradient.


=== Measurement of the superlattice period <ssec:phase-measure-period>

#notes[
  - Reference the phase-stability section for the details of the in-situ measurement?
]

To precisely control the superlattice phase $phi$ with the frequency $f$, we need to know the conversion factor between the two quantities.
While the measurement of the zero-phase frequency $f_0$ just allows us to set the phase $phi = 0$, any other phase $phi$ requires the calibration of the superlattice period in terms of the frequency $f$.
With the length $d approx #qty[50][cm]$ of the optical path from the atom position to the retro mirror (see @fig:super-setup), we can already estimate the frequency period to be $Delta f approx #qty[150][MHz]$ based on @eq:phase-setup-delta-phi.
For a calibration of the frequency period, we run the phase measurement in @fig:phase-measure-detect-result at the adjacent phases $phi = 0$ and $phi = pi slash 2$.
The resulting frequency difference $Delta f$ between the two configurations is the frequency period corresponding to the phase period $pi slash 2$.

#floating-figure(
  image("figures/phase_measure_period.png"),
  caption: [
    Measurement of the frequency period.
    *a*, Distribution of the frequency differences in consecutive sequences across #num[1120] measurements.
    *b*, *c*, Loading and state initialization in the two different superlattice configurations.
    The phases for the loading are $phi = -pi slash 4$ (*b*) and $phi = pi slash 4$ (*c*) respectively, and each phase is increased by $pi slash 4$ for the initialization.
    The superlattice parameters for the measurement are $Vx1064 = #qty[40][Erec]$ and $Vx532 = #qty[14.4][Erec]$, and the target frequencies are $f = #qty[406.4][MHz]$ (*b*) and $f = #qty[556.3][MHz]$ (*c*).

    #notes[
      - Add insets to show the "resonance" data?
      - Move the distribution to the right and introduce the superlattice configurations first?
      - Add arrow between the axes *b* and *c* to highlight the initialization with $Delta phi = + pi slash 4$?
    ]
  ],
  label: <fig:phase-measure-period>,
)

For the initial configuration of the phase measurement according to @fig:phase-measure-sequence, we select the phases $phi = -pi slash 4$ and $phi = pi slash 4$, before initializing the oscillations at the phases $phi = 0$ and $phi = pi slash 2$ respectively.
The two corresponding superlattice configurations are illustrated in @fig:phase-measure-period.
For the measurement of the superlattice phase, we apply a small horizontal gradient component where the phase is encoded in the position of the minimum in the atomic density (see @fig:phase-measure-gradient-vertical).
With the horizontal component of #qty[0.060(6)][MHz/μm], the positions of the minima move across the entire atom cloud to make the measurement as sensitive to the phase as possible.
This technique allows an alternation between the two configurations every sequence, which makes the measurement insensitive to long-term drifts.
The distribution of the frequency differences of consecutive sequences in #subref(<fig:phase-measure-period>, tr[a]) yields the frequency period

$
  Delta f = #qty[149.79(18)][MHz]
$ <eq:phase-measure-period>

which is only slightly lower than the value estimated from the optical path length.
We can now use $Delta f$ to convert any frequency in #unit[MHz] to a phase in #unit[mrad], which is the physical superlattice parameter and allows a comparison to other experimental setups.
