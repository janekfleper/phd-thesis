#import "/header.typ": *
#import "figures/figures.typ": coupled-lattice
#import "figures/coupled_theory/figure.typ": figure as figure-theory
#import "figures/coupled_result/figure.typ": figure as figure-result

== Band structure of coupled lattices <sec:mod-coupled>

The #x1064\-lattice axis and the #y1064\-lattice axis are not perpendicular in the #xy-plane, as already mentioned in @ssec:setup-lattices-xy and throughout this chapter.
Instead, the angle of intersection of the lattice axes deviates by $fitang = #deg[-4.9(5)]$ from perpendicularity (see @tab:mod-eval-results).
The two lattice potentials are, therefore, not separable and we have to apply Bloch's theorem to the coupled potential in the #xy-plane to find the two-dimensional band structure and the corresponding Bloch waves @ashcroft_solid_1976.
In two dimensions, the Bravais lattice is spanned by the vectors #a1 and #a2 (see @fig:mod-coupled-setup).
The corresponding two-dimensional lattice potential is

$
  V(vr) = Vx1064 dot sin^2(x cos fitang + y sin fitang) + Vy1064 dot sin^2(fitang) eqc
$ <eq:mod-coupled-potential>

where the #x1064 lattice is rotated by the relative angle #fitang.
At $fitang = #deg[0]$, the separable potential $V(phy.vb(r)) = Vx1064(x) + Vy1064(y)$ is recovered.
According to Bloch's theorem, we use the ansatz

$
  bloch(vq, "")(vr) = uq2(vr) dot cexp(vq dot vr)
$ <eq:mod-coupled-bloch>

for the Bloch waves with the quasimomentum $vq = (q_x, q_y)$.
Analogous to the one-dimensional potential in @sec:theory-bloch, the functions $uq2(vr)$ have the same periodicity as the lattice potential $V(vr)$ in @eq:mod-coupled-potential.
Using the reciprocal lattice vectors #b1 and #b2, we express these functions as the Fourier series

$
  uq2(vr) = sum_(m1 m2) uqm2(m1, m2) dot cexp((m1 b1 + m2 b2) dot vr)
$ <eq:mod-coupled-uq>

with the indices $m1, m2 in ZZ$.
In dimensionless units where the lattice period is $a = pi$ and the energy is normalized by the recoil energy #unit[Erec], the resulting Schrödinger equation is

#[
  #set math.equation(number-align: bottom)
  $
    cband_cn (vq) uqm2(m1, m2) & = [(q_x + 2m1)^2 + (q_y + 2 / (cos fitang) (m2 + m1 sin fitang))^2] uqm2(m1, m2) \
                               & + sum_(m1' m2') V_(m1' m2') dot uqm2(m1 - m1'\,, m2 - m2') eqc
  $ <eq:mod-coupled-schroedinger>
]

where the sum over #m1 and #m2 as well as the complex exponential function are already eliminated (c.f. @sec:theory-bloch).
For the two-dimensional potential @eq:mod-coupled-potential[], we compute the coefficients $V_(m1' m2')$ of the Fourier series numerically for all indices $m1'$ and $m2'$ that we consider for the matrix form of the Schrödinger equation.
Compared to the one-dimensional potential in @eq:theory-bloch-potential-fourier-series, none of the coefficients vanish unless the relative angle is $fitang = #deg[0]$.
Instead of the index $m$, the rows and columns of the matrix are labeled with the index tuple $(m1, m2)$.
To solve the Schrödinger equation @eq:mod-coupled-schroedinger[], we diagonalize the corresponding matrix for each quasimomentum vector #vq in the first Brillouin zone.
The eigenvalues $cband_cn (vq)$ form the energy bands in the two-dimensional band structure, and we compute the two-dimensional Bloch waves $bloch(vq, eta)(vr)$ from the coefficients $uqm2(m1, m2)$.
We use #cn as the generalized index of the energy bands in the coupled band structure.

#floating-figure(
  {
    show figure: set text(10pt)
    show math.equation: set text(10pt)
    set math.equation(numbering: none)

    grid(
      columns: (1.5fr, 2fr),
      align: (right + horizon, left + horizon),
      coupled-lattice(),
      $
        a1 & = a vec(1, 0),                        && a2 &&&    = a vec(-sin fitang, cos fitang) \
        b1 & = (2 pi) / a vec(1, tan fitang), quad && b2 &&& = (2 pi) / (a cos fitang) vec(0, 1)
      $,
    )
  },
  caption: [
    Lattice configuration for the computation of the coupled band structure.
    The red lines indicate the potential minima of the respective lattices and the intersections of the lines mark the lattice sites.
    The resulting Bravais lattice is spanned by the lattice vectors #a1 and #a2.
    We select the coordinate system such that the #y1064 lattice is parallel to the #y-axis.
    Therefore, the relative angle #fitang is only applied to the #x1064 lattice.
    The reciprocal lattice vectors #b1 and #b2 are computed from the lattice vectors #a1, #a2 and $a3 = phy.vu(z)$ @ashcroft_solid_1976.
  ],
  label: <fig:mod-coupled-setup>,
)

To understand the composition of the coupled energy bands $cband_cn (vq)$, we compare them to energy bands $band_vn (vq)$ of the separable two-dimensional lattice potential.
Without the coupling, we compute the band structure in each lattice individually and use the band index $vn = (nx, ny)$ to identify the two-dimensional energy bands.
Instead of a general comparison of the two configurations, we only consider the band transition $1 -> 3$ for the in-situ #lms.
If we modulate the #x1064 lattice, the lowest band has the index $vn = (1, 1)$ and the excited band has the index $vn = (3, 1)$.
For the lattice configuration $Vx1064 = Vy1064$, the bands with the indices $vn = (3, 1)$ and $vn = (1, 3)$ are degenerate at $vq = (0, 0)$, while the band with the index $vn = (2, 2)$ has a slightly larger energy.
In the coupled lattice potential, these three bands are mixed to yield the coupled energy bands $cband_cn (vq)$ shown in #subref(<fig:mod-coupled-theory>, "a").
The three avoided crossings of the bands $cband_cn (vq)$ are located at $Vx1064 approx #qty[50][Erec], #qty[60][Erec] "and" #qty[70][Erec]$ respectively.

#floating-figure(
  figure-theory(),
  caption: [
    Transitions in the coupled band structure.
    *a*, Available band transitions around the lattice configuration $Vx1064 = Vy1064 = #qty[60][Erec]$.
    All transition frequencies are computed relative to the lowest band $vn = (1, 1)$ or $cn = 1$.
    We disregard the width of the excited bands here and only look at the mean transition frequencies.
    In the one-dimensional potential, we use the transition to the excited band $vn = (3, 1)$ (solid black line) when modulating the #x1064 lattice.
    The other black lines show the transitions with a similar frequency to other excited bands.
    In the coupled band structure, the energy bands $cband_eta$ are a mixture of the uncoupled energy bands $band_vn$.
    The transparency of the coupled energy bands indicates the amplitude of the transition from the lowest band with $cn = 1$.
    *b* - *d*, Composition of the states corresponding to the coupled energy bands $cband_eta$.
    The colors and strokes follow the legend in *a*.

    // TODO: Anything to add about the composition details?
    // TODO: Only place a single yaxis-label for axes *b* to *d*?
  ],
  label: <fig:mod-coupled-theory>,
)

Since the excitation to a higher band is still based on the overlap of the Wannier functions due to the perturbation of the lattice potential (c.f. @sec:mod-intro), the optimal band transition corresponds to the index changes $Delta nx = 2$ and $Delta ny = 0$.
For the in-situ #lms, the transition from the lowest band with index $cn = 1$, therefore, relies on the contribution from the uncoupled band $vn = (3, 1)$.
In #subref(<fig:mod-coupled-theory>, "b-d") the composition of the coupled states corresponding to the energy bands $cband_2$, $cband_3$ and $cband_4$ is shown#footnote[
  Since we only consider the lowest band with $cn = 1$ and the excited bands in @fig:mod-coupled-theory, we use the indices $cn = 2, 3 "and "4$.
  In the complete spectrum, other bands exist between $cn = 1$ and $cn = 2$ that are not relevant here.
].
As the transparency of the band transitions in #subref(<fig:mod-coupled-theory>, "a") indicates, the accessibility of the coupled states changes with the avoided crossings.
For $Vy1064 < #qty[40][Erec]$, the coupled band with the index $cn = 2$ is the dominant one for the in-situ #lms.
At $Vy1064 > #qty[70][Erec]$, the coupled band with the index $cn = 4$ shows the strongest transition from the lowest band with the index $cn = 1$.
In the intermediate regime $#qty[40][Erec] <= Vy1064 <= #qty[70][Erec]$, all three coupled bands contribute with varying strengths.
We could, therefore, observe three transitions in a frequency interval smaller than #qty[15][kHz] with the in-situ #lms.
An unambiguous identification of the transitions would require a wide scan of the modulation frequency #fmod.
At $Vy1064 < #qty[40][Erec]$ and $Vy1064 > #qty[70][Erec]$ this is not an issue since only one of the coupled energy bands is easily accessible with the modulation of the #x1064 lattice.
Additionally, the transitions to the other coupled energy bands are detuned by at least #qty[10][kHz].

The main purpose of the investigation of the coupled band structure in this section is to find the optimal configuration for the in-situ #lms of the #x1064 lattice and the #y1064 lattice.
Due to the computational runtime of the coupled band structure, we are not able to use it for the data analysis according to @sec:mod-eval.
Instead, we use the one-dimensional band structure to compute the reference data for the transition frequency $fnm(1, 3)(V)$.
Depending on the lattice depth of the other infrared in-plane lattice, we apply a correction to take the coupled band structure into account.
@fig:mod-coupled-result shows the calibration factor #fita0 and the waist #fitw0 of the modulated #x1064 lattice as a function of the lattice depth #Vy1064.
We observe that the measured calibration factor #fita0 matches the predicted band transitions according to the coupled band structure.
For $Vy1064 < #qty[40][Erec]$ the calibration factor #fita0 deviates by less than #qty[1][%] from the reference value $fita0 = 1.0$.
In this regime, the measured calibration factors match the coupled theory, and the waist #fitw0 in #subref(<fig:mod-coupled-result>, "b") shows consistent results.
In the intermediate regime $#qty[40][Erec] < Vy1064 <= #qty[50][Erec]$ we observe a significant increase of the measured and theoretical calibration factors.
However, the measured calibration factors are slightly smaller than the prediction for the transition to the coupled band $cband_4$.
At the same time, the waist increases from #qty[145][μm] to #qty[170][μm] and its uncertainty increases as well.
This indicates the breakdown of the data analysis based on the one-dimensional theory close to the avoided crossings in #subref(<fig:mod-coupled-theory>, "a").
The fit model for the lattice depth $V(fitr)$ in @eq:mod-eval-model-lattice-depth assumes a constant calibration factor #fita0 across the atom cloud.
However, at $Vy1064 > #qty[40][Erec]$, the calibration factor #fita0 of the #x1064 lattice increases with the distance #fitr from the lattice axis since the ratio $Vy1064 slash Vx1064$ increases.
This is wrongly interpreted as an increase of the waist #fitw0 by the fit model.
Additionally, the equipotential lines become elliptical (see inset in #subref(<fig:mod-coupled-result>, "a") since the ratio $Vy1064 slash Vx1064$ also changes due to the inhomogeneity of the #y1064 lattice.
We could only overcome this limitation by directly using the coupled band structure to compute the transition frequency $fnm(1, 3)(Vx1064, Vy1064)$ for the data analysis.
At $Vy1064 > #qty[60][Erec]$, we can see the results of the transition to the coupled band $cband_2$.
The calibration factor $fita0$ matches the theory again, and the waists #fitw0 are mostly consistent with the reference value.
Since the data point at $Vy1064 = #qty[70][Erec]$ is closest to the avoided crossings, we attribute the slightly increased waist to the breakdown of the fit model again.

#floating-figure(
  figure-result(),
  caption: [
    Lattice-depth calibration in the coupled band structure.
    *a*, Calibration factor #fita0 determined with the one-dimensional band structure.
    The shaded areas show the calibration factor computed with the coupled band structure and the parameters $Vx1064 = #qty[58.9][Erec]$ and $fitang = #deg[-4.9(5)]$.
    Only the transitions to the coupled bands $cband_2$ and $cband_4$ are shown here.
    The intermediate band $cband_3$ is not targeted by the selected intervals for the modulation frequency #fmod.
    The calibration factors are rescaled to set the reference value $fita0 = 1.0$ at $Vy1064 = #qty[0][Erec]$.
    *b*, Waist #fitw0 determined with the one-dimensional band structure.
    The horizontal line and the shaded area show the last calibrated value at $Vy1064 = #qty[30][Erec]$.
    The error bars in *a* and *b* show the uncertainties according to the procedure introduced in @ssec:mod-eval-error.
    The insets in *a* show the mask $#qty[-10][μm] < x < #qty[10][μm]$ we apply for the data analysis of the atomic densities.

    // TODO: Synchronize colors with @fig:mod-eval-x1064-result and @fig:mod-coupled-theory.
    // TODO: Add label/legend for the coupled energy bands $cband_2$ and $cband_4$.
    // TODO: Find a better color for the mean waist in *b*?
    // TODO: Improve the figure position in the document!
  ],
  label: <fig:mod-coupled-result>,
)

Based on the result for the #x1064\-lattice calibration in @fig:mod-coupled-result, we conclude that the optical configuration for the in-situ #lms uses the lattice depths $Vx1064 = #qty[60][Erec]$ and $Vy1064 = #qty[30][Erec]$.
While the results for $Vy1064 > #qty[70][Erec]$ are also consistent, the resonance visibility is significantly worse than for $Vy1064 < #qty[40][Erec]$ according to the insets in #subref(<fig:mod-coupled-result>, "a").
Our interpretation is that the stronger confinement by the radial potential of the #y1064 lattice limits the atom-loss mechanism discussed in @sec:mod-loss.
The lower limit for the lattice depth #Vy1064 is given by the requirement for a frozen lattice potential (see @sec:mod-intro).
If the atoms could tunnel perpendicular to the modulated lattice, the depleted resonances would be occupied by the surrounding atoms again.
This reduces the resonance visibility and could result in a systematic error if the resonance positions are slightly shifted.
The lattice configuration $Vx1064 = #qty[60][Erec]$ and $Vy1064 = #qty[30][Erec]$ is, therefore, a good compromise for these two limitations of the in-situ #lms.
