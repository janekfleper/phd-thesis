#import "/header.typ": *
#import "figures/figures.typ": table-other-properties, table-thermal-properties
#import "figures/stability_result/figure.typ": figure as figure-result
#import "figures/stability_limitation/figure.typ": figure as figure-limitation

== Active phase stabilization <sec:phase-stability>

// TOOO: Mention the mu-metal anywhere before the @ssec:phase-stability-sensors?

During the experimental sequence, we use the experimental setup in @fig:phase-setup to control the superlattice phase #phase.
With the zero-phase frequency $f0(x, y)$ and the superlattice period $Delta f$ determined in @sec:phase-measure, we can realize any phase $phase(f)$ using the DDS frequency #fdds and the AOM frequency #faom.
Despite the relative stabilization of the laser frequencies, we observe a slow drift of the zero-phase frequency #f0 in a long-term measurement of the superlattice phase.
This drift is caused by a change of the environmental parameters along the optical path between the atom position and the retro mirror.
Since they are superimposed, the #x1064\-lattice beams and the #x532\-lattice beams have an equal geometrical path length.
On the other hand, the optical path length also takes the refractive indices along the beam path into account.
The variation of the refractive index in terms of the environmental parameters depends on the wavelength.
In the context of a bichromatic superlattice, this results in a difference of the accumulated optical phases of the individual lattices up to the atom position, which in turn changes the superlattice phase #phase.

For the optical elements, we only have to consider the changes to the refractive indices as a function of the material temperature.
In contrast, the refractive index in air depends on the temperature, the pressure, the relative humidity and the #CO2 concentration.
Out of these environmental parameters, only the temperature is actively regulated on the experimental table.
Additionally, we have shielded the optical path to improve the passive temperature stability.
The air pressure in the laboratory is equal to the air pressure outside of the building, while the relative humidity is lowered by the fresh-air supply and two dehumidifiers.
A regulation of the pressure and the humidity would require a hermetically sealed experimental table or an enclosed optical path, which is not practical for our experimental setup.
Instead, we implement an active stabilization of the superlattice phase based on the readings of environmental sensors along the optical path.
We compute the environmental coefficients of the refractive index for the wavelengths #qty[1064][nm] and #qty[532][nm] to compute the expected drift of the phase #phase and the required correction of the frequency #fdds to stabilize the phase.


=== Environmental sensitivity of the superlattice phase <ssec:phase-stability-coefficients>

To compute the environmental correction, we split the optical path (c.f. @fig:phase-stability-sensors-setup) into six different segments.
Starting from the retro mirror, the lattice beams propagate approximately #qty[240][mm] in the first air segment up to the retro lens.
Since the retro lens is an achromatic doublet, we use two segments to take the different materials into account.
Behind the retro lens, there is another air segment up to the glass cell with a length of approximately #qty[220][mm].
The last two segments in the optical path cover the ultra-high vacuum glass cell.
The wall of the glass cell is #qty[4][mm] thick, and the atoms are located approximately #qty[17][mm] inside the glass cell.
While all segments contribute to the accumulated optical phases of the individual lattices, the ultra-high vacuum inside the glass cell makes the last segment insensitive to the environmental parameters.
The other five segments each contribute to the drift of the superlattice phase #phase.
For the glass cell and the retro lens, the refractive indices are only sensitive to the respective material temperatures $T$.
In the two air segments, we take the temperature $T$, the pressure $P$, the relative humidity #RH and the #CO2 concentration #xCO2 into account.

Using the phase convention in @eq:theory-super-potential, we express the superlattice phase #phase as a function of the individual phases #phix1064 and #phix532 that both depend on the optical path length.
We divide the #x532\-lattice phase by $2$ to take the wavelengths of the individual lattices into account.
The resulting superlattice phase is

$
  phase & = phix1064 - 1 / 2 phix532 \
        & = (k + Delta k) dot integral_0^d phy.dd(x) nx1064 (x) - k dot integral_0^d phy.dd(x) nx532 (x) \
        & = k dot sum_sigma d_sigma dot Delta n_sigma + Delta k dot sum_sigma d_sigma dot nx1064 \
$ <eq:phase-stability-phi>

where $k$ is the wave vector of the reference laser that pumps the second-harmonic generation cavity in @fig:phase-setup.
The wave vector of the #x532 lattice is $kx532 = 2k$, and the wave vector of the #x1064 lattice is $kx1064 = k + Delta k$, where $Delta k$ takes the frequency detuning of the #x1064\-lattice seed laser and the additional frequency shift by the acousto-optical modulator into account.
Each integral covers the optical path from the retro mirror to the atom position in the glass cell.
To further simplify the expression, we use the constant refractive indices in each segment $sigma$ to rewrite the integrals as two sums.
The first term in @eq:phase-stability-phi computes the accumulated superlattice phase due to the difference $Delta n_sigma = nx1064 - nx532$ of the refractive indices in each segment, and the second term takes the change of the superlattice phase due to the frequency detuning of the #x1064 lattice into account.
While the second term is essential for controlling the superlattice phase according to the diagram in @fig:phase-setup, its derivative with respect to the environmental parameters is smaller by four orders of magnitude compared to the first term.
Therefore, we neglect the second term in @eq:phase-stability-phi when computing the environmental correction for the superlattice phase.
The sensitivity of the superlattice phase #phase to the temperature $T$ is given by the derivative

$
  phy.pdv(phase, T) =
  k dot sum_sigma (phy.pdv(d_sigma, T) dot Delta n_sigma + d_sigma dot phy.pdv(Delta n_sigma, T))
$ <eq:phase-stability-phi-derivative>

where the first term in the sum represents the thermal expansion of the optical elements and the second term takes the relative changes of the refractive indices into account.
In all segments of the optical path, the first term is smaller by at one to three orders of magnitude compared to the second term.
Therefore, we neglect the first term to compute the temperature sensitivity of the superlattice phase.
In the case of the other environmental parameters the first term in @eq:phase-stability-phi-derivative vanishes since they do not affect the geometrical path length.


In @tab:phase-stability-temperature-coefficients, the temperature coefficients $phy.pdv(phase, T)$ are compiled for each segment.
If we combine all segments, the total temperature coefficient is $phy.pdv(phase, T) = #iqty[-14.4][mrad/K]$.
However, the changes of the temperature $T$ are not uniform in all segments.
In the first air segment between the retro mirror and the retro lens, the peak-to-peak temperature variation is typically #degC[0.2] in one hour.
On a timescale of a few days, the mean temperature drifts between #degC[0.1] and #degC[0.2].
For the retro lens, the peak-to-peak temperature stability is better than #degC[0.02], while long-term drifts can also go up to #degC[0.2].
Therefore, we expect the superlattice phase to change between #qty[20][mrad] and #qty[30][mrad] due to the first air segment and the retro lens.
Due to the proximity of the lattice beams to the magnetic field coils, the second air segment is subject to the thermal cycle of the coils and we observe peak-to-peak temperature changes up to $Delta T = #degC[2]$ within one experimental sequence.
Additionally, we expect an inhomogeneous temperature distribution based on the geometry and the location of the magnetic field coils.
The resulting limitation for the stability of the superlattice phase is discussed in detail in @fig:phase-stability-result-limitation.

#floating-figure(
  {
    set text(10pt)
    table-thermal-properties
  },
  caption: [
    Temperature coefficients of the segments in the retro path.
    The derivatives $phy.pdv(Delta n_sigma, T)$ show that the refractive index of air is significantly less sensitive to the temperature compared to the optical materials.
    However, the actual contributions to the superlattice phase #phase are similar in all segments due to the different distances $d_sigma$.
    The two lenses made of #CAF2 (lens 1) and #NBALF4 (lens 2) form the achromatic retro lens.
    The reference conditions for the computation of the temperature coefficients are $T_0 = #degC[24]$, $P_0 = #qty[1013.3][hPa]$ and $RH_0 = #qty[40][%]$.
    In air, the temperature coefficient is computed with the Ciddor equation @ciddor_refractive_1996.
    The material properties of the retro lens are taken from @daimon_high-accuracy_2002 @corning_optigrade_2024 @schott_tie-31_2018, and the material properties of the glass cell (UVFS) are taken from @malitson_interspecimen_1965 @corning_fused_2015.

    // TODO: Mention the materials in an additional row?
    // TODO: Find the material name for the glass cell? Heraeus Suprasil? And reference the data sheet instead?
  ],
  label: <tab:phase-stability-temperature-coefficients>,
)

For the pressure $P$, the relative humidity #RH and the #CO2 concentration #xCO2, we combine the two air segments into one air segment.
In contrast to the temperature $T$, we expect these parameters to be homogeneous along the optical path.
The resulting environmental coefficients for the total distance in air are listed in @tab:phase-stability-other-coefficients.
For the pressure in the laboratory, we have observed values between #qty[950][hPa] and #qty[1030][hPa] in the last few years.
If the weather outside of the building changes rapidly, pressure variations can go up to $abs(Delta P) = #qty[20][hPa]$ in a few hours, which amounts to a drift of the superlattice phase by more than #qty[200][mrad].
The overall range of the relative humidity is $#qty[10][%] < RH < #qty[50][%]$.
We usually observe changes of the relative humidity between #qty[1][%] and #qty[15][%] within #qty[24][h], where the upper limit amounts to a phase correction by more than #qty[10][mrad].
The phase coefficient of the #CO2 concentration is very small compared to the pressure and the relative humidity.
When the fresh air supply is working and no person is present in the laboratory, the #CO2 concentration is constant within the specified repeatability of the sensor, which limits the variation to $Delta xCO2 < #qty[20][ppm]$.
In terms of the superlattice phase, this corresponds to a maximal drift by #qty[0.1][mrad].
Therefore, we neglect the #CO2 concentration for the active stabilization of the superlattice phase unless we reach the sub-#unit[mrad] regime.

#floating-figure(
  {
    set text(10pt)
    table-other-properties
  },
  caption: [
    Environmental coefficients of air in the retro path.
    The coefficients are computed using the Ciddor equation @ciddor_refractive_1996 at the reference values $T_0 = #degC[24]$, $P_0 = #qty[1013.3][hPa]$, $RH_0 = #qty[40][%]$ and $xCO2 = #qty[450][ppm]$ for a total distance of #qty[460][mm] in air.
  ],
  label: <tab:phase-stability-other-coefficients>,
  placement: bottom,
)


=== Measuring the environmental parameters <ssec:phase-stability-sensors>

// TODO: Move some of the technical details about the sensors to the figure!

The environmental sensors along the optical path from the retro mirror to the atom position are shown in @fig:phase-stability-sensors-setup.
We use multiple environmental sensors to cover the different segments and parameters.
In the air segment between the retro lens and the retro mirror, we place two air-temperature sensors close to the lattice beams.
A surface-temperature sensor is attached to the retro-lens mount to measure the material temperature of the two lens segments.
Inside the #mu-metal shielding, we are only able to measure the air temperature close to the ends of the Ioffe bars.
Placing an air-temperature sensor further towards the atom position or attaching a surface-temperature sensor to the glass cell is not possible due to a lack of physical access.
For measuring the pressure, the relative humidity and the #CO2 concentration, we place the environmental sensors in the air segment outside the #mu-metal shielding.
As we expect these parameters to be homogeneous, measuring them at specific positions is not necessary.

#floating-figure(
  image("figures/phase-sensors-setup.png"),
  caption: [
    Layout of the environmental sensors in the retro path.
    Two air-temperature sensors are distributed between the retro lens and the retro mirror.
    A surface-temperature sensor is attached to the lens mount to measure the temperature of the retro lens components.
    Close to the retro path, two environmental sensors are used to measure the pressure, the relative humidity and the #CO2 concentration.
    Two air-temperature sensors are located inside the #mu-metal shielding close to the Ioffe bars.

    // TODO: Add coordinate system (in lower left corner?)
    // TODO: Add a scale? Or at least a comment regarding the scale?
    // TODO: Add the legend in the lower center. Mention all the sensor models/types!
    // TODO: Mentioned all the detailed information about the sensor types here!
    // TODO: Skip the other FT07 sensor outside of the #mu-metal...
    // TOOD: Exchange the lenses L1 and L2 in the achromatic doublet...
  ],
  label: <fig:phase-stability-sensors-setup>,
  placement: bottom,
)

A multitude of integrated sensors are available for measuring the environmental parameters in the retro path.
Using #I2C (Inter-Integrated Circuit) or SPI (Serial Peripheral Interface) for communicating with a single-board computer or a microcontroller enables a simple integration into the experimental control.
However, we observed an issue when using integrated temperature sensors where the temperature reading increased during the first few seconds of a continuous measurement#footnote[
  We observed this behavior when using the sensors Bosch BMP280 and Bosch BME280.
].
We attribute the heating of the sensor to the electrical power dissipation during the measurement process.
Since these temperature changes were significant compared to the temperature drifts in the retro path, we decided against using integrated temperature sensors.
For the other environmental parameters, we have not observed any issues when running continuous measurements with integrated sensors.
The first integrated sensor#footnote[
  Bosch BMP390
] measures the pressure every #qty[300][ms] with the relative accuracy $plus.minus #qty[0.03][hPa]$, which corresponds to $plus.minus #qty[0.33][mrad]$ in terms of the superlattice phase.
The second integrated sensor#footnote[
  Sensirion SCD30
] measures the relative humidity as well as the #CO2 concentration every #qty[2][s].
The repeatability is specified as $plus.minus #qty[0.1][%]$ and $plus.minus #qty[10][ppm]$ for the two environmental parameters, respectively.
In both cases, the corresponding variation of the superlattice phase is smaller than $plus.minus #qty[0.1][mrad]$.
For the integrated sensors, the absolute accuracy is significantly worse than the relative accuracy.
While this can be improved by calibrating the sensors, it is not required in the context of the active stabilization of the superlattice phase.
Since the environmental coefficients in @tab:phase-stability-other-coefficients are constant in the typical conditions inside the laboratory, measuring the relative changes of the environmental parameters is sufficient.

For measuring the temperature along the optical path, we use passive temperature sensors with a temperature-sensitive resistance $R(T)$.
We select data acquisition devices with suitable measurement parameters to avoid self-heating of the temperature sensors @vishay_selecting_2015.
To achieve a maximal temperature sensitivity, we use negative temperature coefficient (NTC) thermistors for measuring the air temperature.
The temperature sensors indicated by the circles in @fig:phase-stability-sensors-setup are precision epoxy NTC thermistors#footnote[
  TE Connectivity 44001A
] with a resistance of $R_0 = #qty[100][Ohm]$ at #degC[25].
For the temperature measurement of the retro-lens mount, we use a platinum resistance temperature detector#footnote[
  Omega SA1-RTD-4W
] (RTD) with a resistance of $R_0 = #qty[100][Ohm]$ at #degC[0].
Using the same reference value for the resistance of all four sensors allows us to use a single data logger#footnote[
  Pico Technology PT-104
] designed for the high-accuracy readout of platinum RTDs with 4-wire sensing.
The specified RMS noise of the data logger is #degC[0.01] for the direct temperature measurement with an RTD and #degC[0.001] for the resistance measurement of the NTC thermistors.
This level of precision requires a readout time of #qty[720][ms] per channel, resulting in a measurement period of approximately #qty[3][s] for each sensor.
With the specified response time $<#qty[10][s]$ of the air-temperature sensors, the time resolution is not limited by the by the data logger.

To improve the time resolution of the air-temperature measurement, we use fast NTC thermistors#footnote[
  Amphenol Advanced Sensors FP07
] with a response time of #qty[0.1][s] in still air.
This enables us to resolve temperature changes during the experimental sequence.
For the 4-wire resistance measurement, we employ bench digital multimeters#footnote[
  Keysight 34465A
] in the low-power readout mode to avoid self-heating of the NTC thermistors.
With a readout time of #qty[100][ms], the specified RMS noise of the multimeter is approximately #qty[1][Ohm], which corresponds to a temperature uncertainty smaller than #degC[0.003].
The typical readings of the fast NTC thermistor inside the #mu-metal (see @fig:phase-stability-sensors-setup) during the experimental sequence are shown in @fig:phase-stability-result-limitation.


=== Characterizing the phase stability <ssec:phase-stability-result>

Using the readings of the environmental sensors introduced in @ssec:phase-stability-sensors, we apply a correction to the DDS frequency to stabilize the superlattice phase.
The integrated sensors and the data logger for the temperature sensors run continuously at the specified readout rates.
In the experimental sequence, the frequency correction is applied approximately #qty[5][s] before the atoms are loaded into the optical lattices (see @fig:setup-sequence).
For each sensor, we compute the mean value of the previous #qty[15][s] to reduce the impact of noisy readings.
Therefore, we only target long-term drifts of the environmental parameters for the active phase stabilization.

From the segments listed in @tab:phase-stability-temperature-coefficients, we only take the temperature in the first air segment (outside the #mu-metal) and the retro lens into account.
In the air segment, we use the mean temperature reading of the NTC thermistors #tr[B] and #tr[C] (see @fig:phase-stability-sensors-setup).
The temperature measured by the surface sensor attached to the retro-lens mount is used for the two lens segments.
In the second air segment (inside the #mu-metal), the #qty[100][Ohm] NTC thermistor measures a variation of up to #degC[2] during the experimental sequence (see @fig:phase-stability-result-limitation).
The corresponding frequency correction far exceeds the drifts we observe for the zero-phase frequency #f0.
For the glass cell, the temperature is unkonwn since we are not able to attach a surface-temperature sensor.
Therefore, we only consider the first air segment and the retro lens for the frequency correction based on the temperature.

For the air pressure, we apply the frequency correction according to the environmental coefficient in @tab:phase-stability-other-coefficients.
In contrast, the fudge factor $2.5$ is required for the frequency correction based on the relative humidity.
This fudge factor is consistent across several long-term measurements of the phase stability using different humidity sensors.
While the Ciddor equation for the refractive index of air is valid for wavelengths in the range between #qty[350][nm] and #qty[1300][nm], it does not take absorption lines of water in the infrared regime into account @ciddor_refractive_1996.
This can affect the refractive index at #qty[1064][nm], thereby changing the environmental coefficient.

#floating-figure(
  figure-result(),
  caption: [
    Long-term stability of the superlattice phase.
    *a*, Shot-to-shot fluctuations of the superlattice phase with the active stabilization (blue).
    Without the environmental corrections, we expect a significant drift of the superlattice phase (red).
    The insets show the local minimum in the atomic density that is used to determine the phase.
    Missing data points correspond to measurements that are masked because the optical phase locked loop is out of lock.
    The superlattice parameters for the phase measurement are $Vx1064 = #qty[40][Erec]$ and $Vx532 = #qty[14.4][Erec]$.
    *b*, Environmental corrections computed from the sensor readings.
    The data are shifted to start at #qty[0][mrad].
  ],
  label: <fig:phase-stability-result>,
)

To quantify the stability of the superlattice phase with the active correction, we use the phase-sensitive measurement shown in @fig:phase-measure-detect-result with a finite horizontal gradient component.
Analogous to the measurement of the superlattice period in @ssec:phase-measure-period, this technique enables measuring the mean zero-phase frequency #f0 in every sequence.
With the horizontal gradient component #iqty[0.615(24)][mrad/μm] we achieve a high sensitivity to the superlattice phase#footnote[
  If the gradient component is too small, the zero-phase frequency can be located outside of the atom cloud.
  On the other hand, a large gradient component restricts the local minimum to the center of the atom cloud, which makes the measurement sensitive to shot-to-shot fluctuations of the atom-cloud position.
].
In #subref(<fig:phase-stability-result>, "a"), the long-term stability of the superlattice phase is shown for around #num[800] repetitions in #qty[17][h].
The corresponding standard deviation is

$
  sqrt(Delta phase^2) = #qty[1.27][mrad]
$ <eq:phase-stability-result>

without a rolling average to correct for long-term drifts.
Using a rolling average with a period of #qty[30][min], we find the long-term phase drift to be smaller than #qty[1][mrad].
We cannot decouple fluctuations of the mean superlattice phase and the horizontal gradient component since both contribute to the position of the local minimum.
Therefore, the standard deviation quantifies the combined stability of the superlattice phase $phase(x, y)$.

Based on the environmental corrections in #subref(<fig:phase-stability-result>, "b"), we estimate the raw drift of the superlattice phase during the measurement to be #qty[30][mrad].
The lens and air temperature each contribute with a correction smaller than #qty[2][mrad].
For the pressure, we see a correction of up to #qty[15][mrad] during the measurement.
While the corresponding pressure change of #qty[1.5][hPa] is on the lower end of possible pressure drifts, we observe the same phase stability for much larger pressure drifts by more than #qty[10][hPa] in a few hours.
The correction due to the relative humidity goes up to #qty[15][mrad] with the fudge factor $2.5$, which corresponds to a drift by #qty[7][%].
Without the fudge factor, the correction of the superlattice phase is off by #qty[10][mrad].

In general, we find the environmental correction to be very reliable for the pressure and the relative humidity, while most of the instability is caused by the temperature.
We attribute this to the homogeneity of the pressure and the relative humidity along the optical path.
While using multiple temperature sensors is an attempt to handle the inhomogeneity, we have to rely on the active temperature regulation on the experimental table to reduce the phase fluctuations as much as possible.
Consequently, the phase stability achieved in @fig:phase-stability-result always requires a good thermal stability along the optical path.
The limitation of the phase stability due to the thermal cycle of the magnetic field coils in the experimental setup is shown in @fig:phase-stability-result-limitation.


==== Comparison to other experimental setups

The stability of the superlattice phase in @eq:phase-stability-result is better than the reported stability in other state-of-the-art tunable bichromatic superlattices#footnote[
  The stability of the superlattice phase is always related to its tunability.
  With a shallow-angle setup, a bichromatic superlattice can be built to be inherently stable by choosing equal path lengths for the two arms.
  Any modification of the setup that allows a tunability of the phase, is likely to reduce the stability of the phase.
].
In @li_high-powered_2021, a shallow-angle superlattice is presented with a focus on the robustness of the phase stability.
Just like in our experimental setup, the wavelengths are #qty[1064][nm] and #qty[532][nm].
Both beam paths have approximately the same length and are sealed in a box to make the phase insensitive to fluctuations of the environmental parameters.
The tunability of the superlattice phase is achieved by changing the path length of the infrared lattice in one of the arms.
The phase measurement is done with a camera that captures the interference fringes at the position of the atoms.
The reported short-term stability is $0.003 pi approx #qty[9.4][mrad]$ in #qty[10][s], and the typical drift of the phase in #qty[90][min] is $0.03 pi$.
Regular compensation measurements are required to ensure the long-term phase stability.

Another shallow-angle superlattice using the wavelengths #qty[1064][nm] and #qty[532][nm] is introduced in @chalopin_optical_2024.
The tunability of the superlattice phase is achieved with a difference in the path length of approximately #qty[40][cm].
To ensure a passive stability of the superlattice, the optical setup is placed into an evacuated box and the optical elements are glued onto a near-zero thermal expansion glass plate.
The superlattice phase is inferred from the double-well population after loading the atoms around the symmetric configuration.
The shot-to-shot fluctuations for the phase of the green lattice are $sqrt(Delta phase^2) approx #qty[4.5][mrad]$ with a rolling average over a period of #qty[20][min].
For a comparison to the phase of the infrared lattice in the superlattice potential @eq:theory-super-potential[], we divide the phase by the factor $2$, thereby resulting in the stability $sqrt(Delta phase^2) approx #qty[2.25][mrad]$.
To eliminate long-term drifts of the superlattice phase, regular compensation measurements are required.


==== Limitation of the phase stability

While the active phase stabilization applied in @fig:phase-stability-result completely removes long-term drifts of the superlattice phase, the short-term stability is not improved on.
Furthermore, the environmental parameters do not show shot-to-shot variations that are sufficiently large to improve the phase stability.
To understand the origin of the shot-to-shot phase fluctuations, we look at the readings of the temperature sensors inside the #mu-metal, which are not used for the active phase stabilization.
In terms of the segments in the optical path (see @tab:phase-stability-temperature-coefficients), these sensors cover approximately half of the optical path length and the glass cell.
The typical readings are shown in #subref(<fig:phase-stability-result-limitation>, "a") as a function of the sequence time.
Both sensors replicate the thermal cycle of the magnetic field coils used for the Ioffe-Pritchard trap, which are the dominant sources of heating on the experimental table.
The regular NTC thermistor is positioned closer to the Ioffe bars than the fast NTC thermistor#footnote[
  Due to a restricted visibility and a lack of physical access, we do not know the exact positions of the temperature sensors relative to the Ioffe bars and the lattice beams.
], which results in the different peak-to-peak amplitude of the readings and the delay relative to the interval of the Ioffe-Pritchard trap in the sequence.

#floating-figure(
  figure-limitation(),
  caption: [
    Temperature cycle during the experimental sequence.
    *a*, Air-temperature readings inside the #mu-metal (see @fig:phase-stability-sensors-setup).
    The lower data (orange) shows the regular NTC thermistor and the upper data (green) shows the fast NTC thermistor.
    An offset of #degC[-2.5] is applied to the data of the fast NTC thermistor to improve the readability.
    The shaded areas show the mean temperature and the corresponding standard deviation, while the solid lines and the data points show the temperature readings during a single sequence.
    The dashed vertical lines mark the time interval where the Ioffe-Pritchard trap is turned on.
    *b*, Drift of the superlattice phase depending on the measurement time during the sequence.
    The time interval of the phase measurements is highlighted with the gray area in *a*.
  ],
  label: <fig:phase-stability-result-limitation>,
)

The earliest time for measuring the superlattice phase during the experimental sequence is after approximately #qty[52.5][s].
Everything before is reserved for preparing the degenerate Fermi gas and loading the atoms into the three-dimensional optical lattices (see @sec:setup-sequence).
In #subref(<fig:phase-stability-result-limitation>, "b") we see a linear drift of the superlattice phase if we delay the phase measurement in the experimental sequence.
While the sign of the slope matches a decreasing air temperature according to the environmental coefficients in @tab:phase-stability-temperature-coefficients, the readings of the temperature sensors cannot accurately predict the variation of the superlattice phase in individual sequences.
From the mean phase drift, we extract the empirical correction

$
  phy.pdv(phase, tau) = #qty[-0.94(9)][mrad/s] med ,
$ <eq:phase-stability-result-slope>

which we apply to all sequences where the atoms are trapped in the superlattice for longer than #qty[100][ms].
In conclusion, we cannot further improve on the phase stability with the temperature sensors close to the magnetic field coils for the Ioffe-Pritchard trap.
The spatial and temporal variations of the air temperature due to the thermal cycle of the experimental sequence are the most likely limitation of the phase stability.

Before the upgrade of the superlattice setup introduced in @ch:super, we observed a phase drift up to #iqty[25][mrad/s] depending on the #x532\-lattice depth#footnote[
  The old retro lens has a much higher absorption coefficient at #qty[532][nm] compared to #qty[1064][nm].
].
We conclude that the absorption of the lattice beams in the old retro lens, which was responsible for the thermal lensing, also affected the superlattice phase.
With the new retro lens, we do not see any dependency between the drift of the superlattice phase and the lattice depth #Vx532.
Replacing the retro lens was, therefore, an essential step for the overall stability of the in-plane superlattice.
