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

