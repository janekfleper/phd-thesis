#import "/header.typ": *

== Improvement of the alignment procedure <sec:mod-align>

#notes[
  - Use the resonance contrast as the combined fit parameter.
  - Reference the mirror in @sec:super-setup that is used for the x1064-lattice alignment?
]

The main purpose of the in-situ lattice modulation is the quantitative calibration of the lattice depths $V(x, y)$ across the atom cloud.
However, we can also use the technique as a qualitative tool for the alignment of the lattice beams.
The direct feedback from the atoms about the local lattice depth significantly improves all steps of the lattice-alignment procedure.
Without the in-situ resolution the lattice depth could only be measured with a scan of the modulation frequency $f_"mod"$ over the expected interval of the transition to a higher band.
The coarse alignment of the lattice beams is much faster now because we are able to see changes of the lattice depth from sequence to sequence.
We made use of this extensively during the first alignment of the x1064-lattice beams and the x532-lattice beams after the upgrade of the optical setup in @ssec:super-thermal-x1064-rebuild and @ssec:super-thermal-x532-rebuild.
For the fine alignment, the in-situ measurement also has a better precision than the time-of-flight measurement.
The fidelity of the position of a resonance is much higher than a decrease of the global atom number.
We are therefore able to reliably find the optimal alignment of the lattices, which makes the alignment more robust against temporal drifts of the lattice beams.


=== x1064-lattice alignment <ssec:mod-align-x1064>

#notes[
  - Mention typical position fluctuations? This is relevant in @ssec:phase-measure-resolve.
  - Estimate the sensitivity of the vertical alignment?
  - Where to mention the hysteresis of the piezo mirror mounts for the first time?
  - Where to introduce the contrast of the resonances?
  - Mention the vertical atom cloud size anywhere?
  - Really call the alignment procedure "walking"?
]

The properties x1064 lattice and the y1064 lattice are very similar, which also applies to their alignment procedures.
Both are standing-wave lattices, they are red-detuned, they have Gaussian waists around #qty[150][μm] and they have piezo mirror mounts#footnote[Newport Agilis AG-M100N #tr[mention this here again or somewhere in @sec:setup-xy?]] to align the retro-propagating beams.
The main difference is that the x1064 lattice also uses the same type of piezo mirror mount to align the forward-propagating beam.
This allows us to run a complex alignment optimization where we walk the two piezo mirror mounts against each other.
The optimal alignment for the x1064 lattice is also more important in the context of this thesis as it is the starting point for the alignment and calibration of the x532 lattice in @sec:mod-super.

To start the alignment procedure of the in-plane lattices, we are only using the respective forward-propagating lattice beams.
The corresponding retro-propagating beam is blocked just in front of the retro-reflecting mirror and the perpendicular in-plane lattice is turned off.
We can then infer the horizontal position of the forward-propagating beam from the position of the atom cloud in the $x y$ plane.
For the x1064 lattice the horizontal position is measured along the $y$ axis.
We therefore align the forward-propagating beam to center the atom cloud in the camera frame at $y = 0$.
After unblocking the retro-propagating beam we center the atom cloud again, this time using the respective retro-reflecting mirror.
This already concludes the horizontal alignment of the in-plane lattices.

The vertical position of both in-plane lattices is measured along the $z$ axis, which is also the optical axis for the high-resolution imaging.
We are therefore not able to measure the vertical positions directly, as neither the imaging for the $x$ axis nor the imaging for the $y$ axis have a sufficient resolution #tr[ref @sec:setup-detect?].
In addition to the lack of imaging resolution, the vertical position of the atom cloud is pinned by the horizontal dipole trap or the z532 lattice.
Changing the vertical position of the in-plane lattices would therefore not affect the position of the atom cloud.
With the in-situ lattice modulation we can overcome this limitation by directly optimizing the lattice depth.
If the vertical position of the in-plane lattices is centered on the atom cloud, the lattice depth will be maximal.
During the optimization of the vertical alignment, we would therefore expect the transition frequency in the center of the atom cloud to increase.
Instead of maximizing the transition frequency, we can also use a constant modulation frequency and maximize the distance of the resonances.
Both signals allow a distinct optimization of the vertical alignment, but the latter approach is generally more robust.
As shown in @fig:mod-eval-model the transition frequency in the center of the atom cloud is not easy to interpret.
Even if the modulation frequency is too large for the lattice depth in the center, there can still be a visible resonance in the atom cloud.
If we use the position of the resonances instead, the interpretation of the signal is always clear.
In @fig:mod-align-x1064-forward such an optimization is shown for the vertical position of the forward-propagating beam.
We start with a modulation frequency $f_"mod"$ where the resonances are close to the center of the atom cloud.
This gives us the most room for the optimization of the lattice depth without changing the frequency.
The resonances will then move outwards as we improve the lattice depth.
When we reach the resonance position in *d*, we increase the modulation frequency by a few #unit[kHz] to continue the optimization with the resonances near the center again.
The vertical position is optimized when the resonances do not move anymore.
We can then follow the same steps for the vertical position of the retro-propagating beam.

#floating-figure(
  image("figures/alignment_x1064_vertical.png"),
  caption: [
    Optimization of the x1064-lattice depth at a constant modulation frequency.
    The lattice depth was set to $Vx1064 = #num[55]$ where the maximum transition frequency is #qty[115.7][kHz].
    The modulation frequency was set to $f_"mod" = #qty[110][kHz]$ which corresponds to a local lattice depth of #qty[50.4][Erec].
    From *a* to *d* the vertical position of the forward-propagating beam is changed in equal steps.

    #notes[
      - Remove the colorbar?
    ]
  ],
  label: <fig:mod-align-x1064-forward>,
)

Using this iterative approach, we will only find a local optimum of the lattice alignment.
To find the global optimum we have to walk the vertical position of the forward-propagating beam against the vertical position of the retro-propagating beam.
This measurement takes several hours to be completed with a sufficient sampling of the respective beam positions.
Thanks to the sequence control of the piezo mirror mounts it works completely autonomous and we can run this overnight.
An issue that arises when walking the forward-propagating beam and the retro-propagating beam is the hysteresis of the piezo mirror mounts.
To overcome this limitation, we are tracking the two beams with cameras that are imaging the position of the atoms.
We can then use the measured beam positions instead of the programmed mirror-mount positions for the evaluation.

For this measurement to find the global optimum of the lattice alignment, we are probing the variation of the lattice depth $V(x, y)$ in the vertical lattice planes.
Even though the image shows the atom density integrated along the $z$ axis, we can still extract information about the individual lattice planes.
If the lattice depth $V(x, y)$ is equal in all lattice planes, we expect the resonances to have the best visibility.
A changing lattice depth $V(x, y)$ on the other hand will show broad resonances at the mean position of all lattice planes.
In @fig:mod-align-x1064-walking we can see how the correction factor $fita0$ and the resonance contrast $a_R / sigma_R$ change as a function of the vertical beam positions.
The maximum of $fita0$ is always achieved at the same position $z_"retro" approx 0$ where the retro-propagating beam is centered on the atom cloud.
This is expected since the lattice depth $V(x, y)$ will always have a local maximum when the intensity of either lattice beam is maximal at the position of the atoms.
The optimum of the resonance contrast then shows where the two lattice beams are perfectly overlapped.
In the global optimum of the vertical alignment, both conditions are fulfilled at the same time.
From the measurement in #subref(<fig:mod-align-x1064-walking>, "d"), we can extract the positions $z_"retro" approx 0$ and $z_"forward" approx #qty[4][μm]$ as the global optimum.
The maximum of the correction factor $fita0$ in #subref(<fig:mod-align-x1064-walking>, "e") suggests that the optimal vertical position of the forward-propagating beam is between #qty[0][μm] and #qty[5][μm].
While this result agrees with the position extracted from #subref(<fig:mod-align-x1064-walking>, "d"), it is less robust while requiring the same amount of acquired data.
With the intersection of $fita0$ and the contrast $a_R slash sigma_R$, we can determine the optimal vertical alignment with a precision of $delta z tilde.eq #qty[1][μm]$.
This is on par with the precision of the horizontal alignment where we can directly use the position of the atom cloud.
The precision of the vertical alignment is therefore alos limited by the beam pointing, the imaging of the atom cloud and the tracking of the lattice beams with the cameras.

Compared to the previous lattice-alignment procedure, we are able to improve the precision of the vertical alignment by one order of magnitude #tr[cite Luke].
As shown in #subref(<fig:mod-align-x1064-walking>, "e"), the lattice depth is only slightly improved thanks to this precision.
The important aspect is the robustness of the lattice alignment over time.
When both lattice beams are aligned to the global optimum, it takes longer for the lattice depth $V(x, y)$ to decrease due to drifts of the lattice beams.
Furthermore, subsequent alignment procedures will be faster since the lattice beams are already close to the global optimum.
Running the measurement in @fig:mod-align-x1064-walking is not required for every alignment procedure.
The simple optimization as shown in @fig:mod-align-x1064-forward is sufficient if the lattice beams are already close to their optimal positions.

#floating-figure(
  image("figures/alignment_x1064_walking.png"),
  caption: [
    Optimization of the vertical x1064-lattice alignment.
    The modulation parameters were set to $Vx1064 = #qty[60][Erec]$, $tau_"mod" = #qty[0.75][s]$ and $delta V slash Vx1064 = #tr(qty[3][%])$.
    We scanned the vertical position of the forward-propagating beam in five steps around the local optimum from @fig:mod-align-x1064-forward.
    For each of those positions, we did a broad scan of the vertical position of the retro-propagating beam around the expected optimum of the lattice depth.
    Each data point in *a* to *c* shows the result of the evaluation as introduced in @sec:mod-eval.
    The maximum of the correction factor $fita0$ is always reached at $z_"retro" approx 0$.
    The optimal resonance contrast $a_R slash sigma_R$ on the other hand follows the position $z_"forward"$.
    In *d* the optimal positions $z_"retro"$ are shown as a function of $z_"forward"$.
    The intersection of the two lines shows the global optimum of the vertical alignment.
    This position $z_"forward"$ is in agreement with the maximum of the correction factor $fita0$ in *e*.
    The insets in *d* and *e* show images from the respective measurements to illustrate the differences in the contrast and in the lattice depth.
    The modulation frequency for the images in *d* is $f_"mod" = #qty[118.5][kHz]$, while the modulation frequency for the images in *e* is $f_"mod" = #qty[119.5][kHz]$.

    #notes[
      - Reduce the height of the lower axes? Just use the same height for both rows?
      - Just remove the errorbars since they are not really visible anyway?
      - Really use the inverse contrast in *a* to *c*?
      - Add lines in *d* to highlight the intersection?
      - How to show the position of *a* to *c* in *d* and *e*?
      - Really show all these insets?
    ]
  ],
  label: <fig:mod-align-x1064-walking>,
)


=== z532-lattice alignment <ssec:mod-align-z532>

#notes[
  - Show images of the single-beam alignment?
  - Mention something about the shared mirror?
  - Ref anything earlier for the one-dimensional treatment of the z532 lattice?
  - Actually mention the z1064 lattice?
]

The main obstacle for the alignment of the z532 lattice is the repulsive optical dipole force due to its blue detuning.
We are not able to directly measure the position of the lattice beams with the position of the atom cloud as it is the case for the in-plane lattices in @sec:mod-align.
Instead, we have to use the dipole traps to weakly confine the atoms along the $x$ axis.
The z532-lattice beams will then create a gap in the atom cloud around their beam position.
The resolution of this technique is worse by at least one order of magnitude compared to the alignment of the red-detuned in-plane lattice beams.
Furthermore, it relies on the perfect alignment of the dipole traps to correctly interpret the position of the gap.
While the z1064 lattice shares the optical path with the z532 lattice, its confining properties simplify the alignment significantly.
We can measure the position of the individual beams directly with the atom cloud, and only need the in-situ lattice modulation for the fine alignment and the subsequent calibration.

We are therefore using the in-situ lattice modulation technique to measure the position of the z532 lattice in the $x y$ plane.
Due to the aspect ratio of $r_y slash r_x approx 4$ of the z532-lattice potential, the resonances are most sensitive to the position $x_(z 532)$.
Since the resonances are always symmetric around the center of the lattice potential, we can infer the lattice position from the position of the resonances.
The images in @fig:mod-align-z532-left-right show a typical alignment procedure to center the resonances around $x = 0$.
We usually need a few tries to find the correct position as we can only move the lattice beams with a mechanical mirror mount.
This is also the practical limitation of the z532-lattice alignment.
The measurement itself has the same precision of $delta x tilde.eq #qty[1][μm]$ as the alignment of the in-plane lattices in @ssec:mod-align-x1064.
We could reliably achieve this precision with a piezo mirror mount and a camera to track the beam positions at the position of the atoms.

For the alignment of the z532 lattice along the $y$ axis, we are using the onset of the ellipticity of the resonances.
If the lattice is centered around $y = 0$, we expect the resonances to be parallel.
@fig:mod-align-z532-up-down shows a series of images where we have optimized the position $y_(z 532)$.
The initial resonances showed a small angle that suggested a lattice position $y_(z 532) > 0$.
In a few iterations, we can then find the lattice position where the resonances are parallel.
This procedure is again limited by the mechanical mirror mount and the lack of a camera to measure the beam positions.
The precision of $delta y tilde.eq #qty[10][μm]$ is however sufficient to center the lattice position such that we can neglect the inhomogeneity of the z532-lattice depth $Vz532(y)$.
As discussed in @sec:mod-eval, both the z532 lattice and the y1064 lattice are parametrized by a one-dimensional Gaussian lattice depth as a function of $x$.

#floating-figure(
  image("figures/alignment_z532_left-right.png"),
  caption: [
    Optimization of the z532-lattice position along the $x$ axis.
    The lattice depth was set to $Vz532 = #qty[100][Erec]$ and the modulation frequency was set to $f_"mod" = #qty[40][kHz]$.
    The first image on the left shows the z532-lattice position after the alignment of the individual lattice beams.
    We are then moving the lattice position until the resonances are centered around $x = 0$.
    The atom cloud always moves in the opposite direction because of the deconfinement from the z532 lattice.

    #notes[
      - Merge this figure with @fig:mod-align-z532-up-down?
      - Remove the colorbar? If not, fix the height of the colorbar!
    ]
  ],
  label: <fig:mod-align-z532-left-right>,
)

#floating-figure(
  image("figures/alignment_z532_up-down.png"),
  caption: [
    Optimization of the z532-lattice position along the $y$ axis.
    The lattice depth was set to $Vz532 = #qty[100][Erec]$ and the modulation frequency was set to $f_"mod" = #qty[40][kHz]$.
    The first image on the left is equal to the image in #subref(<fig:mod-align-z532-left-right>, "d") where we can see a slight ellipticity of the resonances.
    We are then moving the lattice beams until the resonances are parallel.
    The atom cloud does not move because the deconfinement by the z532 lattice along the $y$ axis is weak compared to the $x$ axis.

    #notes[
      - Merge this figure with @fig:mod-align-z532-left-right?
      - Remove the colorbar? If not, fix the height of the colorbar!
    ]
  ],
  label: <fig:mod-align-z532-up-down>,
)
