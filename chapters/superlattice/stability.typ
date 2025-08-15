#import "/header.typ": *

== Stability of the optical lattices <sec:super-stability>

#notes[
]

=== x1064-lattice characterization <ssec:super-thermal-x1064>

#[
  #set text(red)
  - Estimate the shift of the focus for an initially perfect alignment?
]

While we initially noticed the thermal lensing and thermal "phasing" issues in the superlattice, we opted to investigate the x1064-lattice separately first.
There are only two transmissive optical elements that are shared by the lattices, see #text(red)[ref figure in setup section], we can expect most of the thermal lensing to "originate" in the individual optical setups.
For the x1064-lattice we could just run the monochromatic in-situ parametric heating to measure the changes due to the thermal lensing.
We used a (lattice) modulation time of #qty[100][ms] to achieve a good time resolution with the in-situ lattice modulation measurements.
#text(red)[reference modulation chapter/section here on the optimization of the modulation time?]
#text(red)[Mention shallow lattices with #qty[6][Erec] somewhere?]
Further reducing the modulation time was not necessary to resolve the changes of the lattice due to the thermal lensing as shown in @fig:super-thermal-x1064-ph.
We found that the lattice depth $a_0$ is reduced (or decays exponentially?) by $approx #qty[5][%]$ during the first second of the holding time.
After this initial (strong) decrease/decay, the lattice depth is further reduced linearly by $approx #qty[0.2][%/s]$.
The measured/evaluated waist $w_0$ of the optical lattice increases by $approx #qty[15][μm]$ during the first second, matching the behavior of the lattice depth.
We therefore concluded that the foci of the forward-propagating and retro-propagating lattice beams are shifted such that we get a shallower (but wider) lattice at the position of the atoms.

#figure(
  image("figures/2024-05-30_x1064-heating_reference_result.png", width: 80%),
  caption: [
    In-situ lattice modulation spectroscopy of the thermal lensing effects in the x1064-lattice.
    The setpoint of the lattice depth for this measurement was #qty[55][Erec] which would correspond to a parabola offset of $a_0 = 1.0$.
    In the experimental sequence the lattice modulation would start immediately after the time $t_"hold"$ which we varied from #qty[0][s] to #qty[5][s].
    The modulation time was set to #qty[100][ms], and the modulation amplitude was chosen such that the resonance amplitudes are between #num[0.45] and #num[0.65] #text(red)[ref modulation chapter/section].
    The errorbars show the standard deviation of three measurements per data point.

    #show list: set text(red)
    - Shift the data points by #qty[50][ms]?
    - Rename x-axis variable?
    - Is the fit really necessary here?
    - Normalize a0 to be 1.0 at t = 0?
    - Only show position, depth and waist here.
    - Also include data with #qty[45][Erec]
  ],
) <fig:super-thermal-x1064-ph>


The change of the position $y_0$ by $approx #qty[1][px]$ (#text(red)[use lattice site $a$ as unit instead?]) during the holding time is insignificant compared to the changes of the other two lattice parameters.
This does not completely rule out thermal effects on the beam pointing since the lattice depth would also be reduced if the overlap of the lattice beams gets worse.
Measurements of the lattice beams with a camera did however show that the beam positions are constant down to a few #unit[μm].
The beam waists and beam amplitudes (intensity in the center) on the camera did however show changes that match the measurements with the atoms in @fig:super-thermal-x1064-ph.
#text(
  red,
)[Mention that the camera was not properly measuring with a 4f configuration, hence no actual camera data shown here?]

A quantitative analysis of the thermally induced focal shift would require a measurement of the beam waist and the beam amplitude as a function of the time $t$ and at different positions $x$ around the (virtual) position of the atoms.
From the data in @fig:super-thermal-x1064-ph we can only conclude that we do not "cross" the position of the atoms with the foci of the forward-propagating beam and/or the retro-propagating beam.
We do not know the distance the foci actually moved due to the thermal lensing.
The spatial direction of the change can be inferred from the fact that thermal lensing (almost) always has a "focusing" effect.
The focus of the forward-propagating beam was therefore moved towards the #qty[2][in] lens in the forward-path.
In accordance with the expected behavior in a $4f$-configuration, the focus of the retro-propagating beam was shifted towards the lens in the retro-path.
If we had known the focal positions relative to the positions of the atoms, we could have inferred the distance of the focal shift from the lattice depth measurement or the measurements with the camera.
However, we only learned how to measure the focal positions with a camera reliably after we had already minimized the thermal lensing in the optical setup.

To find the optical elements responsible for the thermal lensing, we only used the forward-propagating beam to simplify the interpretation of the data.
We manually placed a beam block just behind the fiber (out)coupler in the (experimental) optical path of the x1064-lattice.
After waiting for a few seconds we would then removed the beam block and measured the beam with the camera at the (virtual) position of the atoms as a function of the time $t$.
This allowed us to measure the combined effect of the thermal lensing in all optical elements _behind_ the beam block.
We then repeated this measurement with the beam block at every available position in the optical setup.
The differences in the combined thermal lensing would then reveal which optical elements we should remove or replace.
We decided against measuring the actual focal shift for each position of the beam block since this would have increased the measurement time by at least a factor of $10$.
To identify the problematic optical elements it was sufficient to use the "qualitative" measurement at the (virtual) position of the atoms.
For the final setup that minimizes the thermal lensing, we then measured the actual focal shifts of the forward-propagating beam and the retro-propagating beam.
The results are presented in @ssec:super-thermal-x1064-rebuild.


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



=== x1064-lattice rebuild <ssec:super-thermal-x1064-rebuild>

#[
  #set text(red)
  - Merge this with the x532-lattice rebuild subsection?
  - Give different names to the waists to tell them apart?
  - Mention all the lens types? Compare before and after?
  - Really mention that the concave lenses were mostly responsible? Or is this just an unnecessary detail?
  - Mention that a/the focus is technically inside the optical isolator?
  - Really compare the materials of the forward-lens and retro-lens? Check the materials again after including them in the table @tab:super-thermal-theory.
  - Mention the perfect focus matching with #qty[532][nm] and #qty[1064][nm] of the YAP lens?
  - Add figure that shows the actual beam profiling as a function of $t$ and $x$?
  - Where to mention the improvement of the x1064-lattice depth by 20%? Also mention the corresponding decrease of the waists.
  - Use actual errors for all the estimated values here?
]

Based on the measurements from @ssec:super-thermal-x1064, the theoretical considerations from @sec:super-thermal and the simulation of the "propagation" of thermal lensing in @ssec:super-thermal-simulation we rebuilt the optical setup of the x1064-lattice.
The primary goal was to minimize the thermal lensing but we also wanted to make sure that we can properly tune the around the position of the atoms #text(red)[ref setup section?].
In the initial setup for the x1064-lattice there were two Galilean telescopes used for the beam shaping.
The first telescope used lenses with the focal lengths #qty[175][mm] and #qty[-100][mm] and was placed directly behind the fiber coupler.
With a (de)magnification of $tmag_1 = 1.75$ the initial waist of the collimated beam was reduced from $w_0 approx #qty[0.9][mm]$ to $w_0 approx #qty[0.5][mm]$.
The second telescope was placed just before the mirror used for the alignment, and it used lenses with the focal lengths #qty[125][mm] and #qty[-100][mm].
With a demagnification of $tmag_2 = 1.25$ the telescope only slightly reduced the beam size again.
The total demagnification without taking the propagation between the telescopes into account is therefore $tmag approx 2$.

During the characterization/investigation of the thermal lensing in @ssec:super-thermal-x1064 we found the main contributions coming from the concave lenses of the telescopes.
All four lenses were singlets made from N-BK7 with similar (center) thickness, we therefore don't know why the concave ones were worse than the convex ones.
To minimize the thermal lensing in the x1064-lattice setup we therefore decided to replace the two telescopes by a single one with demagnification $tmag = 2$.
We placed the telescope just in front of the optical isolator, and for the lenses we used UVFS singlets with the focal lengths #qty[150][mm] and #qty[-75][mm].
In addition to the telescope we also introduced a "relay" lens with a focal length of #qty[750][mm] that is also made from UVFS.
The relay lens is positioned just behind the mirror used for the alignment since it should be as close as possible to the 2 inch lens before the atoms.
#text(red)[Add reference to the setup here!]

With optimized focal positions we had already cut down the change of the lattice depth due to the thermal lensing to $approx #num[1]%$ #text(red)[At #qty[60][Erec]].
Neither the optical isolator#footnote[#text(red)[Conoptics 714, TGG?]] nor the waveplate and PBS in the x1064-lattice setup to rotate the polarization behind the isolator showed a relevant thermal lensing.
The biggest remaining contribution to the thermal lensing of the x1064-lattice was the 2 inch lens in the retro-path#footnote[#text(red)[YAP-250.0-50.0]].
While $approx #num[1]%$ is not a large change anymore, the origin of the thermal lensing in the lens in the retro-path was still critical.
Since the x1064-lattice beams and the x532-lattice beams have to be overlapped for the alignment of the x-superlattice, the thermal lensing contribution from the two lattices would add up in the 2 inch lenses around the glass cell.
For the 2 inch lens in the forward-path a different model#footnote[#text(red)[Borchers? Any model name/description?]] was used that did not show any thermal lensing (contribution).
While both lenses have a focal length of #qty[250][mm] and a diameter of $>#qty[50][mm]$, their materials are completely different.
The lens in the forward-path is an achromatic doublet with N-BALF4 as the flint glass with a (center) thickness of $approx #qty[3][mm]$ and $"CaF"_2$ as the crown glass with a (center) thickness of #qty[10][mm].
According to the thermal lensing properties in @tab:super-thermal-theory these glasses are well suited for a minimal thermal lensing.
$"CaF"_2$ actually has a negative thermal lensing contribution which would counteract the thermal lensing caused by the N-BALF4.
The lens in the retro-path on the other hand was an achromatic triplet consisting of one N-SF11 lens (as the flint glass) with a (center) thickness of #qty[4][mm] and two N-BK7 lenses (as the crown glass(es)) with a total (center) thickness of #qty[13][mm].
In terms of thermal lensing this is probably the worst possible composition of a lens #text(red)[is N-SF11 also bad on its own?].

Regarding the stability of the superlattice potential the lens in the retro-path is extra critical since it also affects the phase $phi$ of the superlattice #text(red)[ref what?].
The local temperature change $Delta T$ that causes the thermal lens(ing) will also detune the superlattice phase #text(red)[ref superlattice chapter].
We therefore decided to replace the lens in the retro-path by the same lens model as in the forward-path.
Both the thermal lensing of the lattices as shown in #text(red)[ref x1064-figure and x532-figure] as well as the phase of the superlattice #text(red)[ref figure in superlattice chapter] were significantly improved by the replacement.

As the final optimization of the thermal lensing we set/place the focal positions of the forward-propagating beam and the retro-propagating beam such that the change of the beam amplitude is minimal.
The lattice depth in the center is most sensitive to the maximum beam amplitude, small changes of the waist on the other hand are not problematic for our experiments.
#text(red)[where to put the next sentence? even mention the astigmatism?]
We determined these focal positions empirically from beam profiling measurements as a function of the camera displacement and the time.
For the x1064-lattice we can observe a small astigmatism where the in-plane focus is displaced by $approx #qty[5][mm]$ compared to the vertical focus.
With a Rayleigh range of $z_R approx #qty[60][mm]$ the loss of the (maximum) amplitude is negligible.
Adding a cyclindrical telescope or introducing other changes to the optical setup to compensate/correct the astigmatism would not be worth it.

#text(red)[Find a better transition here...]
From the beam profiling measurements with a camera we found that the focal shift due to the thermal lensing is $delta < #qty[1][mm]$ for both the forward-propagating beam as well as the retro-reflected beam.
#text(red)[Just also write #qty[60][Erec] here?]
The total measurement time was #qty[5][s] and the x1064-lattice was set to a lattice depth of #qty[65][Erec].
From the beam amplitude/intensity (in the center) we could already estimate that the change of the lattice depth will be positive at $<#num[0.5]%$.
For the definitive result we have to look at the in-situ parametric heating measurement shown in @fig:super-thermal-x1064-rebuild.
Over the measurement time of #qty[5][s] the lattice depth increases by $approx #num[0.2]%$.
The actual thermal lensing change/strength is therefore even smaller than expected from the measurements with the camera.
Compared to the initial measurement in @fig:super-thermal-x1064-ph we have therefore reduced the thermal lensing by a factor of #num[25] due to the improvements presented in this subsection.
#text(red)[Actually mention this possible improvement?]
In theory we could have tried to reduce the thermal lensing effect even more by optimizing the position of the focus such that the focus is "pulled" through the position of the atoms by the shift $delta$.
#text(red)[Just skip this idea?]
We decided against this since we are already close to the resolution of the in-situ measurement.
Unless the overlap with the x532-lattice will lead to a strong(er) thermal lensing again, we don't have to worry about it for the x1064-lattice anymore.

#figure(
  image("figures/2024-10-28_PH_x1064_thermal_lensing_result.png", width: 80%),
  caption: [
    In-situ lattice modulation spectroscopy of the minimized thermal lensing effects in the x1064-lattice.
    The setpoint of the lattice depth for this measurement was #qty[60][Erec] and the modulation time was set to #qty[200][ms].
    The data shows five averages of full in-situ lattice modulation scans where the errorbars denote the

    #[
      #set text(red)
      - Remove Basler camera data.
      - Make sure that this figure is connected to @fig:super-thermal-x1064-ph.
      - Only show the position, the waist and the depth here.
    ]
  ],
) <fig:super-thermal-x1064-rebuild>


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
