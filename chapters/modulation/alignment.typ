#import "/header.typ": *

== Alignment <sec:mod-align>

#[
  #set text(red)
  - Use the resonance contrast as the combined fit parameter.
  - Explain the alignment of the dipole traps and z-lattices somewhere?
  - Reference the mirror in @sec:super-setup that is used for the x1064-lattice alignment?
  - Would gravity actually mess with the vertical alignment?
  - Mention that we have to adjust the frequency if the lines are too far apart?
  - Actually mention the individual alignment of the z532-lattice beams?
  - Also show the "up-down" alignment of the z532-lattice?
  - Reorder the section? E.g. put the x1064-lattice walking before the z532-lattice?
  - Use subsections to separate the x1064-lattice from the z532-lattice?
]

The measurements in this chapter so far were always conducted with (perfectly) aligned lattices.
After the alignment we can then run the in-situ lattice modulation measurements to calibrate the lattice depth, the lattice position and the lattice angle.
While this is the primary purpose of these measurements, they are also essential for the alignment of the lattices in the first place.
Before the implementation of the in-situ lattice modulation measurements the alignment procedure took much longer and was less reproducable.
To understand why the in-situ lattice modulation measurements improve the alignment, I will shortly explain the required steps for the infrared in-plance lattices #text(red)[x1064 and y1064].
For the z-lattices and the x532-lattice the old/initial alignment was different due to the geometry and the detuning of these lattices.
We can however also use the in-situ lattice modulation alignment for these lattices now, significantly improving on the old techniques/procedures.

#text(red)[I will only focus on the alignment of the x1064-lattice here. The alignment of the y1064-lattice is largely the same but we do not have a motorized mirror for the forward-propagating beam.]
At the start of the in-plane lattice alignment procedure we are only using the forward-propagating beams by placing a beam block/dump in the retro-reflecting path.
This allows us to measure/see the position of the forward-propagating beam of the x1064-lattice in the $x y$-plane.
Since the atoms are trapped at the maximum of the intensity of the forward-propagating beam, we can directly infer the beam position from the position of the atom cloud on the z-camera #text(red)[ref what?].
We can then move the forward-propagating beam until the atom cloud is centered in/to the (local) camera frame.
After removing the beam dump from the retro-reflecting path, we can use that mirror to center the atom cloud in/to the camera frame again.
Since we know that the forward-propagating beam is already aligned/centered, any shift of the position must be caused by the retro-propagating beam.
Due to the high resolution of the z-camera the alignment in the $x y$-plane is therefore fast/simple and robust.

#text(red)[Any transition here?]
For the vertical alignment of the x1064-lattice #text(red)[(and the y1064-lattice)] this is not possible since the atoms are already loaded into the planes of the z532-lattice at that time in the sequence.
If we would not use the z532-lattice to "pin" the atoms, we would still need to use the horizontal dipole trap for the vertical confinment #text(red)[is this actually true?].
Moving the forward-propagating beam or the retro-propagating beam vertically would therefore not result in a (measurable) signal even if the y-camera (or x-camera) had the required resolution.
We therefore need(ed) to infer the vertical alignment of the forward-propagating beam and the retro-propagating beam from the atom cloud measured with the z-camera.
#text(red)[How much was this compared to the beam waist?]
The old solution/technique used a wide scan of the vertical beam positions (#text(red)[one after the other]) to measure the change of the aspect ratio of the atom cloud.
This was not an accurate/precise measurement and it was therefore not reliable in finding the optimal alignment of the lattice beams.

With the in-situ lattice modulation spectroscopy we can infer (the change of) the lattice depth from a single image instead.
We select the modulation frequency such that the resonances (#text(red)[resonance lines?]) are located (roughly) halfway between the edge of the cloud and the center of the cloud.
If we change the vertical alignment of the lattice beams, the resonance lines will either shift towards the center of the cloud or move away from the center of the cloud.
In the former case the (maximum) lattice depth has/was decreased, whereas in the latter case the (maximum) lattice depth has/was increased.
See @fig:mod-align-x1064-retro for a series of images from an alignment procedure where we scanned the vertical alignment of the retro-propagating beam.
We can see that the resonance lines have a maximal separation at/in the #text(red)[nth] image, indicating the (local) maximum of the lattice depth.
While we could evaluate the images to actually determine the distance/separation of the resonance lines, the optimization #text(red)["by eye"] is sufficient due to the high sensitivity of the measurement.
#text(red)[Really already mention this for this short measurement?]
We can also scan the mirror axis with a variable in the experimental sequence to automate this measurement.
Since the piezo mirror shows significant/strong hysteris we can use the beam data captured with the camera #text(red)[looking?] at the atom position to move beam to the optimal position.
This technique allows us to qualitatively maximize the lattice depth with the same resolution as the calibration measurement itself.
For the full calibration of the lattice depth and the gaussian waist we still have to scan the frequency across/over the atom cloud, but we only have to do this once at the end of the alignment.

#figure(
  [some images of the x1064-lattice single-frequency alignment],
  caption: [
    Optimization of the x1064-lattice depth by scanning the vertical alignment of the retro-propagating beam.
    The lattice depth was set to #text(red)[$v_x = #qty[60][Erec]$] and the modulation frequency was set to #text(red)[$f = #qty[118][kHz]$].
    Between the images we are moving the retro-propagating beam by #text(red)[$? #unit[μm]$] per step along the $z$-axis.

    #show list: set text(red)
    - Draw any helper lines in the images?
  ],
) <fig:mod-align-x1064-retro>

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

Besides the simple optimization of the x1064-lattice depth by maximizing the resonance line distance, we can also use the in-situ lattice modulation technique for a more advanced alignment procedure.
While this simple technique is fast, it will "only" find/show a local maximum of the lattice depth.
To find the global maximum/optimum we have to run a two-dimensional scan of the vertical aligment of the forward-propagating beam and the retro-propagating beam.
Such an optimization is only necessary after the experiment was completely shut down for a significant time or after changes to the optical setup (e.g. to fix the thermal lensing as shown in @sec:super-thermal).
The "global" maximum/optimum does not show a (significantly) better lattice depth than slightly misaligned beam configurations.
Instead we are "defining" the global maximum/optimum as the configuration where the maximum of the lattice depth coincides with the maximum of the resonance line contrast.
The results of such a measurement are shown in @fig:mod-align-x1064-walking.
For each (vertical) position of the forward-propagating beam we are scanning the (vertical) position of the retro-propagating beam to find the (local) maximum/optimum of the beam overlap.
We can see that the position of the forward-propagating slightly affects the maximally achievable lattice depth, but the better/stronger signal is the overlap of the best (local) lattice depth with the best (local) resonance contrast.
In the data shown in the figure this optimal alignment is achieved between the second configuration and the third configuration.
Since we have acquired the beam positions (in forward-propagating direction and in retro-propagating direction), we can directly move to the optimized configuration/position despite the hysteresis of the alignment mirrors.
#text(red)[Go into even more detail here?]

#figure(
  image("/figures/2025-04-06_PH_x1064_walk_UD_result_thesis.png"),
  caption: [
    Walking of the x1064-lattice alignment with the forward-propagating beam and the retro-propagating beam.
    The in-plane lattice depths were set to $v_x = #qty[60][Erec]$ and $v_y = #qty[30][Erec]$ and the modulation time was set to $t_"mod" = #qty[0.75][s]$.
    Each column shows a different vertical position of the forward-propagating beam.
    The step size between each column/measurement is (only) $approx #qty[5][μm]$.
    Each data point corresponds to a frequency scan across the atom cloud to (accuractely) measure the lattice depth and the resonance contrast (width and amplitude?).

    #show list: set text(red)
    - Fit parabolas here to quantitatively find the optimum positon?
    - Use the resonance contrast and share the y-axis?
  ],
) <fig:mod-align-x1064-walking>
