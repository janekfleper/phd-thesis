#import "/header.typ": *

== Environmental sensors <sec:phase-sensors>

#[
  #set text(red)
  - Already reference this in @sec:phase-setup?
  - Discuss why mechanical/physical length is not (really) relevant?
  - Mention the old setup with the BME280 sensor? Just in the Floquet section?
  - Use $d$ instead of $L$ for the distances?
  - Find a cleaner expression for @eq:phase-sensors-phi.
  - Where should the glasses for the lens be mentioned first?
  - Immediately mention the CO2 concentration? Or just in the "limitations"?
]

The setup introduced in @sec:phase-setup allows us to control/stabilize the superlattice phase on short time scales from #qty[1][μs] to #qty[1][s].
If we would run the measurements from @sec:phase-measure continuously, we would however notice that the superlattice phase slowly changes despite the stabilization of the lattice frequencies relative to each other.
This drift is caused by the (relative) change of the refractive index in the retro-reflecting path.
While we could repeat the phase calibration from @ssec:phase-measure-resolve or @ssec:phase-measure-in-situ to measure the change of the superlattice phase $phi$, we also need the phase to be controlled/stable during other measurements.
Being able to predict the superlattice phase $phi$ without the atoms is therefore essential for the operation of the experiment.


=== Environmental coefficients <ssec:phase-sensors-coefficients>

#[
  #set text(red)
  - Really start a new subsection here?
  - Mention expected temperature changes in this section already?
  - Mention that the coefficients are really perfectly linear for everything _but_ the temperature?
]

In @sec:phase-setup (and @eq:phase-setup-delta-phi) we assumed that the path length $d$ is constant.
While this might be true for the mechanical/physical length between the atom position and the retro-reflecting mirror, it is not true for the optical (path) length that also takes the refractive index (or dispersion) $n(lambda)$ into account.
Since the individual lattices have (vastly) different wavelengths of #qty[532][nm] and #qty[1064][nm], the changes of the refractive index $phy.pdv(n(lambda), xi)$ as a function of the environmental parameters/properties $xi$ will also be different.
(Only) this difference between the wavelengths (actually) causes the superlattice phase $phi$ to change.
The phase shifts of the individual lattices will be higher by one order of magnitude but we are not able to observe this due to the lack of single-site resolution of the imaging system, see @sec:setup-detect.
We will therefore directly/only focus on the relative changes/phase shifts of the lattices/wavelengths.

If we look at the retro-reflecting path in #text(red)[ref figure superlattice setup/or sensor setup?], we can split the length $d$ into six different segments.
Starting from the retro-reflecting mirror the lattice beams propagate $approx #qty[25][mm]$ in (the) air followed by the propagation/transmission through the 2 inch "retro" lens.
Since the "retro" lens is an achromatic doublet (lens), we have to consider the two individual lenses as separate segments L1 and L2 as they use a different material (#text(red)[and can have a different temperature?]).
After/behind the "retro" lens(es) there is another segment of air with a length of $approx #qty[#text(red)[23]][mm]$ up to the glass cell.
The glass cell is made from UV fused silica with a wall thickness of #qty[4][mm] and the atom position is then #text(red)[#qty[17][mm]] further inside the glass cell.
Only the segment inside the glass cell can be neglected for the drifts of the superlattice phase $phi$ because the refractive index inside the ultra-high vacuum is (just) $n = 1$.
The five remaining segments each contribute to the drifts of the superlattice phase $phi$.
For the glass cell wall and the lens(es) we (only) have to consider the (glass) temperature $T$.
In the two air segments we also have to take the (ambient) pressure $P$, the relative humidity $R H$ and the #text(red)[CO2] concentration #text(red)[$C$?] into account (on top of the temperature $T$).

With the phase convention chosen in @eq:theory-super-potential, we can express the superlattice phase $phi$ as a function of the (global) phases $phi_l$ and $phi_s$ that both depend on the (respective) optical path lengths.
The resulting expression will include @eq:phase-setup-delta-phi (as a static term) and terms for the glass cell, the two lenses and the air (segments)

$
  phi &= phi_l - 1 / 2 phi_s \
  &= (k + Delta k) dot integral_0^d phy.dd(z) n_l (z) - k dot integral_0^d phy.dd(z) n_s (z) \
  &= k dot sum_sigma d_sigma dot Delta n_sigma + Delta k dot sum_sigma d_sigma dot n_(l, sigma) \
$ <eq:phase-sensors-phi>

#text(red)[this paragraph requires quite a bit of improvement...]
where $k$ is the wavevector of the reference laser that drives/pumps the SHG cavity, see @sec:phase-setup.
The wavevector of the short/x532 lattice is therefore just $k_s = 2k$ and for the wavevector of the long/x1064 lattice we have to add the "detuning" $Delta k$ that is also used to modify the superlattice phase $phi$.
The integrals cover the optical path of the lattice beams from the position of the atoms to the retro-reflecting mirror.
In the sums the index $sigma$ denotes the different segments that were introduced earlier.
The relative refractive index is defined as $Delta n = n_l - n_s$.
The AOMs in @fig:phase-setup and the (possible) drifts of the reference laser are (effectively) included in the "detuning" $Delta k$.
These frequency changes are smaller than #qty[1][GHz] are therefore not relevant for the refractive indices in the different segments.
#text(red)[Add a reference to these infrared-only superlattices here?]

To determine the sensitivity of the superlattice phase $phi$ we can compute the derivative of @eq:phase-sensors-phi with respect to the environmental parameters $T$, $P$, $R H$ and #text(red)[$C$].
For the temperature we have to take all segments into account, whereas for the pressure, the (relative) humidity and the #text(red)[CO2] concentration only the air segments are relevant.
If we compute/take the (partial) derivative of $phi$ with respect to the temperature $T$, there will be four terms for each segment

$
  phy.pdv(phi, T) =
  k dot sum_sigma (phy.pdv(d_sigma, T) dot Delta n_sigma + d_sigma dot phy.pdv(Delta n_sigma, T))
  + Delta k dot sum_sigma (phy.pdv(d_sigma, T) dot n_(l, sigma) + d_sigma dot phy.pdv(n_(l, sigma), T))\
$ <eq:phase-sensors-phi-derivative>

(#text(red)[use the total derivative here?])
where the glass segments will expand with/under a higher temperature and the air segments will shrink accordingly.
We can however neglect all terms but the second one with the derivative $phy.pdv(Delta n_sigma, T)$.
The other terms are smaller by $3 "to" 4$ orders of magnitude if we consider the (typical) thermal expansion coefficients $alpha$ and the #text(red)[thermal coefficient] $phy.dv(n, T)$ of the glasses (#text(red)[include ref to @tab:super-thermal-theory]).
The resulting coefficients for the different segments are collected/listed in @tab:phase-sensors-temperature-coefficients.
The distance of the "air" only includes the segment between the retro-reflecting mirror and the "retro" lens since we cannot reliably measure the air temperature inside the mu-metal.
The glass cell (wall) made out of UV fused silica is (only) included in @tab:phase-sensors-temperature-coefficients but not taken into account for the phase correction since we are not able to measure the glass temperature (either).
This will be discussed further in #text(red)[ref section "limitations"].

#figure(
  table(
    inset: 0.6em,
    columns: 5,
    "Material", "Air", "CaF2", "N-BALF4", "UVFS",
    [Distance $d slash#unit[mm]$], num[250], num[10], num[2.9], num[4],
    $phy.dv(Delta n, T) med slash med #qty[1e-8][1/K]$, num[1.3], num[-27.4], num[-94.2], num[-61.8],
    $phy.dv(phi, T) med slash #unit[mrad/K]$, num[19.20], num[-16.17], num[-16.13], num[-14.60],
  ),
  caption: [
    Temperature coefficients of the superlattice phase $phi$.
    The reference conditions/parameters for the computation of the temperature coefficients are $T_0 = #num[24]degree "C"$, $P_0 = #qty[1013.3][hPa]$, $R H_0 = #qty[40][%]$ and $C = #qty[450][ppm]$.

    #show list: set text(red)
    - Anything else to add to the caption?
    - Skip the "intermediate" quantity $phy.dv(Delta n, T)$?
    - Where should I first mention the lens materials?
    - Find the correct unit for the CO2 concentration.
    - Really mention the reference parameters here and not in the text? I think it would be best to put the reference parameters in a single (block) equation.
    - Find a short/good name for the coefficient $phy.dv(phi, T)$?
    - Add references directly to the material names? Ciddor for air, Corning for CaF2, Schott for N-BALF4 and glass cell datasheet for UVFS.
  ],
) <tab:phase-sensors-temperature-coefficients>

For the other environmental coefficients we can use the same term from @eq:phase-sensors-phi-derivative with the temperature $T$ replaced by the respective variable/parameter/property.
#text(red)[Mention that two other terms vanish and that the other term is way smaller again?]
Compared to the temperature we can handle/treat the two air segments together since we do not expect any spatial changes of the pressure, the (relative) humidity (#text(red)[is this true?]) and the #text(red)[CO2] concentration.
This makes it a lot easier to measure these environmental properties and to apply the corresponding corrections for the superlattice phase $phi$.
In @tab:phase-sensors-other-coefficients the coefficients are listed for the combined length of the two air segments.
The units of the coefficients are already adjusted to the typical changes we can expect in the lab.
For the pressure the reasonable/possible range is #qty[950][hPa] to #qty[1030][hPa] which would result in a superlattice phase change of more than $pi slash 4$.
As there is no reasonable way to regulate the pressure on the optical tables, the environmental correction of the pressure is critical/essential for the stability of the superlattice phase $phi$.
The (relative) humidity is capped/limited to $<#qty[50][%]$ by the fresh air supply and dehumidifiers inside the lab.
If the air outside of the building is dry, the (relative) humidity can be as low as #qty[10][%].
The total expected range for the phase correction of the (relative) humidity is therefore $cal(O)(#qty[10][mrad])$.
We did however have to introduce an empirical fudge factor for the (relative) humidity.
This will be discussed in #text(red)[ref section phase stability].
The (environmental) coefficient of/for the #text(red)[CO2] concentration is very small compared to the other two (coefficients).
When the fresh air supply is working/running, the #text(red)[CO2] concentration shows changes up to #qty[100][ppm] per person currently working in the lab.
If the lab is empty, the changes of the #text(red)[CO2] concentration are only $cal(O)(#qty[10][ppm])$.
We can therefore ignore this coefficient for the correction of the superlattice phase $phi$.
All/most long-term measurements are done during nights and weekends or if no one is in the lab.

#figure(
  table(
    inset: 0.6em,
    columns: 4,
    "Property", "Pressure", "Relative Humidity", "CO2 concentration",
    $phy.dv(phi, xi)$, qty[-11.127][mrad/hPa], qty[-0.915][mrad/%], qty[-5.948][μrad/ppm],
  ),
  caption: [
    Other environmental coefficients of the superlattice phase $phi$.
    The reference conditions/parameters for the computation of the temperature coefficients are $T_0 = #num[24]degree "C"$, $P_0 = #qty[1013.3][hPa]$, $R H_0 = #qty[40][%]$ and $C = #qty[450][ppm]$.
    The total distance in air is $d_"air" = #qty[46.6][cm]$ (#text(red)[check this again!]).

    #show list: set text(red)
    - Join this table with @tab:phase-sensors-temperature-coefficients?
    - Anything else to add to the caption?
    - Use per #qty[100][ppm] for the CO2 concentration.
  ],
) <tab:phase-sensors-other-coefficients>


=== Measuring the environmental parameters <ssec:phase-sensors-measure>

#[
  #set text(red)
  - Write environmental properties or parameters?
  - More details on the self-heating of the integrated temperature sensors?
  - Already mention "inside" and "outside" segment earlier?
  - Where to mention when the phase correction is actually applied?
]

To (actually) apply the environmental correction of the superlattice phase $phi$ compiled in @tab:phase-sensors-temperature-coefficients and @tab:phase-sensors-other-coefficients we need to set up the corresponding sensors in the retro-reflecting path.
For the measurement of the temperature we would like to have (at least) one sensor for each air segment and one sensor that measures the (combined) lens temperature.
If we had (physical) access to the glass cell, we would have also liked to attach a temperature sensor (to it?).
As already discussed in @ssec:phase-sensors-coefficients this is however not possible.
The measurement of the other/remaining environmental parameters is simpler as we have to take neither the glasses nor a spatial resolution into account.
We can therefore place those sensors somewhere convenient near the retro-reflecting path.

There are many (cheap) integrated environmental sensors available that can be directly connected to a Raspberry Pi or an Arduino micro controller with I2C or SPI.
Some of those sensors only measure the temperature, others can measure the temperature, the pressure and the relative humidity in/on a single chip/device.
Pressure sensors and relative humidity sensors always include a temperature sensor for an internal calibration (#text(red)[really mention this?]).
These integrated sensors usually have a good resolution but not necessarily a good absolute accuracy.
For our use case this is however not an issue since we are only interested in the relative changes of the environmental parameters/properties.
If the temperature measurement is always off by $#num[1]degree"C"$, it does not affect the correction of the superlattice phase.
The same is/holds true for the other environmental parameters.
For the temperature we nevertheless decided against using integrated sensors since the measured temperature can be affected by the measurement (action) itself.
If we measured the temperature repeatedly during/for a few seconds, we could (always) see an increase of the temperature/measurement result#footnote(text(red)[Bosch BMP280 and BME280]).
This is most likely caused by the electrical power required for/used during the measurement heating up the PCB and therefore also the sensor (area/volume).
Furthermore these integrated sensors are not designed for the measurement we need for the lens temperature.
We therefore opted for (passive) resistance-based temperature sensors.
They/those require an additional device for the readout but they offer a better/higher resolution, can be operated without "self-heating" and are (directly) available for surface/material measurements.
A good absolute accuracy would require a calibration of these resistance-based temperature sensors.
As mentioned earlier, this is not significant for the phase correction.

The environmental sensors we built into the retro-path of the x-superlattice are shown in @fig:phase-sensors-measure-setup.
There are multiple temperature sensors to resolve the spatial variation of the air temperature and a separate sensor to measure the temperature of the lens mount.
For the air temperature sensors we used _negative-temperature-coefficient_ (NTC) thermistors since they are much more sensitive than _resistance temperature detectors_ (RTDs) #text(red)[ref any whitepaper here? or just give a number/order of magnitude?].
The temperature sensors indicated by the circles are precision epoxy NTC thermistors#footnote(text(red)[TE Connectivity 44001A]) with a resistance of #qty[100][#sym.Omega] at $#num[25]degree"C"$.
This resistance is common for platinum RTDs and allowed us to share a high-resolution data logger#footnote(text(red)[Pico Technology PT-104]) with the lens-temperature sensor.
We used the four-wire resistance measurement for the three NTC thermistors and computed the temperature using the parameters $R_0 = #qty[100][#sym.Omega]$, $beta = #qty[2854][K]$ and $T_0 = #qty[298.15][K]$ #text(red)[ref anything for this beta-equation?].
The lens-temperature sensor is a platinum RTD#footnote(text(red)[Omega SA1-RTD-4W]) with a resistance of $R_0 = #qty[100][#sym.Omega]$ at $#num[25]degree"C"$.
This sensor is also connected to the data logger in a four-wire configuration and the temperature is computed internally by the data logger.
The data logger has a conversion time of #qty[720][ms] per channel, resulting in one measurement every #qty[3][s] for each sensor.
With a sensing current of #qty[300][μA] #text(red)[ref the communication with the engineer] self-heating of the NTC thermistors and the platinum RTD are negligible #text(red)[ref any whitepaper?].
The two (circle marker) air-temperature sensors outside of the mu-metal and the lens-temperature sensor are used for the regular phase correction with the coefficients computed/shown in @tab:phase-sensors-temperature-coefficients.
The (circle) air-temperature sensor inside the mu-metal is discussed again in #text(red)[ref "limitations" subsections] in the context of the limitations of the phase correction.

#text(red)[Mention $beta$ etc...?]
The temperature sensors indicated by the squares are glass-coated NTC thermistors#footnote(text(red)[Amphenol Advanced Sensors NTC Type FP07]) with an ultra-fast response time of #qty[0.1][s] in still air.
They have a resistance of #qty[8][k:#sym.Omega] at $#num[25]degree"C"$ and require a (very) low test current to avoid self-heating.
We are therefore using bench digital multimeters#footnote(text(red)[Keysight 34465A Digital Multimeter]) that also allow a fast readout compared to typical (temperature) data loggers.
In the low-power mode with a measurement range of #qty[10][k:#sym.Omega] the test current is #qty[10][μA] #text(red)[ref the data sheet here?].
The dissipated power in the NTC thermistors is $<#qty[1][μW]$ which results in is negligible self-heating given the dissipation constant of #qty[50][μW/(#sym.degree:C)] in (still) air.
The (typical) temperature traces measured with these NTC thermistors during the experimental sequence are shown in #text(red)[ref "limitations" section, or a figure?].
We could not see a possible improvement of the phase correction with the temperature data from these sensors #text(red)[actually mention this here?].

The two remaining sensors in @fig:phase-sensors-measure-setup are integrated sensors that are connected to an Arduino micro controller.
The first sensor measures the pressure#footnote(text(red)[Bosch BMP390]) and is configured at/to the highest resolution, resulting in one measurement every #qty[300][ms].
The second sensor measures the relative humidity and the #text(red)[CO2] concentration#footnote(text(red)[Sensirion SCD30]) once every #qty[2][s].
The pressure measurement is used for the phase correction with the coefficient computed/shown in @tab:phase-sensors-other-coefficients.
For the relative humidity we have to multiply the coefficient @tab:phase-sensors-other-coefficients by a factor of #num[2.5] to get the best phase correction #text(red)[mention this here or in the next subsection?].
This issue is not related to the sensor itself as we found the same factor with another sensor#footnote(text(red)[Bosch BME280]).
A possible explanation of/for this factor is/are a (weak) absorption lines of #text(red)[H2O] around/near the wavelength $lambda = #qty[1064.5][nm]$ of the infrared lattice #text(red)[ref ciddor].
The equation/theory covers/interpolates the refractive index (at least) from #qty[350][nm] to #qty[1300][nm] but does not take (specific) water absorption lines into account.

#figure(
  image("/figures/phase-sensors-setup.png"),
  caption: [
    Layout of the environmental sensors in the retro-reflecting path.
    There are two temperature sensors (just) inside the mu-metal to the "inside" temperature near the Ioffe bars.
    Placing a temperature sensors deeper inside the mu-metal is (unfortunately) not possible.
    There are three other/more air temperature sensors spread in the "outside" segment.
    For the lens temperature we are using a surface sensor that is attached to the mount of the lens.

    #show list: set text(red)
    - Add coordinate system (in upper left corner?)
    - Add the legend in lower left corner.
    - Extend the mu-metal shielding (and indicate a "cut" for the sketch?)
    - Find better names for the different sensor types/models.
    - Figure out the different markers for the temperature sensors...
  ],
) <fig:phase-sensors-measure-setup>


=== Phase stability <ssec:phase-sensors-stability>

#[
  #set text(red)
  - Where to mention how/when the phase correction is applied?
  - Mention the feed-forward as a function of the time?
  - Measure the standard deviation of the atom cloud position?
  - Mention is the error/fluctuations of the gradient strength?
  - Where to mention the lattice depths $v_l$ and $v_s$?
  - Find all reported stabilities in bichromatic superlattices.
  - Where to mention that we do not have any really short-term resolution?
  - Add a separate subsection for the limitation? For all the refs from earlier...
]

With the phase correction based on the temperature, the pressure and the relative humidity as introduced in @ssec:phase-sensors-measure we can test the resulting stability of the superlattice phase $phi$.
The (same) correction is automatically applied in any sequence involving the superlattice.
We can therefore "transfer" the stability of the phase, once characterized, to other measurements.
To measure the long-term stability of the superlattice phase we are using the in-situ measurement technique introduced in @ssec:phase-measure-resolve with a finite horizontal gradient.
The symmetric phase $phi = 0$ is then encoded in the position of the phase-sensitive signal, as already shown in @sssec:phase-measure-resolve-vertical and @sssec:phase-measure-resolve-period #text(red)[ref a figure instead?].
The horizontal gradient is (again) set to the smallest possible value where the phase-sensitive signal remains within the atom cloud during the measurement.
During/in the calibration of the gradient we measured the strength $k_1 = #qty[0.344(13)][mrad/px]$ which will be used to translate the signal positions to the respective phases.

#figure(
  image("/figures/2025-05-19_symmetry_point_thesis_result.png", width: 70%),
  caption: [
    Stability of the superlattice phase with the environmental correction.
    The upper axes shows a comparison of the (actually) measured phase (blue) to the expected phase (orange) without the phase correction.
    In the lower axes the individual contributions of/to the phase correction are shown.
    The data is/are normalized to start at #qty[0][mrad].

    #show list: set text(red)
    - Anything else to add to this caption?
    - Normalize the second trace in the upper figure to start at 0?
    - Show the total applied correction instead in the upper figure?
    - Figure out the correct signs for the phase correction.
    - Add the CO2 concentration here?
    - Use different offsets in the lower axes to avoid overlapping data?
    - Show two atom images as insets?
    - Comment that the "noise" on the sensors is much smaller than the "noise" on the phase data?
  ],
) <fig:phase-sensors-stability>

For the (actual) measurement of the phase stability we repeat the same sequence for an entire night, resulting in around #num[1000] data points.
The atom images are evaluated individually to extract the position $y_0$ of the phase-sensitive signal.
The phase shown in @fig:phase-sensors-stability is then $phi = k_1 dot y_0$.
We can see in the upper axes that the measured phase does not show any long-term/slow drifts/changes.
There are only short-term changes visible with a peak-to-peak amplitude of #qty[5][mrad].
The contributions to the phase correction are converted from #unit[MHz] to #unit[mrad] using the factor @eq:phase-measure-resolve-period-conversion.
The orange data points (in the upper axes) show the expected phase without the phase correction where we can see significant drifts of $>#qty[30][mrad]$.
These data points are computed by adding the sum of the environmental correction to the measured phases.
(Actually) Running a measurement without the phase correction is not practical since we would need (to apply) a much stronger horizontal gradient to keep the phase-sensitive signal within the atom cloud.

The data in the lower axes in @fig:phase-sensors-stability show(s) that the pressure and the relative humidity are usually the strongest contribution to the phase correction.
Since the temperature of the experiment table is stabilized and we have put additional shielding around the retro-path, the air temperature shows peak-to-peak changes of $#num[0.1]degree"C"$ and the lens temperature shows peak-to-peak changes of $<#num[0.05]degree"C"$.
The phase correction for the pressure corresponds to a change of only #qty[1.5][hPa] in #qty[15][h].
Even for strong(er) pressure changes by more than #qty[10][hPa] in a few hours we observe the same phase stability #text(red)[what measurement to reference here?].
The (relative) humidity varied by up to #qty[7][%] during the measurement which is a common change during a night measurement.
In summer slightly larger/greater changes are possible, again depending on the weather conditions.
The (fudge) factor #num[2.5] for the humidity correction is already applied here.
Without this factor we would have observed a long-term drift of $>#qty[10][mrad]$ in the measured phases.

We are using the standard deviation of the phase $phi$ in @fig:phase-sensors-stability to quantify the overall stability of the superlattice phase.
Since there is no (obvious) long-term drift visible, we compute the standard deviation without any running average.

$
  sqrt(Delta phi^2) = #qty[1.35][mrad]
$ <eq:phase-sensors-stability>

This stability of the superlattice phase is better than the reported stabilities of other bichromatic superlattices.
#text(red)[Ref Chalopin 2024, Li 2021, etc...]

#text(red)[compute the running average of the standard deviation without the phase correction...]
If we compare the data with and without the phase correction in the upper axes in @fig:phase-sensors-stability again, we can see that the sequence-to-sequence variation/stability is not (actually) improved.
The environmental phase correction only ensures/improves the long-term stability.
We cannot explain the short-term changes with the environmental sensors that are/were used for the phase correction.
To understand where this residual variation comes from we will look at the temperature data measured by the two sensors inside the mu-metal and the glass-coated NTC thermistor outside of the mu-metal.
As a reminder, the temperature (measured) inside the mu-metal is not included in the phase correction.
For the coefficient of the air temperature only the distance of #text(red)[#qty[250][mm]] from the retro-reflecting mirror to the "retro" lens is taken into account, see @tab:phase-sensors-temperature-coefficients.
(Accurately) measuring the air temperature on the optical path of the x-lattices inside the mu-metal is not possible as highlighted by @fig:phase-sensors-stability-limitation.
Close to the Ioffe bars we can measure temperature changes of $#num[1]degree"C"$ to $#num[2]degree"C"$ during an experimental sequence.
As shown in @fig:phase-sensors-measure-setup the sensor NTC100-B is located close to the "lower" Ioffe bar and the sensor FP07-A is located close to the "upper" Ioffe.
#text(red)[Where to mention (again): we do not know the actual distance of the sensors from the Ioffe bars!]
The measured temperature cycle is inherited from the duty cycle of the Ioffe bars during the/a typical sequence.
There is however a delay of around #qty[15][s] between the evaporation steps using the Ioffe bars (and pinch + offset coils) and the temperature cycle of the surrounding air.
While the Ioffe bar itself will be heated up within a few seconds, it takes longer for the "heat" to be transported through the epoxy coating enclosing/wrapping the Ioffe bars and to be "transferred" to the surrounding air.
#text(red)[This delay is consistent for the two (different) temperature sensors despite their different positions.]
#text(red)[Mention time scale of the epoxy NTCs (again)?]
Actual measurements inside the superlattice start after a sequence time of #qty[52][s] which is right on the cooldown slope of the temperature cycle inside the mu-metal.
We were not able to find any correlation between the measured phases in @fig:phase-sensors-stability and the air temperature measured by the sensor FP07-A evaluated at a specific sequence time.
We can therefore conclude that the phase correction for the optical path inside the mu-metal is not possible because of the (strong) temperature cycle due to the Ioffe bars (and pinch + offset coils).
The temperature of the glass cell will also be a small contribution due to its proximity to the Ioffe bars and the pinch coils.
Measuring the glass temperature is/was however not possible since we do not have (sufficient) physical access to the glass cell to attach a temperatur sensor.

#figure(
  image("/figures/2025-06-13_sensor-dmm_result.png", width: 70%),
  caption: [
    Air temperature as a function of the sequence time.
    The axes/figure on the left shows the measurement inside the mu-metal by the sensors NTC100-A (dashed) and FP07-A (solid) during a typical experimental sequence.
    The vertical lines indicate the interval where the Ioffe bars (and pinch + offset coils) are turned on during the sequence.
    In the axes/figure on the right the data measurement by the sensors NTC100-B (dashed) and FP07-A (solid) outside of the mu-metal is shown.
    The shaded regions show the mean plus-minus standard deviation of the respective sensors across/in #text(red)[N] sequences.

    #show list: set text(red)
    - Show the comparison to the epoxy sensors.
    - Only show a single trace and then a long average in the background?
    - Add Ioffe interval to the left axes.
    - Actually show the sensors measuring outside of the mu-metal? It might be easier here to just show a wide plot of the sensor(s) inside of the mu-metal...
    - Mention theoretical time scale of the NTC100 sensor?
  ],
) <fig:phase-sensors-stability-limitation>
