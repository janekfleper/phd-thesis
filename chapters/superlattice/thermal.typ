#import "/header.typ": *
#import "figures/figures.typ": table-optical-properties, thermal-lensing-simulation

== Introduction to thermal lensing <sec:super-thermal>

The absorption of light in lenses, windows, and other optical elements induces a thermal gradient $Delta T$ that changes the geometrical and optical properties of the material.
Thermal lensing refers to the wavefront distortion of a laser beam that passes through the temperature gradient @laskin_selection_2021.
Industrial lasers used for welding or cutting can achieve average powers of several #unit[kW], where elaborate techniques are required to compensate the effects of the thermal lensing @reitemeyer_online_2010 @rall_simulation_2022.
In the context of the experimental setup in this thesis, we only use intermediate optical powers up to a few watts.
Nevertheless, we observe significant thermal lensing in the optical setups of the in-plane superlattice.
Since the strength of the thermal lensing depends on the beam intensity, the shape of the lattice beams in the optical elements is also relevant besides the beam power.

For the optical setups of the lattices in this thesis, we only consider thermal lensing due to the absorption of light in the bulk material and the dielectric coatings of the optical elements#footnote[
  In industrial applications, scratches and other surface defects can also cause significant absorption @laskin_selection_2021.
].
The absorption of a laser beam induces a temperature gradient $Delta T$ in the optical element.
The dominant effects from the temperature gradient are a geometrical expansion of the material and a change of the refractive index.
In total, we quantify the optical effects due to the temperature gradient $Delta T$ with the coefficient

$
  G = alpha (n_0 - 1) + phy.dv(n, T) eqc
$ <eq:super-thermal-G>

where $n_0$ is the refractive index of the optical material @laskin_selection_2022.
The _coefficient of thermal expansion_ (CTE) $alpha$ is positive for most optical materials#footnote[
  Corning Ultra-Low Expansion (ULE#super[®]) Glass @corning_ultra-low_2016 and SCHOTT ZERODUR#super[®] @schott_zerodur_2024 are examples for glasses with a near-zero thermal expansion $alpha = #pqty[0+-10e-9][1/K]$.
], while the coefficient $phy.dv(n, T, style: "horizontal")$ can either be positive or negative.
// For all optical materials with $phy.dv(n, T) > 0$, the coefficient $G$ is also positive.
If the coefficient $phy.dv(n, T, style: "horizontal")$ is negative, $G$ ranges from weakly positive to weakly negative.
Certain materials show an athermal behavior $(G approx 0)$ where the two contributions to the thermal lensing in @eq:super-thermal-G compensate each other.
In case $G$ is negative, the optical material can be used to compensate the thermal lensing in composite optics @rall_simulation_2022.

The shape of the temperature gradient $Delta T$ is not equal to the intensity profile of the laser beam.
While the heating is proportional to the intensity, the temperature gradient $Delta T$ spreads in the material according to the thermal conductivity $k_T$.
The thermal lensing is, therefore, dynamic until a steady state is reached between the heating by the laser beam, the thermal conduction in the material and the dissipation of the heat from the surfaces.
This matches our observation of a rapid decrease of the lattice depth $Vx1064(tau)$ in the first second, followed by a weak linear decrease (see @fig:super-stability-x1064).
We use the thermo-optical ratio

$
  rho = G slash k_T = (alpha (n_0 - 1) + phy.dv(n, T)) slash k_T
$ <eq:super-thermal-rho>

to take the thermal conductivity $k_T$ into account as a mechanism to reduce the strength of the thermal lensing @laskin_selection_2022.
If the thermal conductivity is high, it prevents a large temperature gradient $Delta T$ from building up in the optical element.
A derivation of the exact shape of the thermal lens from the intensity profile of the laser beam requires a simulation with an elaborate heat model of the optical elements @rall_simulation_2022.
Here, we only conclude that an optical element with a positive (negative) coefficient $G$ forms a convex (concave) thermal lens around the center of the temperature gradient $Delta T$.
Since we operate the lattice beams with a small numerical aperture, we neglect higher-order aberrations due to the profile of the temperature gradient @laskin_selection_2021.

#floating-figure(
  {
    show table: set text(10pt)
    show table: set align(center)
    table-optical-properties
  },
  caption: [
    Properties of the optical materials in the experimental setup.
    The thermo-optical coefficient $rho$ and the absorption coefficient#footnote[
      The letter $a$ denotes the absorption since $alpha$ is already used for the coefficient of thermal expansion (CTE).
    ] $a$ quantify the effective strength of the thermal lensing due to absorption in the bulk material.
    Based on these two coefficients, the most suitable materials to minimize thermal lensing are UV-grade fused silica (#UVFS), calcium fluoride (#CAF2), and crystalline quartz (#SiO2).
    The material properties of #UVFS for the coefficient $rho$ are taken from @malitson_interspecimen_1965 @corning_fused_2015.
    The absorption in #UVFS depends on the OH content in the specific variant of the optical material @humbach_analysis_1996 @nurnberg_bulk_2015.
    The material properties of #NBK7 and #NBALF4 are taken from @schott_tie-31_2018.
    The material properties of #CAF2 are taken from @daimon_high-accuracy_2002 @corning_optigrade_2024.
    The material properties of #SiO2 for the coefficient $rho$ are taken from @ghosh_dispersion-equation_1999 @toyoda_temperature_1983.
    Analogous to #UVFS, the absorption in #SiO2 depends on the purity of the material @vlasova_absorption_2024.
    We use the same upper limit for #qty[532][nm] and #qty[1064][nm] here due to the lack of available data in the literature.
    Only the perpendicular orientation of the crystal that is used for waveplates is shown here.
    The material properties of terbium gallium garnet (TGG) are taken from @franta_wide_2025 @stevens_promising_2016 @furuse_thermo-optic_2015.
  ],
  label: <tab:super-thermal-materials>,
)

In @tab:super-thermal-materials, the relevant properties of the materials in the optical setups of the #x1064 lattice and the #x532 lattice are compiled.
The most common materials used in readily available optical elements are #NBK7 and UV-grade fused silica (#UVFS).
According to the thermo-optical ratio @eq:super-thermal-rho[], they experience a similar thermal-lensing strength.
However, this does not take the initial heating due to the absorption of the laser beams into account.
At the wavelengths #qty[532][nm] and #qty[1064][nm], the absorption in #UVFS is significantly lower than in #NBK7.
Therefore, for most optical elements such as singlet lenses, windows, and polarizing beam splitters (PBS), #UVFS is the optimal choice to minimize the thermal lensing due to absorption in the bulk material.

Achromatic doublets are composite lenses made of two materials with different dispersive properties to compensate chromatic aberrations @hecht_optics_2016.
One lens is made from a crown glass which has a low refractive index and a weak dispersion, and the other lens is made from a flint glass with a high refractive index and a strong dispersion.
A common crown glass suitable for high-power applications is calcium fluoride (#CAF2).
It experiences a very low absorption at #qty[532][nm] and #qty[1064][nm] and the thermo-optical ratio is slightly negative.
In general, there is a wide range of crown and flint glasses available to construct achromatic doublets.
Regardless of the glasses used in an achromatic doublet, the lenses must be air-spaced for high-power applications.
Cemented doublets experience significant absorption in the material that is connecting the two lenses.

Waveplates are built using a birefringent material where the optical axis of the crystal is perpendicular to the propagation direction of the beam @hecht_optics_2016.
In the context of thermal lensing, the optimal material for waveplates is crystalline quartz (#SiO2).
Regardless of the orientation of the optical axis, it exhibits a very low absorption and ideal thermal properties @laskin_selection_2022.
In the orientation that is required for waveplates, the thermo-optical ratio vanishes almost completely.
Analogous to achromatic doublets, compound waveplates are either air-spaced or optically contacted to avoid absorption in the bonding material and consequent thermal lensing.

Optical isolators use a Faraday medium in a magnetic field to rotate the polarization of the laser beam between two polarizing beam splitters @saleh_fundamentals_2019.
The most common Faraday medium used in optical isolators is terbium gallium garnet (#TGG).
While it experiences a low absorption at #qty[1064][nm] @stevens_promising_2016, the absorption increases significantly towards shorter wavelengths @franta_wide_2025.
At #qty[532][nm], the absorption is more than $10 times$ higher compared to #qty[1064][nm].
Despite this high absorption, it is the default Faraday medium used in readily available optical isolators at #qty[532][nm].
Other than selecting an optical isolator with a minimal length, we cannot reduce the thermal lensing at #qty[532][nm].
The research on suitable Faraday media with lower absorption is ongoing @xygkis_absorption_2023.


=== Simulating the focal shift <ssec:super-thermal-simulation>

We simulate the thermal lensing in the optical setups of the #x1064 lattice and the #x532 lattice using a thin spherical lens with the focal length#footnote[
  Based on the focal length associated with the thermal lensing in the optical isolator of the #x532 lattice.
] $ftherm = cal(O)(#qty[10][m])$, followed by a lens with focal length $f$ to focus the lattice beams onto the atoms#footnote[
  To simplify the simulation, the other components in the optical setups do not experience any thermal lensing.
].
The wavefront curvature of the collimated lattice beams is slightly changed by the thermal lens, which results in the focal shift

$
  delta = -tpower f^2 + cal(O)(p^2)
$ <eq:super-thermal-simulation-simple>

at the position of the atoms.
The refractive power $tpower = 1 slash ftherm$ quantifies the strength of the thermal lens.
For the simulation, we use the simplification $tpower prop I_0 prop P slash w_0^2$, where $P$ is the beam power in watt and $w_0$ is the waist of the lattice beam at the position of the thermal lens.
Since the thermal lens is convex ($p > 0$), the focus is shifted towards the lens with focal length $f$.
In the experimental setup, the lens with focal length $f$ is shared between the #x1064 lattice, the #x532 lattice and the horizontal dipole trap (see @sec:setup-prepare-dipole).
Using a lens with a shorter focal length $f'$ to reduce the focal shift @eq:super-thermal-simulation-simple[] is, therefore, not an option.
Furthermore, the waists of the lattice beams at the position of the atoms have to be conserved.
A shorter focal length $f'$ requires smaller collimated lattice beams $w'_0 prop f'$ in the optical setup.
With $delta prop f^2$ and $p prop w_0^(-2)$, the focal shift @eq:super-thermal-simulation-simple[] is unaltered.
The best option to reduce the focal shift is an improvement of the properties of the optical element that causes the thermal lensing.

#floating-figure(
  thermal-lensing-simulation(),
  caption: [
    Optical setup for the simulation of the thermally-induced focal shift.
    The beam is initially collimated with the radius $r = w_0$ and the angle $theta.alt = 0$.
    The thermal lens slightly focuses the beam before it is demagnified by the factor $tmag = f_1 slash f_2$ in the telescope.
    After the propagation of the distance $d$, the beam is focused onto the position of the atoms by a lens with the focal length $f$.
    The dashed lines indicate the propagating beam without the thermal lens.

    // TODO: Add the radius $r$ and the angle $theta$ around the final lens $f$.
    // TODO: Make the "real" lenses look nicer.
  ],
  label: <fig:super-thermal-simulation-setup>,
)

We find the same result for the focal shift in an optical system with an additional telescope to handle the beam shaping.
The telescope is composed of two lenses with the focal lengths $f_1$ and $f_2$ at the distance $L = f_1 + f_2$, resulting in the demagnification $tmag = f_1 slash f_2$.
Behind the telescope, the beam propagates by the distance $d$ before it is focused onto the atoms.
The total optical setup to simulate the thermal lensing is shown in @fig:super-thermal-simulation-setup.
We use geometrical light rays instead of Gaussian beams to simplify the computation of the focal shift#footnote[
  The effect of the divergence of the Gaussian beams on the focal shift is only a higher-order correction.
].
In the ray transfer matrix formalism, we describe the collimated beam with the vector $phy.vb(v)_0 = (w_0, 0)$, where $r = w_0$ is the waist of the corresponding Gaussian beam @saleh_fundamentals_2019.
With the matrix equation

$
  phy.vb(v)_1 =
  underbrace(mat(1, 0; -1 slash f, 1), "focusing") dot
  underbrace(mat(1, d; 0, 1), "propagation") dot
  underbrace(mat(-1 slash tmag, L; 0, -tmag), "telescope") dot
  underbrace(mat(1, 0; -tpower, 1), "thermal lens") dot
  phy.vb(v)_0
$ <eq:super-thermal-simulation-v1>

we compute the vector after the propagation through the optical setup in @fig:super-thermal-simulation-setup.
The position of the focus depends on the radius $r_1$ and the angle $theta.alt_1$ of the vector $phy.vb(v)_1$.
Relative to the expected distance $f$ from the lens to the focus, we find the focal shift

$
  delta = -r_1 / theta.alt_1 - f = - tpower tmag^2 f^2 + cal(O)(tpower^2)
$ <eq:super-thermal-simulation-delta>

that only differs by the factor $tmag^2$ from the simple case in @eq:super-thermal-simulation-simple.
The beam waist $w_0$ and the propagation distance $d$ only show up in the higher orders $cal(O)(tpower^2)$.
The quadratic scaling of $delta$ with the demagnification $tmag$ is a result of the ray transfer matrix of the telescope in @eq:super-thermal-simulation-v1.
The radius is divided by the factor $tmag$, while the angle is multiplied by $tmag$.
After the focusing lens, the reduced radius and the increased angle contribute equally to the focal shift $delta prop tmag^2$.
Analogous to the simple case in @eq:super-thermal-simulation-simple, we cannot reduce the focal shift due to the thermal lensing by changing the beam shaping in the optical setup.
Using an optical material with a smaller thermo-optical ratio $rho$ or a lower absorption $a$ is the recommended approach to reduce the thermal lensing.
If a better material is not available, the best option is to reduce the thickness of the optical element that causes the thermal lensing.
