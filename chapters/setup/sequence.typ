#import "/header.typ": *

== Experimental sequence <sec:setup-sequence>

#notes[
  - Really mention the temperatur stability here?
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

We are using saturated absorption imaging to measure the (optical) density of the atoms at the end of the sequence.
The imaging is done with #qty[10][μs] pulses from the MOT (cooling) laser tuned to the transition $phy.ket(F = 9 slash 2 comma m_F = -9 slash 2) -> phy.ket(F' = 11 slash 2 comma m_F = -11 slash 2)$.
We are able to measure two different atom images per sequence in quick succession by using the fast kinetics mode of the Andor X888? camera.
As a (spatial) reference for the imaging pulse we then grab a third image (so-called _bright_ image) without any atoms.
From (the logarithm of) the difference between the atom images and the bright image we can compute the optical density in the two atom images.
Due to the short (and intense) imaging pulses, the optical transition is satured to effectively lower the optical density.
This is a special technique that allows (very) high optical densities to be measured reliably.
Without saturating the optical transition, an optical density of 2.0 would only transmit #qty[1][%] of the photons in the imaging pulse.
Since we have to calculate the optical density from the transmitted photon number, high optical densities quickly become an issue.
The satured absorption imaging solves this by "rescaling" the optical density.
This technique requires careful calibration of the camera with pulses of different intensities.

With the two available atom images we usually capture the doubly-occupied sites in the first image and the singly-occupied sites in the second image.
Due to the small spacing of the HFS states as shown in @fig:setup-k40-hfs the imaging pulse resonant for the optical transition of the $m_F = -9 slash 2$ state can also (slightly) affect the other $m_F$ states of the $F = 9 slash 2$ manifold.
We are therefore using a microwave transition to the $F = 7 slash 2$ manifold to _shelve_ the state for the second atom image.
This microwave shelving is not possible for doubly-occupied sites since the atoms will be lost.
#text(red)[Is this just caused by spin-exchange collisions since there are now state pairs available at a lower energy?]
For singly-occupied sites the shelving is possible with a very high fidelity #text(red)[Mention the number from Eugenio here?]
Note that we will only measure singly-occupied sites in one of the two HFS spin states.
This is fine under the assumption that the two spin states are equally occupied after the spin-mixing pulses at the start of the experiment.
In that case we can assume that the average density of singly-occupied sites is equal for both spin states since we are not using anything spin-sensitive in our optical lattices.

#text(red)[Actually mention the spin regime?]
Besides resolving singly-occupied and doubly-occupied sites, the two atom images can also be used to measure the different spin states.
This was used in the past to measure spin correlations with the spin spiral in the two-dimensional Hubbard model.
In that case the doubly-occupied sites are removed prior to the spin spiral measurement.
A separation of singly-occupied sites and doubly-occupied sites is therefore no longer necessary and we can use the two atom images to measure the different (HFS) spin states.

