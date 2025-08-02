#import "/header.typ": *

== Experimental sequence <sec:setup-sequence>

#notes[
  - Really mention the temperature stability here?
  - Move the preparation times to the introduction of @sec:setup-prepare?
  - Go into depth about attractive interactions -> doubly-occupied sites here?
  - Where to mention the mapping $mF(9) = phy.ket(arrow.b)$ and $mF(7) = phy.ket(arrow.t)$?
  - Really skip the "experiment" subsection and only ref to the later chapters?
]

The experimental setup is controlled by an experimental sequence that typically lasts #qty[60][s].
To keep the experiment table at a constant temperature, the sequence is running $24 slash 7$.
A short interruption of the sequence can already require several hours of thermalization on the experiment table.
The most critical components for the temperature stability are the magnetic field coils of the Ioffe-Pritchard trap and the slow Feshbach coils.
Despite their water cooling, these coils are the largest thermal loads on the experiment table.
We therefore aim to set up the experimental sequence with a constant runtime for the individual coils.
Even then, a true thermal equilibrium is not possible since the coils are only running for a fraction of the sequence.
We can however achieve a periodic temperature cycle with minimal variations from sequence to sequence.
This is relevant for the stability of the in-plane superlattice phase, which I will discuss in #tr[ref @ssec:phase-sensors-stability].

Every experimental sequence starts with the magneto-optical trap which takes approximately #qty[4][s], followed by the magnetic transport to the glass cell in less than #qty[1][s].
The evaporation in the Ioffe-Pritchard trap lasts almost #qty[35][s], #tr[anything else to mention?]
The loading into the optical dipole traps and the subsequent evaporation takes #qty[8][s].
The preparation of the degenerate fermi gas therefore takes up #qty[80][%] of the sequence time.
After this preparation, the atoms are loaded into the optical lattices where we actually conduct the experiments.
Since the preparation of the atoms is unchanged compared to the previous generations of PhD students, I will only briefly explain the different steps to create a degenerate fermi gas.


#floating-figure(
  image("figures/setup_sequence.png"),
  caption: [
    A minimal working experimental sequence in the optical lattices.
    The sketch starts just after the evaporation in the optical dipole trap where the atoms occupy the mixture #mix(9, 7).
    During the _loading_ segment, the optical lattices are turned on successively until the atoms are trapped in the in-plane superlattice.
    The insets indicate the structure of the atom cloud in the $x y$ plane with an exaggerated lattice spacing.
    The details about the loading into the optical lattices are explained in @ssec:setup-sequence-loading.
    After the optical lattices are turned on, we can conduct the actual measurements in the _experiment_ segment.
    Usually, the superlattice phase is close to $phi = 0$ where the potential is an array of double wells.
    The actual superlattice phase, the lattice depths and the interaction strength will depend on the specific measurement (see @ch:mod and @ch:phase).
    After the experiment is done, the rest of the sequence is spent on the _detection_ segment.
    We start by freezing the #x1064 lattice to completely disable the tunneling of the atoms.
    The #x532 lattice is not required anymore since the atoms are #tr[(already)] frozen on the lattice sites.
    This allows us to manipulate the $m_F$ states of the atoms in preparation for the imaging.
    With a singles-doubles separation pulse (see #tr[ref SD/HS subsection]), the _singles_ $phy.ket(S)$ are separated from the _doubles_ $phy.ket(D)$.
    The _reference_ state $phy.ket(R)$ is transferred to the $m_F$ state #mF(5) with radio-frequency sweeps (see #tr[ref RF sweep subsection]).
    In each sequence we can capture three images of which two show atoms and the third one is an "empty" image that just shows the imaging pulse (see #tr[ref imaging subsection]).

    #notes[
      #set text(10pt)
      - Add any timing information? Maybe just the length of the intervals?
      - Number/abc the different rows? The labels of the rows can be removed alltogether?
      - Merge the "dipole" and "z532" rows?
      - Really just quickly reference the measurements in the later chapters here?
      - Where should I explain _singles_ and _doubles_?
      - Add one more atom cloud for the frozen system!
      - Do not turn off #x532 lattice? In the LR-sensitive measurements it needs to be on!
      - Mention the magnetic field used for the detection?
      - Indicate sweep direction for the RF pulses?
    ]
  ],
  label: <fig:setup-sequence>,
)


=== Loading the optical lattices <ssec:setup-sequence-loading>

#notes[
  - Mention change of confinement when freezing the #y1064 lattice?
  - How/Where to reference the _loading_ segment in @sec:setup-sequence?
]

After the evaporation, the optical dipole trap is still required to provide a confinement for the atoms.
The atoms occupy the #mix(9, 7) with attractive interactions and we want as many doubly-occupied sites as possible in the optical lattices.
At first, only the #z532 lattice is turned on to split the atom cloud into several two-dimensional #tr[layers/pancakes].
While the #z532 lattice provides a strong confinement along the $z$ axis, it cannot trap the atoms alone due to the small deconfinement in the $x y$ plane.
The dipole beams are only turned off when the infrared in-plane lattices are turned on to a depth of #qty[6][Erec].
By matching the dipole-trap potential and the radial potential of the in-plane lattices, we can conserve the confinement during the adiabatic transfer into the optical lattices.
This is essential to minimize the heating of the atoms due to the redistribution of the density #tr[cite Marcell + Nicola].
A higher temperature of the atoms in the optical lattices would reduce the number of doubly-occupied sites.

When we work with the in-plane superlattice, we want to freeze the tunneling along the $y$ axis by increasing the #y1064\-lattice depth to $Vy1064 >= #qty[20][Erec]$.
The resulting potential will be an array of uncoupled one-dimensional lattices in each vertical layer.
We also increase the depth of the #x1064 lattice to #Vx1064 in preparation for the superlattice potential.
This will temporarily freeze the atoms until the #x532 lattice is turned on.
The initial superlattice phase is strongly detuned from $Delta = 0$, in most cases we are even using the antisymmetric phase $phi = plus.minus pi slash 4$.
Any further changes to the lattice depths or the superlattice phase $phi$ depend on the specific measurement (#tr[ref later chapters?]).


=== Detecting the atoms <ssec:setup-sequence-detect>

#notes[
  - Where should the magnetic fields be introduced? In a separate section just before this one?
  - Where should the mapping of spin states to HFS states be introduced? Theory?
  - What are the actual technical advantages of HS1 pulses?
  - Explain the MTF measurement to optimize the focus?
  - Mention the dark image?
  - What is the actual image detuning for the other $m_F$ states?
  - Mention cleaning pulses for the polarized measurments here?
  - Actually mention x-imaging and y-imaging anywhere?
]

When all lattices are frozen after the experiment segment, the atoms are pinned on their lattice sites.
We can change the magnetic field and the internal state of the atoms without affecting their dynamics/density.
During the detection, we can then prepare the atoms for the absorption imaging at the end of the sequence.
The imaging allows us to #tr[(destructively)] visualize the density distribution $n(x, y)$ of the atoms, and these images are the basis for any data evaluation.


==== Radio-frequency sweeps <sssec:setup-sequence-detect-rf>

#notes[
  - Where to mention $delta B$ for the first time?
  - Mention the transfer efficiency (#qty[99.85][%])?
  - Use "transfer" or "transition"?
  - Find good letters for the #qty[2][MHz] gaps and the pulse width...
  - Actually explain the "correct" sign for the frequency sweeps?
]

The rich hyperfine structure of #K40 shown in @fig:setup-k40-hfs is an essential tool for the detection of the atoms.
At a magnetic field of $B approx #qty[200][G]$, the energy differences between neighbouring states are $Delta E slash h approx #qty[50][MHz]$, which is #tr[easily/readily] accessible with radio-frequency fields.
In general, transfers between neighbouring $m_F$ states are possible with either $pi$-pulses or adiabatic Landau-Zener sweeps.
While the $pi$-pulse drives the transition on resonance for a specific time, the latter approach uses a sweep of the radio frequency across the resonance.
If the sweep range is wide compared to the induced coupling of the two $m_F$ states and the fluctuations of the resonance frequency due to magnetic fields, the transition with the Landau-Zener sweeps is significantly more robust than resonant $pi$-pulses.
The different transitions in the $F = 9 slash 2$ manifold are detuned by $delta f approx #qty[2][MHz]$ from each other since the splitting of the $m_F$ states is in the intermediate regime.
This allows us to target each transition with the center frequency $f$ of the radio-frequency field.
For a robust state transfer with the Landau-Zener sweeps, we are using a pulse width of $sigma_f = #qty[175][kHz]$, a pulse length of #qty[2][ms] and a rise- and fall-time of #qty[100][μs] to smoothen the pulse #tr[cite Eugenio].
While the direction of the frequency sweep does not matter for the transfer of a #tr[single] atom, we have to select the correct direction if we address a pair of interacting atoms.
A change of the $m_F$ mixture will usually affect the scattering length #asc according to @fig:setup-k40-fesbhach.
If the scattering length changes, the spatial wave function will also change during the Landau-Zener sweep.
This will result in a small coupling to higher bands in the optical lattices.
If the band gaps are in the sweep range defined by the pulse width $sigma_f$, the transferred atom will end up in a superposition of multiple bands and multiple $m_F$ states #tr[cite Luke].


==== HS1 pulses <sssec:setup-sequence-detect-hs1>

#notes[
  - Where to mention the magnetic field for the detection?
  - Where to introduce the actual term _singles-doubles separation_?
  - Where to explain why we need the singles-doubles separation? (Mention the spin sector?)
  - Check the actual pulse parameters for the singles-doubles separations we did!!!
  - Where to introduce _singles_ and _doubles_ (more specifically, the shortcuts...)
  - Mention line sync + magnetic field noise in detail?
  - Mention that HS1 is just a fancier form of a Landau-Zener sweep?
  - Make this shorter?
]

For the regular radio-frequency pulses, we use a linear sweep of the frequency and a constant amplitude of the radio-frequency field apart from the rise- and fall-time.
This is sufficient to target different $m_F$ states, but the pulse shape is not suitable for a high frequency resolution.
In the experimental sequence, we need a narrow radio-frequency pulse for the separation of the singly-occupied sites from the doubly-occupied sites right at the start of the detection in @fig:setup-sequence.
The required frequency resolution depends on the interaction energy $U$ which is usually on the order of several #unit[kHz].
If the interaction energy changes during the transfer of one of the atoms, the resonance frequency will be detuned by $Delta U$ compared to the singly-occupied sites.
We can achieve such a frequency resolution with an HS1 pulse where both the frequency and the amplitude are varied to achieve a narrow pulse with a flat top in the frequency domain #tr[cite Garwood].
With this pulse shape, we can achieve a #tr[sub] #unit[kHz] resolution for the $m_F$ transitions #tr[cite Luke + Eugenio].
The narrow pulse width requires a corresponding increase of the pulse length to respect the Fourier limit #tr[cite something?].
For the separation of singly-occupied sites and doubly-occupied sites, we are typically using a pulse width of $delta f = #qty[2][kHz]$ and a pulse length of $tau = #qty[7][ms]$.
Narrower pulses are possible at the expense of a senstivity to fluctuations of the magnetic field #tr[cite Luke + Eugenio or Marcell?].

If the atoms initially occupy the #mix(9, 7) mixture, we expect a slightly repulsive interaction $U$ at the magnetic field $B approx #qty[210][G]$.
With the HS1 pulse, the atoms in the state #mF(7) will be transferred to the state #mF(5), where the mixture #mix(9, 5) will have a strongly repulsive interaction.
By increasing the center frequency to $f_"HS1" + Delta U slash h$, we can only target the atoms on doubly-occupied sites while the atoms on singly-occupied sites remain in the state #mF(7).
We can now label the states as $phy.ket(D)$ and $phy.ket(S)$ to refer to the doubles and singles respectively.
The reference state $phy.ket(R) = mF(9)$ is still relevant for the remainder of the detection since it is part of the doubly-occupied sites in the mixture #mix(9, 5).

Besides the singles-doubles separation, the HS1 pulse can also be used to transfer atoms in a single plane of the vertical lattice #tr[cite Marcell + Nicola].
This technique requires a strong magnetic field gradient $phy.pdv(B_z, z)$ to change the resonant transition frequency as a function of the position $z$.
With the fast Feshbach coils in an anti-Helmholtz configuration, we can create a magnetic field gradient up to $phy.pdv(B_z, z) = #qty[33.3][G/cm]$.
This amounts to a frequency difference of #qty[640][Hz] between neighbouring lattice planes, which does not allow a reliable transfer of a single plane due to the #tr[(residual)] magnetic field noise.
By initially loading the atoms into the #z1064 lattice, only every second plane of the #z532 lattice will be occupied.
With a frequency difference of #qty[1280][Hz] and a synchronization of the HS1 pulse to the #tr[phase/noise] of the power line, a robust transfer of a single lattice plane is now possible #tr[cite Marcell + Nicola].
For the measurements presented in this thesis, we did not use this technique since it significantly reduces the density signal $n(x, y)$ by #tr[discarding/ignoring] all but one lattice plane.
Instead, we are always measuring the global signal of all lattice planes with varying #tr[filling/atom numbers].


==== Microwave shelving <sssec:setup-sequence-detect-mw>

#notes[
  - Really put the shelving before the imaging?
  - Explain the term/name "shelving"?
  - Mention shelving frequency?
  - Introduce the natural linewidth in @sec:setup-k40 already?
]

Just before the first image taken in @fig:setup-sequence, the singles in the state #mF(9) are _shelved_ in the state $FmF(7 / 2, -7 / 2)$ in the upper manifold in #subref(<fig:setup-k40-hfs>, "b").
The doubles $phy.ket(D)$ are imaged in the state #mF(9), and the singles are transferred back to the state #mF(9) for the second image.
This extra step in the detection is necessary to avoid a #tr[crosstalk] between the two images #tr[cite Luke + Eugenio].
If we would image the singles in the state #mF(9) before the shelving, a small percentage of the doubles in the state #mF(7) would be also excited by the imaging light.
This happens since the natural linewidth $Gamma slash 2 pi approx #qty[6][MHz]$ is not negligible compared to the detuning $Delta E slash h approx #qty[50][MHz]$ between the states #mF(9) and #mF(7).
By shelving the singles, the state #mF(7) will always be empty during the image pulses.
Transferring the state $phy.ket(D)$ to the $m_F$ state in the upper manifold would result in an immediate loss of the doubles.
Analogous to the loss of the mixture #mix(9, 3) (see @sec:setup-k40), the states $FmF(9/2, -5/2)$ and $FmF(7/2, -7/2)$ experience inelastic spin-exchange collisions where the excess energy is passed onto the atoms as kinetic energy.


==== Saturated absorption imaging <ssec:setup-sequence-detect-imaging>

#notes[
  - Mention the dark images at all?
  - Where to mention the imaging axis for the first time?
  - Mention the actual values of $alpha = #num[1.175]$ and $I_0^"sat" = #qty[97][counts]$?
]

At the end of an experimental sequence, we are imaging the atoms with light pulses to measure the integrated density distribution $n(x, y)$ along the $z$ axis#footnote[There are additional imaging systems along the $x$ axis and the $y$ axis, which are mainly used for calibration measurements now. The corresponding setups and previous use cases are presented in #tr[cite Feld - Eugenio]].
The optical setup and the characterization of the $z$ imaging system can be found in #tr[cite Eugenio] and #tr[cite Luke].
I will only summarize the important properties of the imaging system, and I will show how the atomic densities $n(x, y)$ are computed from the #tr[raw] images.
The imaging system has a numerical aperture of $"NA" = 0.5$ and uses an aspheric lenses with $f = #qty[8][mm]$ that is mounted above the atoms inside the glass cell #tr[cite Feld + Fröhlich].
A second lens with $f = #qty[200][mm]$ and a $1:1$ relay are used to image the atom plane onto a CCD camera#footnote[Andor iXon Ultra 888].
The measured magnification is $M = #num[22.7(1)]$, resulting in a pixel size of $d_"px" approx #qty[0.57][μm]$ in the atom plane.
While this is close to the lattice periods $ax1064 = ay1064 = #qty[0.532][μm]$, the actual imaging resolution is worse due to a point-spread function with $"HWHM" = #qty[1.25][μm]$.
We are therefore always measuring the atomic density $n(x, y)$ averaged across a few lattice sites.
This is a critical limitation regarding the occupation of the individual sites in the superlattice potential #tr[ref anything?].

The frequency of the imaging pulses is resonant to the cooling transition in #subref(<fig:setup-k40-hfs>, "a") to excite the atoms from the state $FmF(9/2, -9/2)$ to the state $FmF(11/2, -11/2, prime: #true)$.
We can use three consecutive imaging pulses to measure two different atom images and one bright image, as illustrated in @fig:setup-sequence.
The light pulses are captured with the CCD camera in fast-kinetics mode to enable a short readout time.
The absorption by the atoms will reduce the photon count in the resonant imaging pulses according to Beer's law #tr[cite Foot].
We can therefore compute the optical density of the atoms with the expression

$
  "OD"(x, y) = sigma_0 dot n(x, y) = -ln((I_"atom" (x, y)) / (I_"bright" (x, y)))
$ <eq:setup-sequence-detect-imaging-od>

where $I_"atom" (x, y)$ and $I_"bright" (x, y)$ are the atom image and the bright image respectively.
The atomic density $n(x, y)$ is related to the optical density by the scattering cross section $sigma_0$ of the #tr[atom-photon interaction].
If the atom cloud is dense, the atom image $I_"atom" (x, y)$ will have a low photon count which limits the signal-to-noise ratio of the atomic density $n(x, y)$.
We are therefore using short imaging pulses with a high intensity to saturate the imaging transition #tr[cite Reinaudi].
While the atoms are in the excited state, they cannot absorb more photons from the imaging pulse.
This will reduce the measured optical density $"OD"(x, y)$ to a regime with a good signal-to-noise ratio.
Computing the atomic density $n(x, y)$ from the measured optical density requires an elaborate calibration of the imaging system and the parameters of the imaging pulse #tr[cite Chomaz PhD].
This procedure is explained in detail in #tr[cite Eugenio] and #tr[cite Luke].
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
By quickly turning off the optical lattices, the quasimomenta $q$ #tr[in/of] the bands $n$ are mapped to their corresponding free-particle momentum #tr[cite Köhl (2005)].
This technique allows us to measure the occupation of the higher bands in the lattice potential and in the superlattice potential, at the expense of the spatial resolution of the atomic densities.
Since the atoms are no longer confined by the optical lattices, we are also limited to a single atom image with the time-of-flight technique in the $z$ imaging system#footnote[#tr[Really mention this? ]With the imaging systems along the $x$ axis or the $y$ axis, multiple $m_F$ can be captured in a single image if they are spatially separated by a applying a gradient magnetic field #tr[cite Feld + Fröhlich].].
In @fig:setup-sequence-imaging-tof a time-of-flight image is shown where the atoms occupy the $1^"st"$, $3^"rd"$ and $4^"th"$ Brillouin zone along the $x$ axis.
The atoms in the $1^"st"$ Brillouin zone occupied the band $n = 1$, while the other atoms occupied the excited bands $n = 3$ and $n = 4$ respectively.
This is an essential measurement in the superlattice potential to infer the population of the left and right lattice sites in each double well #tr[cite Nick?].
The details for this detection technique are discussed in #tr[ref Floquet section...].


#floating-figure(
  image("figures/setup_imaging_tof.png"),
  caption: [
    Band mapping and time-of-flight imaging.
    The optical lattices are turned off in $tau_"map" = #qty[1][ms]$ to map the band index $n$ to the corresponding Brillouin zone.
    The expansion time is only $tau_"TOF" = #qty[6][ms]$ to allow a measurement up the $4^"th"$ Brillouin zone along the $x$ axis.
    As indicated by the black rectangles in *b*, the camera sensor is already maxed out#footnote(emoji.hippo) by the region of interest.
    Along the $y$ axis, we could only measure up to the $2^"nd"$ Brillouin zone.

    #notes[
      - Label the different Brillouin zones in *a*.
      - Anything to add to the caption?
    ]
  ],
  label: <fig:setup-sequence-imaging-tof>,
)



