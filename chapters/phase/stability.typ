#import "/header.typ": *
#import "figures/figures.typ": table-other-properties, table-thermal-properties

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
While we could repeat the phase calibration from @ssec:phase-measure-detect to measure the change of the superlattice phase $phi$, we also need the phase to be controlled/stable during other measurements.
Being able to predict the superlattice phase $phi$ without the atoms is therefore essential for the operation of the experiment.


=== Environmental sensitivity of the superlattice phase <ssec:phase-sensors-coefficients>

#notes[
  - Mention expected temperature changes in this section already?
  - Mention that the coefficients are really perfectly linear for everything _but_ the temperature?
  - Take the absolute derivative in @eq:phase-sensors-phi-derivative?
  - Use environmental "parameters" or "properties"?
  - Where is the mu-metal mentioned first?
  - Already tease the sensors before the subsection?
  - Where to mention the _absolute_ phase changes again? In the next subsection?
]

In @eq:phase-setup-delta-phi we assume a constant path length $d$ to control the superlattice phase.
While this is largely true for the geometical path length between the retro mirror and the atom position, the phase depends on the optical path length that also takes the refractive index into account.
Since the individual lattices have different wavelengths of #qty[1064][nm] and #qty[532][nm], the refractive indices are not equal.
If we look at the retro path in #text(red)[ref figure superlattice setup/or sensor setup?], we can split the length $d$ into six different segments.
Starting from the retro mirror, the lattice beams propagate approximately #tr[#qty[240][mm]] in air up to the retro lens.
Since the retro lens is an achromatic doublet, we use two further segments to take the different materials into account.
Behind the retro lens, there is another segment of air with a length of approximately #tr[#qty[230][mm]] up to the glass cell.
The wall of the glass cell #tr[itself] is #qty[4][mm] thick, and the atoms are positioned #qty[17][mm] inside the glass cell.
While all segments contribute to the accumulated optical phases of the individual lattices, the segment inside the glass cell is in #tr[a] ultra-high vacuum and can be neglected for the stability of the superlattice phase.
The other five segments each contribute to the drift of the superlattice phase $phi$.
For the glass cell and the retro lens, the refractive indices are only sensitive to the temperature $T$.
In the two air segments, we additionally take the ambient pressure $P$, the relative humidity #RH and the #text(red)[CO2] concentration #xco2 into account.

With the phase convention chosen in @eq:theory-super-potential, we can express the superlattice phase $phi$ as a function of the phases #phix1064 and #phix532 that both depend on the optical path.
To take the different wavelengths of the individual lattices into account, we divide the phase #phix532 by $2$ and compute the superlattice phase

$
  phi & = phix1064 - 1 / 2 phix532 \
      & = (k + Delta k) dot integral_0^d phy.dd(x) nx1064 (x) - k dot integral_0^d phy.dd(x) nx532 (x) \
      & = k dot sum_sigma d_sigma dot Delta n_sigma + Delta k dot sum_sigma d_sigma dot n_(x1064,sigma) \
$ <eq:phase-sensors-phi>

where $k$ is the wave vector of the reference laser that pumps the second-harmonic generation cavity in @fig:phase-setup.
The wave vector of the #x532 lattice is $kx532 = 2k$, and the wave vector of the #x1064 lattice is $kx1064 = k + Delta k$ to take the frequency detuning of the #x1064\-lattice seed laser and the additional frequency shift by the acousto-optical modulator into account.
Each integral covers the optical path from the retro mirror to the atom position inside the glass cell.
To further simplify the expression, we use the constant refractive index in each segment $sigma$ to rewrite the integrals as two sums.
The first term in @eq:phase-sensors-phi computes the accumulated phase due to the difference $Delta n_sigma = nx1064 - nx532$ of the refractive indices in each segment, and the second term takes the change of the superlattice phase due to the frequency detuning of the #x1064 lattice into account.
While the second term is essential for the control of the superlattice phase according to @fig:phase-setup, it is significantly smaller than the first term and is therefore negligible for the long-term stability of the superlattice phase.
To determine the sensitivity of the superlattice phase $phi$ to the temperature, we #tr[compute/take] the derivative

$
  phy.pdv(phi, T) =
  k dot sum_sigma (phy.pdv(d_sigma, T) dot Delta n_sigma + d_sigma dot phy.pdv(Delta n_sigma, T))
$ <eq:phase-sensors-phi-derivative>

where the first term in the sum represents the thermal expansion of the optical elements, and the second term takes the changes of the refractive indices into account.
The first term is smaller than the second term by at least one order of magnitude in all optical materials in the retro path.
For the air segments, the difference between the terms is even greater at three orders of magnitude.
We can therefore neglect the first term to compute the temperature sensitivity of the superlattice phase.
In @tab:phase-sensors-temperature-coefficients, the resulting temperature coefficients $phy.pdv(phi, T)$ are compiled for each segment.
If we compute the sum of all segments, the total temperature coefficient is $phy.pdv(phi, T) = #qty(per-mode: "slash")[-12.6][mrad/K]$.
However, the changes of the temperature $T$ are not uniform in all segments.
In the first air segment between the retro mirror and the retro lens, the peak-to-peak temperature variation is typically #degC[0.2] in one hour.
Additionally, long-term drifts of the mean temperature over a few days range between #degC[0.1] and #degC[0.2].
For the two segments in the retro lens, the peak-to-peak temperature stability is better than #degC[0.02], while long-term drifts can also go up to #degC[0.2].
We can therefore expect the superlattice phase to change by #qty[20][mrad] to #qty[30][mrad] due to the first air segment and the retro lens.
In the second air segment, we can observe peak-to-peak temperature changes up to $Delta T = #degC[2]$ within one experimental sequence.
Due to the proximity of the lattice beams to the magnetic field coils, the optical path in the second air segment is subject to the thermal cycle of the coils.
Quantifying the exact temperature $T$ along the optical path is impossible since we can not measure exactly at the position of the lattice beams, and we also expect an inhomogeneous temperature distribution based on the geometry and the location of the magnetic field coils.
For the glass cell, it was not possible for us to measure the temperature due to a lack of physical access.
The limitation of the #tr[temperature cycle of the] magnetic field coils on the stability of the superlattice phase is discussed in detail in #tr[ref subsubsubsection or figure?].

#floating-figure(
  {
    set text(10pt)
    table-thermal-properties
  },
  caption: [
    Temperature coefficients of the segments in the retro path.
    The derivative $phy.pdv(Delta n_sigma, T)$ shows that air is significantly less sensitive to the temperature than the optical materials.
    However, due to the different distances, the actual contribution to the superlattice phase $phi$ is similar in all segments.
    Most notably, the temperature coefficient $phy.pdv(phi, T)$ in the air segments has a different sign compared to the optical materials.
    The two lenses that constitute the retro lens are made of #CAF2 and #NBALF4 and have a center thickness of #qty[10][mm] and #qty[2.9][mm] respectively.
    The actual distances are different because the lattice beams are shifted by approximately #qty[10][mm] from the optical axis of the retro lens.
    The reference conditions for the computation of the temperature coefficients are $T_0 = #degC[24]$, $P_0 = #qty[1013.3][hPa]$ and $RH_0 = #qty[40][%]$.

    #notes[
      - Anything else to add to the caption?
      - Do any (manual) number alignment?
      - Use a different order of magnitude for $phy.pdv(Delta n_sigma, T)$? Something like #num[1e-6]?
      - Mention the materials in an additional row?
      - Add references directly to the material names? Ciddor for air, Corning for CaF2, Schott for N-BALF4 and glass cell datasheet for UVFS.
      - Use $degree "C"$ as the unit for the temperature coefficients?
    ]
  ],
  label: <tab:phase-sensors-temperature-coefficients>,
)

Besides the temperature, the accumulated phase in the air segments is also sensitive to the pressure $P$, the relative humidity #RH and the #tr[CO2] concentration #xco2.
Since these properties do not affect the #tr[geometrical] distances $d_sigma$, the first term in @eq:phase-sensors-phi-derivative vanishes and we only have to take the derivative of $Delta n$ into account.
Compared to the temperature, we can also combine the two air segments into a single one since we do not expect any spatial changes of the pressure, the relative humidity or the #tr[CO2] concentration along the optical path.
#tr[mention the simplicity of the sensor measurement and phase correction later...]
The resulting coefficients for the total length of the air segments are listed in @tab:phase-sensors-other-coefficients.
For the pressure in the laboratory, we have observed values from #qty[950][hPa] to #qty[1030][hPa] so far.
If the weather outside of the building changes rapidly, pressure variations can go up to $abs(Delta P) = #qty[20][hPa]$ in a few hours, which amounts to a drift of the superlattice phase by more than #qty[200][mrad].
The relative humidity is capped at approximately #qty[50][%] by the dehumidification of the fresh air and the additional dehumidifiers inside the laboratory.
If the air outside of the building is dry, the relative humidity inside the laboratory can be as low as #qty[10][%].
Within #qty[24][h], we usually observe changes of the relative humidity by #qty[1][%] up to #qty[15][%].
While the phase coefficient is small compared to the pressure, it is still relevant for the long-term stability of the superlattice phase.
The phase coefficient of the #tr[CO2] concentration is very small compared to the other two coefficients.
When the fresh air supply is working and no human is present in the laboratory, the #tr[CO2] concentration usually varies by less than #qty[20][ppm] in #qty[24][h].
For the superlattice phase this would amount to a drift of approximately #qty[0.1][mrad], which is far below the expected drifts due to the other two environmental parameters.
We can therefore ignore the #tr[CO2] concentration for the stability of the superlattice phase unless we reach the sub #unit[mrad] regime.

#floating-figure(
  {
    set text(10pt)
    table-other-properties
  },
  caption: [
    Environmental coefficients of the air in the retro path.
    The coefficients are computed with the Ciddor equation #tr[ref ciddor] at the reference values $T_0 = #degC[24]$, $P_0 = #qty[1013.3][hPa]$, $RH_0 = #qty[40][%]$ and $xco2 = #qty[450][ppm]$ for a total air distance of #qty[46.6][cm].

    #notes[
      - Join this table with @tab:phase-sensors-temperature-coefficients?
      - Anything else to add to the caption?
      - Really put the #tr[CO2] coefficient in #unit[ppm] instead of #qty[100][ppm]?
    ]
  ],
  label: <tab:phase-sensors-other-coefficients>,
)


=== Measuring the environmental parameters <ssec:phase-sensors-measure>

#[
  #set text(red)
  - Write environmental properties or parameters?
  - More details on the self-heating of the integrated temperature sensors?
  - Already mention "inside" and "outside" segment earlier?
  - Where to mention when the phase correction is actually applied?
  - Mention the fudge factor here!
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
  image("figures/phase-sensors-setup.png"),
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
To measure the long-term stability of the superlattice phase we are using the in-situ measurement technique introduced in @ssec:phase-measure-detect with a finite horizontal gradient.
The symmetric phase $phi = 0$ is then encoded in the position of the phase-sensitive signal, as already shown in @ssec:phase-measure-gradient and @ssec:phase-measure-period #text(red)[ref a figure instead?].
The horizontal gradient is (again) set to the smallest possible value where the phase-sensitive signal remains within the atom cloud during the measurement.
During/in the calibration of the gradient we measured the strength $k_1 = #qty[0.344(13)][mrad/px]$ which will be used to translate the signal positions to the respective phases.

#figure(
  image("figures/2025-05-19_symmetry_point_thesis_result.png", width: 70%),
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
The contributions to the phase correction are converted from #unit[MHz] to #unit[mrad] using the factor @eq:phase-measure-period.
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
We were not able to find any correlation between the measured phases in @fig:phase-sensors-stability and the air temperature measured by the sensor FP07-A evaluated at a constant/specific sequence time.
We therefore had to conclude that the phase correction can not be improved further with the air-temperature sensors inside the mu-metal.
The amplitude/strength of the temperature cycle and the spatial variation of the temperature are too big/great of an uncertainty.
The temperature of the glass cell would also be a small contribution due to its proximity to the Ioffe bars and the pinch coils.
Measuring the glass temperature is/was however not possible (either) since we do not have (sufficient) physical access to the glass cell to attach a temperatur sensor.
#text(red)[where to actually mention this in this paragraph?]
We could however see a drift of the superlattice phase as a function of the sequence time with $approx #text(red)[#qty[-1][mrad/s]]$.
The sign/slope of the drift (already) matches the expected sign based on the decrease of the air temperature after #qty[50][s] in the sequence.
// The actual value of the temperature slope is however too high/strong.
Between #qty[50][s] and #qty[60][s] in the sequence time, the temperature decreases by #qty[-0.0337(27)][#sym.degree:C / s].
If we use the coefficient $phy.dv(Delta n, T) = #qty[1.3e-8][1/K]$ from @tab:phase-sensors-temperature-coefficients with a distance of #text(red)[#qty[200][mm]] between the retro lens and the glass cell, the resulting phase correction would be #qty[-0.56(5)][mrad / s] which is smaller than the actual decrease by a factor of almost #num[2].
We therefore have to conclude that the air-temperature sensor FP07-A only allows us to draw qualitative conclusions about the air temperature inside the mu-metal.
For a quantitative phase correction we have to rely on the empirical slope of

$
  phy.dv(phi, tau) approx #text(red)[#qty[-1][mrad/s]]
$ <eq:phase-sensors-stability-slope>

where $tau$ is the sequence time after #qty[50][s].

#figure(
  grid(
    columns: (2fr, 1fr),
    image("figures/2025-06-13_sensor-dmm_result.png"), image("figures/2024-11-06_ON_symmetry_drifts_result.png"),
  ),
  caption: [
    Air temperature as a function of the sequence time.
    The axes/figure on the left shows the measurement inside the mu-metal by the sensors NTC100-A (dashed) and FP07-A (solid) during a typical experimental sequence.
    The vertical lines indicate the interval where the Ioffe bars (and pinch + offset coils) are turned on during the sequence.
    The shaded regions show the mean plus-minus standard deviation of the respective sensors across/in #text(red)[N] sequences.
    In the axes/figure on the right the drift of the phase with the sequence time is shown.

    #show list: set text(red)
    - Show the comparison to the epoxy sensor NTC100-A.
    - Only show a single trace and then a long average in the background?
    - Add Ioffe interval to the left axes.
    - Actually evaluate the "gradient" in the right axes? It would be good to get an actual uncertainty here...
    - Use $tau$ for the time(s) on the x-axis.
  ],
) <fig:phase-sensors-stability-limitation>

We tried to overcome the limitation of (the) temperature sensors inside the mu-metal by setting up a bichromatic Michelson interferometer in the retro-path #text(red)[add some nice refs].
The idea was to use two overlapping beams with the wavelengths #qty[532][nm] and #qty[1064][nm] to directly measure/probe the relative phase (changes) due to the refractive index.
The beam splitter was placed just next to the retro-mirror and the reference/short arm was located directly behind the retro-mirror (with a length of a few #unit[cm]).
In the long/probe arm we would then guide/position the interferometer beams as close to the lattice beams as possible.
Only the outer walls of the glass cell are coated, we could therefore use the inner wall (facing the retro-path) of the glass cell as the retro-reflecting mirror in/of the probe arm.
The interferometer beams therefore covered all segments in @fig:phase-sensors-measure-setup that are (actually) relevant for the superlattice phase.
The limitation here was however that it is not possible to overlap the interferometer beams and the lattice beams.
The optical axis of the interferometer beams needs to be (perfectly) perpendicular to the glass cell wall to achieve a reflection back to the beam splitter.
The lattice beams on the other hand are set up to deliberately avoid a perpendicular reflection off the glass cell walls #text(red)[ref @sec:super-setup?].
While the distance between the beams is only a few #unit[mm], this is already too much if we take into account that the distance to the Ioffe bars and the pinch coils is on the same order of magnitude.
