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
As explained in #text(red)[ref modulation/superlattice section] we always want to use the lower well at the antisymmetric phase $phi = pi / 4$ for the in-situ lattice modulation in the x-superlattice.
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
) <fig:superlattice-thermal-x532-ph>


=== Theory of thermal lensing <ssec:superlattice-thermal-theory>

#[
  #set text(red)
  - Look up ULE glasses. Do they really have G = 0?
  - Reference achromatic lenses here that use a similar "compensation"?
  - Mention any actual values for $G$ etc... here?
  - Add figure to illustrate the two thermal lensing terms.
]

Before introducing the changes we made to the optical setups of the x1064-lattice and the x532-lattice, I will briefly explain the theory behind the observed thermal lensing (effects).
When dealing with thermal lensing, there are two approaches available to reduce its effects on the optical system.
You can either compensate the thermal lensing with a combination of glasses with "complimentary" properties, or you can (just) minimize the thermal lensing (in the first place) by a smart choice of materials.
The former approach is often required when working with high-energy laser pulses or very high powers $cal(O)(#qty[100][W])$ and beyond.
In that case you can only resort to custom optics optimized for your specific scenario/use case #text(red)[cite some custom optics stuff here].
Since we are (only) dealing with medium optical powers $cal(O)(#qty[1][W])$, the simple approach of selecting (readily available) optical elements with minimal thermal lensing effects was sufficient.
#text(red)[Where should I put this sentence?]
An understanding of the material properties that determine the strength of the thermal lensing was important for the selection of the optical elements.

We already know that the thermal lensing as observed in @fig:superlattice-thermal-x1064-ph and @fig:superlattice-thermal-x532-ph was self-induced by the laser beams of the respective lattices.
And the "strength" of the thermal lensing was proportional to (or at least increasing with) the optical power.
This is the expected behavior of thermal lensing caused by local temperature changes due to absorption of the laser beams in the optical elements.
We can expect each optical element to absorb $<#qty[1][%]$ of the optical power.
While this does not sound like a lot given the total power $cal(O)(#qty[1][W])$, we are working with beam diameters that are (unusually) small for collimated beams #text(red)[ref setup?].
The (local) intensity can therefore be as high as #text(red)[compute an actual value here...].

#text(red)[ref Laskin 2022 for this entire paragraph]
To get started with the theoretical description of thermal lensing we will just assume that the absorbed intensity $Delta I$ leads to a (static) local increase of the temperature $Delta T prop Delta I$.
The local change of the temperature will cause an expansion of the glass proportional to the coefficient $alpha$.
In addition the glass will show a refractive index gradient $phy.dv(n, T)$.
These are the two effects/terms that contribute to the change of the optical path length.
Combining them yields the coefficient

$
  G = alpha (n_0 - 1) + phy.dv(n, T)
$ <eq:superlattice-thermal-theory-G>

where $n_0$ is the (unperturbed) refractive index of the glass.
The first term/contribution is always positive since all glasses have a thermal coefficient of expansion $alpha > 0$.
The thermal coefficient $phy.dv(n, T)$ on the other hand can either be negative or positive.
For so-called "athermal" glasses the (total) coefficient G can therefore be (close to) zero, in which case they would not experience thermal lensing at all (at least not in the lowest order...).
If the contribution by the second term in @eq:superlattice-thermal-theory-G is stronger than the first term, the coefficient G will be negative.
Such glasses are used to compensate the effects of thermal lensing of other glasses with $G > 0$.
Examples for glasses with negative $G$ are $"CaF"_2$ and Crystalline quartz (#text(red)[mention both orientations?]).

The most common glasses used in our optical setup were Fused Silica and N-BK7 and #text(red)[any other glasses?].
See @tab:superlattice-thermal-theory for a compilation of the material properties of the glasses in our optical setup.
For all these glasses both terms in @eq:superlattice-thermal-theory-G are positive, leading to a strong? thermal coefficient $G$.
The (actual) local change of the optical path length $Delta s$ is proportional to the coefficient $G$ and to the temperature change $Delta T$ #text(red)[at least approximately...].
Since $Delta T$ follows the gaussian intensity distribution of the lattice beams, the thermal lensing will behave like an effective convex lens (focal length $f > 0$).
This matches our observations that the focal positions were moved towards their respective lenses during the thermally-induced drifts.

#figure(
  table(
    columns: 6,
    stroke: none,
    table.header(
      "Material",
      $n_0$,
      $phy.dv(n, T) dot 10^6 slash thin #unit[K]$,
      $alpha dot 10^6 slash thin #unit[K]$,
      $k_T slash thin #unit[W/(m K)]$,
      $G dot 10^6 slash thin #unit[K]$,
    ),
    table.hline(),
    "Fused Silica", num[1.4496], num[8.8], num[0.51], num[1.31], num[9.03],
    "N-BK7", num[1.5066], num[1.5], num[8.3], num[1.114], num[5.7],
    $"CaF"_2$, num[1.4284], num[-10.4], num[18.9], num[9.7], num[-2.3],
  ),
  caption: [
    Thermal lensing properties of common glasses.
    The properties are measured/valid at a temperature of $T = #qty[300][K]$.

    #show list: set text(red)
    - What else should I add to the caption here?
    - Transpose the list to allow more properties? E.g. $rho$ and the absorption.
    - Add quartz for waveplates (and TGG for the isolators if possible?)
  ],
) <tab:superlattice-thermal-theory>

To also understand the time dependence of the thermal lensing drifts we have to take into account that the local changes of the temperature $Delta T$ will distribute in the optical elements according to the thermal conductivity $k_T$.
If the thermal conductivity is large, the temperature changes will "delocalize" quickly, thereby reducing the effects of the thermal lensing.
The (total) coefficient that takes the change of the optical path length and the dissipation of the heat into account is therefore

$
  rho = G slash k_T = (alpha (n_0 - 1) + phy.dv(n, T)) slash k_T
$ <eq:superlattice-thermal-theory-rho>

Based on the coefficients $rho$ shown in @tab:superlattice-thermal-theory we would now expect Fused Silica and N-BK7 #text(red)[(and more?)] to be equally problematic regarding the thermal lensing.
We are however still missing one material property to quantify/estimate the (actual) strength of the thermal lensing.
As the temperature changes are caused/induced by the absorption of the lattice beams in the optical elements, the actual strength of the thermal lensing will (of course) depend on the absorbed power/intensity.
If a glass has a very low absorption (coefficient), the effect of the thermal lensing will be small even if the coefficient $rho$ is large/substantial.
The perfect example for such a glass is (UV) Fused Silica.
While it has the largest thermal lensing coefficient $rho$ of all the glasses we used in the optical setups, the absorption on the other hand is by far the smallest.
For the power regimes we are working in, (UV) Fused Silica is therefore the best/most suitable glass.
Many (designated) high-power lenses and (polarizing) beamsplitters made from (UV) Fused Silica are readily available, making the necessary replacements possible without any custom optics.

Due to its large thermal lensing coefficient $rho$ and the large absorption we decided to avoid N-BK7 optics at all costs.
Most (cheap) singlet lenses are made from N-BK7, and it is also commonly used as the crown glass in achromatic doublets.
Many of the optics in the optical setups of the x1064-lattice and the x532-lattice were therefore using N-BK7 glass, which proved to be the biggest contribution to the thermal lensing issues.

#text(red)[Actually put this in this section?]
A type of glass that we could not (just) optimize for its thermal lensing properties is the Faraday medium in the optical isolators that we use for the retro-reflected lattices #text(red)[ref setup].
The most important property for those glasses is the Verdet constant that quantifies the rotation of the polarization proportional to the magnetic field $phy.vb(B)$ and the distance $d$.
Efforts to reduce the thermal lensing of optical isolators (in high-power setups) mostly/usually add external cooling of the crystal #text(red)[add citations].
This is not useful in our case since we are only affected by the local temperature changes in the (small) beam area.
The best we could do for the optical isolators was therefore to use the Faraday medium TGG (which has at least decent thermal lensing properties) and to minimize the length of the crystal.

The last contribution to the thermal lensing that we could identify was the glue/cement used in composite optical elements such as (polarizing) beamsplitters, waveplates or (achromatic) doublets.
Since we do not know the thickness or the thermal and optical properties of the glue/cement, the only optimization was to get rid of them alltogehter.
For beamsplitters and waveplates this can be achieved by optically contacting the separate parts.
(Achromatic) doublets can be air-spaced to avoid the (additional) thermal lensing.
Both options are readily available without requiring custom optics.
They are usually sold as high-power optics since the glue/cement has a much lower damage threshold compared to the glasses.


=== Simulation of thermal lensing <ssec:superlattice-thermal-simulation>

#[
  #set text(red)
  - Mention any of the equations in the theory chapter?
  - Which book should I cite here for ABCD + gaussian beams?
  - Any references to the thermal lensing theory chapter?
  - Find a better character for the optical strength? Maybe s or $sigma$ are good here?
  - Where to mention that thermal lensing is always positive? Ref earlier section?
  - Use different character for the demagnification? The vectors are also $v$...
]

To get an understanding of the "propagation" of the thermal lens(ing) through the optical setups we are going to consider a minimal setup from the thermal lens to the position of the atoms.
The actual optical setups of the x1064-lattice and the x532-lattice are more complex, but their behavior under thermal lensing can still be related to the setup in the simulation.
While the actual lattice beams would need to be modelled by gaussian beams, it is sufficient to consider simple rays when studying the focal shift introduced by the thermal lens(ing).
This approximation is valid since the initial beam is collimated and since the thermal lens(ing) is only a small perturbation of the beam.
#text(red)[Mention the Rayleigh-induced focal shift here? This should not matter for the actual thermal lensing since the Rayleigh-induced shift is a static one.]

#figure(
  image("/figures/thermal-lensing-simulation.png"),
  caption: [
    Dummy setup to simulate the focal shift induced by (a) thermal lens(ing).
    The beam is initially collimated with a radius of $r = w_0$.
    A thermal lens then slightly focusses the beam before it is demagnified by the factor $v = f_1 \/ f_2$ in a telescope to (later) get the correct beam shape/waist at the position of the atoms.
    After a propagation by the distance $d$ the beam is focusses onto the atoms with the 2 inch lens #text(red)[ref anything?] with $f = #qty[250][mm]$.

    #[
      #set text(red)
      - Also draw the corresponding gaussian beam in here?
    ]
  ],
) <fig:superlattice-thermal-simulation-setup>

@fig:superlattice-thermal-simulation-setup shows the minimal optical setup to simulate the propagation of thermal lensing.
The setup/simulation assumes that there is a single optical element responsible for the thermal lensing.
We are then using a demagnifying telescope to prepare the correct beam shape before the final (atom) lens that focusses the lattice beams onto the atoms.
In practice the thermal lensing is distributed across all (transmissive) optical elements.
All three (other) lenses in @fig:superlattice-thermal-simulation-setup would therefore also contribute to the (total) thermal lensing.
For the x1064-lattice there is a third lens to "relay" the beam onto the final lens with $f$ that is not considered here. #text(red)[How does this actually affect the thermal lensing?]
For the x532-lattice there are two telescopes in the setup resulting in a different demagnification for the horizontal axis and the vertical axis.
To relate the setup to the simulation we can only count the total demagnification across the two telescopes for each axis.

We are going to quantify the thermal lensing with a (very) thin lens of focal length $f_"thermal"$.
In our setup the (effective) focal length was $cal(O)(#qty[10][m])$ which is (very) weak compared to the other lenses and the (propagation) distances.
We will therefore use the optical power

$
  alpha = 1 \/ f_"thermal"
$ <eq:superlattice-thermal-simulation-alpha>

to characterize the thermal lens(ing).
The lattice beams after applying the thermal lens(ing) will then be described by the vector

$
  phy.vb(v_0) = vec(w_0, - alpha w_0)
$ <eq:superlattice-thermal-simulation-v>

where $w_0$ is the (gaussian) waist of the beam.
For the initial beams of the x1064-lattice and the x532-lattice the waist is $w_0 approx #qty[1][mm]$.
#text(red)[(The difference of the Rayleigh length due to the wavelengths is not relevant here)]
In the ABCD (or ray transfer) matrix formalism we can describe the propagation of the beam/vector $phy.vb(v_0)$ through the (remaining) lenses in the setup in @fig:superlattice-thermal-simulation-setup by the following equation

$
  phy.vb(v_1) =
  mat(1, 0; -1\/f, 1) dot
  mat(1, d; 0, 1) dot
  mat(-1\/v, L; 0, -v) dot
  phy.vb(v_0)
$ <eq:superlattice-thermal-simulation-v1>

where $v = f_1 \/ f_2$ and $L = f_1 + f_2$ are the demagnification and the length of the telescope, $d$ is the propagation distance between the telescope and the (atom) lens, and $f$ is the focal length of the (atom) lens.

Without thermal lensing ($alpha = 0$) we would expect the beam to be focussed at distance $f$ from the last lens.
To quantify the thermal lensing we are therefore going to compute the shift from the expected focus (as a function of the thermal lensing strength $alpha$).
The focal shift/position can be computed from the radius $r_1$ and the angle $theta.alt_1$ of the vector $phy.vb(v_1)$

$
  delta = -r_1 / theta.alt_1 - f = - alpha v^2 f^2 + cal(O)(alpha^2)
$ <eq:superlattice-thermal-simulation-delta>

From the first order (of expansion) in the optical power $alpha$ we can already read/learn the most important properties of the thermal lensing.
The focal shift $delta$ is negative which indicates that the focus is moved towards the (atom) lens.
This aligns with our expectations since the thermal lens(ing) applies/applied a small focus on the collimated beam.
The reason for the quadratic scaling of $delta$ with the demagnification $v$ is not (completely) obvious.
If we take a look at the ABCD matrix $M_v$ of the telescope, we can see that the factor $v$ occurs twice.
The radius is divided by the factor $v$ whereas the angle is multiplied by the factor $v$.
In the end both the reduced radius and the increased angle contribute (equally) to the focal shift, resulting in the factor $v^2$ (in first order of $alpha$).

The importance of the quadratic scaling of $delta$ with the demagnification $v$ is not obvious at first glance eitehr.
Without this scaling one could think that the thermal lensing can be "eliminated" with a larger initial beam and a stronger telescope.
The quadratic scaling however completely neutralizes this "trick".
If the thermal lensing $alpha$ is proportional to the intensity prefactor $I_0$ of the gaussian beam, the order of the thermal lens(ing) and the telescope does not matter #text(red)[@ssec:superlattice-thermal-theory or an equation/figure?].
Any reduction of $alpha$ due to a larger beam will be applied (or recovered?) by the telescope through the factor $v^2$ again.
#text(red)[Anything to say about the scaling with $f^2$?]
For the x532-lattice we can therefore expect a different shift $delta$ for the horizontal axis and the vertical axis.
With an aspect ratio of $~#num[2.5]$ the shift $delta_"horizontal"$ should be greater than the shift $delta_"vertical"$ by a factor of $~#num[6]$.
#text(red)[Add the comparison of the ray simulation and gaussian simulation here.]
