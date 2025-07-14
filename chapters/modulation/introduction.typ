#import "/header.typ": *

== Introduction to lattice-modulation spectroscopy <sec:mod-intro>

#notes[
  #set text(red)
  - Better title "theory of lattice modulation spectroscopy"?
  - Make a strong argument that we are modulating in the Wannier basis?
  - Add a sketch for the sequence?
  - Already tease the loss mechanism here?
  - Really use $V_0$ for the setpoint?
  - Mention _how_ exactly the modulation is applied? Function generator -> AOM
]

The idea behind the lattice-modulation spectroscopy is to probe the band structure by exciting atoms to higher bands #tr[cite something].
By modulating the lattice potential, a small overlap between the Bloch waves in different bands is created.
In this thesis, we apply the modulation to the lattice depth $V_0$ to get the time-dependent lattice potential

$
  V(tau) = V_0 + delta V dot sin(2 pi f_"mod" tau)
$ <eq:mod-intro-function>

with the modulation amplitude $delta V$ and the modulation frequency $f_"mod"$.
This type of modulation is the most common one for the calibration of the lattice depth.
The other type of modulation in monochromatic lattices targets the lattice position instead by shaking the potential along the lattice vector $phy.vb(k)$ #tr[cite what?].
In superlattice potentials there are even more modulation options since there are two lattices depths $V_l$ and $V_s$ and the superlattice phase $phi$ that can be tuned.
This allows complex measurements beyond the calibration of the lattice depths #tr[cite PhD Carla and ref the Floquet sections].

If we compare the two different modulation types for monochromatic lattices, we find that they have opposite parities.
The modulation of the lattice depth according to @eq:mod-intro-function is _even_ while the modulation of the lattice position is _odd_.
Since the excitation to a higher band requires a finite overlap of the respective wave functions, the parity of the modulation determines the allowed band transitions $n -> n'$.
In #subref(<fig:mod-intro-theory>, "a") we can see that the parity $cal(P)$ of the Bloch waves at $q = 0$ on a single lattice site alternates with the band index $n$.
When the modulation has an even parity, only the band transitions with $Delta n = n' - n = 2, 4, ...$ are therefore allowed.
Since the parity of the Bloch waves does not change as a function of the quasimomentum $q$, we can draw the same conclusion for the Wannier functions.
In practice, band transitions with $Delta n = 1, 3, ...$ can be allowed for an even-parity modulation if the optical lattice has a running-wave component.
This is discussed in detail in @sec:mod-loss where we compare the x1064 lattice to the z532 lattice.

Besides the parity of the wave functions, the width of the excited band $n'$ is also important for the selection of the transition $n -> n'$.
After the loading into the optical lattices, the atoms will initially occupy most quasimomentum states $q$ in the lowest band $n = 1$.
We always have to take the entire excited band $epsilon_n' (q)$ into account, since we pass on the quasimomentum resolution in favor of the local measurement of the lattice depth.
We consider the excited band to be sufficiently narrow if its width is negligible relative to the modulation frequency $f_"mod"$ and the expected change thereof across the atom cloud.
If this condition is not fulfilled, the reliability of the evaluation of the local signals in the atom cloud will be limited.
There is no universal function to quantify the maximally allowed width of the excited band.
We have to check this individually based on the transition $n -> n'$ and the lattice that is modulated, the maximally available lattice depth also plays a role in the decision.
Based on the widths of the bands shown in #subref(<fig:mod-intro-theory>, "b"), the band $n' = 3$ is a suitable candidate for lattice depths $V > #qty[40][Erec]$.
For lower lattice depths, the band width would already start to limit the evaluation.

#floating-figure(
  image("figures/modulation_introduction.png"),
  caption: [
    Properties of the energy bands for the lattice-modulation spectroscopy.
    *a* shows an optical lattice with a depth of $V = #qty[60][Erec]$ and the resulting energy bands from $n = 1$ to $n = 5$.
    The solid lines show the corresponding Bloch waves at $q = 0$ shifted by the mean band energies $epsilon_n (q)$.
    Only the real part is shown for an odd $n$, and only the imaginary part is shown for an even $n$.
    Starting with an even parity of the lowest band, the parity alternates with the band index $n$.
    *b* shows how the width of the energy bands changes as a function of the lattice depth $V$.
    The diagonal line indicates when the bands are initially trapped, which is however not sufficiently narrow for the lattice-modulation spectroscopy yet.

    #notes[
      - Use annotations instead of the legend?
      - Really mention "trapped" bands?
      - Add band $n = 6$ for the reference in @sec:mod-loss?
    ]
  ],
  label: <fig:mod-intro-theory>,
)

The experimental sequence to measure the in-situ lattice modulation spectroscopy is based on the default sequence #tr[ref setup].
After the atoms are loaded into the shallow in-plane lattices, both lattices are frozen to pin the atoms to their lattice sites.
We then use an imaging pulse to remove the atoms in the hyperfine state $phy.ket(m_F = -9 slash 2)$ from the lattice potential, resulting in a polarized atom cloud.
The remaining atoms are transferred to the state $phy.ket(m_F = -9 slash 2)$ in preparation for the imaging.
In the experimental sequence we can set the lattice depth $V$, the modulation amplitude $delta V$, the modulation frequency $f_"mod"$ and the modulation time $tau_"mod"$.
Based on the modulated lattice, we apply the modulation for up to $tau_"mod" = #qty[1][s]$ with a relative amplitude $delta V slash V$ between #qty[1][%] and #qty[10][%].
The depths of the other lattices are selected to maximize the signal strength, and to minimize the coupling between the lattices as shown in @sec:mod-coupled.
The modulation according to @eq:mod-intro-function is applied to the amplitude of the radio-frequency signal that drives the acousto-optic modulator we use for the power stabilization.
The band width of the power stabilization is lower than the possible modulation frequencies $f_"mod"$ for all available lattices.
Even for the largest modulation amplitude, the setpoint $V$ of the lattice depth therefore remains constant.

For the infrared in-plane lattices we are using a lattice depth of $V = #qty[60][Erec]$.
With $#unit[Erec] slash h = #qty[4.405][kHz]$, the maximum modulation frequency is $f_"mod" approx #qty[122][kHz]$ and the frequency width is only $Delta f = Delta epsilon_n slash h approx #qty[0.17][kHz]$.
Based on the waists of the x1064 lattice and the y1064 lattice, we expect the local modulation frequency to change by $delta f_"mod" approx #qty[5][kHz]$ across the atom cloud.
The band width is therefore negligible relative to $f_"mod"$ as well as $delta f_"mod"$.
While the modulated lattice has a depth of #qty[60][Erec], we set the opposite in-plane lattice to a depth of #qty[30][Erec] to reduce the coupling between the two lattices.
The z532-lattice depth does not affect the measurement of the in-plane lattices, and we select the maximum depth of $Vz532 = #qty[100][Erec]$.

With a constant modulation time, we select the modulation amplitude $delta V$ based on the visibility of the resonances.
The resonances should be resolvable in the atom images by eye, but they should not saturate.
This leaves a wide range of modulation amplitudes that yield consistent results for the lattice parameters.
For the x1064 lattice we find that $delta V slash V approx #tr[#qty[3][%]]$ is a suitable modulation amplitude.
We then scan the modulation frequency in the expected range based on the local lattice depths.
The resulting series of atom images for such a measurement with the x1064 lattice is shown in @fig:mod-intro-images.
For the lowest modulation frequency of #qty[118.0][kHz] we can see narrow resonances near the edge of the atom cloud.
These resonances move towards the center with increasing step sizes as the modulation frequency is incremented in steps of #qty[0.5][kHz].
The inhomogeneity of the lattice depth also causes the resonances to broaden near the center.
Both effects follow the expected behavior of the intensity profile of the Gaussian lattice beams.

When we look at the single resonance in #subref(<fig:mod-intro-images>, [i]), we could argue that it is sufficient to determine the lattice depth in the center from the modulation frequency of #qty[122.0][kHz].
The corresponding lattice depth is $fita0 dot V_0 approx #qty[60.3][Erec]$ which would result in the correction factor $fita0 approx #num[1.005]$.
Such a simple evaluation would always result in a systematic error since we cannot reliably infer the center frequency of a single resonance in position space.
In a measurement such as shown in @fig:mod-intro-images, there can be images at multiple frequencies that only show a single resonance with different contrasts.
For a reliable evaluation, we are therefore using all images together with their modulation frequencies.
Besides the maximum lattice depth, we will also get the waist of the underlying Gaussian beams and the lattice position in the $x y$ plane.

#floating-figure(
  image("figures/modulation_x1064-images.png"),
  caption: [
    In-situ lattice modulation spectroscopy of the x1064 lattice.
    For this measurement the lattice depth was set to $Vx1064 = #qty[60][Erec]$, the modulation time was set to $tau_"mod" = #qty[0.75][s]$ and the modulation amplitude was set to $delta V slash Vx1064 = #tr[#qty[3][%]]$.
    We scanned the modulation frequency from #qty[118.0][kHz] in *a* to #qty[122.5][kHz] in *j* in steps of #qty[0.5][kHz].
    For the transition $1 -> 3$, the resonance frequency in the center of the lattice is expected to be #qty[121.6][kHz], which is between the images *h* and *i*.
    The angle of the resonances in the $x y$ plane matches the expected angle of the optical axis of the x1064 lattice relative to the camera frame.

    #notes[
      - Use #unit[μm] or #unit[_a_] as the unit here or keep #unit[px]?
      - Remove the colorbar?
      - Use a different colormap?
    ]
  ],
  label: <fig:mod-intro-images>,
)
