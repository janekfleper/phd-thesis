#import "/header.typ": *
#import "figures/figures.typ": experimental-sequence
#import "figures/imaging_tof/figure.typ": figure as figure-imaging-tof

== Experimental sequence <sec:setup-sequence>

The experimental setup is controlled by an experimental sequence that typically lasts #qty[60][s].
Every sequence starts with the magneto-optical trap which takes approximately #qty[4][s], followed by the magnetic transport to the glass cell in less than #qty[1][s].
Due to the unfavorable collision properties of fermionic particles, the evaporative cooling in the Ioffe-Pritchard trap lasts almost #qty[35][s].
The loading into the optical dipole traps and the subsequent evaporation takes #qty[8][s].
Preparing the degenerate Fermi gas, therefore, takes up #qty[80][%] of the sequence time.
After this preparation, the atoms are loaded into the optical lattices where we actually conduct the experiments.
The experimental sequence is concluded by the detection where the atoms are captured in a series of images.
@fig:setup-sequence shows a typical sequence from the loading of the optical lattices to the imaging at the end of the detection.

To keep the experimental table at a constant temperature, the sequence is running around the clock.
A short interruption of the sequence can already require several hours of thermalization on the experimental table.
The most critical components for the temperature stability are the magnetic field coils of the Ioffe-Pritchard trap and the slow Feshbach coils.
Despite their water cooling, these coils are the largest thermal loads on the experimental table.
Therefore, we aim to set up the experimental sequence with a constant runtime for the individual coils.
Even then, a true thermal equilibrium is not possible since the coils are only running for a fraction of the sequence.
We can, however, achieve a thermal cycle with minimal variations between sequences.
This is essential for the stability of the in-plane superlattice phase (see @ssec:phase-stability-result).

#floating-figure(
  experimental-sequence(),
  caption: [
    A minimal working experimental sequence in the optical lattices.
    The sequence starts just after the evaporation in the optical dipole trap where the atoms occupy the #mix(9, 7) mixture.
    The sketches in the bottom indicate the structure of the optical potential in the #xy-plane with exaggerated lattice spacings.
    Without the in-plane lattices, the optical dipole trap provides a harmonic confinement.
    During the loading segment, the optical lattices are turned on successively until the atoms are trapped in the in-plane superlattice (see @ssec:setup-sequence-loading).
    The total confinement in the #xy-plane is conserved until the #x1064 lattice and the #y1064 lattice are initially frozen.
    During the experiment segment, the superlattice phase is usually close to the symmetric configuration ($phi = 0$), where the superlattice potential is an array of weakly-coupled double wells.
    The actual parameters of the superlattice depend on the specific measurements (see @ch:mod and @ch:phase).
    After the experiment is done, the rest of the sequence is spent on detecting the atoms (see @ssec:setup-sequence-detect).
    We start the detection by freezing the #x1064 lattice to completely disable the tunneling of the atoms.
    This allows us to manipulate the $m_F$~states of the atoms in preparation for the imaging pulses.
    With the first radio-frequency pulse (HS1), the doubly-occupied sites (purple) are separated from the singly-occupied sites (green).
    Then, the atoms on the singly-occupied sites are shelved to the state $FmF(7/2, -7/2)$ while the doubly-occupied sites are imaged in OD1.
    In each sequence, we can capture two atom images and the bright image that shows the intensity distribution of the imaging pulse.
  ],
  label: <fig:setup-sequence>,
)


=== Loading the optical lattices <ssec:setup-sequence-loading>

After the evaporation, the optical dipole trap is still required to confine the atoms.
As the starting point of the loading segment in @fig:setup-sequence, the atoms occupy the #mix(9, 7) mixture with attractive interactions to maximize the number of doubly-occupied sites in the optical lattices.
Then, the #z532 lattice is turned on to split the atom cloud into a stack of two-dimensional layers.
While the #z532 lattice provides a strong confinement along the #z-axis, it cannot trap the atoms due to its deconfinement in the #xy-plane.
The dipole trap is, therefore, only turned off when the infrared in-plane lattices are turned on to a lattice depth of #qty[6][Erec].
By matching the dipole-trap potential and the radial potential of the in-plane lattices, we can conserve the overall confinement during the adiabatic transfer into the optical lattices.
This is essential to minimize the heating of the atoms due to the redistribution of the density @wurz_quantum_2021.
A higher temperature of the atoms in the optical lattices would reduce the number of doubly-occupied sites.

When we work with the in-plane superlattice, we freeze the tunneling along the #y-axis by increasing the #y1064\-lattice depth to $Vy1064 >= #qty[20][Erec]$.
The resulting potential is an array of uncoupled one-dimensional lattices in each vertical layer.
We also increase the depth of the #x1064 lattice to #Vx1064 in preparation for the superlattice potential.
This freezes the atoms temporarily until the #x532 lattice is turned on.
The initial superlattice phase is far-detuned from $phi = 0$, in most cases we use an antisymmetric configuration ($phi = plus.minus pi slash 4$).
Any further changes to the lattice depths or the superlattice phase $phi$ depend on the specific measurements in @ch:mod and @ch:phase.


=== Detecting the atoms <ssec:setup-sequence-detect>

When all lattices are frozen after the experiment segment, the atoms are pinned to their lattice sites as indicated in @fig:setup-sequence.
Then, we change the magnetic field to $B approx #qty[210][G]$ where the atoms are almost non interacting in the #mix(9, 7) mixture.
During the detection segment, we prepare the atoms for the absorption imaging at the end of the sequence.
The imaging allows us to visualize the atomic density $n(x, y)$, which is the primary experimental data.


==== Radio-frequency sweeps <sssec:setup-sequence-detect-rf>

The rich hyperfine structure of #K40 shown in @fig:setup-k40-hfs is an essential tool for the detection of the atoms.
At a magnetic field of $B approx #qty[210][G]$, the energy difference between neighboring $m_F$ states is $Delta E slash h approx #qty[50][MHz]$, which is easily accessible with a radio-frequency field.
The different transitions in the $F = 9 slash 2$ hyperfine manifold are detuned by approximately #qty[2][MHz] from each other since the magnetic field $B$ is in the intermediate regime of the energy splitting of the $m_F$~states.
We can, therefore, use adiabatic Landau-Zener sweeps to achieve a robust state transfer.
The radio-frequency sweeps have a pulse width of $sigma_f = #qty[175][kHz]$, a pulse length of #qty[2][ms], and a rise- and fall-time of #qty[100][μs] to smoothen the pulse @cocchi_analogue_2016.
While the direction of the frequency sweeps does not matter for the transfer of an individual atom, we have to select the correct direction if the transfer changes the interaction energy of a pair of atoms.
Otherwise, the atom can be transferred to higher bands by the frequency sweep @miller_ultracold_2016.


==== HS1 pulses <sssec:setup-sequence-detect-hs1>

In the experimental sequence, we need a narrow radio-frequency pulse for the separation of the singly-occupied sites (singles) from the doubly-occupied sites (doubles) right at the start of the detection in @fig:setup-sequence.
The required frequency resolution is related to the interaction energy $U$, which is usually on the order of several #unit[kHz].
If the interaction energy changes during the transfer of one of the atoms, the corresponding resonance frequency for the transfer is detuned by $Delta U$ compared to the singly-occupied sites.
The regular radio-frequency pulses with a linear frequency sweep and a constant amplitude are not suitable for state transfers with a high frequency resolution.
We can achieve the required frequency resolution with an HS1 pulse where both the frequency and the amplitude are varied @garwood_return_2001.
The resulting pulse has a flat top in the frequency domain, which makes the transfer robust to fluctuations of the magnetic field.
With this pulse shape, we can achieve a #unit[kHz] resolution for the $m_F$ transitions @cocchi_analogue_2016 @miller_ultracold_2016.
For the separation of singles and doubles, we typically use a pulse width of $sigma_f = #qty[2][kHz]$ and a pulse length of #qty[7][ms].
Narrower pulses are possible at the expense of an increased sensitivity to fluctuations of the magnetic field @gall_quantum_2020 @wurz_quantum_2021.

If the atoms initially occupy the #mix(9, 7) mixture at the magnetic field $B approx #qty[210][G]$, the interaction energy is $U approx 0$.
With the HS1 pulse, the atoms in the state #mF(7) are transferred to the state #mF(5) where the mixture #mix(9, 5) is subject to strongly-repulsive interactions.
In total, the interactions introduce an energy shift of $Delta U = U_(95) - U_(97)$.
By increasing the center frequency to $f_"75" + Delta U slash h$, we can only target the atoms in the state #mF(7) on doubly-occupied sites while the singles remain in the state #mF(7).
The separation of singles and doubles allows us to image the corresponding atomic densities $n_S (x, y)$ and $n_D (x, y)$ individually.

Besides the singles-doubles separation, the HS1 pulse can also be used to transfer atoms in a single plane of the vertical lattice @gall_quantum_2020 @wurz_quantum_2021.
This technique requires a strong magnetic field gradient $phy.pdv(B_z, z, style: "horizontal")$ to change the resonant transition frequency as a function of the vertical position.
With the fast Feshbach coils in an anti-Helmholtz configuration, we can create a magnetic field gradient up to $phy.pdv(B_z, z, style: "horizontal") = #iqty[33.3][G/cm]$.
This results in a frequency difference of approximately #qty[640][Hz] between neighboring lattice planes.
Due to magnetic field noise, this detuning between the planes does not allow a reliable transfer of a single plane.
By initially loading the atoms into the #z1064 lattice, only every second plane of the #z532 lattice can be occupied.
With a frequency difference of #qty[1280][Hz] and a synchronization of the experimental sequence to the phase of the power line, a robust transfer of a single lattice plane is possible.
Just like the #z1064 lattice in @ssec:setup-lattices-z, the single-plane tomography is only mentioned here for the sake of completeness.
For the measurements presented in this thesis, we did not apply this technique and used the global signal of all lattice planes instead.


==== Microwave shelving <sssec:setup-sequence-detect-mw>

Just before the first atom image taken in @fig:setup-sequence, the singles in the $m_F$ state #mF(9) are shelved in the state $FmF(7/2, -7/2)$ in the upper hyperfine manifold (see #subref(<fig:setup-k40-hfs>, "b")).
For the transfer, we use a frequency sweep of a microwave field with the center frequency #box[$f_0 approx #qty[1.8][GHz]$] and the pulse width $sigma_f = #qty[2][MHz]$.
While the singles are shelved, the doubles in the $m_F$ state #mF(7) are transferred to the $m_F$ state #mF(9) and subsequently imaged.
The singles are then transferred back to the $m_F$ state #mF(9) for the second atom image.
This extra step in the detection is necessary to avoid a crosstalk between the two atom images @cocchi_analogue_2016 @miller_ultracold_2016.
If we would directly image the singles in the $m_F$ state #mF(9) without the shelving, the imaging pulse would also address a fraction of the doubles in the $m_F$ state #mF(7) due to the small detuning between the respective optical transitions.
By shelving the singles, we ensure that the $m_F$ state #mF(7) is always empty during the imaging pulses.
Transferring the doubles to the state in the upper manifold would result in an immediate atom loss.
The states $FmF(9/2, -5/2)$ and $FmF(7/2, -7/2)$ experience inelastic spin-exchange collisions where the excess energy is passed onto the atoms as kinetic energy.


==== Saturated absorption imaging <ssec:setup-sequence-detect-imaging>

At the end of an experimental sequence, we use absorption imaging to measure the integrated density distribution $n(x, y)$ of the atoms along the #z-axis#footnote[
  There are additional imaging systems along the #x-axis and the #y-axis, which are mainly used for calibration measurements now. The corresponding setups and previous use cases are presented in @feld_low_2011 @frohlich_strongly_2011 and @cocchi_analogue_2016 @miller_ultracold_2016
].
The setup and characterization of the #z-axis imaging system are presented in detail in @cocchi_analogue_2016 @miller_ultracold_2016.
Here, I will only summarize the important properties of the imaging system and show how the atomic densities $n(x, y)$ are computed from the raw images.

The #z-axis imaging system uses an aspheric lens mounted above the atoms inside the glass cell with the focal length $f = #qty[8][mm]$ and the numerical aperture $"NA" = 0.5$.
A second lens with $f = #qty[200][mm]$ and a $1:1$ relay are then used to image the atom plane onto a CCD camera#footnote[
  Andor iXon Ultra 888
].
The measured magnification is $M = #num[22.7(1)]$, resulting in a pixel size of $d_"px" approx #qty[0.57][μm]$ in the atom plane.
While this is close to the lattice periods $ax1064 = ay1064 approx #qty[0.532][μm]$, the actual imaging resolution is significantly worse.
From the Fourier transformation of the modulation transfer function @hung_extracting_2011, the size (HWHM) of the point spread function was determined as #qty[1.25][μm] @drewes_thermodynamics_2020.
Therefore, we always measure the atomic density $n(x, y)$ averaged across a few lattice sites.
This is a critical limitation regarding the occupation of the individual sites in the superlattice potential (see @sec:phase-measure).

The frequency of the imaging pulses is resonant with the cooling transition in #subref(<fig:setup-k40-hfs>, "a") to excite the atoms from the state $FmF(9/2, -9/2)$ to the state $FmF(11/2, -11/2, prime: #true)$.
We can use three consecutive imaging pulses to measure two different atom images and one bright image, as illustrated in @fig:setup-sequence.
The light pulses are captured with the CCD camera in fast-kinetics mode to enable a short readout time.
The absorption by the atoms reduces the photon count in the resonant imaging pulses according to Beer's law @foot_atomic_2005.
We then compute the optical density of the atoms with the expression

$
  "OD"(x, y) = sigma_0 dot n(x, y) = -ln((I_"atom" (x, y)) / (I_"bright" (x, y))) eqc
$ <eq:setup-sequence-detect-imaging-od>

where $I_"atom" (x, y)$ and $I_"bright" (x, y)$ are the atom and bright image respectively.
The atomic density $n(x, y)$ is related to the optical density by the scattering cross section $sigma_0$ of the photon absorption.
However, if the atom cloud is dense, the atom image $I_"atom" (x, y)$ has a low photon count, which limits the signal-to-noise ratio of the atomic density $n(x, y)$.
Therefore, we use short imaging pulses with a high intensity to saturate the imaging transition @reinaudi_strong_2007.
While the atoms are in the excited state, they cannot absorb more photons from the imaging pulse.
With the optimal parameters, this reduces the measured optical density $"OD"(x, y)$ to a regime with a good signal-to-noise ratio.
Computing the atomic density $n(x, y)$ from the measured optical density requires an elaborate calibration of the imaging system and the parameters of the imaging pulse @chomaz_coherence_2014.
This calibration procedure is explained in detail in @cocchi_analogue_2016 @miller_ultracold_2016.
Once calibrated, the evaluation can be applied to all images with the same parameters of the imaging pulses.
Instead of @eq:setup-sequence-detect-imaging-od, we use the expression

$
  "OD"(x, y) = sigma_0 dot n(x, y) = -alpha ln((I_"atom" (x, y)) / (I_"bright" (x, y))) + (I_"bright" (x, y) - I_"atom" (x, y)) / I_0^"sat" eqc
$ <eq:setup-sequence-detect-imaging-saturated-od>

where the second term takes the saturation of the imaging transition into account, and the deviations from an ideal two-level system are captured by the parameter $alpha$.

In a typical experimental sequence, we use in-situ imaging to measure the atomic density $n(x, y)$ in the frozen lattices.
If we need to separate the singles and doubles, we follow the detection segment in @fig:setup-sequence and capture two atom images followed by the bright image.
For the measurements in @ch:mod and @ch:phase with a spin-polarized atom cloud, we only measure an atomic density in the first image.
Since the second atom image is empty, we can significantly simplify the detection segment.
The microwave shelving is no longer required and some of the radio-frequency pulses can be removed.
The typical atomic density $n(x, y)$ of the spin-polarized atom cloud is shown in @fig:mod-intro-images and @fig:phase-measure-gradient-vertical.

An alternative to the in-situ imaging of the atoms is the time-of-flight technique where the atoms are released from the optical lattices shortly before the first imaging pulse.
By turning off the optical lattices on an appropriate timescale, the quasimomenta $q$ in the bands $n$ are mapped to their corresponding free-particle momentum @kohl_fermionic_2005.
This technique allows us to measure the occupation of the higher bands in the lattice potential and in the superlattice potential, at the expense of the spatial resolution of the atomic densities.
Since the atoms are no longer confined by the optical lattices, we are limited to a single atom image with the time-of-flight technique in the #z-axis imaging system#footnote[
  With the imaging systems along the #x-axis or the #y-axis, multiple $m_F$ can be captured in a single image if they are spatially separated by a gradient magnetic field @feld_low_2011 @frohlich_strongly_2011
].
In @fig:setup-sequence-imaging-tof a time-of-flight image is shown where the atoms occupy the $1^"st"$, $3^"rd"$ and $4^"th"$ Brillouin zone along the #x-axis.
The atoms in the $1^"st"$ Brillouin zone occupied the band $n = 1$, while the other atoms occupied the excited bands $n = 3$ and $n = 4$, respectively.
This is an essential measurement in the superlattice potential to infer the population of the left and right lattice sites in each double well (see @ssec:phase-measure-detect).

#floating-figure(
  figure-imaging-tof(),
  caption: [
    Band mapping and time-of-flight imaging.
    The optical lattices are turned off in #qty[1][ms] to map the band index $n$ to the corresponding Brillouin zone.
    The expansion time is only $tau_"TOF" = #qty[6][ms]$ to allow a measurement up the $4^"th"$ Brillouin zone along the #x-axis.
    Since the width of the camera sensor is nearly maxed out, a longer expansion time would further reduce the maximal band index $n$ we can detect.
    Along the #y-axis, we can only measure up to the $2^"nd"$ Brillouin zone.
  ],
  label: <fig:setup-sequence-imaging-tof>,
)



