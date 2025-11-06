#import "/header.typ": *
#import "figures/figures.typ": table-other-properties, table-thermal-properties

== Active phase stabilization <sec:phase-stability>

// TOOO: Mention the mu-metal anywhere before the @ssec:phase-stability-sensors?

During the experimental sequence, we use the experimental setup in @fig:phase-setup to control the superlattice phase #phase.
With the zero-phase frequency $f0(x, y)$ and the superlattice period $Delta f$ determined in @sec:phase-measure, we can realize any phase $phase(f)$ using the DDS frequency #fdds and the AOM frequency #faom.
Despite the relative stabilization of the laser frequencies, we observe a slow drift of the zero-phase frequency #f0 in a long-term measurement of the superlattice phase.
This drift is caused by a change of the environmental parameters along the optical path between the atom position and the retro mirror.
Since they are superimposed, the #x1064\-lattice beams and the #x532\-lattice beams have an equal geometrical path length.
On the other hand, the optical path length also takes the refractive indices along the beam path into account.
The variation of the refractive index in terms of the environmental parameters depends on the wavelength.
In the context of a bichromatic superlattice, this results in a difference of the accumulated optical phases of the individual lattices up to the atom position, which in turn changes the superlattice phase $phi$.

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
  phy.pdv(phi, T) =
  k dot sum_sigma (phy.pdv(d_sigma, T) dot Delta n_sigma + d_sigma dot phy.pdv(Delta n_sigma, T))
$ <eq:phase-stability-phi-derivative>

where the first term in the sum represents the thermal expansion of the optical elements and the second term takes the relative changes of the refractive indices into account.
In all segments of the optical path, the first term is smaller by at one to three orders of magnitude compared to the second term.
Therefore, we neglect the first term to compute the temperature sensitivity of the superlattice phase.
In the case of the other environmental parameters the first term in @eq:phase-stability-phi-derivative vanishes since they do not affect the geometrical path length.


In @tab:phase-stability-temperature-coefficients, the temperature coefficients $phy.pdv(phi, T)$ are compiled for each segment.
If we combine all segments, the total temperature coefficient is $phy.pdv(phi, T) = #iqty[-14.4][mrad/K]$.
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
    However, the actual contributions to the superlattice phase $phi$ are similar in all segments due to the different distances $d_sigma$.
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


=== Measurement of the environmental parameters <ssec:phase-stability-sensors>

#notes[
  - Already mention "inside" and "outside" segment earlier?
]

The strategy for the stabilization of the superlattice phase $phi$ is a correction of the DDS frequency in @fig:phase-setup based on the environmental parameters in the retro path.
If we can predict the drifts of the superlattice phase, we can achieve a stable superlattice without relying on regular phase measurements with the atoms.
For the measurement of the environmental parameters, we use a selection of sensors near the optical path of the lattice beams as shown in @fig:phase-stability-sensors-setup.
The temperature sensors mainly cover the air segment between the retro lens and the retro mirror, as well as the two segments in the retro lens.
For the other air segment, we can only measure the temperature close to the Ioffe bars just inside the #mu-metal shielding.
Placing a temperature sensor further towards the atom position or attaching a surface-temperature sensor to the glass cell was not possible due to a lack of physical access.
The other environmental sensors are just placed close to the retro path since we do not expect a spatial variation of the pressure, the relative humidity or the #CO2 concentration.

#floating-figure(
  image("figures/phase-sensors-setup.png"),
  caption: [
    Layout of the environmental sensors in the retro path.
    Two air-temperature sensors are distributed between the retro lens and the retro mirror.
    A surface-temperature sensor is attached to the lens mount to measure the temperature of the retro lens components.
    Close to the retro path, two environmental sensors are used to measure the pressure, the relative humidity and the #CO2 concentration.
    Two air-temperature sensors are located inside the #mu-metal shielding close to the Ioffe bars.

    #notes[
      - Add coordinate system (in upper left corner?)
      - Add the legend in lower left corner. Mention all the sensor types here?
      - Extend the #mu-metal shielding (and indicate a "cut" for the sketch?)
      - Skip the other FT07 sensor outside of the #mu-metal...
      - Exchange the lenses L1 and L2 in the achromatic doublet...
      - Add names of the segments from @tab:phase-stability-temperature-coefficients here?
    ]
  ],
  label: <fig:phase-stability-sensors-setup>,
)

For all environmental parameters required for the phase stabilization, digital sensors are available that use #I2C (Inter-Integrated Circuit) or SPI (Serial Peripheral Interface) to communicate with a single-board computer or a microcontroller.
While such a setup allows a simple measurement of the environmental parameters, we found some drawbacks when using these types of sensors.
When we measured the temperature with a digital sensor, the reading always increased during the first few seconds of repeated measurements#footnote[
  We observed this behavior when using the sensors Bosch BMP280 and Bosch BME280.
].
We interpreted this as a slight heating of the sensor by the electrical power dissipation during the measurement process.
Since the temperature change was significant compared to the actual temperature changes in the retro path, we decided to use resistance-based temperature sensors instead.
For the other environmental parameters we use digital sensors, and we could not observe any systematic drifts caused by repeated measurements.
The first digital sensor#footnote[
  Bosch BMP390
] measures the pressure every #qty[300][ms] with a specified relative accuracy of $plus.minus #qty[0.03][hPa]$, which corresponds to $plus.minus #qty[0.33][mrad]$ in terms of the superlattice phase.
With the second digital sensor#footnote[
  Sensirion SCD30
], we measure both the relative humidity as well as the #CO2 concentration every #qty[2][s].
The repeatability of the sensor readings are specified as $plus.minus #qty[0.1][%]$ and $plus.minus #qty[10][ppm]$ respectively, which is sufficient for the corresponding changes of the superlattice phase.
For both digital sensors the absolute accuracy specifications are significantly worse than the relative accuracy.
This is however not an issue for the stabilization of the superlattice phase.
The environmental coefficients in @tab:phase-stability-other-coefficients are constant in the parameter ranges that occur in the laboratory, and we only need to measure the relative changes.

The temperature sensors we use are passive elements and require additional devices to measure their resistance $R(T)$.
While this increases the complexity of the experimental setup, it allows us to optimize the measurement parameters to avoid self-heating of the sensors @vishay_selecting_2015.
For the air-temperature sensors, we use negative temperature coefficient (NTC) thermistors to achieve a maximal temperature sensitivity.
The temperature sensors indicated by the circles in @fig:phase-stability-sensors-setup are precision epoxy NTC thermistors#footnote[
  TE Connectivity 44001A
] with a resistance of $R_0 = #qty[100][Ohm]$ at #degC[25].
For the temperature measurement of the retro-lens mount, we use a platinum resistance temperature detector#footnote[
  Omega SA1-RTD-4W
] (RTD) with a resistance of $R_0 = #qty[100][Ohm]$ at #degC[0].
Using the same reference value for the resistance of all four sensors allows us to use a single data logger#footnote[
  Pico Technology PT-104
] designed for the high-accuracy readout of platinum RTDs with 4-wire sensing.
For the connected NTCs, we configure the data logger to measure the resistance $R$ which we can convert to a temperature after the readout.
The specified RMS noise of the data logger is #degC[0.01] for the direct temperature measurement with an RTD and #degC[0.001] for the resistance measurement of the NTCs.
This level of precision requires a readout time of #qty[720][ms] per channel, resulting in a measurement period of approximately #qty[3][s] for each sensor.
While a higher data rate would seem beneficial for the air-temperature sensors, it would not necessarily improve the temperature measurement since the time response in air is specified as $<#qty[10][s]$.
To improve the time resolution of the air-temperature measurement, we tried glass-coated NTC thermistors#footnote[
  Amphenol Advanced Sensors FP07
] with a resistance of #qty[8][k:Ohm] and a specified response time of #qty[0.1][s] in still air.
For the 4-wire resistance measurement of the fast NTCs, we use bench digital multimeters#footnote[
  Keysight 34465A
] in the low-power readout mode to avoid self-heating of the NTCs.
With a readout time of #qty[100][ms], the specified RMS noise of the multimeter is approximately #qty[1][Ohm], which corresponds to a temperature uncertainty of less than #degC[0.003].
The typical reading of the fast NTC inside the #mu-metal (see @fig:phase-stability-sensors-setup) during the experimental sequence is shown in @fig:phase-stability-result-limitation.


=== Characterization of the phase stability <ssec:phase-stability-result>

Based on the readings of the environmental sensors introduced in @ssec:phase-stability-sensors, we apply a correction to the DDS frequency to stabilize the superlattice phase.
The digital sensors and the data logger for the temperature sensors run continuously at the specified readout rates, without a synchronization to the experimental sequence.
The server that controls the superlattice phase then applies the frequency correction approximately #qty[5][s] before the atoms are loaded into the optical lattices in the experimental sequence (see @fig:setup-sequence).
For each sensor, the mean value of the previous #qty[15][s] is used to reduce the impact of noisy readings.
We are therefore only targeting long-term drifts with the frequency correction.
While the fast NTC thermistor can resolve temperature changes during the experimental sequence, we could not find any further improvement of the phase stability in the sensor data (see @fig:phase-stability-result-limitation).
From the temperature segments listed in @tab:phase-stability-temperature-coefficients, we only take the first air segment (outside of the #mu-metal) and the two components of the retro lens into account.
For the air segment, we use the mean temperature reading of the NTC thermistors #tr[B] and #tr[C] in @fig:phase-stability-sensors-setup.
The temperature measured by the surface sensor attached to the retro-lens mount is used for the two retro-lens components.
In the second air segment (inside of the #mu-metal), the #qty[100][Ohm] NTC thermistor measures a variation of up to #degC[2] during the experimental sequence (see @fig:phase-stability-result-limitation).
If we would consider this temperature for the entire air segment, the corresponding frequency correction significantly exceeds the drifts we can observe for the zero-phase frequency $f_0$.
Since we can not measure the actual temperature $T(x)$ along the optical path, it does not make sense to use the measured temperature at a single location for the frequency correction.
We are not applying a frequency correction for the glass-cell temperature either, since we were not able to install a surface-temperature sensor.
While the glass cell is subject to a similar temperature cycle as the air segment inside the #mu-metal, the actual temperature changes in the glass will be delayed compared to the measured air temperature.

The frequency correction based on the ambient pressure is applied exactly with the environmental coefficient in @tab:phase-stability-other-coefficients, while we increase the frequency correction due to the relative humidity by $2.5$.
// use a fudge factor of $2.5$ for the frequency correction due to the relative humidity.
We found this fudge factor consistently across several long-term measurements of the phase stability using different humidity sensors.
While the Ciddor equation of the refractive index of air is valid for wavelengths in the range from below #qty[350][nm] to above #qty[1300][nm], it does not take absorption lines of water in the infrared regime into account @ciddor_refractive_1996.
This could affect the refractive index at the wavelength #qty[1064][nm], and change the environmental coefficient of the relative humidity.
The other environmental parameters would not be affected by this since they are not related to the water vapor in the air.
For the #CO2 concentration, we do not apply a frequency correction at all since the expected changes are not relevant for the phase stability we can currently achieve.

To quantify the stability of the superlattice phase with the applied frequency correction, we use the phase-sensitive measurement shown in @fig:phase-measure-detect-result with a finite horizontal gradient component.
Just like for the measurement of the superlattice period in @ssec:phase-measure-period, we can use this technique measure the mean zero-phase frequency $f_0$ in every sequence.
We use a small gradient component of #qty[0.615(24)][mrad/μm] to achieve a high sensitivity of the local minimum in the atom density to the superlattice phase.
A gradient component that is too small would be problematic because the zero-phase frequency could be located outside of the atom cloud.
On the other hand, a large gradient component would restrict the local minimum to the center of the atom cloud and make the measurement sensitive to shot-to-shot fluctuations of the position of the atom cloud.
In #subref(<fig:phase-stability-result>, "a"), the long-term stability of the superlattice phase is shown for around #num[800] repetitions in #qty[17][h].
The corresponding standard deviation is

$
  sqrt(Delta phi^2) = #qty[1.27][mrad]
$ <eq:phase-stability-result>

without a rolling average to correct for long-term drifts.
With a rolling average over a period of #qty[30][min], we find the long-term drift of the phase to be smaller than #qty[1][mrad].
In terms of the position of the minimum that marks the zero-phase, the shot-to-shot fluctuations amount to a standard deviation of #qty[2.1][μm].
As a comparison, the standard deviation of the position of the atom cloud itself is only #qty[0.4][μm].
We can therefore largely neglect the fluctuations of the position of the atom cloud compared to the fluctuations of the superlattice phase.
On the other hand, we can not completely decouple fluctuations of the phase and of the gradient component, since both effects contribute to the position of the minimum in the atom cloud.
Conversely, the calibration of the horizontal gradient component itself is also sensitive to fluctuations of the phase.
We can therefore only use the standard deviation in @eq:phase-stability-result to quantify the combined stability of the mean phase and the horizontal component of the phase gradient.
Since both contributions ultimately affect the phase $phi(x, y)$ across the entire atom cloud, this is a suitable approach to estimate the total phase stability.

#floating-figure(
  image("figures/phase_stability_result.png"),
  caption: [
    Long-term stability of the superlattice phase.
    *a*, Shot-to-shot fluctuations of the superlattice phase with the environmental corrections (blue).
    Without the corrections the superlattice phase, would have drifted by more than #qty[30][mrad] (red).
    The insets show the local minimum in the atomic density that is used to determine the phase.
    The superlattice parameters for the phase measurement are $Vx1064 = #qty[40][Erec]$ and $Vx532 = #qty[14.4][Erec]$.
    Missing data points correspond to measurements that are flagged if the beat frequency $Delta nu$ in the optical phase locked loop is not equal to $fdds$.
    The correct beat frequency is recovered by instantly switching the DDS frequency to the erroneous beat frequency, and slowly tuning the DDS frequency back to its initial value.
    *b*, Environmental corrections computed from the sensor readings.
    The sensor corrections are shifted to start at #qty[0][mrad].

    #notes[
      - Really introduce the "relocking" in the figure caption?
      - Comment that the "noise" on the sensors is much smaller than the "noise" on the phase data?
    ]
  ],
  label: <fig:phase-stability-result>,
)

Based on the environmental corrections in #subref(<fig:phase-stability-result>, "b"), we can estimate the raw drift of the superlattice phase during the measurement to be #qty[30][mrad].
The lens temperature and the air temperature each contribute with less than #qty[2][mrad].
Due to the opposite signs of the temperature coefficients in @tab:phase-stability-temperature-coefficients, the traces appear to be mirrored while the actual temperature drift is similar for the air and the retro lens.
For the pressure we can see a correction of up to #qty[15][mrad] during the measurement.
With a corresponding pressure change of #qty[1.5][hPa] this is on the lower end of possible pressure drifts.
However, we generally observe the same phase stability for much larger pressure drifts by more than #qty[10][hPa] in a few hours.
The correction due to the humidity also goes up to #qty[15][mrad], which corresponds to a drift of the humidity by approximately #qty[7][%].
The fudge factor $2.5$ that we apply to the coefficient in @tab:phase-stability-other-coefficients is already taken into account here.
Without this fudge factor, we would have observed a long-term drift of the superlattice phase by more than #qty[10][mrad] during the measurement.
In general, we find the environmental correction to be very reliable for the pressure and the humidity, while most of the instability is caused by the temperature.
This is a simple consequence of the homogeneity of the environmental parameters in the retro path.
While we expect the pressure and the humidity to be uniform across the entire optical path, this is not true of the temperature.
Using multiple temperature sensors is already an attempt to handle the inhomogeneity, but even then it is not possible to accurately measure the actual temperature along the lattice beams.
We have to rely on the active temperature regulation on the experimental table to reduce the drifts as much as possible.
The phase stability achieved in @fig:phase-stability-result therefore always requires a good thermal stability of the optical path.
The limitation of the phase stability due to the temperature cycle of the magnetic field coils in the experimental setup are shown in @fig:phase-stability-result-limitation.


==== Comparison to other experimental setups

The stability of the superlattice phase in @eq:phase-stability-result is better than the reported stability in other state-of-the-art tunable bichromatic superlattices#footnote[
  The stability of the superlattice phase is always related to its tunability.
  With a shallow-angle setup, a bichromatic superlattice can be built to be inherently stable by choosing equal path lengths for the two arms.
  Any modification of the setup that allows a tunability of the phase, is likely to reduce the stability of the phase.
].
In @li_high-powered_2021, a shallow-angle superlattice is introduced with a focus on the robustness of the phase stability.
Just like in our experimental setup, the wavelengths are #qty[1064][nm] and #qty[532][nm].
Both beam paths have approximately the same length and are sealed in a box to make the superlattice insensitive to fluctuations of the environmental parameters.
The tunability of the superlattice phase is achieved by changing the path length of the infrared lattice in one of the arms.
They use a camera to track the interference fringes of the individual lattices, which is possible due to the shallow-angle configuration.
The reported short-term stability is $0.003 pi approx #qty[9.4][mrad]$ in #qty[10][s], and the typical drift of the phase in #qty[90][min] is $0.03 pi$.
Regular compensation measurements are therefore required to ensure the long-term stability of the superlattice phase.

In @chalopin_optical_2024, another shallow-angle superlattice using the wavelengths #qty[1064][nm] and #qty[532][nm] is presented.
The tunability of the superlattice phase is achieved with a path length difference of approximately #qty[40][cm].
To ensure a passive stability of the superlattice, the optical setup is placed into an evacuated box and the optical elements are glued onto a near-zero thermal expansion glass plate.
The superlattice phase is inferred from the double-well population and the shot-to-shot fluctuations are reported as $sqrt(Delta phi^2) approx #qty[4.5][mrad]$.
However, since their superlattice phase $phi$ is included in the short-lattice term in the superlattice potential @eq:theory-super-potential[], we need to divide their standard deviation by $2$ for a fair comparison to our experimental setup.
The resulting shot-to-shot stability of $sqrt(Delta phi^2) approx #qty[2.25][mrad]$ is worse than our long-term stability by approximately #qty[80][%].
To eliminate long-term drifts of the superlattice phase, regular compensation measurements are also required here.


==== Limitation of the phase stability

While the environmental correction applied in @fig:phase-stability-result completely removes long-term drifts of the superlattice phase, the shot-to-shot stability is not improved at all.
None of the individual corrections even have a sufficient shot-to-shot variation that could further improve the phase.
To understand the origin of the shot-to-shot fluctuations, we look at the readings of the temperature sensors inside the #mu-metal that are not included in the environmental correction.
In terms of the optical path, these sensors would represent approximately half of the total path length (see @tab:phase-stability-temperature-coefficients) and the glass cell.
However, we decided against taking these sensors into account for the environmental correction since we could not find a quantitative relation between the sensor readings and the measured superlattice phase.
The typical readings are shown in #subref(<fig:phase-stability-result-limitation>, "a") as a function of the sequence time.
Both sensors replicate the thermal cycle of the magnetic field coils used for the Ioffe-Pritchard trap that are the dominant source of heating on the experimental table.
Based on the peak-to-peak amplitude and the delay relative to the interval of the Ioffe-Pritchard trap in the sequence, it appears that the regular sensor is positioned closer to one of the Ioffe bars than the fast sensor#footnote[
  Due to a lack of physical access and a restricted visibility, we do not know the exact positions of the temperature sensors relative to the Ioffe bars and the lattice beams.
].

#floating-figure(
  image("figures/phase_stability_limitation.png"),
  caption: [
    Temperature cycle during the experimental sequence.
    *a*, Readings of the air temperature sensors inside the #mu-metal (see @fig:phase-stability-sensors-setup).
    The lower data (orange) shows the regular NTC thermistor and the upper data (green) shows the fast NTC thermistor.
    An offset is applied to the temperature measured with the fast NTC thermistor to improve the readability.
    The shaded areas show the mean temperature and the corresponding standard deviation, while the solid lines and the data points show the temperature reading during a single sequence.
    The dashed vertical lines mark the time interval where the Ioffe-Pritchard trap is turned on.
    *b*, Drift of the superlattice phase depending on the measurement time during the sequence.
    The time interval of the phase measurements is highlighted with the gray area in *a*.
  ],
  label: <fig:phase-stability-result-limitation>,
)

The earliest time during the experimental sequence where we can measure the superlattice phase is at approximately #qty[52.5][s].
Everything before is reserved for the preparation of the degenerate Fermi gas and the loading into the optical lattices (see @sec:setup-sequence).
In #subref(<fig:phase-stability-result-limitation>, "b") we can see the linear drift of the superlattice phase if we delay the phase measurement by up to #qty[5][s].
While the slope has the correct sign for a decrease of the air temperature according to @tab:phase-stability-temperature-coefficients, the readings of the temperature sensors can not accurately predict the drift of the superlattice phase.
We can however conclude that the air temperature is mainly responsible for the drift of the phase, since we would expect the opposite drift from the temperature coefficient of the glass cell.
From the phase drift, we can extract the empirical correction

$
  phy.pdv(phi, tau) = #qty[-0.94(9)][mrad/s]
$ <eq:phase-stability-result-slope>

that we apply during lifetime measurements lasting up to multiple seconds.
For regular measurements where the atoms are trapped in the superlattice for less than #qty[100][ms], we do not take the time-dependent correction in @eq:phase-stability-result-slope into account and just use the correction scheme presented in @fig:phase-stability-result.
In conclusion, we can not achieve a further improvement of the phase stability with the temperature sensors close to the magnetic field coils for the Ioffe-Pritchard trap.
However, we can claim that the spatial and temporal variation of the air temperature due to the thermal cycle of the experimental sequence is the most likely limitation of the phase stability.
Since an accurate measurement of the temperature distribution is not possible, the most promising improvement would be a shielding of the optical path.
In practice, such a shielding would be very difficult to implement due to the proximity of the lattice beams to the magnetic field coils and because of the limited physical access to the optical path.

Before the upgrade of the superlattice setup introduced in @ch:super, we could observe a much stronger drift of the phase by up to #qty[50][mrad] in #qty[2][s].
Furthermore, the phase drift became stronger as a function of the #x532\-lattice depth#footnote[
  Due to the much stronger absorption coefficient at #qty[532][nm] compared to #qty[1064][nm] in #NSF11 (@tab:super-thermal-materials), we could only observe a sensitivity of the superlattice phase to the lattice depth #Vx532.
].
We therefore concluded that the absorption of the lattice beams that caused thermal lensing in the old retro lens also affected the superlattice phase.
The local temperature in the lens was increased depending on the power of the #x532 lattice, which we could not resolve with the temperature sensor attached to the lens mount.
With the new retro lens, we are not able to see any dependency between the drift of the superlattice phase and the lattice depth #Vx532.
Replacing the retro lens was therefore an essential step for the overall stability of the in-plane superlattice.
