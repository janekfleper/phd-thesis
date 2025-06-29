#import "/header.typ": *

== Improvement of the alignment procedure <sec:mod-align>

#[
  #set text(red)
  - Use the resonance contrast as the combined fit parameter.
  - Reference the mirror in @sec:super-setup that is used for the x1064-lattice alignment?
]

#tr[Shorten this paragraph?]
The main purpose of the in-situ lattice modulation is the #tr[(quantitative)] calibration of the lattice depths $v(x, y)$ across the atom cloud.
We are however also using it as a qualitative tool for the alignment of the lattice beams.
In this section I will show how we are using the in-situ lattice modulation for the alignment of the in-plane lattices in @ssec:mod-align-x1064 well as the vertical lattices in @ssec:mod-align-z532.
The direct feedback from the atoms about the local lattice depth significantly improves #tr[(all steps of)] the lattice-alignment procedure.
Without the in-situ resolution the lattice depth #tr[can/could] only be measured with a scan of the modulation frequency #tr[$f_"mod"$] over the interval where we #tr[_expect_] the transition to a higher band.
#tr[A/The] coarse alignment of the lattice beams is therefore much faster #tr[(now)] because we are able to see changes of the lattice depth from sequence to sequence.
We made use of this extensively during the first alignment of the x1064-lattice beams #tr[(and the x532-lattice beams)] after the upgrade of the optical setup #tr[(introduced/shown)] in @ssec:super-thermal-x1064-rebuild #tr[(and @ssec:super-thermal-x532-rebuild)].
For the fine alignment the in-situ measurement also has a better precision than the time-of-flight measurement.
The fidelity of the position of a resonance is much higher than a decrease of the global atom number.
We are therefore able to reliably find the optimal alignment of the lattices, which makes the alignment more robust against slow drifts of the lattice beams.


=== x1064-lattice alignment <ssec:mod-align-x1064>

#[
  #set text(red)
  - Mention typical position fluctuations? This is relevant in @ssec:phase-measure-resolve.
  - Any sketches to show the horizontal alignment?
  - Mention the old alignment procedure with the aspect ratio?
  - Estimate the sensitivity of the vertical alignment?
  - Where to mention the hysteresis of the piezo mirror mounts for the first time?
  - Where to introduce the contrast of the resonances?
  - Mention the vertical atom cloud size anywhere?
]

The properties x1064 lattice and the y1064 lattice are very similar, which also applies to their alignment procedures.
Both are standing-wave lattices, they are red-detuned, they have gaussian waists around #qty[150][μm] and they have piezo mirror mounts#footnote[Newport Agilis AG-M100N #tr[mention this here again or somewhere in @sec:setup-xy?]] to align the retro-propagating beams.
The main difference is that the x1064 lattice also uses the same type of piezo mirror mount to align the forward-propagating beam.
This allows us to run a complex alignment optimization where we #tr[walk] the two piezo mirror mounts against each other.
The optimal alignment for the x1064 lattice is also more important in the context of this thesis as it is the starting point for the alignment of the x532 lattice in @sec:mod-super #tr[(ref a subsection here instead?)].

To start the alignment procedure of the in-plane lattices we are only using the respective forward-propagating lattice beams.
The corresponding retro-propagating beam is blocked just in front of the retro-reflecting mirror and the perpendicular in-plane lattice is turned off.
We can then infer the #tr[_horizontal_] position of the forward-propagating beam from the position of the atom cloud in the $x y$ plane.
For the x1064 lattice the horizontal position is measured along the $y$ axis.
We therefore align the forward-propagating beam to center the atom cloud #tr[in/on] the camera frame at $y = 0$.
After unblocking the retro-propagating beam we center the atom cloud again, this time using the #tr[(respective)] retro-reflecting mirror.
This already concludes the horizontal alignment of the in-plane lattices.

The vertical position of both in-plane lattices is measured along the $z$ axis, which is also the optical axis for the high-resolution imaging.
We are therefore not able to measure the vertical positions directly, as neither the imaging for the $x$ axis nor the imaging for the $y$ axis have a sufficient #tr[magnification/resolution] #tr[ref @sec:setup-detect?].
In addition to the lack of imaging resolution, the vertical position of the atom cloud is #tr[pinned] by the horizontal dipole trap #tr[and/or] the z532 lattice.
Changing the vertical position of the in-plane lattices would therefore not affect the position of the atom cloud.
With the in-situ lattice modulation we can overcome this limitation by directly optimizing the lattice depth.
If the vertical position of the in-plane lattices is centered on the atom cloud, the lattice depth will be maximal.
During the optimization of the vertical alignment, we would therefore expect the #tr[resonance/transition] frequency in the center of the atom cloud to increase.
Instead of maximizing the #tr[resonance/transition] frequency, we can also use a constant modulation frequency and maximize the distance of the resonances.
Both signals allow a distinct optimization of the vertical alignment, but the latter approach is generally more robust.
As shown in @fig:mod-eval-model the #tr[resonance/transition] frequency in the center of the atom cloud is not easy to interpret.
Even if the modulation frequency is too large for the lattice depth in the center, there can still be a visible resonance in the atom cloud.
If we use the position of the resonances instead, the interpretation of the signal is always clear.
In @fig:mod-align-x1064-forward such an optimization is shown for the vertical position of the forward-propagating beam.
We start with a modulation frequency $f_"mod"$ where the resonances are close to the center of the atom cloud.
This gives us the most room for the optimization of the lattice depth without changing the frequency.
The resonances will then move outwards as we improve the lattice depth.
When we reach the resonance position in the image on the right, we increase the modulation frequency by a few #unit[kHz] to continue the optimization with the resonances near the center again.
The optimized vertical position is reached when the resonances do not move anymore.
We can then follow the same steps for the vertical position of the retro-propagating beam.

#figure(
  image("figures/alignment_x1064_vertical.png"),
  caption: [
    Optimization of the x1064-lattice depth at a constant modulation frequency.
    The lattice depth #tr[is/was] set to $v_x = #num[55]$ where the maximum #tr[resonance/transition] frequency is #qty[115.7][kHz].
    The modulation frequency #tr[is/was] set to $f_"mod" = #qty[110][kHz]$ which corresponds to a local lattice depth of #qty[50.4][Erec].
    From left to right the vertical position of the forward-propagating beam is changed #tr[monotonically].

    #show list: set text(red)
    - Draw any helper lines in the images?
    - Remove the colorbar?
    - Anything else to add to this caption?
  ],
) <fig:mod-align-x1064-forward>

Using this iterative approach we will only find a local optimum of the lattice alignment.
To find the global optimum we have to #tr[_walk_] the vertical position of the forward-propagating beam against the vertical position of the retro-propagating beam.
This measurement takes several hours to be completed with a sufficient sampling of the respective beam positions.
Thanks to the sequence control of the piezo mirror mounts it works completely autonomous and we can run this #tr[overnight].
An issue that arises when #tr[_walking_] the forward-propagating beam and the retro-propagating beam is the hysteresis of the piezo mirror mounts.
// The positions of the mirror mount that is scanned back and forth will not be equal during each iteration of the other mirror mount.
To overcome this limitation we are tracking the two beams with cameras that are imaging the position of the atoms #tr[ref anything?].
We can then use the measured beam positions instead of the programmed mirror-mount positions for the evaluation.

For this measurement to find the global optimum of the lattice alignment we are probing the variation of the lattice depth $v(x, y)$ across the vertical lattice planes.
Even though the image shows the atom density integrated along the $z$ axis, we can still extract information about the individual lattice planes.
If the lattice depth $v(x, y)$ is equal in all lattice planes, we expect the resonances to have the best contrast.
A changing lattice depth $v(x, y)$ on the other hand will show broad resonances at the mean position of all lattice planes.
In @fig:mod-align-x1064-walking we can see how the relative lattice depth #tr[$a_0$] and the resonance contrast #tr[what?] change as a function of the vertical beam positions.
The maximum of #tr[$a_0$] is always achieved at the same position $z_"retro" approx 0$ where the retro-propagating beam is centered on the atom cloud.
This is expected since the lattice depth $v(x, y)$ will always #tr[have/show] a local maximum when the intensity of either beam as maximal at the position of the atoms.
The optimum of the resonance contrast then shows us where the two beams are perfectly overlapped.
In the global optimum of the vertical alignment both conditions are fulfilled at the same time.
From the measurement in @fig:mod-align-x1064-walking#strong[d] we can extract the positions #tr[$z_"retro" approx 0$] and #tr[$z_"forward" approx #qty[4][μm]$] as the global optimum.
The maximum of the relative lattice depth #tr[$a_0$] in @fig:mod-align-x1064-walking#strong[e] suggests that the optimal vertical position of the forward-propagating beam is between #qty[0][μm] and #qty[5][μm].
While this result agrees with the position extracted from the overlap of the relative lattice depth #tr[$a_0$] and the resonance contrast, it is significantly less robust while requiring the same amount of acquired data.
With the intersection of #tr[$a_0$] and the #tr[contrast] we can determine the optimal vertical alignment with a precision of $delta z tilde.eq #qty[1][μm]$.
This is on par with the precision of the horizontal alignment where we can directly use the position of the atom cloud.
The precision is #tr[(now)] limited by the beam pointing, the imaging of the atom cloud and the tracking of the lattice beams with the cameras.

Compared to the previous lattice-alignment procedure we were able to improve the precision of the vertical alignment by one order of magnitude #tr[ref Luke].
As shown in @fig:mod-align-x1064-walking#strong[e] the lattice depth is only slightly improved thanks to this precision.
The important aspect is the robustness of the lattice alignment over time.
When both lattice beams are aligned to the global optimum, it takes longer for the lattice depth $v(x, y)$ to decrease due to drifts of the lattice beams.
Furthermore, subsequent alignment procedures will be faster since the lattice beams are already close to the global optimum.
Running the measurement in @fig:mod-align-x1064-walking is also not required for every alignment procedure.
The simple optimization as shown in @fig:mod-align-x1064-forward is sufficient if the lattice beams are already close to their optimal positions.

#figure(
  image("figures/alignment_x1064_walking.png", width: 90%),
  caption: [
    Optimization of the vertical x1064-lattice alignment with the forward-propagating beam and the retro-propagating beam.
    The lattice depth was set to $v = #qty[60][Erec]$ and #tr[mention something else...].
    We scanned the vertical position of the forward-propagating beam in five steps around the local optimum from @fig:mod-align-x1064-forward.
    For each of those positions we then did a broad scan of the vertical position of the retro-propagating beam around the expected optimum of the lattice depth.
    Each data point in *a* -- *c* shows the result of the evaluation as introduced in @sec:mod-eval.
    The maximum relative lattice depth #tr[$a_0$] is always reached at $z_"retro" approx 0$.
    The optimal resonance contrast #tr[some letter?] on the other hand moves with $z_"forward"$.
    In *d* the optimal positions $z_"retro"$ are shown as a function of $z_"forward"$ where the intersection of the two lines shows the global optimum of the vertical alignment.
    This position $z_"forward"$ is in agreement with the maximum of the relative lattice depth in *e*.

    #show list: set text(red)
    - Reduce the height of the lower row? Just use the same height for both rows?
    - Add some errorbars?
    - What is the actual name for the "relative lattice depth"?
    - Really use the inverse contrast here?
    - Find a letter for the resonance contrast...
    - Add lines to *d* to highlight the intersection?
  ],
) <fig:mod-align-x1064-walking>


=== z532-lattice alignment <ssec:mod-align-z532>

#[
  #set text(red)
  - Show images of the single-beam alignment?
  - Mention something about the shared mirror?
  - Ref anything earlier for the one-dimensional treatment of the z532 lattice?
  - Actually mention the z1064 lattice?
]

The main obstacle for the alignment of the z532 lattice is the repulsive optical dipole force due to its blue detuning.
We are not able to directly measure the position of the lattice beams with the position of the atom cloud as it is the case for the in-plane lattices in @sec:mod-align.
Instead we have to use the dipole traps to weakly confine the atoms and then use the local deconfinement from the individual beams.
The z532-lattice beams will create a gap in the atom cloud around their beam position.
The resolution is however worse by at least one order of magnitude compared to the alignment of the red-detuned in-plane lattice beams.
While the z1064 lattice shares the optical path with the z532 lattice, its red-detuned potential simplifies the alignment significantly.
We can measure the position of the individual beams directly with the atom cloud and only need the in-situ lattice modulation for the fine alignment and the subsequent calibration.

We are therefore using the in-situ lattice modulation technique to measure the position of the z532 lattice in the $x y$ plane.
Due to the aspect ratio of $1 slash 4$ the z532-lattice potential the resonances are most sensitive to the position $x_(z 532)$.
Since the resonances are always symmetric around the #tr[center/maximum] of the lattice depth, we can infer the lattice position from the position of the resonances.
The images in @fig:mod-align-z532-left-right show a typical alignment procedure to center the resonances around $x = 0$.
We usually need a few tries to find the correct position as we can only move the lattice beams with a mechanical mirror mount.
This is also the practical limitation of the z532-lattice alignment.
The measurement itself has the same precision of $delta x tilde.eq #qty[1][μm]$ as for the in-plane lattices in @ssec:mod-align-x1064.
We could reliably achieve this precision with a piezo mirror mount and a camera to track the beam positions at the position of the atoms.

Since the atom cloud always moves in the opposite direction of the z532 lattice, we could also use the position of the atom cloud as the signal.
This is however significantly less precise because the position of the atom cloud mainly depends on the position of the dimple beam #tr[ref @sec:setup-dipole].
If the dimple beam is misaligned by just a few pixels, we would systematically misalign the z532 lattice.

For the alignment of the z532 lattice along the $y$ axis we are using the onset of the ellipticity of the resonances.
If the lattice is centered around $y = 0$, we expect the resonances to be parallel.
@fig:mod-align-z532-up-down shows a series of images where we have optimized the position $y_(z 532)$.
The initial resonances showed a small angle that suggested a lattice position $y_(z 532) > 0$.
In a few iterations we can then find the lattice position where the resonances are parallel.
This procedure is again limited by the mechanical mirror mount and the lack of a camera to measure the beam positions.
The precision of $delta y tilde.eq #qty[10][μm]$ is however sufficient to center the lattice position such that we can neglect the inhomogeneity of the z532-lattice depth along the $y$ axis.
As discussed in #tr[@ssec:mod-eval-other] both the z532 lattice and the y1064 lattice are parametrized by a one-dimensional gaussian lattice depth as a function of $x$.

#figure(
  image("figures/alignment_z532_left-right.png"),
  caption: [
    Optimization of the z532-lattice position along the $x$ axis.
    The lattice depth was set to $v = #qty[100][Erec]$ and the modulation frequency was set to $f_"mod" = #qty[40][kHz]$.
    The first image on the left shows the z532-lattice position after the alignment of the individual lattice beams.
    We are then moving the lattice position until the resonances are centered around $x = 0$.
    The atom cloud always moves in the opposite direction because of the deconfinement from the z532 lattice.

    #show list: set text(red)
    - Draw any helper lines in the images?
    - Merge this figure with @fig:mod-align-z532-up-down?
    - Remove the colorbar?
  ],
) <fig:mod-align-z532-left-right>

#figure(
  image("figures/alignment_z532_up-down.png"),
  caption: [
    Optimization of the z532-lattice position along the $y$ axis.
    The lattice depth was set to $v = #qty[100][Erec]$ and the modulation frequency was set to $f_"mod" = #qty[40][kHz]$.
    The first image on the left is the last image in @fig:mod-align-z532-left-right where we can see a slight ellipticity of the resonances.
    We are then moving the lattice beams until the resonances are parallel.
    The atom cloud does not move because the deconfinement by the z532 lattice along the $y$ axis is weak compared to the $x$ axis.

    #show list: set text(red)
    - Draw any helper lines in the images?
    - Merge this figure with @fig:mod-align-z532-left-right?
    - Remove the colorbar?
  ],
) <fig:mod-align-z532-up-down>

