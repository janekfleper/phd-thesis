#import "/header.typ": *

== State manipulation and absorption imaging <sec:setup-detect>

#[
  #set text(red)
  - Where should the magnetic fields be introduced? In a separate section just before this one?
  - Where should the mapping of spin states to HFS states be introduced? Theory?
  - What are the actual technical advantages of HS1 pulses?
  - Explain the MTF measurement to optimize the focus?
  - Mention the dark image?
  - What is the actual image detuning for the other $m_F$ states?
  - Mention cleaning pulses for the polarized measurments here?
  - Actually mention x-imaging and y-imaging anywhere?
]

The rich hyperfine structure of #phy.isotope("K", a: [40]) as shown in @fig:setup-k40-hfs is in incredibly useful tool for the detection of the atoms.
The internal state of the atoms can be changed with simple radio frequency sweeps.
Since the magnetic field at $approx #qty[200][G]$ corresponds to the intermediate regime for the hyperfine structure, each (adjascent) pair of magnetic hyperfine states has a unique energy/frequency difference.
The transition frequency is always around $approx #qty[50][MHz]$, and the frequency differences between transitions are $approx #qty[2][MHz]$ which is comfortably resolvable.
By using (Landau-Zener) frequency sweeps instead of $pi$-pulses the state transfer becomes insensitive to small changes of the magnetic field.
For the regular RF pulses where the states are spaced by $approx #qty[2][MHz]$, we are using pulse widths of #qty[175][kHz] with a pulse length of #qty[2][ms].
To maximize the transfer efficiency an envelope is applied to the RF signal to gracefully ramp the Rabi frequency up and down #text(red)[ref Eugenio].
If we need transfers with a better frequency resolution, we are using HS1 pulses #text(red)[later in this section].


=== HS1 pulses <ssec:setup-detect-hs1>

After the "experiment" the atoms are frozen in the optical lattices and usually in the hyperfine state pair 97 or 95.
There are either zero atoms, one atom or two atoms (of opposite) spin on a lattice site.
For the detection we would like to resolve whether a site is singly-occupied or doubly-occupied.
This is possible due to the interaction energy of the atoms on doubly-occupied sites.
Since this interaction is usually on the order of a few #unit[kHz], we can not use the #qty[175][kHz] wide RF pulses to separate the doubly-occupied sites from the singly-occupied sites.
Instead we are using a so-called HS1 pulse #text(red)[ref something from NMR?] that is optimized for transfers in a narrow frequency window.
This pulse also uses a frequency sweep to achieve a Landau-Zener transfer and in addition the amplitude of the pulse is varied to address a narrow frequency window with a short pulse time.

$
  V_"pulse"(t) = A_"pulse"(t) ... \
  A_"pulse"(t) = A_0 sech(...) \
  Delta_"pulse"(t) = Delta_0 / 2 tanh(...)
$ <eq:setup-detect-hs1-pulse>

For the singles-doubles separation we are usually employing the HS1 pulse with a length of #qty[7][ms] and a width of #qty[2][kHz].
A pulse width of #qty[1][kHz] is also possible with the same pulse length, for even shorter pulses we would need to further increase the pulse length.
The increased pulse length is not required due to the Fourier limit but rather due to the transfer efficiency in the Landau-Zener context/picture.
With a narrower pulse the coupling will start closer to the resonance and we will already loose the adiabaticity of the transfer during the turn-on of the pulse before the pulse even reaches $Delta = 0$.


=== Single-plane slicing <ssec:setup-detect-slicing>

As shown in #text(red)[ref figure with atom pancakes in z-lattice planes], we load atoms into multiple layers of the $z$-lattice.
By default, the imaging will therefore address all layers at the same time since the atoms occupy the same pair of HFS states.
Since the layers feature different numbers of atoms, we would always take the average of different fillings.
And even if the layers would have the same filling/occupation, the detection would still yield the average of multiple realizations which could possibly hide important features or falsify the results?
In order to detect only a single layer, the atoms inside that layer need to be transferred to a different RF state (compared to the other layers).
We achieve this by applying a magnetic field gradient along the $z$-axis with the Fast Feshbach coils in AHH configuration #text(red)[ref Feshbach/magnetic field section].
The maximum gradient strength we can achieve is (only) #qty(per-mode: "slash")[33][G/cm] since the Fast Feshbach coils are not actively cooled (and the power supply + capacitor combination cannot provide more power?).
This magnetic field gradient amounts to a separation of the green $z$-lattice planes by #qty[640][Hz].
As introduced in @ssec:setup-lattices-z we can only occupy every second plane of the green $z$-lattice to move the frequency separation to #qty[1280][Hz].

On paper we can easily achieve this with a #qty[1][kHz] wide HS1 pulse.
If the center frequency is on resonance with the lattice planes, the pulse will address $plus.minus #qty[500][Hz]$ in each direction which is still far away from the neighbouring lattice planes.
In practice we can see that the resonance frequency of the atoms is not perfectly constant on both short time scales (the duration of the pulse) and long time scales (from sequency to sequence or even day to day).
We therefore synchronize the sequence to the phase of the power line since we can expect the power supplies of the magnetic field coils to slightly change/fluctuate during one #qty[20][ms] period of the power line.
The synchronization is implemented by interrupting the sequence a few #qty[10][ms] before the HS1 slicing pulse.
If the power line phase reaches a certain setpoint, the sequence is resumed and the HS1 slicing pulse is always executed at the same phase of the power line.


=== Saturated absorption imaging <ssec:setup-detect-imaging>

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
