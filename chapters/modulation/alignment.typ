#import "/header.typ": *

== Alignment <sec:mod-align>

#[
  #set text(red)
  - Use the resonance contrast as the combined fit parameter.
  - Explain the alignment of the dipole traps and z-lattices somewhere?
  - Reference the mirror in @sec:super-setup that is used for the x1064-lattice alignment?
  - Would gravity actually mess with the vertical alignment?
  - Actually mention the individual alignment of the z532-lattice beams?
  - Also show the "up-down" alignment of the z532-lattice?
]

#tr[Shorten this paragraph?]
The main purpose of the in-situ lattice modulation is the #tr[(quantitative)] calibration of the lattice depths $v(x, y)$ across the atom cloud.
We are however also using it as a qualitative tool for the alignment of the lattice beams.
The direct feedback from the atoms about the local lattice depth significantly improves #tr[(all steps of)] the lattice-alignment procedure.
Without the in-situ resolution the lattice depth #tr[can/could] only be measured with a scan of the modulation frequency #tr[$f_"mod"$] over the interval where we #tr[_expect_] the transition to a higher band.
#tr[A/The] coarse alignment of the lattice beams is therefore much faster #tr[(now)] because we are able to see changes of the lattice depth from sequence to sequence.
We made use of this extensively during the first alignment of the x1064-lattice beams #tr[(and the x532-lattice beams)] after the upgrade of the optical setup #tr[(introduced/shown)] in @ssec:super-thermal-x1064-rebuild #tr[(and @ssec:super-thermal-x532-rebuild)].
For the fine alignment the in-situ measurement also has a better precision than the time-of-flight measurement.
The fidelity of the position of a resonance is much higher than the #tr[(decrease of the)] global atom number.
We are therefore able to reliably find the #tr[optimum/optimal] alignment of the lattice beams.
This makes the alignment more robust against slow drifts of the lattice beams, requiring fewer alignment procedures than before.
#tr[Is there any data to back this claim?]

#tr[Put this somewhere in the previous paragraph?]
In this section I will show how we are using the in-situ lattice modulation for the alignment of the in-plane lattices in @ssec:mod-align-x1064 well as the vertical lattices in @ssec:mod-align-z532.


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
The main difference is that the x1064 lattice also has the same piezo mirror mount to align the forward-propagating beam.
This allows us to run more a more complex alignment optimization where we #tr[walk] the two piezo mirror mounts against each other.
The optimal alignment for the x1064 lattice is also more important in the context of this thesis as it is the starting point for the alignment of the x532 lattice in @sec:mod-super #tr[(ref a subsection here instead?)].

To start the alignment procedure of the in-plane lattices we are only using the respective forward-propagating lattice beams.
The corresponding retro-propagating beam is blocked just in front of the retro-mirror and the perpendicular in-plane lattice is turned off.
We can then infer the #tr[_horizontal_] position of the forward-propagating beam from the position of the atom cloud in the $x y$ plane.
For the x1064 lattice the horizontal position is measured along the $y$ axis.
We therefore align the forward-propagating beam such that the atom cloud is centered #tr[in/on] the camera frame at $y = 0$.
After unblocking the retro-propagating beam we center the atom cloud again, this time using the #tr[(respective)] retro mirror.
This already concludes the horizontal alignment of the in-plane lattices.

The vertical position of both in-plane lattices is measured along the $z$ axis, which is also the optical axis for the high-resolution imaging.
We are therefore not able to measure the vertical positions directly, as neither imaging for the $x$ axis nor the imaging for the $y$ axis have a sufficient #tr[magnification/resolution] #tr[ref @sec:setup-detect?].
In addition to the lack of imaging resolution, the vertical position of the atom cloud is #tr[pinned] by the horizontal dipole trap #tr[and/or] the z532 lattice.
Changing the vertical position of the in-plane lattices would therefore not affect the position of the atom cloud.
With the in-situ lattice modulation we can overcome this limitation by directly optimizing the lattice depth.
If the vertical position of the in-plane lattices is centered on the atom cloud, the lattice depth will be maximal.
During the optimization of the vertical alignment, we would therefore expect the #tr[resonance/transition] frequency in the center of the atom cloud to increase.
Instead of maximizing the #tr[resonance/transition] frequency, we could also use a constant modulation frequency and maximize the distance of the resonances.
Both signals allow a distinct optimization of the vertical alignment, but the latter approach with the constant modulation frequency is more robust.
As shown in @fig:mod-eval-model, the #tr[resonance/transition] frequency in the center of the atom cloud is not easy to interpret.
Even if the modulation frequency is too large for the lattice depth in the center, there can still be a visible resonance in the atom cloud.
If we use the position of the resonances instead, the interpretation of the signal is always clear.
In @fig:mod-align-x1064-forward such an optimization is shown for the vertical position of the forward-propagating beam.
We start with a modulation frequency $f_"mod"$ where the resonances are close to the center of the atom cloud.
This gives us the most room for the optimization of the lattice depth without changing the frequency.
The resonances will then move outwards as we improve the lattice depth.
When we reach the resonance position in the image on the right, we increase the modulation frequency by a few #unit[kHz] to continue the optimization with the resonances near the center again.
The optimized vertical position is reached when the resonances do not move anymore.
We can then run the same steps again with the vertical position of the retro-propagating beam.

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

With the optimization technique in @fig:mod-align-x1064-forward we will only find a local optimum of the lattice alignment.
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
From the measurement in @fig:mod-align-x1064-walking *d* we can extract the positions #tr[$z_"retro" approx 0$] and #tr[$z_"forward" approx #qty[4][μm]$] as the global optimum.
The maximum of the relative lattice depth suggests that the optimal vertical position of the forward-propagating beam is between #qty[0][μm] and #qty[5][μm].
While this result agrees with the position extracted from the overlap of the relative lattice depth #tr[$a_0$] and the resonance contrast, it is significantly less robust and requires the same amount of data acquisition.
With the intersection of #tr[$a_0$] and the #tr[contrast] we can determine the optimal vertical alignment with a precision of $delta z = #qty[1][μm]$.
This is on par with the precision of the horizontal alignment where we can directly use the position of the atom cloud.
The precision is #tr[(now)] limited by the beam pointing, the imaging of the atom cloud and the tracking of the lattice beams with the cameras.

Compared to the previous lattice-alignment procedure we were able to improve the precision of the vertical alignment by one order of magnitude #tr[ref Luke].
As shown in @fig:mod-align-x1064-walking *e* the lattice depth is only slightly improved thanks to this precision.
The important aspect is the robustness of the lattice alignment over time.
When both lattice beams are aligned to the global optimum, it takes much longer for the lattice depth $v(x, y)$ to decrease due to drifts of the lattice beams.
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

#text(red)[Put a good transition here?]
Compared to the lattice depth and the gaussian waist the lattice position can already by accurately determined from the single-frequency measurement/technique.
The resonance lines are always positioned symmetrically around the center/maximum of the lattice (depth).
We can use #text(red)[(are using?)] this for the alignment of the z532-lattice where we are not able to (accurately) measure the position of the individual beams with the atom cloud.
Since the lattice detuning is repulsive (#text(red)[ref theory/setup?]), the atoms will be pushed away from the center of the lattice beams.
While we can choose a power for the individual beams to create a gap in the atom cloud, this has a bad resolution compared to the in-plane lattices (and the z1064-lattice?) where have an attractive detuning #text(red)[mention any quantitative resolution?].
The position of the gap shows the position of the lattice beams along the $x$-axis and the depth of the gap shows the position of the lattice beams along the $y$-axis.
We are therefore only aligning the individual beams of the z532-lattice relative to each other with the splitting of the atom cloud.
For the absolute position of the z532-lattice we can then use the in-situ lattice modulation technique.
As shown in @fig:mod-align-z532-left-right for the $x$-axis and in @fig:mod-align-z532-up-down for the $y$-axis usually requires quite a few tries since we only have (a) manual mirror mount(s) in the z532-lattice setup.
We are however able to center the absolute position of the z532-lattice along the $x$-axis with a resolution of a few #unit[μm], compared to the tens of #unit[μm] with the repulsive potential of the individual lattice beams.
For the $y$-axis the resolution is much smaller even with the in-situ lattice modulation technique since we can only use the angle/curvature of the resonance lines as the signal.
Since we do not have (a) camera(s) or (an) electronically movable mirror(s) as for the x1064-lattice, we can not scan the position with equal steps to infer the center from symmetrically misaligned cases.
We therefore have to rely on the optimization #text(red)["by-eye"] to find the beam position where the resonance lines are parallel.
Since the atoms only occupy a small fraction of the projected waist along the $y$-axis, this is sufficient for all purposes of the z532-lattice #text(red)[(even the z-superlattice)].

#figure(
  [some images of the z532-lattice single-frequency alignment along the $x$-axis],
  caption: [
    Optimization of the left-right z532-lattice position by manually moving the shared mirror.
    The lattice depth was set to #text(red)[$v_"z532" = #qty[100][Erec]$] and the modulation frequency was set to #text(red)[$f = #qty[40][kHz]$].
    The images show the entire optimization after the alignment of the individual lattice beams.

    #show list: set text(red)
    - Draw any helper lines in the images?
    - Merge this figure with @fig:mod-align-z532-up-down?
  ],
) <fig:mod-align-z532-left-right>

#figure(
  [some images of the z532-lattice single-frequency alignment along the $y$-axis],
  caption: [
    Optimization of the up-down z532-lattice position by manually moving the shared mirror.
    The lattice depth was set to #text(red)[$v_"z532" = #qty[100][Erec]$] and the modulation frequency was set to #text(red)[$f = #qty[40][kHz]$].
    The images show the entire optimization after the alignment of the individual lattice beams.

    #show list: set text(red)
    - Draw any helper lines in the images?
    - Merge this figure with @fig:mod-align-z532-left-right?
  ],
) <fig:mod-align-z532-up-down>

