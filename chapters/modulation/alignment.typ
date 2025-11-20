#import "/header.typ": *
#import "figures/alignment_x1064_vertical/figure.typ": figure as figure-alignment-x1064-vertical
#import "figures/alignment_x1064_walking/figure.typ": figure as figure-alignment-x1064-walking
#import "figures/alignment_z532_left_right/figure.typ": figure as figure-alignment-z532-left-right
#import "figures/alignment_z532_up_down/figure.typ": figure as figure-alignment-z532-up-down

== Improving the alignment procedure <sec:mod-align>

The in-situ #lms is the essential tool for the alignment of the lattice beams.
The direct feedback from the atoms about the local lattice depth significantly improves all steps of the lattice-alignment procedure#footnote[
  Without the in-situ resolution of the lattice depth, the alignment is based on the radial confinement of the optical lattice potentials.
  To confirm the alignment, we have to run the calibration measurement with the time-of-flight detection to check the actual lattice depth.
].
The position of the resonances reveals changes of the lattice depth from sequence to sequence.
Additionally, the in-situ calibration technique has a better resolution than the previous calibration technique based on the time-of-flight detection (see @sec:mod-eval).
We are, therefore, able to reliably find the optimal alignment of the lattices, which makes the alignment more robust against temporal drifts of the lattice beams.

=== Alignment of the in-plane lattices <ssec:mod-align-x1064>

The similarity of the #x1064 lattice and the #y1064 lattice extends to their respective alignment procedures.
Both lattices potentials are red detuned and use a standing-wave configuration.
The lattice beams have the waists $wx1064 approx #qty[140][μm]$ and $wy1064 approx #qty[160][μm]$ respectively (c.f. @tab:mod-eval-results).
For the alignment of the #retro beams, both lattices have a motorized mirror mount#footnote[
  Newport Agilis AG-M100N
] to hold the retro mirror.
In the optical setup of the #x1064 lattice, the same type of motorized mirror mount is also used for the alignment of the #forward beam (see @sec:super-setup).
This allows a complex alignment optimization where we walk the #x1064\-lattice beams with the two motorized mirror mounts.
Therefore, I will only discuss the alignment of the #x1064 lattice in this subsection.
The same procedure could be applied to the #y1064 lattice with the necessary hardware in place to control the lattice beams.

To start the alignment procedure of the #x1064 lattice, we only use the #forward beam.
The #retro beam is blocked just in front of the retro mirror, and the #y1064 lattice is turned off.
We align the horizontal position of the #forward beam such that the atom cloud is centered at $y = 0$ in the camera frame.
After unblocking the #retro beam, we center the atom cloud with the position of the #retro beam to finish the horizontal alignment of the #x1064 lattice.
The accuracy of the horizontal alignment is limited to $delta y tilde.eq #qty[1][μm]$ by the shot-to-shot fluctuations of the atom-cloud position.

We cannot apply the same procedure for the vertical alignment of the #x1064 lattice, since the #z-axis imaging system shows the integrated atomic density.
A direct measurement of the vertical lattice position is, therefore, not possible#footnote[
  The additional imaging systems along the #x-axis and #y-axis do not have the required magnification.
].
Additionally, the vertical position of the atom cloud is pinned by either the horizontal dipole trap or the #z532 lattice.
As a result of this vertical confinement, the vertical alignment of the #x1064 lattice does not affect the vertical position of the atom cloud.
With the in-situ #lms, we overcome this limitation by directly optimizing the alignment with the lattice depth.
If the #forward beam and the #retro beam are centered on the vertical position of the atom cloud, we measure the maximal lattice depth.
Instead of running the full calibration measurement as shown in @fig:mod-intro-images, it is sufficient to use a single modulation frequency #fmod.
The corresponding optimization of the #forward beam is shown in @fig:mod-align-x1064-forward.
We start with a modulation frequency #fmod where the resonances are close to the center of the atom cloud.
The resonances move towards the edge of the atom cloud as we optimize the lattice depth.
When we reach the resonance position in #subref(<fig:mod-align-x1064-forward>, "d"), we increase the modulation frequency by a few #unit[kHz] to continue the optimization with the resonances near the center again.
The vertical position of the #forward beam is optimized when the resonances do not move anymore.
We follow the same steps for the vertical alignment of the #retro beam to determine the local optimum of the vertical alignment.

#floating-figure(
  figure-alignment-x1064-vertical(),
  caption: [
    Optimization of the #x1064\-lattice depth at a constant modulation frequency.
    The atomic densities show the resonances of the in-situ #lms at the modulation frequency $fmod = #qty[110][kHz]$.
    From *a* to *d*, the vertical position of the forward-propagating #x1064\-lattice beam is changed in equal steps.
    The lattice depth is set to $Vx1064 = #qty[55][Erec]$ where the expected transition frequency in the center of the optical lattice is $fnm(1, 3) = #qty[115.7][kHz]$.
  ],
  label: <fig:mod-align-x1064-forward>,
)

To find the global optimum, we walk the #forward beam and the #retro beam with the motorized mirror mounts.
We can control the motorized mirror mounts through variables in the experimental sequence to make the measurement fully autonomous.
To overcome the hysteresis of the motorized mirror mounts, we track the beam positions during the measurement with two cameras (see @fig:super-setup).
The concept behind the optimization of the vertical lattice alignment is based on the inhomogeneity of the lattice depth $V0(x, y, z)$, even though the atomic densities $n(x, y)$ show the integrated signal of the individual lattice planes.
If the lattice depth $V0(x, y, z)$ does not change between the lattice planes, the resonances have the maximum contrast.
On the other hand, a variation of the lattice depth along the #z-axis results in broader resonances.
The optimal alignment of the lattice beams is, therefore, achieved when both the lattice depth and the resonance contrast are optimized.
We use the calibration factor #fita0 and the ratio $fitaR slash fitsR$ respectively to quantify these two parameters.
The optimization of the vertical lattice alignment by walking the #forward beam against the #retro beam is illustrated in @fig:mod-align-x1064-walking.
The calibration factor #fita0 shows a local maximum when either lattice beam is centered on the atoms.
For the position of the #retro beam, we find this to be at $zret approx #qty[0][μm]$.
The global maximum of the calibration factor #fita0 is achieved when the position of the #forward beam shows the best resonance contrast.
Here, the global optimum of the vertical lattice alignment is realized when the lattice beams have the positions $zfwd approx #qty[3.5][μm]$ and $zret approx #qty[0][μm]$.
With an estimated uncertainty of $delta z tilde.eq #qty[1][μm]$, the precision of the vertical lattice alignment is on par with the horizontal lattice alignment.
Compared to the former alignment procedure @miller_ultracold_2016, this is an improvement by one order of magnitude.
While the possible improvement of the lattice depth (see #subref(<fig:mod-align-x1064-walking>, "b")) is small compared to the simple optimization in @fig:mod-align-x1064-forward, the new alignment procedure makes the lattice alignment significantly more robust to temporal drifts of the lattice beams.
We can, therefore, operate the optical lattices for longer times without a relevant decrease of the lattice depth $V0(x, y)$.

#floating-figure(
  figure-alignment-x1064-walking(),
  caption: [
    Optimization of the vertical #x1064\-lattice alignment.
    *a*, Optimal position of the #retro beam as a function of the #forward beam position.
    The optimal beam position according to the calibration factor #fita0 is always at $zret approx #qty[0][μm]$ where the #retro beam is centered on the atom cloud.
    The resonance contrast $fitaR slash fitsR$ shows the optimal alignment when both lattice beams overlap.
    Based on the intersection of the optimal positions according to the different parameters, we find the global optimum at $zfwd approx #qty[3.5][μm]$ and $zret approx #qty[0][μm]$.
    The insets show the resonances in the atomic densities at the modulation frequency $fmod = #qty[118.0][kHz]$ to highlight the differences of the lattice depth and the resonance contrast.
    *b*, Maximal calibration factor as a function of the #forward beam position.
    The global optimum $zfwd approx #qty[3.5][μm]$ (*a*) agrees with the largest calibration factor #fita0.
    *c* - *e*, Individual results of the lattice calibration as a function of the #retro beam position.
    The maximum of the calibration factor (blue) is always at $zret approx #qty[0][μm]$, while the maximum of the resonance contrast (orange) depends on the #forward beam position.
    For all measurements, the modulation parameters are $Vx1064 = #qty[60][Erec]$, $tau_"mod" = #qty[0.75][s]$ and $dV slash Vx1064 = #tr(qty[3][%])$.

    // TODO: Already introduce the resonance contrast somewhere else?
    // TODO: Add colors for the y-label of *c* to *e*.
  ],
  label: <fig:mod-align-x1064-walking>,
)


=== Alignment of the vertical lattices <ssec:mod-align-z532>

The alignment of the vertical lattice differs from the alignment of the in-plane lattices introduced in @ssec:mod-align-x1064.
The shallow-angle configuration allows an isolated alignment of the individual lattice beams.
However, with the #z532 lattice we cannot use the position of the atom cloud for the alignment due to the blue detuning that results in a repulsive dipole potential#footnote[
  This is possible with the #z1064 lattice, making the alignment procedure much easier than for the #z532 lattice.
].
Instead, we have to use the optical dipole trap (see @sec:setup-prepare-dipole) to weakly confine the atoms along the #x-axis.
The individual #z532\-lattice beams create a gap in the atom cloud around their respective beam positions.
The precision of this technique is worse by at least one order of magnitude compared to the alignment of the in-plane lattices in @ssec:mod-align-x1064.
Furthermore, it relies on the perfect alignment of the optical dipole trap for a correct interpretation of the gap in the atom loud.
Therefore, we only use this signal for the relative alignment of the individual #z532\-lattice beams.

Using the in-situ #lms, we can resolve position of the lattice depth $Vz532(x, y)$ with the precision $delta x tilde.eq #qty[1][μm]$ along the #x-axis.
Since the resonances are symmetric around the center of the lattice potential, we can read the lattice position from the position of the resonances.
The images in @fig:mod-align-z532-left-right show the typical alignment procedure to center the resonances around $x = 0$.
We can only move the lattice potential with a mechanical mirror mount, which is the main limitation of the #z532\-lattice alignment procedure#footnote[
  A fast and reliable alignment with the precision of the in-situ #lms would require motorized mirror mounts and cameras to track the lattice-beam positions.
].
For the alignment of the #z532 lattice along the #y-axis, we use the onset of the ellipticity of the resonances.
Due to the shallow-angle configuration, the equipotential lines of the lattice potential have an elliptical shape with the aspect ratio $1 : 4$ (see @sec:mod-eval).
If the lattice potential $Vz532(x, y)$ is centered at $y = 0$, the resonances are parallel.
@fig:mod-align-z532-up-down shows the typical series of images to optimize the lattice position along the #y-axis.
The alignment procedure is again limited by the mechanical mirror mount, and we estimate the precision of the optimized position along the #y-axis to be $delta y tilde.eq #qty[10][μm]$.

#floating-figure(
  figure-alignment-z532-left-right(),
  caption: [
    Optimization of the #z532\-lattice position along the #x-axis.
    *a*, Initial position of the #z532 lattice after the alignment of the individual lattice beams.
    We optimize the #z532\-lattice position until the resonances are centered around $x = 0$ (*d*).
    The atom cloud always moves in the opposite direction of the resonances because of the deconfinement by the radial potential of the #z532 lattice.
    For all images, the setpoint of the lattice depth is $Vz532 = #qty[100][Erec]$ and the modulation frequency is $fmod = #qty[80][kHz]$.
  ],
  label: <fig:mod-align-z532-left-right>,
)

#floating-figure(
  figure-alignment-z532-up-down(),
  caption: [
    Optimization of the #z532\-lattice position along the #y-axis.
    *a*, Initial position of the #z532 lattice after the alignment along the #x-axis (see #subref(<fig:mod-align-z532-up-down>, "d")).
    We move the #z532\-lattice potential along the #y-axis until the resonances are parallel (*d*).
    The atom cloud does not move because the deconfinement by the radial potential of the #z532 lattice is negligible compared to the confinement of the #x1064 lattice.
    For all images, the setpoint of the lattice depth is $Vz532 = #qty[100][Erec]$ and the modulation frequency is $fmod = #qty[80][kHz]$.
  ],
  label: <fig:mod-align-z532-up-down>,
)
