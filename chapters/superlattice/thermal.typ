#import "/header.typ": *

== Thermal lensing <sec:super-thermal>

#[
  #set text(red)
  - Mention the y-lattice depth here anywhere?
  - Combine the characterization and rebuild chapters and just start with the theory + simulation subsections?
]

When attempting to run atom/state lifetime measurements in the x-superlattice, we noticed that the potential changed/drifted significantly in a few #qty[100][ms].
During the investigation of these drifts/changes we learned that all three superlattice parameters, the lattice depth $v_l$, the lattice depth $v_s$ and the phase $phi$, were affected.
While the changes of the phase $phi$ could also be caused by changes of the air temperature in the retro-path, the changes of the lattice depths $v_l$ and $v_s$ must be a fundamental issue with the optical setup.
We were able to attribute the changes of the lattice depths $v_l$ and $v_s$ to thermal lensing and could resolve the issues by removing or replacing the offending optical elements.
As a (nice) side effect this also significantly reduced the drift of the superlattice phase that was caused by temperature changes in the lens in the retro-path.
The remaining change/drift of the phase $phi$ is now caused actually just caused by the air temperature #text(red)[ref section...].
In this section I will cover the changes we did to the optical setups to significantly suppress the thermal lensing for the x1064-lattice and the x532-lattice.

To characterize the thermal lensing of the x-lattices, we used the in-situ parametric heating introduced in @ch:mod.
This measurement technique allows us to retrieve the lattice depths, the lattice positions and the lattice waists from a single scan of the modulation frequency.
The time resolution is limited by the modulation time which should be at least #qty[100][ms] to acquire a good/reasonable contrast, see #text(red)[ref modulation section for more details].
Besides the in-situ parametric heating technique we also employed cameras that image the lattice beams at the position of the atoms through a $1:1$ telescope/relay.
Compared to the parametric heating measurement, this allowed us to measure the forward-propagating beams and retro-propagating beams individually.
By using a camera with an RGB sensor#footnote[Basler acA2040-35gc] we could also separate the overlapping beams of the x1064-lattice and the x532-lattice.
Measuring both lattice beams at the same time was important to understand the "crosstalk" of the thermal lensing in the shared optical elements where both lattices are overlapped.
With the cameras we can achieve a time resolution of $< #qty[100][μs]$, the limitation here is the maximum number of $255$ images in the triggered mode.


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
) <fig:super-thermal-x1064-ph>


The change of the position $y_0$ by $approx #qty[1][px]$ (#text(red)[use lattice site $a$ as unit instead?]) during the holding time is insignificant compared to the changes of the other two lattice parameters.
This does not completely rule out thermal effects on the beam pointing since the lattice depth would also be reduced if the overlap of the lattice beams gets worse.
Measurements of the lattice beams with a camera did however show that the beam positions are constant down to a few #unit[μm].
The beam waists and beam amplitudes (intensity in the center) on the camera did however show changes that match the measurements with the atoms in @fig:super-thermal-x1064-ph.
#text(red)[Mention that the camera was not properly measuring with a 4f configuration, hence no actual camera data shown here?]

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
This is not possible for the x532-lattice since we do not have enough optical power to achieve a sufficient lattice depth to get a narrow resonance $1 -> 3$, see @sec:mod-results for the discussion.
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
) <fig:super-thermal-x532-ph>


=== Theory of thermal lensing <ssec:super-thermal-theory>

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

We already know that the thermal lensing as observed in @fig:super-thermal-x1064-ph and @fig:super-thermal-x532-ph was self-induced by the laser beams of the respective lattices.
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
$ <eq:super-thermal-theory-G>

where $n_0$ is the (unperturbed) refractive index of the glass.
The first term/contribution is always positive since all glasses have a thermal coefficient of expansion $alpha > 0$.
The thermal coefficient $phy.dv(n, T)$ on the other hand can either be negative or positive.
For so-called "athermal" glasses the (total) coefficient G can therefore be (close to) zero, in which case they would not experience thermal lensing at all (at least not in the lowest order...).
If the contribution by the second term in @eq:super-thermal-theory-G is stronger than the first term, the coefficient G will be negative.
Such glasses are used to compensate the effects of thermal lensing of other glasses with $G > 0$.
Examples for glasses with negative $G$ are $"CaF"_2$ and Crystalline quartz (#text(red)[mention both orientations?]).

The most common glasses used in our optical setup were Fused Silica and N-BK7 and #text(red)[any other glasses?].
See @tab:super-thermal-theory for a compilation of the material properties of the glasses in our optical setup.
For all these glasses both terms in @eq:super-thermal-theory-G are positive, leading to a strong? thermal coefficient $G$.
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
    text(red)[N-BALF4], ..range(5).map(n => []),
    text(red)[N-SF11], ..range(5).map(n => []),
    text(red)[TGG], ..range(5).map(n => []),
    text(red)[Calcite?], ..range(5).map(n => []),
  ),
  caption: [
    Thermal lensing properties of common glasses.
    The properties are measured/valid at a temperature of $T = #qty[300][K]$.

    #show list: set text(red)
    - What else should I add to the caption here?
    - Transpose the list to allow more properties? E.g. $rho$ and the absorption.
    - Add quartz for waveplates (and TGG for the isolators if possible?)
  ],
) <tab:super-thermal-theory>

To also understand the time dependence of the thermal lensing drifts we have to take into account that the local changes of the temperature $Delta T$ will distribute in the optical elements according to the thermal conductivity $k_T$.
If the thermal conductivity is large, the temperature changes will "delocalize" quickly, thereby reducing the effects of the thermal lensing.
The (total) coefficient that takes the change of the optical path length and the dissipation of the heat into account is therefore

$
  rho = G slash k_T = (alpha (n_0 - 1) + phy.dv(n, T)) slash k_T
$ <eq:super-thermal-theory-rho>

Based on the coefficients $rho$ shown in @tab:super-thermal-theory we would now expect Fused Silica and N-BK7 #text(red)[(and more?)] to be equally problematic regarding the thermal lensing.
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


=== Simulation of thermal lensing <ssec:super-thermal-simulation>

#let power = $p$
#let mag = sym.gamma

#[
  #set text(red)
  - Mention any of the equations in the theory chapter?
  - Which book should I cite here for ABCD + gaussian beams?
  - Any references to the thermal lensing theory chapter?
  - Where to mention that thermal lensing is always positive? Ref earlier section?
  - Mention suppression of (thermal) lensing around the focus...
  - Say anything about the scaling with $f^2$?
]

To get an understanding of the "propagation" of the thermal lens(ing) through the optical setup of the x532-lattice we are going to consider a minimal setup from a/the thermal lens to the position of the atoms.
The actual setup of the x532-lattice is slightly more complex since two telescopes are used for the beam shaping, one of which is a cylindrical one.
In the simulation we are only going to consider the combined/total (de)magnification of each axis.
While the actual lattice beams would need to be modelled by gaussian beams, it is sufficient to consider simple ray-tracing to study the focal shift caused/introduced by the thermal lens(ing).
This approximation is valid since the initial beam is collimated and since the thermal lens(ing) is only a small perturbation of the beam.
We will later compare the results from the ray-tracing simulation to the numerical simulation with gaussian beams.
Note that the ray-tracing simulation is not be applicable to the setup of the x1064-lattice since the "relay" lens significantly changes the behavior of the Gaussian beam.
#text(red)[For the x1064-lattice we are therefore only going to look at the numerical simulation using gaussian beams.]
#text(red)[Mention the Rayleigh-induced focal shift here? This should not matter for the actual thermal lensing since the Rayleigh-induced shift is a static one.]

#figure(
  image("/figures/thermal-lensing-simulation.png"),
  caption: [
    Dummy setup to simulate the focal shift induced by (a) thermal lens(ing).
    The beam is initially collimated with a radius of $r = w_0$.
    A thermal lens then slightly focusses the beam before it is demagnified by the factor $mag = f_1 slash f_2$ in a telescope to (later) get the correct beam shape/waist at the position of the atoms.
    After a propagation by the distance $d$ the beam is focusses onto the atoms with the 2 inch lens #text(red)[ref anything?] with $f = #qty[250][mm]$.

    #[
      #set text(red)
      - Also draw the corresponding gaussian beam in here?
    ]
  ],
) <fig:super-thermal-simulation-setup>

@fig:super-thermal-simulation-setup shows the minimal optical setup to simulate the propagation of thermal lensing.
The setup/simulation assumes that there is a single optical element responsible for the thermal lensing.
We are then using a telescope to prepare the correct beam size/shape before the final (atom) lens that focusses the lattice beams onto the atoms.
In practice the thermal lensing can be distributed across all (transmissive) optical elements.
All three (other) lenses in @fig:super-thermal-simulation-setup could therefore also contribute to the (total) thermal lensing.

We are going to model the thermal lensing with a (very) thin lens of focal length $f_"thermal"$.
In our setup the (effective) focal length was $cal(O)(#qty[10][m])$ which is (very) weak compared to the other lenses and the (propagation) distances.
We will therefore use the optical power

$
  #power = 1 slash f_"thermal"
$ <eq:super-thermal-simulation-power>

to characterize the thermal lens(ing).
The lattice beams after applying the thermal lens(ing) will then be described by the vector

$
  phy.vb(v_0) = vec(w_0, - power w_0)
$ <eq:super-thermal-simulation-v0>

where $w_0 approx #qty[1][mm]$ is the (initial) (gaussian) waist of the x532-lattice beam.
In the ABCD (or ray transfer) matrix formalism we can describe the propagation of the beam/vector $phy.vb(v_0)$ through the (remaining) lenses in the setup in @fig:super-thermal-simulation-setup by the following equation

$
  phy.vb(v_1) =
  mat(1, 0; -1 slash f, 1) dot
  mat(1, d; 0, 1) dot
  mat(-1 slash mag, L; 0, -mag) dot
  phy.vb(v_0)
$ <eq:super-thermal-simulation-v1>

where $mag = f_1 slash f_2$ and $L = f_1 + f_2$ are the demagnification and the length of the telescope, $d$ is the propagation distance between the telescope and the (atom) lens, and $f$ is the focal length of the (atom) lens.

Without thermal lensing ($power = 0$) we would expect the beam to be focussed at distance $f$ from the last lens.
To quantify the thermal lensing we are therefore going to compute the shift from the expected focus (as a function of the thermal lensing strength $power$).
The focal shift/position can be computed from the radius $r_1$ and the angle $theta.alt_1$ of the vector $phy.vb(v_1)$

$
  delta = -r_1 / theta.alt_1 - f = - power mag^2 f^2 + cal(O)(power^2)
$ <eq:super-thermal-simulation-delta>

From the first order (of expansion) in the optical power $power$ we can already read/learn the most important properties of the thermal lensing.
The focal shift $delta$ is negative which indicates that the focus is moved towards the (atom) lens.
This aligns with our expectations since the thermal lens(ing) applies/applied a small focus on the collimated beam.
The reason for the quadratic scaling of $delta$ with the demagnification $mag$ is not (completely) obvious.
If we take a look at the ABCD matrix $M_v$ of the telescope, we can see that the factor $mag$ occurs twice.
The radius is divided by the factor $mag$ whereas the angle is multiplied by the factor $mag$.
In the end both the reduced radius and the increased angle contribute (equally) to the focal shift, resulting in the factor $mag^2$ (in first order of $power$).

The importance of the quadratic scaling of $delta$ with the demagnification $mag$ is not obvious at first glance either.
Without this scaling one could think that the thermal lensing can be "eliminated"/worked around with a larger initial beam and a stronger telescope.
The quadratic scaling however completely neutralizes this "trick".
If the thermal lensing $power$ is proportional to the intensity prefactor $I_0$ of the gaussian beam, the order of the thermal lens(ing) and the telescope does not matter #text(red)[@ssec:super-thermal-theory or an equation/figure?].
Any reduction of $power$ due to a larger beam will be applied (or recovered?) by the telescope through the factor $mag^2$ again.
Due to the ellipticity of the x532-lattice beam we can expect a different shift $delta$ for the horizontal/in-plane axis/focus and the vertical axis/focus.
With an aspect ratio of $approx #num[3]$ the shift $delta_"horizontal"$ should be greater than the shift $delta_"vertical"$ by a factor of $approx #num[9]$.
#text(red)[Add the comparison of the ray simulation and gaussian simulation here.]


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

Based on the measurements from @ssec:super-thermal-x1064, the theoretical considerations from @ssec:super-thermal-theory and the simulation of the "propagation" of thermal lensing in @ssec:super-thermal-simulation we rebuilt the optical setup of the x1064-lattice.
The primary goal was to minimize the thermal lensing but we also wanted to make sure that we can properly tune the around the position of the atoms #text(red)[ref setup section?].
In the initial setup for the x1064-lattice there were two Galilean telescopes used for the beam shaping.
The first telescope used lenses with the focal lengths #qty[175][mm] and #qty[-100][mm] and was placed directly behind the fiber coupler.
With a (de)magnification of $mag_1 = 1.75$ the initial waist of the collimated beam was reduced from $w_0 approx #qty[0.9][mm]$ to $w_0 approx #qty[0.5][mm]$.
The second telescope was placed just before the mirror used for the alignment, and it used lenses with the focal lengths #qty[125][mm] and #qty[-100][mm].
With a demagnification of $mag_2 = 1.25$ the telescope only slightly reduced the beam size again.
The total demagnification without taking the propagation between the telescopes into account is therefore $mag approx 2$.

During the characterization/investigation of the thermal lensing in @ssec:super-thermal-x1064 we found the main contributions coming from the concave lenses of the telescopes.
All four lenses were singlets made from N-BK7 with similar (center) thickness, we therefore don't know why the concave ones were worse than the convex ones.
To minimize the thermal lensing in the x1064-lattice setup we therefore decided to replace the two telescopes by a single one with demagnification $mag = 2$.
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
  image("/figures/2024-10-28_PH_x1064_thermal_lensing_result.png", width: 80%),
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

As already discussed in @ssec:super-thermal-theory the glass inside an optical isolator needs to have Faraday-rotating properties.
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
Since the thermal lensing shift scales quadratically in the beam (de)magnification $mag$, we expect a much greater shift for the horizontal axis than for the vertical axis.
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
  image("/figures/2024-10-31_ON_x532_lensing_PH_result_18.png", width: 65%),
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
