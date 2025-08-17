#import "/header.typ": *

== Characterizing the optical lattices <sec:super-stability>

#notes[
  - Mention that the in-situ lattice modulation can only see the horizontal waist!
  - Create separate subsections for the two lattices?
  - Show in-situ lattice modulation images where the thermal-lensing improvement can be seen in the resonance contrast?
  - Mention the typical beam powers (at the atom position)?
  - Actually mention the size of the atom cloud compared to the lattice waists?
  - Already mention the superlattice phase $phi$ here somewhere?
]

As already mentioned in the introduction of the chapter, we used the in-situ lattice modulation spectroscopy as well as beam profiling with a camera to characterize the thermal lensing.
The modulation spectroscopy directly measures the spatial profile of the optical lattices, which reveals the lattice depth in the center, the Gaussian waist and the position.
In terms of accuracy, it is the best characterization method available #tr[and...?].
However, compared to the beam profiling with a camera, it can not measure the forward-propagating and the retro-propagating beams separately, and the minimum time resolution is #qty[100][ms].
With a camera that images the position of the atoms, we can resolve the profiles of the individual beams and we can achieve a time resolution of $< #qty[100][μm]$.
Furthermore, we can place the camera on a mechanical stage for a full characterization of the beam parameters.
This allows us to actually quantify the focal shift due to the thermal lensing, whereas the lattice modulation spectroscopy is restricted to the position of the atoms.
#tr[Really mention this sentence?]
Ultimately, the measured lattice depths have to be #tr[constant/stable] to claim the #tr[resolution] of the thermal lensing.


=== #x1064 lattice <ssec:super-stability-x1064>

#notes[
  - Mention overall linearity of the thermal lensing drift? This is relevant compared to the #x532 lattice...
  - Mention the astigmatism of $approx #qty[5][mm]$ between the horizontal and vertical waists?
]

For the initial characterization of the thermal lensing in the #x1064\-lattice setup, we used the in-situ lattice modulation spectroscopy.
In the experimental sequence, we introduced a holding time $tau$ just after the #x1064 lattice is frozen at the lattice depth #Vx1064 (see @sec:setup-sequence).
We are neglecting the slow ramp up to #qty[6][Erec] earlier in the sequence.
The lattice-depth modulation begins right after the holding time $tau$ and lasts #qty[100][ms].
In #subref(<fig:super-stability-x1064>, "a") we can see an exponential drop of the lattice depth by #qty[5][%] up to a holding time of #qty[1][s].
During the rest of the holding time up to $tau = #qty[5][s]$, the lattice depth is reduced approximately linear at the rate #qty[0.25][%/s].
The waist $w_0$ in #subref(<fig:super-stability-x1064>, "b") shows the complementary signal with an exponential increase by approximately #qty[15][μm].
From these two lattice parameters, we concluded that the foci of the forward-propagating and retro-propagating beams were initially too close to their respective lenses.
The thermal lensing would shifted the foci further towards their lenses to create a shallower but wider optical lattice at the position of the atoms.
Compared to the waist $w_0$, the change of the lattice position by $Delta y_0 < #qty[1][μm]$ is negligible.

#tr[Put this at the end of the #x1064 subsection?]
For the initial thermal lensing, we do not have usable data available from the beam-profiling cameras.
At #tr[that/the] time, the imaging setup to measure the forward-propagating and retro-propagating lattice beams was not in a $4f$-configuration.
Due to the divergence of the collimated Gaussian beams, the cameras were therefore measuring the lattice beams at a significant distance from the atom position.
Furthermore, we did not conduct measurements of the actual focal shift caused by the thermal lensing.
This would have required a beam-profiling as a function of the holding time $tau$ and the camera position $x$.
#tr[We only developed the corresponding measurement routine after we had already upgraded the #x1064\-lattice setup.]

After replacing all telescope lenses made out of N-BK7 and the retro lens, we measured a focal shift $delta < #qty[1][mm]$ after #qty[5][s] at the lattice depth $Vx1064 = #qty[60][Erec]$.
Relative to the Rayleigh length of $z_R approx #qty[60][mm]$, this is a tiny shift that should result in a stability of the lattice depth better than #qty[0.5][%] if the foci perfectly overlap with the atoms before the shift.
After optimizing the focal position of the forward-propagating beam and the distance between the atoms and the retro lens with the cameras, we use the in-situ lattice modulation spectroscopy for the final characterization.
In #subref(<fig:super-stability-x1064>, "a") we can see that the lattice depth increases by less than #qty[0.2][%] in #qty[5][s].
Compared to the initial setup, we were able to reduce the variation of the lattice depth by a factor of approximately #num[30].
Correspondingly, the waist $w_0$ in #subref(<fig:super-stability-x1064>, "b") does not show a drift in either direction.
The standard deviation of the #tr[data points] is on par with the expected uncertainty from the in-situ lattice modulation spectroscopy (see @ssec:mod-eval-error).
Besides being constant, the waist $w_0$ is also significantly smaller than before.
This allows us to achieve lattice depths beyond #qty[60][Erec], while maintaining a waist that is significantly larger than the atom cloud.
The stronger confinement along the $y$ axis is not an issue since the #y1064 lattice is always frozen when we are working with the in-plane superlattice.
While we could significantly improve the stability of the lattice depth and the lattice waist, the position still drifts by up to #qty[1][μm] in #qty[5][s].
We can attribute this to the thermal cycle during the experimental sequence, which is mainly determined by the magnetic field coils (see @sec:setup-sequence #tr[and ref limitation in @sec:phase-measure]?).
In any case, the drift is negligible compared to the size of the atom cloud and the waist of the #x1064 lattice.

#floating-figure(
  image("figures/superlattice_stability_x1064.png"),
  caption: [
    Improvement of the thermal lensing in the #x1064\-lattice setup.
    The data shows the calibration of the lattice depth with the in-situ lattice modulation spectroscopy (see @ch:mod).
    For the #tr["old"] data and the #tr["new"], the lattice depth in the experimental sequence was set to #qty[55][Erec] and #qty[60][Erec] respectively.
    The modulation time was #qty[100][ms], and the modulation amplitude was set to obtain a good #tr[signal-to-noise ratio].
    The correction factor #tr[$alpha$] quantifies the actual lattice depth relative to the setpoint in the experimental sequence.
    From the other lattice parameters (#tr[compare/see] @fig:mod-eval-x1064-result), only the waist $w_0$ and the position $y_0$ changed during the holding time, while the angle $theta.alt$ was constant even in the #tr["old"] setup.

    #notes[
      - Move the *abc* indices outside of the axes? Just above the x-labels?
      - Find better label names instead of "old" and "new". Maybe "initial" and "final"?
      - Also include the measurement at #qty[45][Erec]?
      - Mention the normalization of the "old" correction factor to $1.0$?
      - Mention number of average sets for each measurement? And mention the origin of the errors?
      - Shift the data points by #qty[50][ms]?
      - Show the fit of the "old" data?
    ]
  ],
  label: <fig:super-stability-x1064>,
)


=== x532-lattice characterization <ssec:super-thermal-x532>

#[
  #set text(red)
  - Mention the change of the phase during the in-situ measurement?
]

For the x1064-lattice we were able to directly measure the lattice depth with the (monochromatic) in-situ parametric heating technique.
This is not possible for the x532-lattice since we do not have enough optical power to achieve a sufficient lattice depth to get a narrow resonance $1 -> 3$, see @sec:mod-intro for the discussion.
We therefore had to rely on the x-superlattice to measure the depth of the x532-lattice.
The technical details of the in-situ lattice modulation spectroscopy in the x-superlattice are explained in #text(red)[ref modulation/superlattice section].
I will therefore only qualitatively explain the (parameters of the) in-situ measurement here.
In addition to the measurement of the lattice depth with the in-situ lattice modulation technique, we also used cameras to capture the forward-propagating beam and the retro-propagating beam at the position of the atoms.
From these measurements with the camera we could already see that the total effect of the thermal lensing for the x532-lattice was even worse than for the x1064-lattice.

#text(red)[just reference the modulation/superlattice section here?]
As explained in #text(red)[ref modulation/superlattice section] we always want to use the lower well at the antisymmetric phase $phi = pi / 4$ for the in-situ lattice modulation in the x-superlattice.
This gives us the highest effective/greatest lattice depth as "the sum" of the x1064-lattice and the x532-lattice, and the band structure will have the smallest sensitivity to small changes of the phase $phi$.
At the maximum x532-lattice depth of $approx #qty[20][Erec]$ we can/could achieve, the bands $n = 3$ and $n = 4$ are sufficiently narrow and have the same parity as the lowest band $n = 1$.
We will therefore use these two transitions to determine the thermally-induced change of the x532-lattice depth.
While both transitions $1 -> 3$ and $1 -> 4$ have similar frequencies, they each scale differently with the lattice depths $v_l$ and $v_s$.
The frequency/energy of the transition $1 -> 4$ is around #text(red)[$10?$] times more sensitive to the lattice depth $v_s$ than the frequency/energy of the transition $1 -> 3$.
For the lattice depth $v_l$ we get exactly the oppostie scenario where the frequency/energy of the transition $1 -> 3$ is a lot more sensitive.
This holds true down to the avoided crossing of the bands $n = 3$ and $n = 4$ at $v_l approx #num[60]$ and $v_s approx #num[14]$ #text(red)[ref anything?].

Since we only want to measure the thermal lensing effects of the x532-lattice we will therefore use the transition $1 -> 4$.
To further suppress any changes due to the x1064-lattice, we applied a feed-forward signal to the lattice depth in the experimental sequence based on the measurement shown in @fig:super-thermal-x1064-ph.
The idea was to increase the set point such that the actual lattice depth at the position of the atoms is constant.
This does not address the increase of the waist which is okay since we mainly care about the lattice depth close to the center.
We only used this as a temporary solution to get a constant x1064-lattice depth before fixing/upgrading the optical setup.
To confirm that the change of the x1064-lattice depth during the measurement was negligible with the varying set point, we used beam data at the (virtual) atom position acquired by the camera and we also included the transition $1 -> 3$ in the measurement.
Both measurements showed a negligible change of the x1064-lattice compared to @fig:super-thermal-x1064-ph.

On the forward-propagating beam camera we could observe that the amplitude/depth of the x532-lattice reduces as a function of the time $t_"hold"$ with a similar shape as the x1064-lattice.
The difference was that the effect of the thermal lensing on the amplitude/depth increased non-linearly with the set point $v_s$.
After a few seconds the measured depth would settle/converge to an increasingly smaller value as if there was a "hard" limit on the lattice depth we could achieve.
We therefore opted to measure the "settled" lattice depth as a function of $v_s$ at $t_"hold" = #qty[3][s]$.
This allowed us to use a longer modulation time of #qty[500][ms] #text(red)[which is preferred for the in-situ x-superlattice measurements?]
The results for the measurement interval/range $v_s = [14.4, ..., 24]$ are presented in @fig:super-thermal-x532-ph, confirming the non-linear decrease/decay of the lattice depth.
At $v_s = #num[14.4]$ the "settled" lattice depth is already reduced by $approx #qty[10][%]$ which is already twice the change of the x1064-lattice at its maximal depth.
The relative "loss" of the lattice depth at $v_s = #num[24]$ already amounts to $approx #qty[30][%]$.
If we assume that the foci of the forward-propagating beam and the retro-propagating beam were (perfectly) located at the position of the atoms, such a change of the lattice depth would correspond to a shift of the focal positions by $approx #qty[10][mm]$ if we only consider the (vertical) Rayleigh length of $approx #qty[15][mm]$.
For the horizontal waist the effect of the thermal lensing is a lot more complicated since the thermal lensing also changes the Rayleigh length itself and therefore the waist at the focus.
#text(red)[Mention waists from @fig:super-thermal-x532-ph here.]

From this measurement we concluded that the x532-lattice is not usable with the current (state of the) optical setup.
Due to the "non-linearity" of the thermal lensing we could not even apply a feed-forward to $v_s$ as we did for the x1064-lattice.
In preparation for the rebuild/overhaul of the optical setup we identified the elements that caused the thermal lensing with the same approach as explained in @ssec:super-thermal-x1064.
The changes we did are explained in detail in @ssec:super-thermal-x532-rebuild.


#figure(
  image("figures/2024-06-24_PH_xsuper_result.png", width: 60%),
  caption: [
    In-situ superlattice modulation spectroscopy of the thermal lensing effects in the x532-lattice.
    The x1064-lattice was set to $v_l = #num[55]$ and the superlattice phase was set to $phi = pi / 4$.
    The modulation time was $t_"mod" = #qty[500][ms]$ after a holding time of $t_"hold" = #qty[3][s]$.
    As the reference value for the lattice depth $a_0$ we used a measurement at $t_"hold" = #qty[0][s]$ with a modulation time of #qty[100][ms].
    While this will already be the average (reduced) lattice depth during the modulation time, it is the best we can do as far as a measurement using the atoms goes.

    #show list: set text(red)
    - Anything important to write about the evaluation?
    - Show lattice depth, waist and position here again?
    - Use absolute lattice depths on the y-axis of the a0 axis?
    - Show "final" lattice depth to illustrate the "hard limit"?
  ],
) <fig:super-thermal-x532-ph>


=== x532-lattice rebuild <ssec:super-thermal-x532-rebuild>

#[
  #set text(red)
  - Merge this with the x1064-lattice rebuild subsection?
  - Give different names to the waists to tell them apart?
  - Add figure that shows the actual beam profiling as a function of $t$ and $x$? Maybe only the forward-propagating beam?
  - Use actual errors for all the estimated values here?
  - Really only mention the components that cause(d) issues here?
  - Find the lenses that were actually used in the initial setup...
  - Find correct material for the Newport isolator PBS?
  - Mention length of optical isolator crystals?
  - Mention the curvature for the horizontal axis focus?
  - Use $w_x$ and $w_y$ to refer to the respective waists?
]

As for the x1064-lattice the first step was to identify the optical elements that were causing the (most) thermal lensing.
The setup consisted of an optical isolator followed by a $lambda / 2$-waveplate and a polarizing beam splitter.
For the beam shaping we used one telescope with regular lenses (#text(red)[is there a better word than "regular"?]) and one telescope with cylindrical lenses.
#text(red)[Add reference to the setup figure here?]
After the two telescopes the x532-lattice beam passed through the two glass plates to shift the position relative to the x1064-lattice beam, before the x532-lattice beam is overlapped with the horizontal dipole beam and the x1064-lattice beam at the dichroic mirror.
The rest of the optical path is shared with the x1064-lattice.

We found that the telescopes were contributing roughly $1 slash 2$ of the total thermal lensing (strength?).
The other half of the thermal lensing (strength) was caused by the optical isolator#footnote[#text(red)[Conoptics M712A]] and the following/trailing polarizing beam splitter.
In the telescopes achromatic lenses were used even though they were not necessary given the beam size of $<#qty[1][mm]$ and the (absolute) focal lengths between #qty[50][mm] and #qty[150][mm].
Removing one of the telescopes as we did for the x1064-lattice setup was not possible since we wanted to be able to adjust the vertical focus and the horizontal focus separately.
We therefore opted to replace all lenses in the telescope by singlets made from (UV) fused silica to minimize the thermal lensing.

As already discussed in @sec:super-thermal the glass inside an optical isolator needs to have Faraday-rotating properties.
We therefore could not just use (UV) fused silica here as well to reduce/minimize the thermal lensing.
Instead, we opted to get a smaller/shorter optical isolator#footnote[#text(red)[Newport ISO-04-532-MP]] using TGG as the Faraday medium.
#text(red)[Actually mention the Kigre M18 glass here?]
The old/previous optical isolator used a glass called Kigre M18 according to the manufacturer of the optical isolator.
We were not able to find all required optical and thermal properties to estimate the strength of the thermal lensing.
Just trying another optical isolator was therefore the best thing we could do.
Besides the Faraday medium the two polarizing beam splitters that are part of the (new) isolator also showed a relevant thermal lensing strength.
We therefore removed the built-in polarizing beam splitters from the (new) optical isolator and mounted optically-contacted polarizing beam splitters made from (UV) fused silica around the optical isolator.
By placing the outcoupling polarizing beam splitter parallel to the optical table, we were able to remove the (half) waveplate and (additional) polarizing beam splitter behind the optical isolator.
After the replacement of the 2 inch lens in the retro-path as mentioned in @ssec:super-thermal-x1064-rebuild the Faraday medium in the optical isolator is now the last optical element that shows relevant thermal lensing.
Both 2 inch lenses around the glass cell showed no relevant thermal lensing strength with the maximally available power for the x532-lattice.
This is also true when running both the x1064-lattice and the x532-lattice at maximum power.

#text(red)[How to make it clear that the shifts are from the POV of the forward-propagating beam?]
#text(red)[Mention that the shifts are exactly the same for the retro-reflected beam?]
After we had replaced/removed all possible optical elements to minimze the thermal lensing, we did the final optimization by tuning the focal position of the horizontal axis and the vertical axis.
Compared to the x1064-lattice we can tune both focal positions individually with the two different telescopes.
Since the thermal lensing shift scales quadratically in the beam (de)magnification $tmag$, we expect a much greater shift for the horizontal axis than for the vertical axis.
The telescope configuration to minize the thermal lensing of the beam amplitude/intensity therefore requires a significant astigmasm.
If we optimize the change of the beam amplitude/intensity for the forward-propagating beam, the optimization will be applied to the retro-reflected beam automatically as long as the 2 inch retro-lens creates a proper $4f$ system.
We are therefore only going to discuss the astigmatism from the perspective of the forward-propagating beam.
The focus of the veritcal axis is positioned $approx #qty[2.5][mm]$ behind the atoms, and the maximum of the beam amplitude is positoned $approx #qty[2.0][mm]$ behind the atoms.
The (remaining) thermal lensing will therefore drag the focus and the maximum of the amplitude towards the atoms.
With a lattice amplitude of #text(red)[#qty[3][V]] we found that in #qty[5][s] the vertical waist is shifted by $approx #qty[0.7][mm]$, and the maximum of the amplitude is shifted by $approx #qty[0.9][mm]$.
For the horizontal/in-plane axis we experically found that a focus position of $approx #qty[20][mm]$ behind the focus results in the smallest thermal lensing effects.
The focus position moves by $approx #qty[6][mm]$ during the holding time of #qty[5][s] but the waist at the focus changes at well (most likely due to the long Rayleigh range...).
We could therefore find a position in the lattice beam where the (local) beam waist changes by $< #qty[0.2][μm]$ (#text(red)[Mention total beam waist?]).
Since the (relative) (local) amplitude/intensity only depends on the two waists at the same beam position, we can strongly suppress/compensate the thermal lensing contribution by the horizontal axis.
In theory this astigmatic configuration will result in (local) changes of the curvature of the wave front.
These changes are however too small to be relevant for the lattice depth or even the phase in the superlattice configuration.

The (local) change of the vertical waist is $Delta w_z approx #qty[0.1][μm]$.
With both focus/focal positions optimized to minimize the changes at the position of the atoms, we would expect the beam amplitude/intensity to be almost constant at the same position.
At the (virtual) position of the atoms we are not able to see a change of the beam amplitude/intensity anymore.
We therefore have to rely on an in-situ parametric heating measurement with the atoms for the final characterization of the x532-lattice potential (as a function of the time).
As already explained in @ssec:super-thermal-x532 we have to rely on the parametric heating in the superlattice to measure the x532-lattice depth.
We are again targeting the transition $1 -> 4$ which is (most) sensitive to the x532-lattice depth.
Since we have already minimized the thermal lensing of the x1064-lattice to a relative change of $<#num[2e-3]$, we do not need to apply an amplitude feed-forward (for this measurement) anymore.
The result of the measurement in @fig:super-thermal-x532-rebuild shows that the x532-lattice depth now changes by $approx #num[2e-3]$ during a holding time of #qty[5][s].
We do not know if these changes are caused by thermal lensing since we have reached the "resolution limit" of the in-situ parametric heating measurement and there is no clear trend of the lattice depth visible anymore.
While #qty[18][Erec] is less than the maximal amplitude measured in @fig:super-thermal-x532-ph, the thermal lensing will not be an issue at #qty[24][Erec] either.
We would only have to revisit the thermal lensing "optimization" if we would significantly increase the available x532-lattice depth.
If the focal shifts get "stronger" by a factor of more than $2$, this could show up as a change of the lattice amplitude eventually.

#figure(
  image("figures/2024-10-31_ON_x532_lensing_PH_result_18.png", width: 65%),
  caption: [
    In-situ lattice modulation spectroscopy of the minimized thermal lensing in the x532-lattice.
    The lattice depths were $v_l = #qty[60][Erec]$ and $v_s = #qty[18][Erec]$ respectively, and the superlattice was set to $phi = pi / 4$.
    The x532-lattice was modulated for $t_"mod" = #qty[0.5][s]$ and the errorbars show the standard deviation of four averages.

    #[
      #set text(red)
      - Remove Basler camera data and only show the position, waist and depth.
      - Make sure that this figure is connected to @fig:super-thermal-x532-ph.
      - Discuss the unnecessarily small time sampling...?
      - Normalize the lattice depth to $t = 0$?
    ]
  ],
) <fig:super-thermal-x532-rebuild>
