#import "/header.typ": *
#import "figures/figures.typ": table-optical-properties

== Thermal lensing <sec:super-thermal>

In high-power laser applications, thermal lensing is a common issue @laskin_selection_2021.
The absorption of light in lenses, windows, and other optical elements induces a thermal gradient in the material that affects its geometrical and optical properties.
Lasers used for welding or cutting can routinely achieve average powers of several #unit[kW], where elaborate techniques are required to compensate the effects of the thermal lensing.
With a real-time focus-shift measurement, a closed-loop control system can be implemented to actively compensate the thermal lensing @reitemeyer_online_2010.
Another approach is to use specific materials to find a balance between thermal dispersion and surface deformation due to the absorption of light @rall_simulation_2022.
In the context of the experimental setup in this thesis, we are only dealing with intermediate optical powers up to a few watts.
However, the collimated lattice beams have small diameters to realize the large beam waists at the atom position (see @sec:super-setup).
Therefore, the beam intensity was sufficient to cause a thermal lensing that significantly affected the operation of the optical lattices.
Compared to high-power applications, we could largely eliminate the thermal lensing by simply choosing the appropriate optical materials.
Retrospectively, the thermal lensing was only enabled by a questionable material selection in the first place.

For the optical setup on the experimental table, we only consider thermal lensing due to the absorption of light in the bulk material and the dielectric coatings of the optical elements#footnote[
  In industrial applications, scratches and other surface defects can also cause significant absorption @laskin_selection_2021.
].
The absorption of a laser beam induces a temperature gradient $Delta T$ in the optical element.
The dominant effects from the temperature gradient are a geometrical expansion of the material and a change of the refractive index.
The expansion is proportional to the coefficient $alpha$, and the refractive index changes according to $phy.dv(n, T)$.
In total, we can quantify the optical effects of the temperature gradient $Delta T$ with the coefficient

$
  G = alpha (n_0 - 1) + phy.dv(n, T)
$ <eq:super-thermal-G>

where $n_0$ is the refractive index of the optical material @laskin_selection_2022.
The _coefficient of thermal expansion_ (CTE) $alpha$ is positive for most optical materials#footnote[
  Corning Ultra-Low Expansion (ULE#super[®]) Glass @corning_ultra-low_2016 and SCHOTT ZERODUR#super[®] @schott_zerodur_2024 are examples for glasses with a near-zero thermal expansion $alpha = #qty[0+-10e-9][1/K]$.
], while the coefficient $phy.dv(n, T)$ can either be positive or negative.
For all optical materials with $phy.dv(n, T) > 0$, the coefficient $G$ is also positive.
If the coefficient $phy.dv(n, T)$ is negative, the value of $G$ can range from weakly positive to weakly negative.
Certain materials show an athermal behavior $(G approx 0)$ where the two contributions to the thermal lensing in @eq:super-thermal-G compensate each other.
If $G$ is negative, the optical material can be used to compensate the thermal lensing of other components in composite optics @rall_simulation_2022.

The shape of the temperature gradient $Delta T$ is not equal to the intensity profile of the laser beam.
While the heating is proportional to the optical intensity, the temperature gradient $Delta T$ distributes in the material based on the thermal conductivity $k_T$.
The thermal lensing is therefore dynamic until a steady state is reached between the heating by the laser beam, the thermal conduction in the material and the dissipation of the heat from the surfaces.
This matches our observation of the thermal lensing, where the lattice depth was changing rapidly in the first second, and significantly slower afterwards (see @fig:super-stability-x1064[]).
For a qualitative statement on the suitability of different optical materials, we can use the thermo-optical ratio

$
  rho = G slash k_T = (alpha (n_0 - 1) + phy.dv(n, T)) slash k_T
$ <eq:super-thermal-rho>

that takes the thermal conductivity $k_T$ into account as a mechanism to reduce the strength of the thermal lensing @laskin_selection_2022.
If the thermal conductivity is high, it prevents a large temperature gradient $Delta T$ from building up in the optical elements.
Nevertheless, we are not able to easily derive the actual shape of the thermal lens from the intensity profile of the laser beam.
This would require a quantitative simulation of an elaborate heat model of the optical elements @rall_simulation_2022.
We only conclude that an optical element with a positive (negative) coefficient $G$ forms a convex (concave) thermal lens in the center of the temperature gradient $Delta T$.
The outer region of the temperature gradient has the opposite curvature, which results in a spherical aberration @laskin_selection_2021.
For the lattice beams, we are mainly interested in the focal shift in the center of the thermal lens, while the spherical aberrations are only a secondary effect.
Since we are operating the lattice beams far away from the diffraction limit, small aberrations are negligible.

#floating-figure(
  {
    show table: set text(10pt)
    show table: set align(center)
    table-optical-properties
  },
  caption: [
    Properties of the optical materials in the experimental setup.
    The thermo-optical coefficient $rho$ and the absorption coefficient $a$ quantify the effective strength of the thermal lensing.
    Each coefficient has separate values for the wavelengths $lambda = #qty[1064][nm]$ (upper value) and $lambda = #qty[532][nm]$ (lower value).

    #notes[
      - Add all references to data sheets etc. here...
      - Add crystalline quartz (for waveplates)
      - Highlight the rows to make it easier to see the different wavelengths?
    ]
  ],
  label: <tab:super-thermal-materials>,
)

In @tab:super-thermal-materials, the relevant properties of all optical materials related to the #x1064\-lattice setup and the #x532\-lattice setup are compiled.
The most common materials used for readily available optical elements are #NBK7 and UV-grade fused silica (#UVFS).
According to the thermo-optical ratio @eq:super-thermal-rho[], they should experience a similar thermal-lensing strength.
However, this does not take the initial heating due to the absorption of the laser beams into account.
At the wavelengths #qty[532][nm] and #qty[1064][nm], the typical absorption in #UVFS is significantly lower than the absorption in #NBK7.
If the absorption in the bulk material is the only heating source, #UVFS is therefore the ideal choice for most optical elements such as singlet lenses, windows and polarizing beam splitters (PBS).

Composite lenses such as achromatic doublets always use two materials with different dispersive properties to compensate chromatic aberrations @hecht_optics_2016.
The dispersion is quantified by the Abbe number $V$, where a small value corresponds to a strong dispersion and vice-versa.
In an achromatic doublet, one lens is made from a _crown_ glass which has a low refractive index and a weak dispersion, while the other lens is made from _flint_ glass with a high refractive index and a strong dispersion.
Both #NBK7 and #UVFS are suitable crown glasses, although the former is more commonly used in achromatic doublets.
Another typical crown glass that is also suitable for high-power applications is calcium fluoride (#CAF2).
It has a very low absorption at #qty[532][nm] and #qty[1064][nm], and the thermo-optical ratio is slightly negative.
If the flint glass used for the other lens has a positive thermo-optical ratio, the achromatic doublet can be made athermal.
In general, there is a wide range of crown and flint glasses available to construct achromatic doublets, and we had to check the thermal-lensing properties of the glasses individually for each material (see @tab:super-thermal-materials).
This was essential for the replacement of the lens in the retro-propagating path.
Regardless of the glasses used in an achromatic doublet, the lenses should be air-spaced for high-power applications.
Cemented doublets can experience significant absorption in the material that is connecting the two lenses.

For polarization optics, the range of materials is limited compared to general optics such as lenses and windows.
Waveplates require a birefringent material where the optical axis of the crystal is perpendicular to the propagation direction of the beam.
In high-power applications, the most suitable material is crystalline quartz (#SiO2).
Regardless of the orientation of the optical axis, it exhibits a very low absorption and ideal thermal properties @laskin_selection_2022.
In the orientation that is required for waveplates, the thermo-optical ratio almost vanishes completely.
Analogous to achromatic doublets, compound waveplates are either air-spaced or optically contacted to avoid heating in the connecting material.
Optical isolators use a Faraday medium in a magnetic field to rotate the polarization of the laser beam between two polarizing beam-splitters.
The strength of the Faraday effect is characterized by the Verdet constant in units of #unit(per-mode: "fraction")[rad/(T m)].
The most commonly used material in optical isolators is terbium gallium garnet (#TGG).
It has a large Verdet constant and shows a low absorption at #qty[1064][nm] @stevens_promising_2016.
However, the absorption increases significantly towards shorter wavelengths @franta_wide_2025.
At #qty[532][nm], the absorption is more than $10 times$ larger than the absorption at #qty[1064][nm].
Despite the large absorption, it is the default material used in readily available optical isolators at #qty[532][nm].
Other than selecting an optical isolator with a minimal crystal length, we can not reduce the thermal lensing at #qty[532][nm].
There is ongoing research on suitable optical materials with significantly lower absorption @xygkis_absorption_2023.


=== Simulating the focal shift <ssec:super-thermal-simulation>

#notes[
  - Mention suppression of (thermal) lensing around the focus...?
  - Interpret the scaling $delta prop f^2$?
]

Disregarding any higher-order aberrations, we can use a thin spherical lens to model the thermal lensing.
Based on the observations in the experimental setup, we expect a thermal lens with the focal length $f_"thermal" = cal(O)(#qty[10][m])$.
For a collimated lattice beam, this only amounts to a tiny change of the wavefront curvature.
In order to see the focal shift at the position of the atoms, we need to focus the lattice beam with an additional lens of focal length $f$.
If we neglect the propagation between the thermal lens and the additional lens, the focal shift amounts to

$
  delta = -tpower f^2 + cal(O)(p^2)
$ <eq:super-thermal-simulation-simple>

where $tpower = 1 slash f_"thermal"$ is the optical power in units of #unit[1/m].
The negative sign corresponds to a focal shift towards the additional lens if the thermal lens is convex.

#floating-figure(
  image("figures/thermal-lensing-simulation.png"),
  caption: [
    Optical setup for the simulation of the thermally-induced focal shift.
    The beam is initially collimated with the radius $r = w_0$ and the angle $theta.alt = 0$.
    A thermal lens slightly focuses the beam before it is demagnified by the factor $tmag = f_1 slash f_2$ in the telescope.
    After the beam shaping in the telescope, the beam is focused onto the position of the atoms by the lens with the focal length $f$.
    The dashed lines indicate the propagating beam without the thermal lens.

    #notes[
      - Draw the rays without thermal lensing as dashed lines...
    ]
  ],
  label: <fig:super-thermal-simulation-setup>,
)

In @sec:super-thermal we concluded that the thermal lensing is amplified by the small beam diameters and the resulting high intensities.
If we could use larger beams in the optical elements that are relevant for the thermal lensing, the optical power of the thermal lens will be reduced.
To conserve the beam waist at the position of the atoms, we would then need a telescope that decreases the diameter of the collimated beams before they are focused onto the atoms by the lens with focal length $f$.
Therefore, we include a telescope in the simulation to see how the focal shift changes compared to @eq:super-thermal-simulation-simple.
The total optical setup for the simulation is shown in @fig:super-thermal-simulation-setup.
The telescope is composed of two lenses with the focal lengths $f_1$ and $f_2$ at the distance $L = f_1 + f_2$, resulting in the demagnification $tmag = f_1 slash f_2$.
Behind the telescope, the beam will propagate by the distance $d$ before it is focused onto the atoms.
We use geometrical light rays instead of Gaussian beams to simplify the simulation.
The effect of the divergence of the Gaussian beams on the focal shift is only a higher-order correction.
In the ray transfer matrix formalism, we can describe the collimated beam with the vector

$
  phy.vb(v)_0 = vec(w_0, 0)
$ <eq:super-thermal-simulation-v0>

where the radius $r$ corresponds to the waist $w_0$ of a Gaussian beam @saleh_fundamentals_2019.
With the matrix equation

$
  phy.vb(v)_1 =
  underbrace(mat(1, 0; -1 slash f, 1), "focusing") dot
  underbrace(mat(1, d; 0, 1), "propagation") dot
  underbrace(mat(-1 slash tmag, L; 0, -tmag), "telescope") dot
  underbrace(mat(1, 0; -tpower, 1), "thermal lens") dot
  phy.vb(v)_0
$ <eq:super-thermal-simulation-v1>

we can compute the vector after the propagation through the optical setup in @fig:super-thermal-simulation-setup.
The position of the focus depends on the radius $r_1$ and the angle $theta.alt_1$ of the vector $phy.vb(v)_1$.
Relative to the expected distance $f$ from the lens to the focus, we compute the focal shift

$
  delta = -r_1 / theta.alt_1 - f = - tpower tmag^2 f^2 + cal(O)(tpower^2)
$ <eq:super-thermal-simulation-delta>

that only differs by the factor $tmag^2$ from the simple case in @eq:super-thermal-simulation-simple.
In the leading order, the focal shift depends neither on the initial beam waist $w_0$ nor on the distance $d$.
With Gaussian beams, we would expect a small correction based on these two properties.
The reason for the quadratic scaling of $delta$ with the demagnification $tmag$ is hidden in the ray transfer matrix of the telescope in @eq:super-thermal-simulation-v1.
The radius is divided by the factor $tmag$ while the angle is multiplied by the factor $tmag$.
After the focusing lens, the reduced radius and the increased angle contribute equally to the focal shift $delta prop tmag^2$.
The quadratic scaling has a significant implication for the beam size in the thermal lens.
Even if we use a larger beam diameter to reduce the thermal lensing, the focal shift is not actually reduced since we need to use a telescope with the demagnification $tmag$ after the thermal lens to conserve the beam waist at the position of the atoms.
This assumes a linear scaling of the optical power $p$ of the thermal lens with the maximum intensity $I_0 prop w_0^(-2)$ in the center of the Gaussian beam.
Nevertheless, it can be beneficial to use a larger beam for most of the optical setup to reduce the divergence due to the Gaussian nature of the lattice beams.
