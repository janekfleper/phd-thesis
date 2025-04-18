#import "../../header.typ": *

== Thermal lensing <sec:superlattice-thermal>

#[
  #set text(red)
  - Mention the y-lattice depth here anywhere?
]

When attempting to run atom/state lifetime measurements in the x-superlattice, we noticed that the potential changed/drifted significantly in a few #qty[100][ms].
During the investigation of these drifts/changes we learned that all three superlattice parameters, the lattice depth $v_l$, the lattice depth $v_s$ and the phase $phi$, were affected.
While the changes of the phase $phi$ could also be caused by changes of the air temperature in the retro-path, the changes of the lattice depths $v_l$ and $v_s$ must be a fundamental issue with the optical setup.
We were able to attribute the changes of the lattice depths $v_l$ and $v_s$ to thermal lensing and could resolve the issues by removing or replacing the offending optical elements.
As a (nice) side effect this also significantly reduced the drift of the superlattice phase that was caused by temperature changes in the lens in the retro-path.
The remaining change/drift of the phase $phi$ is now caused actually just caused by the air temperature #text(red)[ref section...].
In this section I will cover the changes we did to the optical setups to significantly suppress the thermal lensing for the x1064-lattice and the x532-lattice.

To characterize the thermal lensing of the x-lattices, we used the in-situ parametric heating introduced in @ch:modulation.
This measurement technique allows us to retrieve the lattice depths, the lattice positions and the lattice waists from a single scan of the modulation frequency.
The time resolution is limited by the modulation time which should be at least #qty[100][ms] to acquire a good/reasonable contrast, see #text(red)[ref modulation section for more details].
Besides the in-situ parametric heating technique we also employed cameras that image the lattice beams at the position of the atoms through a $1:1$ telescope/relay.
Compared to the parametric heating measurement, this allowed us to measure the forward-propagating beams and retro-propagating beams individually.
By using a camera with an RGB sensor#footnote[Basler acA2040-35gc] we could also separate the overlapping beams of the x1064-lattice and the x532-lattice.
Measuring both lattice beams at the same time was important to understand the "crosstalk" of the thermal lensing in the shared optical elements where both lattices are overlapped.
With the cameras we can achieve a time resolution of $< #qty[100][μs]$, the limitation here is the maximum number of $255$ images in the triggered mode.


=== x1064-lattice characterization <ssec:superlattice-thermal-x1064>

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
Further reducing the modulation time was not necessary to resolve the changes of the lattice due to the thermal lensing as shown in @fig:superlattice-thermal-x1064-ph.
We found that the lattice depth $a_0$ is reduced (or decays exponentially?) by $~#qty[5][%]$ during the first second of the holding time.
After this initial (strong) decrease/decay, the lattice depth is further reduced linearly by $~#qty[0.2][%/s]$.
The measured/evaluated waist $w_0$ of the optical lattice increases by $~#qty[15][μm]$ during the first second, matching the behavior of the lattice depth.
We therefore concluded that the foci of the forward-propagating and retro-propagating lattice beams are shifted such that we get a shallower (but wider) lattice at the position of the atoms.

#figure(
  image("../../figures/2024-05-30_x1064-heating_reference_result.png", width: 80%),
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
) <fig:superlattice-thermal-x1064-ph>


The change of the position $y_0$ by $~#qty[1][px]$ (#text(red)[use lattice site $a$ as unit instead?]) during the holding time is insignificant compared to the changes of the other two lattice parameters.
This does not completely rule out thermal effects on the beam pointing since the lattice depth would also be reduced if the overlap of the lattice beams gets worse.
Measurements of the lattice beams with a camera did however show that the beam positions are constant down to a few #unit[μm].
The beam waists and beam amplitudes (intensity in the center) on the camera did however show changes that match the measurements with the atoms in @fig:superlattice-thermal-x1064-ph.
#text(red)[Mention that the camera was not properly measuring with a 4f configuration, hence no actual camera data shown here?]

A quantitative analysis of the thermally induced focal shift would require a measurement of the beam waist and the beam amplitude as a function of the time $t$ and at different positions $x$ around the (virtual) position of the atoms.
From the data in @fig:superlattice-thermal-x1064-ph we can only conclude that we do not "cross" the position of the atoms with the foci of the forward-propagating beam and/or the retro-propagating beam.
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
#text(red)[ref later figure...]


=== x532-lattice characterization <ssec:superlattice-thermal-x532>

#[
  #set text(red)
  - Mention the change of the phase during the in-situ measurement?
]

For the x1064-lattice we were able to directly measure the lattice depth with the (monochromatic) in-situ parametric heating technique.
This is not possible for the x532-lattice since we do not have enough optical power to achieve a sufficient lattice depth to get a narrow resonance $1 -> 3$, see @sec:modulation-results for the discussion.
We therefore had to rely on the x-superlattice to measure the depth of the x532-lattice.
The technical details of the in-situ lattice modulation spectroscopy in the x-superlattice are explained in #text(red)[ref modulation/superlattice section].
I will therefore only qualitatively explain the (parameters of the) in-situ measurement here.
In addition to the measurement of the lattice depth with the in-situ lattice modulation technique, we also used cameras to capture the forward-propagating beam and the retro-propagating beam at the position of the atoms.
From these measurements with the camera we could already see that the total effect of the thermal lensing for the x532-lattice was even worse than for the x1064-lattice.

#text(red)[just reference the modulation/superlattice section here?]
As explained in #text(red)[ref modulation/superlattice section] we always want to use the lower well at the antisymmetric phase $phi = pi/4$ for the in-situ lattice modulation in the x-superlattice.
This gives us the highest effective/greatest lattice depth as "the sum" of the x1064-lattice and the x532-lattice, and the band structure will have the smallest sensitivity to small changes of the phase $phi$.
At the maximum x532-lattice depth of $~#qty[20][Erec]$ we can/could achieve, the bands $n = 3$ and $n = 4$ are sufficiently narrow and have the same parity as the lowest band $n = 1$.
We will therefore use these two transitions to determine the thermally-induced change of the x532-lattice depth.
While both transitions $1 -> 3$ and $1 -> 4$ have similar frequencies, they each scale differently with the lattice depths $v_l$ and $v_s$.
The frequency/energy of the transition $1 -> 4$ is around #text(red)[$10?$] times more sensitive to the lattice depth $v_s$ than the frequency/energy of the transition $1 -> 3$.
For the lattice depth $v_l$ we get exactly the oppostie scenario where the frequency/energy of the transition $1 -> 3$ is a lot more sensitive.
This holds true down to the avoided crossing of the bands $n = 3$ and $n = 4$ at $v_l approx #num[60]$ and $v_s approx #num[14]$ #text(red)[ref anything?].

Since we only want to measure the thermal lensing effects of the x532-lattice we will therefore use the transition $1 -> 4$.
To further suppress any changes due to the x1064-lattice, we applied a feed-forward signal to the lattice depth in the experimental sequence based on the measurement shown in @fig:superlattice-thermal-x1064-ph.
The idea was to increase the set point such that the actual lattice depth at the position of the atoms is constant.
This does not address the increase of the waist which is okay since we mainly care about the lattice depth close to the center.
We only used this as a temporary solution to get a constant x1064-lattice depth before fixing/upgrading the optical setup.
To confirm that the change of the x1064-lattice depth during the measurement was negligible with the varying set point, we used beam data at the (virtual) atom position acquired by the camera and we also included the transition $1 -> 3$ in the measurement.
Both measurements showed a negligible change of the x1064-lattice compared to @fig:superlattice-thermal-x1064-ph.

On the forward-propagating beam camera we could observe that the amplitude/depth of the x532-lattice reduces as a function of the time $t_"hold"$ with a similar shape as the x1064-lattice.
The difference was that the effect of the thermal lensing on the amplitude/depth increased non-linearly with the set point $v_s$.
After a few seconds the measured depth would settle/converge to an increasingly smaller value as if there was a "hard" limit on the lattice depth we could achieve.
We therefore opted to measure the "settled" lattice depth as a function of $v_s$ at $t_"hold" = #qty[3][s]$.
This allowed us to use a longer modulation time of #qty[500][ms] #text(red)[which is preferred for the in-situ x-superlattice measurements?]
The results for the measurement interval/range $v_s = [14.4, ..., 24]$ are presented in @fig:superlattice-thermal-x532-ph, confirming the non-linear decrease/decay of the lattice depth.
At $v_s = #num[14.4]$ the "settled" lattice depth is already reduced by $~#qty[10][%]$ which is already twice the change of the x1064-lattice at its maximal depth.
The relative "loss" of the lattice depth at $v_s = #num[24]$ already amounts to $~#qty[30][%]$.
If we assume that the foci of the forward-propagating beam and the retro-propagating beam were (perfectly) located at the position of the atoms, such a change of the lattice depth would correspond to a shift of the focal positions by $~#qty[10][mm]$ if we only consider the (vertical) Rayleigh length of $~#qty[15][mm]$.
For the horizontal waist the effect of the thermal lensing is a lot more complicated since the thermal lensing also changes the Rayleigh length itself and therefore the waist at the focus.
#text(red)[Mention waists from @fig:superlattice-thermal-x532-ph here.]

From this measurement we concluded that the x532-lattice is not usable with the current (state of the) optical setup.
Due to the "non-linearity" of the thermal lensing we could not even apply a feed-forward to $v_s$ as we did for the x1064-lattice.
In preparation for the rebuild/overhaul of the optical setup we identified the elements that caused the thermal lensing with the same approach as explained in @ssec:superlattice-thermal-x1064.
The changes we did are explained in detail in #text(red)[ref later section].


#figure(
  image("../../figures/2024-06-24_PH_xsuper_result.png", width: 60%),
  caption: [
    In-situ superlattice modulation spectroscopy of the thermal lensing effects in the x532-lattice.
    The x1064-lattice was set to $v_l = #num[55]$ and the superlattice phase was set to $phi = pi/4$.
    The modulation time was $t_"mod" = #qty[500][ms]$ after a holding time of $t_"hold" = #qty[3][s]$.
    As the reference value for the lattice depth $a_0$ we used a measurement at $t_"hold" = #qty[0][s]$ with a modulation time of #qty[100][ms].
    While this will already be the average (reduced) lattice depth during the modulation time, it is the best we can do as far as a measurement using the atoms goes.

    #show list: set text(red)
    - Anything important to write about the evaluation?
    - Show lattice depth, waist and position here again?
    - Use absolute lattice depths on the y-axis of the a0 axis?
    - Show "final" lattice depth to illustrate the "hard limit"?
  ],
) <fig:superlattice-thermal-x532-ph>
