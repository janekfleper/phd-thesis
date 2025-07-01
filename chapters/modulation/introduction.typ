#import "/header.typ": *

== Introduction to lattice modulation spectroscopy <sec:mod-intro>

#[
  #set text(red)
  - Better title "theory of lattice modulation spectroscopy"?
  - Mention modulation amplitude and length of modulation? With reference to the optimization section.
  - Make a strong argument that we are modulating in the Wannier basis?
  - Add a sketch for the sequence?
  - Already tease the loss mechanism here?
]

The idea behind #tr[(the)] lattice modulation spectroscopy is to probe the band structure by exciting atoms to higher bands #tr[ref what?].
By modulating the lattice potential a small overlap between the wave functions in different bands is created.
If the modulation is then resonant to the energy difference between the bands, the atoms can be excited to the higher band.
In this thesis the modulation is always applied to the lattice depth $v$.
We can therefore write the time-dependent lattice potential as

$
  v(tau) = v_0 + delta v dot sin(2 pi f_"mod" tau)
$ <eq:mod-intro-function>

with the modulation amplitude $delta v$ and the modulation frequency $f_"mod"$.
This type of modulation is also the most common one for the calibration of the lattice depth.
The other type of modulation in monochromatic lattices targets the lattice position instead by #tr[shaking] the potential along the lattice vector #tr[$phy.vb(k)$] #tr[ref what?].
In superlattices there are even more modulation options since there are two lattices amplitudes $v_l$ and $v_s$ and the superlattice phase $phi$ that can be tuned.
This allows complex measurements beyond the calibration of the lattice depths #tr[ref PhD Carla and the Floquet sections?].

If we compare the two different modulation types for monochromatic lattices, we find that they have opposite parities.
The modulation of the lattice depth according to @eq:mod-intro-function is _even_ while the modulation of the lattice position is _odd_.
Since the excitation to a higher band requires a finite overlap of the respective wave functions, the parity of the modulation has important implications on the allowed band transitions $n -> n'$ #tr[ref any textbook here?].
In @fig:mod-intro-theory we can see that the parity $cal(P)$ of the Bloch waves at $q = 0$ on a single lattice site alternates with the band index $n$.
The parity of the Bloch waves does not change as a function of the quasimomentum $q$, resulting in the Wannier functions #tr[inheriting] the parity from the Bloch waves.
When the modulation has an even parity, only the transitions with $Delta n = n' - n = 2, 4, ...$ are therefore allowed.
In practice, transitions with $Delta n = 1, 3, ...$ can be allowed for an even-parity modulation if the optical lattice has a running-wave component #tr[ref theory or radial potential section?].
This is discussed in detail in #tr[@sec:mod-loss] where we compare the x1064 lattice to the z532 lattice.

Besides the parity of the Bloch waves, the width of the higher energy band $n'$ is also important for the selection of the transition $n -> n'$ #tr[mention the lower energy band?].
We always have to take the entire energy band into account since we pass on the quasimomentum resolution in favor of the local measurement of the lattice depth.
The atoms will initially occupy most quasimomentum states $q$ in the lowest band #tr[mention this?].
We consider the #tr[excited/higher] band to be #tr[(sufficiently)] narrow if its width is negligible relative to the modulation frequency $f_"mod"$ and the expected change thereof across the atom cloud.
If this condition is not fulfilled, the accuracy of the evaluation of the local signals in the atom cloud will be limited.
There is no #tr[universal] function to quantiy the maximally allowed with of the #tr[higher/upper/excited] band.
We have to check this individually based on the transition $n -> n'$ and the lattice that is #tr[probed/measured].
The maximally available lattice depth also plays a role in the decision.
Based on the widths of the bands shown in @fig:mod-intro-theory, the band $n' = 3$ looks like a suitable candidate for lattice depths $V > #qty[50][Erec]$.
#tr[Really mention this?]
If we could only reach a depth of #qty[40][Erec] with a specific lattice, it would still make sense to attempt the in-situ lattice modulation spectroscopy.
At lattice depths of $V < #qty[30][Erec]$, on the other hand, the band width would #tr[(severely)] limit the evaluation.

#figure(
  image("figures/modulation_introduction.png"),
  caption: [
    Properties of the energy bands for the lattice modulation spectroscopy.
    The figure on the left shows an optical lattice with a depth of $V_0 = #qty[60][Erec]$ and the resulting energy bands from $n = 1$ to $n = 5$.
    The solid (dashed) lines show the real (imaginary) parts of the corresponding Bloch waves at $q = 0$ shifted by the band energies $epsilon_n (q=0)$.
    Starting with an even parity of the lowest band, the parity alternates with the band index $n$.
    The figure on the right shows how the width of the energy bands changes as a function of the lattice depth #tr[$V_0$].
    The diagonal line indicates when the bands are initially #tr[_trapped_] which is however not sufficiently narrow for the lattice modulation spectroscopy yet.

    #show list: set text(red)
    - Somehow also show $epsilon_n$ as a function of $q$ here?
    - Also show some higher bands $n > 5$?
    - Use *a* and *b* here for the subfigures?
    - How to handle the real and imaginary parts of the Bloch waves? Just make all Bloch waves real?
    - What should the legend look like here?
    - Use semilogy for the figure on the right?
    - Mention "trapped" bands?
  ],
) <fig:mod-intro-theory>

The experimental sequence to measure the in-situ lattice modulation spectroscopy is based on the default sequence #tr[ref setup].
After the atoms are loaded into the shallow x1064 lattice and the y1064 lattice, both lattices are frozen.
We then use an imaging pulse to #tr[_clean_] the atoms in the hyperfine state $phy.ket(m_F = -9 slash 2)$, resulting in a polarized atom cloud.
The remaining atoms are transferred to the state $phy.ket(m_F = -9 slash 2)$ in preparation for the imaging.
The modulation in @eq:mod-intro-function is always applied to a #tr[single/specific] lattice by modulating the amplitude of the radio-frequency signal that drives the acousto-optic modulator #tr[go into this much detail?].
The amplitudes of the #tr[other/non-modulated] lattices are selected to maximize the signal strength (see #tr[ref z532]) and to minimize the coupling between the lattices (see #tr[ref @sec:mod-coupled]).
In the experimental sequence we can #tr[control/set] the modulation amplitude $delta v$, modulation frequency $f_"mod"$ and the modulation time $tau_"mod"$.
Based on the #tr[probed/targeted] lattice we apply the modulation for up to $tau_"mod" = #qty[1][s]$ with a relative amplitude $delta v slash v_0$ between #qty[1][%] and #qty[10][%].
The band width of the power stabilization is lower than the possible modulation frequencies $f_"mod"$ for all available lattices.
Even for the largest modulation amplitude the setpoint $v_0$ of the lattice depth therefore remains constant.

#tr[Add a transition here?]
For the infrared in-plane lattices we are #tr[(usually)] using a lattice depth of $V = #qty[60][Erec]$.
With $#unit[Erec] slash h = #qty[4.405][kHz]$ the maximum modulation frequency is $f_"mod" approx #qty[122][kHz]$ and the frequency width is only $Delta f = Delta epsilon_n slash h approx #qty[0.17][kHz]$.
Based on the waists of the x1064 lattice and the y1064 lattice, we expect the local modulation frequency to change by $delta f_"mod" approx #qty[5][kHz]$ across the atom cloud.
The band width is therefore negligible relative to $f_"mod"$ as well as $delta f_"mod"$.
While the modulated lattice has a depth of #qty[60][Erec], we set the #tr[other/perpendicular] lattice to a depth of #qty[30][Erec].
This reduces the coupling between the two lattices, see @sec:mod-coupled for the detailed investigation.
The z532 lattice is set to its maximum depth of #qty[100][Erec] #tr[really mention this lattice?].

With a #tr[constant/fixed] modulation time we select the modulation amplitude $delta v$ based on the #tr[contrast/visibility] of the resonances.
The resonances should be resolvable #tr[by eye] in the atom images, but they should not #tr[saturate].
This leaves a wide range of modulation amplitudes that yield consistent results for the lattice parameters #tr[actually show this later?].
For the x1064 lattice we find that $delta v slash v_0 approx #tr[#qty[3][%]]$ is a suitable modulation amplitude.
We then scan the modulation frequency in the expected range based on the local lattice depths.
The resulting series of atom images for such a measurement #tr[for/with] the x1064 lattice are shown in @fig:mod-intro-images.
For the lowest modulation frequency of #qty[118.0][kHz] we can see narrow resonances near the edge of the atom cloud.
These resonances move towards the center with increasing step sizes as the modulation frequency is increased.
The inhomogeneity of the lattice depth also causes the resonances to become #tr[broader/wider] near the center.
Both effects follow the expected behavior of the intensity profile of a gaussian beam.

When we look at the single resonance in #subref(<fig:mod-intro-images>, [i]), we could argue that it is sufficient to determine the lattice depth in the center from the modulation frequency of #qty[122.0][kHz].
The corresponding lattice depth is $approx #qty[60.3][Erec]$ which would result in the correction factor $fita0 approx #num[1.005]$ relative to the setpoint of $v_0 = #qty[60][Erec]$.
Such a simple evaluation would always result in a systematic error since we cannot realiably infer the center of a single resonance in frequency space.
In a measurement such as shown in @fig:mod-intro-images, there can be images at multiple frequencies that only show a single resonance with different contrasts.
For a reliable evaluation we are therefore using all images together with their modulation frequencies.
Besides the maximum lattice depth, we will also get the waist of the underlying gaussian beams and the lattice position in the $x y$ plane from this evaluation.
The details of this evaluation are presented in the next @sec:mod-eval.
#tr[Really ref the next section here?]

#figure(
  image("figures/modulation_x1064-images.png"),
  caption: [
    In-situ lattice modulation spectroscopy #tr[of/with] the x1064 lattice.
    For this measurement the lattice depth was set to $v_0 = #qty[60][Erec]$, the modulation time was set to $tau_"mod" = #qty[0.75][s]$ and the modulation amplitude was set to $delta v slash v_0 = #tr[#qty[1][%]?]$.
    We scanned the modulation frequency from #qty[118.0][kHz] in *a* to #qty[122.5][kHz] in *j* in steps of #qty[0.5][kHz].
    For the transition $1 -> 3$ the resonant frequency in the center of the lattice is expected to be #qty[121.6][kHz] which #tr[is/lies] (just) between the images *h* and *i*.
    The angle of the resonances in the $x y$ plane matches the expected angle of the optical axis of the x1064 lattice relative to the camera frame.

    #show list: set text(red)
    - Use #unit[μm] or #unit[_a_] as the unit here or keep #unit[px]?
    - Remove the colorbar?
    - Use a different colormap?
  ],
) <fig:mod-intro-images>
