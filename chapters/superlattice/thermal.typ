#import "/header.typ": *

== Thermal lensing <sec:super-thermal>

#notes[
  - Mention the y-lattice depth here anywhere?
  - Combine the characterization and rebuild chapters and just start with the theory + simulation subsections?
  - Explain the two contributions of thermal lensing right at the start?
  - Use "glasses" or "optical materials"
  - Where to mention scratches + contaminations as the leading issue in industrial applications?
  - Go into the detail with the inner/outer parts of the beam? This might be hard to understand without a sketch...
  - Use table and/or figure to illustrate the two thermal lensing terms?
  - Mention that we immediately saw that the thermal lensing scales with the optical power of the lattice beams!
  - Mention low damage threshold of cemented/glued composite optics?
  - Where to first introduce the abbreviation PBS?
]

In high-power laser applications, thermal lensing is a common issue #tr[cite Laskin (2021)].
The absorption of light in lenses, windows and other optical elements induces a thermal gradient in the material that will affect the geometrical and optical properties.
Lasers used for welding or cutting can routinely achieve average powers of several #unit[kW], where elaborate techniques are required to compensate the effects of the thermal lensing.
With an online focus shift measurement, a closed-loop control system can be implemented to compensate the thermal lensing #tr[cite Reitemeyer (2010)].
Another approach is to use specific materials to find a balance between thermal dispersion and surface deformation due to the absorption of light #tr[cite Rall (2022)].
In the context of the experimental setup in this thesis, we are #tr[only] dealing with intermediate optical powers up to a few watts.
However, the collimated lattice beams have relatively small diameters (see #tr[ref setup section/figure]) to realize the large beam waists at the atom position #tr[add a footnote or ref to a later figure/section?].
Therefore, the resulting intensity was sufficient to cause a thermal lensing that significantly affected the operation of the optical lattices.
Compared to the high-power applications, we could mostly eliminate the thermal lensing by choosing appropriate optical materials.
Retrospectively, the thermal lensing was only enabled by a questionable material selection in the first place, and could have been avoided without a lot of effort.

Here, we only consider thermal lensing due to the absorption of light in the bulk material and the dielectric coatings of optical elements#footnote[
  In industrial applications, the absorption due to contaminations, scratches and other surface defects are also significant #tr[cite Laskin (2021)].
].
The heating by the laser beams will induce a temperature gradient $Delta T$ in the optical element due to the inhomogeneity of the intensity distribution as defined in @eq:theory-dipole-gaussian.
The dominant effects from the temperature gradient are a geometrical expansion of the material and a change of the refractive index #tr[cite Laskin (2022)].
The expansion is proportional to the coefficient $alpha$, and the refractive index changes according to $phy.dv(n, T)$.
In total, we can quantify the optical effects of the temperature gradient $Delta T$ with the coefficient

$
  G = alpha (n_0 - 1) + phy.dv(n, T)
$ <eq:super-thermal-G>

where $n_0$ is the refractive index of the optical material #tr[cite Laskin (2022) again?].
The _coefficient of thermal expansion_ (CTE) $alpha$ is positive for most optical materials#footnote[
  Well-known glasses with a near-zero thermal expansion are Corning Ultra-Low Expansion (ULE#super[®]) Glass #tr[cite Corning (2016) ULE 7972 product sheet] and SCHOTT ZERODUR#super[®] #tr[cite what?]. #tr[Mention the upper limits for the CTEs?]
], while the coefficient $phy.dv(n, T)$ can either be positive or negative.
For all optical materials with $phy.dv(n, T) > 0$, the coefficient $G$ is also positive.
If the coefficient $phy.dv(n, T)$ is negative, the value of $G$ can range from weakly positive to weakly negative.
Certain materials show an athermal behavior $(G approx 0)$ where the two contributions to the thermal lensing in @eq:super-thermal-G compensate each other.
Glasses with this property have been designed specifically for high-power applications #tr[ref aTerhmoXX glass? or some more general one?].
If $G$ is negative, the optical material can be used to compensate the thermal lensing of other components with positive $G$ #tr[cite Rall (2022)].

The shape of the temperature gradient $Delta T$ is not equal to the intensity profile of the laser beam.
While the heating is proportional to the optical intensity, the temperature gradient $Delta T$ #tr[spreads] in the material according to the thermal conductivity $k_T$.
Therefore, the thermal lensing is dynamic until a steady state is reached between the heating by the laser beam, the thermal conduction in the material and the dissipation of the heat from the surfaces.
This matches our observation of the thermal lensing, where the lattice depth was changing rapidly in the first second, and significantly slower afterwards #tr[ref later figure...].
For a qualitative statement on the suitability of different optical materials, we can use the thermo-optical ratio

$
  rho = G slash k_T = (alpha (n_0 - 1) + phy.dv(n, T)) slash k_T
$ <eq:super-thermal-rho>

that takes the thermal conductivity $k_T$ into account as a mechanism to reduce the strength of the thermal lensing #tr[cite Laskin (2022)].
If the thermal conductivity is high, it prevents a large temperature gradient $Delta T$ from building up in the optical elements.
Nevertheless, we are not able to derive the actual shape of the thermal lens from the intensity profile of the laser beam.
This would require a quantitative analysis with the heat equation and elaborate heat model of the optical elements #tr[cite Rall (2022)].
We only conclude that an optical element with a positive (negative) coefficient $G$ results in a convex (concave) thermal lens in the center of the temperature gradient $Delta T$.
The outer part of the temperature gradient has the opposite curvature, which results in a spherical aberration #tr[cite Laskin (2021)].
In the context of the lattice beams, we are mainly interested in the focal shift due to the center of the thermal lens, while the spherical aberrations are only a secondary effect.
Since we are operating the lattice beams far away from the diffraction limit, small aberrations are generally not resolvable #tr[anyway].

#tr[Where to mention the average of #qty[532][nm] and #qty[1064][nm] for the thermo-optical ratio $rho$?]
The most common materials used for readily available optical elements are N-BK7#footnote[
  Manufactured by SCHOTT #tr[cite data sheet here?]
] and fused silica.
According to the thermo-optical ratio @eq:super-thermal-rho[], they experience a similar thermal-lensing strength with #tr[$rho_"N-BK7" = #qty[5.12e-6][W/m]$] and #tr[$rho_"FS" = #qty[6.89e-6][W/m]$] #tr[cite Laskin (2022)].
However, this does not take the initial heating due to the absorption of the laser beams into account.
At the wavelengths #qty[532][nm] and #qty[1064][nm], the typical absorption in fused silica#footnote[
  For example Heraeus Suprasil#super[®] or Corning High Purity Fused Silica (HPFS#super[®]) #tr[cite some data sheets?] with an absorption $< #qty[0.1][%]$ in #qty[10][mm] glass.
] is lower than the absorption in N-BK7 by more than one order of magnitude.
If the absorption in the bulk material is the only heating source, fused silica is therefore well-suited for most optical elements such as singlet lenses, windows and polarizing beam splitters (PBS).

Composite lenses such as achromatic doublets always use two materials with different dispersive properties to compensate chromatic aberrations #tr[cite Hecht].
The dispersion is quantified by the Abbe number $V$, where a small value corresponds to a strong dispersion and vice-versa.
In an achromatic doublet, one lens is made from a _crown_ glass which has a low refractive index and a weak dispersion, while the other lens is made from _flint_ glass with a high refractive index and a strong dispersion.
Both N-BK7 and fused silica are suitable crown glasses, although the former is more commonly used in achromatic doublets.
Another typical crown glass that is also suitable for high-power applications is calcium fluoride (#tr[$"CaF"_2$]).
It has a very low absorption $< #qty[0.1][%]$ in #qty[10][mm] glass at #qty[532][nm] and #qty[1064][nm], and the thermo-optical ratio is #tr[$rho_"CaF2" = #qty[-0.24e-6][W/m]$].
If the flint glass used for the other lens has a positive thermo-optical ratio, the doublet can be made athermal.
In general, there is a wide range of crown and flint glasses available to construct achromatic doublets, and we had to check the thermal-lensing properties of the glasses individually for each material.
This was essential for the replacement of the lens in the retro-propagating path #tr[ref what?].
Regardless of the glasses used in an achromatic doublet, the lenses should be air-spaced for high-power applications #tr[cite what?].
Cemented doublets can experience significant absorption in the material that is connecting the two lenses.

For polarization optics, the range of materials is limited compared to #tr[refractive] optics.
Waveplates require a birefringent crystal where the optical axis of the crystal is perpendicular to the propagation direction of the beam.
In high-power applications, the most suitable material is crystalline quartz (#tr[SiO2]).
Regardless of the orientation of the optical axis, it exhibits a very low absorption and ideal thermal properties #tr[cite Laskin (2022)].
In the orientation that is required for waveplates, the thermo-optical ratio almost vanishes completely at $rho_"SiO2" approx #qty[-0.04e-6][W/m]$.
Analogous to achromatic doublets, compound waveplates are either air-spaced#footnote[
  Thorlabs zero-order waveplates #tr[add link?]
] or optically contacted#footnote[
  Altechna high energy waveplates #tr[add link?]
] to avoid heating in the connecting material.
Polarizing beam-splitter cubes use a polarization-sensitive dielectric coating and can be made from a wide range of glasses.
In high-power applications, the typical material is UV-grade fused silica and the two parts are optically contacted #tr[cite Thorlabs + Altechna?].
Optical isolators use a Faraday medium in a magnetic field to rotate the polarization of the laser beam between two polarizing beam-splitters.
The strength of the Faraday effect is described by the Verdet constant in units of #unit[rad/((T m))].
The most commonly used material is Terbium gallium garnet (TGG) due to its large Verdet constant and its favorable optical properties.
At #qty[532][nm], the thermo-optical ratio is $rho_"TGG" approx #qty[3.3e-6][W/m]$, and the absorption is #qty[1.4][%/cm].
Other than selecting an optical isolator with a minimal crystal length, we can not reduce the strength of the thermal lensing.
#tr[Anything else to add regarding the optical isolator?]


=== Simulating the focal shift <ssec:super-thermal-simulation>

#notes[
  - Mention any of the equations in the theory chapter?
  - Which book should I cite here for ABCD + gaussian beams?
  - Any references to the thermal lensing theory chapter?
  - Mention suppression of (thermal) lensing around the focus...?
  - Interpret/Say anything about the scaling with $f^2$?
]

Disregarding any higher-order aberrations, we can use a thin spherical lens to model the thermal lensing.
Based on the observations in the experimental setup, we consider a thermal lens with the focal length $f_"thermal" = cal(O)(#qty[10][m])$.
For a collimated lattice beam, this only amounts to a tiny change of the wavefront curvature.
In order to see the focal shift at the position of the atoms, we need to focus the lattice beam with an additional lens of focal length $f$.
If we neglect the propagation between the thermal lens and the additional lens, the focal shift amounts to

$
  delta = -tpower f^2 + cal(O)(p^2)
$ <eq:super-thermal-simulation-simple>

where $tpower = 1 slash f_"thermal"$ is the optical power in units #unit[1/m] #tr[cite anything?].
The negative sign corresponds to a focal shift towards the lens if the optical power is positive.
This is expected since a convex thermal lens will apply a slight focusing to the laser beam.

#floating-figure(
  image("figures/thermal-lensing-simulation.png"),
  caption: [
    Optical setup for the simulation of the thermally-induced focal shift.
    The beam is initially collimated with the radius $r = w_0$ and the angle $theta.alt = 0$.
    A thermal lens slightly focuses the beam before it is demagnified by the factor $tmag = f_1 slash f_2$ in the telescope.
    Behind the telescope, the beam needs to have a specific #tr[waist/radius] to get the correct beam waist at the position of the atoms.

    #notes[
      - Also draw the corresponding gaussian beam in here?
      - Draw the rays without thermal lensing as dashed lines?
      - Anything to add to the caption?
    ]
  ],
  label: <fig:super-thermal-simulation-setup>,
)

In @sec:super-thermal we concluded that the thermal lensing is amplified by the small beam diameters and the resulting high intensities.
If we could use larger beams in the optical elements that are relevant for the thermal lensing, the optical power of the thermal lens will be reduced.
To conserve the beam waist at the position of the atoms, we would then need a telescope that decreases the diameter of the collimated beam just before the #tr[focusing] lens with focal length $f$.
Therefore, we include a telescope in the simulation to see how the focal shift changes compared to @eq:super-thermal-simulation-simple.
The telescope is composed of two lenses with the focal lengths $f_1$ and $f_2$ at the distance $L = f_1 + f_2$, resulting in the demagnification $tmag = f_1 slash f_2$.
Behind the telescope, the beam will propagate by a distance $d$ before it is focused onto the atoms.
The total optical setup for the simulation is shown in @fig:super-thermal-simulation-setup.
In the ray transfer matrix formalism, we can describe the collimated beam #tr[by/with] the vector

$
  phy.vb(v)_0 = vec(w_0, 0)
$ <eq:super-thermal-simulation-v0>

where the radius $r$ is equal to the beam waist $w_0$.
We use geometrical light rays instead of Gaussian beams to simplify the simulation.
Apart from the divergence of the Gaussian beams during the propagation in the optical setup, the resulting focal shift is #tr[equal/the same].
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
Relative to the expected distance $f$ from the lens to the focus, we can compute the focal shift

$
  delta = -r_1 / theta.alt_1 - f = - tpower tmag^2 f^2 + cal(O)(tpower^2)
$ <eq:super-thermal-simulation-delta>

that only differs by the factor $tmag^2$ from the simple case in @eq:super-thermal-simulation-simple.
In the leading order, the focal shift depends neither on the initial beam waist $w_0$ nor on the distance $d$.
With Gaussian beams, we would expect a small correction based on these two properties.
The reason for the quadratic scaling of $delta$ with the demagnification $tmag$ is hidden in the ray transfer matrix of the telescope in @eq:super-thermal-simulation-v1.
The radius is divided by the factor $tmag$ while the angle is multiplied by the factor $tmag$.
After the focusing lens, the reduced radius and the increased angle contribute equally to the focal shift $delta prop tmag^2$.
The quadratic scaling of $delta$ with the demagnification $tmag$ has a significant implication for the beam size in the thermal lens.
Even if we use a larger beam diameter to reduce the thermal lensing, the focal shift is not actually reduced since we need to use a telescope with the demagnification $tmag$ after the thermal lens to conserve the beam waist at the position of the atoms.
This assumes a linear scaling of the optical power $p$ of the thermal lens with the maximum intensity $I_0 prop w_0^(-2)$ in the center of the Gaussian beam.
Nevertheless, it can be beneficial to use a larger beam for most of the optical setup to reduce the divergence due to the Gaussian nature of the lattice beams.
