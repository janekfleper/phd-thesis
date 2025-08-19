#import "/header.typ": *
#import "figures/figures.typ": experimental-sequence

== Experimental sequence <sec:setup-sequence>

#notes[
  - Where to mention the mapping $mF(9) = phy.ket(arrow.b)$ and $mF(7) = phy.ket(arrow.t)$?
  - Really skip the "experiment" segment and only reference to the later chapters?
]

The experimental setup is controlled by an experimental sequence that typically lasts #qty[60][s].
Every sequence starts with the magneto-optical trap which takes approximately #qty[4][s], followed by the magnetic transport to the glass cell in less than #qty[1][s].
Due to the unfavorable collision properties of fermionic particles, the evaporation in the Ioffe-Pritchard trap lasts almost #qty[35][s].
The loading into the optical dipole traps and the subsequent evaporation takes #qty[8][s].
The preparation of the degenerate Fermi gas therefore takes up #qty[80][%] of the sequence time.
After this preparation, the atoms are loaded into the optical lattices where we actually conduct the experiments.
The end of the experimental sequence is the detection where the atoms are imaged to capture the measurement results.
@fig:setup-sequence shows a typical sequence from the loading of the optical lattices to the imaging at the end of the detection.

To keep the experimental table at a constant temperature, the sequence is running around the clock.
A short interruption of the sequence can already require several hours of thermalization on the experimental table.
The most critical components for the temperature stability are the magnetic field coils of the Ioffe-Pritchard trap and the slow Feshbach coils.
Despite their water cooling, these coils are the largest thermal loads on the experimental table.
We therefore aim to set up the experimental sequence with a constant runtime for the individual coils.
Even then, a true thermal equilibrium is not possible since the coils are only running for a fraction of the sequence.
We can however achieve a periodic temperature cycle with minimal variations from sequence to sequence.
This is essential for the stability of the in-plane superlattice phase, which I will discuss in @ssec:phase-sensors-stability.

#floating-figure(
  experimental-sequence(),
  caption: [
    A minimal working experimental sequence in the optical lattices.
    The sketch starts just after the evaporation in the optical dipole trap where the atoms occupy the #mix(9, 7) mixture.
    During the _loading_ segment, the optical lattices are turned on successively until the atoms occupy in the in-plane superlattice.
    The insets indicate the structure of the atom cloud in the $x y$ plane with exaggerated lattice spacings.
    The details about the loading into the optical lattices are explained in @ssec:setup-sequence-loading.
    After the optical lattices are turned on, we can conduct the actual measurements in the _experiment_ segment.
    Usually, the superlattice phase will be close to $phi = 0$ where the potential is an array of double wells.
    The actual parameters of the superlattice will depend on the specific measurement (see @ch:mod and @ch:phase).
    After the experiment is done, the rest of the sequence is spent on the _detection_ segment (see @ssec:setup-sequence-detect).
    We start the detection by freezing the #x1064 lattice to completely disable the tunneling of the atoms.
    This allows us to manipulate the $m_F$ states of the atoms in preparation for the imaging.
    In each sequence, we can capture two atom images and the bright image that just shows the imaging pulse.

    #notes[
      #set text(10pt)
      - Add y-labels to the different rows? E.g. "confinement", "in-plane lattices", "HFS"
      - Add any timing information? Maybe just the length of the intervals?
      - Add legend for the $m_F$ states and the in-plane lattices?
      - Mention the magnetic field during the sequence?
      - Indicate sweep direction for the RF pulses? And label the swaps/sweeps?
    ]
  ],
  label: <fig:setup-sequence>,
)


=== Loading the optical lattices <ssec:setup-sequence-loading>

#notes[
  - Mention change of confinement when freezing the #y1064 lattice?
]

After the evaporation, the optical dipole trap is still required to provide a confinement for the atoms.
The atoms occupy the #mix(9, 7) mixture with attractive interactions since we want to maximize the number of doubly-occupied sites in the optical lattices.
This is the starting point of the loading segment in @fig:setup-sequence.
At first, only the #z532 lattice is turned on to split the atom cloud into several two-dimensional layers.
While the #z532 lattice provides a strong confinement along the $z$ axis, it cannot trap the atoms alone due to the small deconfinement in the $x y$ plane.
The dipole trap is therefore only turned off when the infrared in-plane lattices are turned on to a depth of #qty[6][Erec].
By matching the dipole-trap potential and the radial potential of the in-plane lattices, we can conserve the confinement during the adiabatic transfer into the optical lattices.
This is essential to minimize the heating of the atoms due to the redistribution of the density @wurz_quantum_2021.
A higher temperature of the atoms in the optical lattices would reduce the number of doubly-occupied sites.

When we work with the in-plane superlattice, we want to freeze the tunneling along the $y$ axis by increasing the #y1064\-lattice depth to $Vy1064 >= #qty[20][Erec]$.
The resulting potential will be an array of uncoupled one-dimensional lattices in each vertical layer.
We also increase the depth of the #x1064 lattice to #Vx1064 in preparation for the superlattice potential.
This will temporarily freeze the atoms until the #x532 lattice is turned on.
The initial superlattice phase is strongly detuned from $Delta = 0$, in most cases we are even using the antisymmetric phase $phi = plus.minus pi slash 4$.
Any further changes to the lattice depths or the superlattice phase $phi$ depend on the specific measurements in @ch:mod and @ch:phase.


=== Detecting the atoms <ssec:setup-sequence-detect>

#notes[
  - Where should the mapping of spin states to HFS states be introduced? Theory?
  - Mention the dark image?
  - Mention cleaning pulses for the polarized measurements here?
]

When all lattices are frozen after the experiment segment, the atoms are pinned on their lattice sites as indicated in @fig:setup-sequence.
We can now change the magnetic field to $B approx #qty[210][G]$ where the atoms are almost non-interacting in the #mix(9, 7) mixture.
During the detection, we prepare the atoms for the absorption imaging at the end of the sequence.
The imaging allows us to visualize the atomic density $n(x, y)$, which forms the basis for any data evaluation.


==== Radio-frequency sweeps <sssec:setup-sequence-detect-rf>

#notes[
  - Where to mention $delta B$ for the first time?
  - Find good letters for the #qty[2][MHz] gaps and the pulse width...
  - Actually explain the "correct" sign for the frequency sweeps?
]

The rich hyperfine structure of #K40 shown in @fig:setup-k40-hfs is an essential tool for the detection of the atoms.
At a magnetic field of $B approx #qty[200][G]$, the energy difference between neighboring $m_F$ states is $Delta E slash h approx #qty[50][MHz]$, which is easily accessible with radio-frequency fields.
In general, transfers between neighboring $m_F$ states are possible with either $pi$-pulses or adiabatic Landau-Zener sweeps.
While the $pi$-pulse drives the transition on resonance for a specific time, the latter approach uses a sweep of the radio frequency across the resonance.
If the sweep range is wide compared to the induced coupling of the two $m_F$ states and compared to the fluctuations of the resonance frequency due to magnetic fields, the transition with the Landau-Zener sweeps is significantly more robust than resonant $pi$-pulses.
The different transitions in the $F = 9 slash 2$ manifold are detuned by $delta f approx #qty[2][MHz]$ from each other since the magnetic field $B$ is in the intermediate regime of the splitting of the $m_F$ states.
This allows us to target each transition with the center frequency $f$ of the radio-frequency field.
For a robust state transfer with the Landau-Zener sweeps, we are using a pulse width of $sigma_f = #qty[175][kHz]$, a pulse length of #qty[2][ms] and a rise- and fall-time of #qty[100][μs] to smoothen the pulse @cocchi_analogue_2016.
While the direction of the frequency sweep does not matter for the transfer of an individual atom, we have to select the correct direction if we address a pair of interacting atoms.
A change of the $m_F$ mixture will usually affect the scattering length #asc according to @fig:setup-k40-fesbhach.
If the scattering length changes, the spatial wave function will also change during the Landau-Zener sweep.
This will result in a small coupling to higher bands in the optical lattices.
If the band gaps are in the sweep range defined by the pulse width $sigma_f$, the transferred atom will end up in a superposition of multiple bands and multiple $m_F$ states @miller_ultracold_2016.


==== HS1 pulses <sssec:setup-sequence-detect-hs1>

For the regular radio-frequency pulses, we use a linear sweep of the frequency and a constant amplitude of the radio-frequency field apart from the rise- and fall-time.
This is sufficient to target different $m_F$ states, but the pulse shape is not suitable for a high frequency resolution.
In the experimental sequence, we need a narrow radio-frequency pulse for the separation of the singly-occupied sites from the doubly-occupied sites right at the start of the detection in @fig:setup-sequence.
The required frequency resolution depends on the interaction energy $U$, which is usually on the order of several #unit[kHz].
If the interaction energy changes during the transfer of one of the atoms, the resonance frequency will be detuned by $Delta U$ compared to the singly-occupied sites.
We can achieve such a frequency resolution with an HS1 pulse where both the frequency and the amplitude are varied to achieve a narrow pulse with a flat top in the frequency domain @garwood_return_2001.
With this pulse shape, we can achieve a #unit[kHz] resolution for the $m_F$ transitions @cocchi_analogue_2016 @miller_ultracold_2016.
For the separation of singly-occupied sites and doubly-occupied sites, we are typically using a pulse width of $delta f = #qty[2][kHz]$ and a pulse length of $tau = #qty[7][ms]$.
Narrower pulses are possible at the expense of an increased sensitivity to fluctuations of the magnetic field @gall_quantum_2020 @wurz_quantum_2021.

If the atoms initially occupy the #mix(9, 7) mixture, we expect an interaction $U approx 0$ at the magnetic field $B approx #qty[210][G]$.
With the HS1 pulse, the atoms in the state #mF(7) will be transferred to the state #mF(5), where the mixture #mix(9, 5) will have a strongly repulsive interaction.
By increasing the center frequency to $f_"75" + Delta U slash h$, we can only target the atoms on doubly-occupied sites while the atoms on singly-occupied sites remain in the state #mF(7).
The separation of singles and doubles allows us to image the corresponding atomic densities $n_S (x, y)$ and $n_D (x, y)$ individually.

Besides the singles-doubles separation, the HS1 pulse can also be used to transfer atoms in a single plane of the vertical lattice @gall_quantum_2020 @wurz_quantum_2021.
This technique requires a strong magnetic field gradient $phy.pdv(B_z, z)$ to change the resonant transition frequency as a function of the position $z$.
With the fast Feshbach coils in an anti-Helmholtz configuration, we can create a magnetic field gradient up to $phy.pdv(B_z, z) = #qty[33.3][G/cm]$.
This amounts to a frequency difference of #qty[640][Hz] between neighboring lattice planes, which does not allow a reliable transfer of a single plane due to the magnetic field noise.
By initially loading the atoms into the #z1064 lattice, only every second plane of the #z532 lattice will be occupied.
With a frequency difference of #qty[1280][Hz] and a synchronization of the experimental sequence to the phase of the power line, a robust transfer of a single lattice plane is possible.
For the measurements presented in this thesis, we did not use this technique since it significantly reduces the atomic density $n(x, y)$.
Instead, we are always measuring the global signal of all lattice planes.


==== Microwave shelving <sssec:setup-sequence-detect-mw>

#notes[
  - Mention shelving frequency?
  - Introduce the natural linewidth in @sec:setup-k40 already?
]

Just before the first image taken in @fig:setup-sequence, the singles in the $m_F$ state #mF(9) are _shelved_ in the state $FmF(7 / 2, -7 / 2)$ in the upper manifold in #subref(<fig:setup-k40-hfs>, "b").
The doubles are then imaged in the $m_F$ state #mF(9), and the singles are transferred back to the $m_F$ state #mF(9) for the second image.
This extra step in the detection is necessary to avoid a crosstalk between the two images @cocchi_analogue_2016 @miller_ultracold_2016.
If we would image the singles in the $m_F$ state #mF(9) before the shelving, a small percentage of the doubles in the $m_F$ state #mF(7) would be also excited by the imaging light.
This happens since the natural linewidth $Gamma slash 2 pi approx #qty[6][MHz]$ is not negligible compared to the detuning between the respective optical transitions.
By shelving the singles, the $m_F$ state #mF(7) will always be empty during the image pulses.
Transferring the doubles to the state in the upper manifold would result in an immediate loss of the doubles.
The states $FmF(9/2, -5/2)$ and $FmF(7/2, -7/2)$ experience inelastic spin-exchange collisions where the excess energy is passed onto the atoms as kinetic energy.


==== Saturated absorption imaging <ssec:setup-sequence-detect-imaging>

#notes[
  - Mention the dark images anywhere?
  - Mention the actual values of $alpha = #num[1.175]$ and $I_0^"sat" = #qty[97][counts]$?
]

At the end of an experimental sequence, we are imaging the atoms with light pulses to measure the integrated density distribution $n(x, y)$ along the $z$ axis#footnote[There are additional imaging systems along the $x$ axis and the $y$ axis, which are mainly used for calibration measurements now. The corresponding setups and previous use cases are presented in @feld_low_2011 @frohlich_strongly_2011  and @cocchi_analogue_2016 @miller_ultracold_2016].
The optical setup and the characterization of the $z$ imaging system can be found in @cocchi_analogue_2016 @miller_ultracold_2016.
I will only summarize the important properties of the imaging system, and I will show how the atomic densities $n(x, y)$ are computed from the raw images.
The imaging system uses an aspheric lens placed above the atoms inside the glass cell with the focal length $f = #qty[8][mm]$ and the numerical aperture $"NA" = 0.5$.
A second lens with $f = #qty[200][mm]$ and a $1:1$ relay are then used to image the atom plane onto a CCD camera#footnote[Andor iXon Ultra 888].
The measured magnification is $M = #num[22.7(1)]$, resulting in a pixel size of $d_"px" approx #qty[0.57][μm]$ in the atom plane.
While this is close to the lattice periods $ax1064 = ay1064 = #qty[0.532][μm]$, the actual imaging resolution is worse due to a point-spread function with $"HWHM" = #qty[1.25][μm]$.
We are therefore always measuring the atomic density $n(x, y)$ averaged across a few lattice sites.
This is a critical limitation regarding the occupation of the individual sites in the superlattice potential (see @sec:phase-measure).

The frequency of the imaging pulses is resonant to the cooling transition in #subref(<fig:setup-k40-hfs>, "a") to excite the atoms from the state $FmF(9/2, -9/2)$ to the state $FmF(11/2, -11/2, prime: #true)$.
We can use three consecutive imaging pulses to measure two different atom images and one bright image, as illustrated in @fig:setup-sequence.
The light pulses are captured with the CCD camera in fast-kinetics mode to enable a short readout time.
The absorption by the atoms will reduce the photon count in the resonant imaging pulses according to Beer's law @foot_atomic_2005.
We can therefore compute the optical density of the atoms with the expression

$
  "OD"(x, y) = sigma_0 dot n(x, y) = -ln((I_"atom" (x, y)) / (I_"bright" (x, y)))
$ <eq:setup-sequence-detect-imaging-od>

where $I_"atom" (x, y)$ and $I_"bright" (x, y)$ are the atom image and the bright image respectively.
The atomic density $n(x, y)$ is related to the optical density by the scattering cross section $sigma_0$ of the photon absorption.
However, if the atom cloud is dense, the atom image $I_"atom" (x, y)$ will have a low photon count which limits the signal-to-noise ratio of the atomic density $n(x, y)$.
We are therefore using short imaging pulses with a high intensity to saturate the imaging transition @reinaudi_strong_2007.
While the atoms are in the excited state, they cannot absorb more photons from the imaging pulse.
This will reduce the measured optical density $"OD"(x, y)$ to a regime with a good signal-to-noise ratio.
Computing the atomic density $n(x, y)$ from the measured optical density requires an elaborate calibration of the imaging system and the parameters of the imaging pulse @chomaz_coherence_2014.
This calibration procedure is explained in detail in @cocchi_analogue_2016 @miller_ultracold_2016.
Once calibrated, the evaluation can be applied to all images with the same parameters of the imaging pulses.
Instead of @eq:setup-sequence-detect-imaging-od, we are using the expression

$
  "OD"(x, y) = sigma_0 dot n(x, y) = -alpha ln((I_"atom" (x, y)) / (I_"bright" (x, y))) + (I_"bright" (x, y) - I_"atom" (x, y)) / I_0^"sat"
$ <eq:setup-sequence-detect-imaging-saturated-od>

where the second term takes the effect of the saturation of the imaging transition into account, and the deviations from an ideal two-level system are captured by the parameter $alpha$.

#floating-figure(
  image("figures/setup_imaging_insitu.png"),
  caption: [
    In-situ imaging with singles-doubles separation.
    The images *a* and *b* show the atomic densities of the doubles and the singles respectively.
    As illustrated in @fig:setup-sequence, the first two imaging pulses measure the doubles and the singles.
    The third imaging pulse is used to measure the bright image $I_"bright" (x, y)$ in @eq:setup-sequence-detect-imaging-od.
    In *c*, the image capture with the fast-kinetics mode shows the two atom images and the bright images arranged from top to bottom.
    The black squares indicate the regions of interest where the atomic densities in *a* and *b* are computed.
    A slight reduction of the photon count is visible where the atoms are located in the upper two images.

    #notes[
      - Find a nicer image that is centered...
      - Add unit for the atomic density?
      - Remove the black square in the bright image?
    ]
  ],
  label: <fig:setup-sequence-imaging-in-situ>,
)

In a typical experimental sequence as shown in @fig:setup-sequence, we use _in-situ_ imaging to measure the atomic density $n(x, y)$ in the frozen lattices.
An example for the measured atomic densities of doubles and singles is shown in @fig:setup-sequence-imaging-in-situ.
We can see that the doubles density has a smaller cloud size and a higher density in the center compared to the singles density.
This is the excpected signal when the atoms are loaded into the optical lattice with an attractive interaction.
If we do not need to resolve two different atomic densities, the second atom image will be empty and the detection segment in @sec:setup-sequence can be simplified significantly.
This is the case for all measurements in @ch:mod and the polarized measurements in @ch:phase.
An alternative to the in-situ imaging of the atoms is the time-of-flight technique where the atoms are released from the optical lattices shortly before the first imaging pulse.
By quickly turning off the optical lattices, the quasimomenta $q$ in the bands $n$ are mapped to their corresponding free-particle momentum @kohl_fermionic_2005.
This technique allows us to measure the occupation of the higher bands in the lattice potential and in the superlattice potential, at the expense of the spatial resolution of the atomic densities.
Since the atoms are no longer confined by the optical lattices, we are also limited to a single atom image with the time-of-flight technique in the $z$ imaging system#footnote[#tr[Really mention this? ]With the imaging systems along the $x$ axis or the $y$ axis, multiple $m_F$ can be captured in a single image if they are spatially separated by a gradient magnetic field @feld_low_2011 @frohlich_strongly_2011].
In @fig:setup-sequence-imaging-tof a time-of-flight image is shown where the atoms occupy the $1^"st"$, $3^"rd"$ and $4^"th"$ Brillouin zone along the $x$ axis.
The atoms in the $1^"st"$ Brillouin zone occupied the band $n = 1$, while the other atoms occupied the excited bands $n = 3$ and $n = 4$ respectively.
This is an essential measurement in the superlattice potential to infer the population of the left and right lattice sites in each double well.
The details for this detection technique are discussed in @sec:phase-floquet.


#floating-figure(
  image("figures/setup_imaging_tof.png"),
  caption: [
    Band mapping and time-of-flight imaging.
    The optical lattices are turned off in $tau_"map" = #qty[1][ms]$ to map the band index $n$ to the corresponding Brillouin zone.
    The expansion time is only $tau_"TOF" = #qty[6][ms]$ to allow a measurement up the $4^"th"$ Brillouin zone along the $x$ axis.
    As indicated by the black rectangles in *b*, the camera sensor is already maxed out#footnote(emoji.hippo) by the region of interest.
    Along the $y$ axis, we can only measure up to the $2^"nd"$ Brillouin zone.

    #notes[
      - Find an image that actually has atoms in the higher Brillouin zones...
      - Label the different Brillouin zones in *a*.
    ]
  ],
  label: <fig:setup-sequence-imaging-tof>,
)



