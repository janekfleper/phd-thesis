#import "/header.typ": *
#import "figures/superlattice_phase/figure.typ": figure as figure-phase
#import "figures/superlattice_scaling/figure.typ": figure as figure-scaling
#import "figures/superlattice_result/figure.typ": figure as figure-result

== Modulating the superlattice potential <sec:mod-super>

For the #x532 lattice, the available optical power limits the lattice depth to $Vx532 = #qty[30][Erec]$.
As a consequence, the #x532 lattice is not suitable for a calibration with the in-situ #lms due to the width of the excited band $n' = 3$.
The mean transition frequency at a lattice depth of #qty[30][Erec] is $fnm(1, 3) approx #qty[322][kHz]$ and the corresponding bandwidth is $delta epsilon_3 slash h approx #qty[13][kHz]$.
The relative bandwidth $delta epsilon_3 slash (h dot fnm(1, 3)) approx #qty[4][%]$ is too wide for the data analysis introduced in @sec:mod-eval.
We would need to take the occupation of the lowest band and the density of states of both bands into account to evaluate the resonances in the atomic densities.
Instead, we use the superlattice potential for the calibration of the #x532\-lattice depth.
The principle of the in-situ #lms in the superlattice potential is equivalent to a monochromatic lattice potential.
We excite the atoms from the lowest band $n = 1$ to a narrow band $n'$ to probe the band structure.
Additionally, an atom-loss channel is required to make the resonances visible as discussed in @sec:mod-loss.
In the superlattice potential, we find a suitable configuration at the antisymmetric phase $phase = -pi slash 4$ and the lattice depths $Vx1064 = #qty[60][Erec]$ and $Vx532 = #qty[18][Erec]$ (see #subref(<fig:mod-super-phase>, "a")).
The excited band $n' = 4$ has the width $delta band_4 approx #qty[0.4][kHz]$ and the transition frequency is $fnm(1, 4) approx #qty[270][kHz]$.
This is on par with the properties of the band transition $1 -> 3$ in the infrared in-plane lattices at #qty[60][Erec].
Additionally, the Wannier functions $w_1 (x)$ and $w_4 (x)$ are localized on the same lattice site#footnote[
  This requirement is only relevant in the superlattice potential since the unit cell contains two lattice sites.
] and they have the same parity.
Regarding the atom-loss mechanism, the untrapped band $n'' = 9$ is available to heat the atoms out of the optical lattice potential.
The loss channel $1 -> 4 -> 9$ is resonant for a single modulation frequency over a wide range of lattice depths #Vx1064 and #Vx532.
A secondary modulation frequency is, therefore, not necessary for the in-situ #slms.

We use the antisymmetric configuration ($phase = -pi slash 4$) for calibrating the #x532\-lattice depth.
As indicated in #subref(<fig:mod-super-phase>, "b"), the band structure shows the least sensitivity around this phase.
Since we can control the superlattice phase #phase with an accuracy of a few #unit[mrad] (see @sec:phase-stability), the shot-to-shot fluctuations do not affect the calibration of the #x532\-lattice depth#footnote[
  The in-situ #slms could also be used for the calibration of the superlattice phase.
  In this case, measuring around the symmetric configuration ($phase = 0$) is most suitable to maximize the sensitivity of the band structure to the superlattice phase.
].
At the antisymmetric phase $phase = -pi slash 4$, the lower lattice site in the unit cell is effectively the sum of the two potentials (compare #subref(<fig:theory-super-potential-phase>, "c")).
A modulation of either lattice depth #Vx1064 or #Vx532 is suitable for driving the band transition $1 -> 4$.
However, modulating the #x532\-lattice depth is significantly more effective compared to the #x1064\-lattice depth due to the shorter lattice period.
We achieve a good resonance visibility with the modulation amplitude $dV slash Vx532 = #num[2.5e-3]$ and the modulation time $tmod = #qty[0.75][s]$.

#floating-figure(
  figure-phase(),
  caption: [
    Phase configuration for the in-situ #slms.
    *a*, Antisymmetric configuration of the superlattice potential (black) with the lattice depths $Vx1064 = #qty[60][Erec]$ and $Vx532 = #qty[18][Erec]$.
    The Wannier functions are computed directly from the Bloch waves of the bands $n = 1$ to $n = 4$, and the mean energy of the corresponding bands $epsilon_n (q)$ is used as the offset.
    *b*, Sensitivity of the band structure to the superlattice phase #phase.
    Around the antisymmetric configuration ($phase = -pi slash 4$), the band structure is the least sensitive to the superlattice phase.
  ],
  label: <fig:mod-super-phase>,
)

Besides the sensitivity to the superlattice phase #phase, we also consider the sensitivity of the band transition $1 -> 4$ to the lattice depth #Vx532.
Even though the lower lattice site is effectively the sum of the two lattices, the scaling of the transition frequency #fnm(1, 4) can show a different behavior.
According @fig:mod-super-scaling, the transition frequency is mainly sensitive to the #x532\-lattice depth around the reference configuration with $Vx1064 = #qty[60][Erec]$ and $Vx532 = #qty[18][Erec]$.
We use the result of the #x1064\-lattice calibration in @tab:mod-super-result as the reference data for the computation of the transition frequency $fnm(1, 4)(Vx1064, Vx532, phase)$.
The superlattice phase is set to $phase = -pi slash 4$, leaving only the parameters of the lattice depth $Vx532(x, y)$ and the resonance parameters #fitaR and #fitsR for the fit of the resonances according to the model in @eq:mod-eval-model-resonance.
The general procedure of the #x532\-lattice depth calibration works analogous to the in-situ #lms introduced in @sec:mod-intro and @sec:mod-eval.
We scan the modulation frequency #fmod across the atom cloud to find the resonances that show the equipotential lines of the superlattice potential.
For the data analysis, we model the lattice depth $Vx532(x, y)$ with @eq:mod-eval-model-lattice-depth.
Only the angle #fitang is shared with the lattice depth $Vx1064(x, y)$.
The other parameters of $Vx532(x, y)$ are independent of the #x1064\-lattice parameters.
In the first step of the data analysis, we run the combined fit with all atomic densities $n(x, y)$ and the corresponding modulation frequencies #fmod.
To estimate the errors of the calibration, we run the individual fits according to the procedure described in @ssec:mod-eval-error.


#floating-figure(
  figure-scaling(),
  caption: [
    Sensitivity of the in-situ #slms.
    The superlattice phase is set to the antisymmetric configuration $phase = -pi slash 4$, and the dashed vertical lines indicate the reference values $Vx532 = #qty[18][Erec]$ and $Vx1064 = #qty[60][Erec]$ for the respective lattice depths.
    Around the reference configuration, the transition frequency #fnm(1, 4) is sensitive to the #x532\-lattice depth (*a*), while it is constant as a function of the #x1064\-lattice depth (*b*).
    At the avoided crossings of the bands $3$ and $4$, the assignment of the Wannier functions $w_3 (x)$ and $w_4 (x)$ changes.
    The relevant transition becomes $1 -> 3$, and the sensitivity to the respective lattice depths is unchanged.
  ],
  label: <fig:mod-super-scaling>,
)

#subref(<fig:mod-super-result>, "a") shows the result of the calibration of the #x532\-lattice depth with the in-situ #slms.
The transition frequency #fnm(1, 4) computed from the band structure matches the resonances in the atomic density.
The corresponding lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ are shown in #subref(<fig:mod-super-result>, "b").
As already stated in @ssec:setup-lattices-xy, the #x1064\-lattice beams are slightly wider than the #x532\-lattice beams.
Furthermore, we observe a small positional shift $delta fity0$ between the two lattices potentials.
This is a fundamental limitation of the lattice alignment with the shared retro mirror (see @fig:super-setup).
The mirrors for the #forward beams cannot change the mean position of the lattice potentials.
With the retro mirror, we are only able to apply equal shifts to the position of the two lattices.
Therefore, we only adjust the #forward beam of the #x532 lattice after running the #x1064\-lattice alignment procedure introduced in @ssec:mod-align-x1064.
With the band transition $1 -> 4$ and a constant modulation frequency #fmod, we use the technique shown in @fig:mod-align-x1064-forward for the horizontal and vertical alignment of the #x532\-lattice beams.

#floating-figure(
  figure-result(),
  caption: [
    Calibration of the #x532\-lattice depth with the superlattice potential.
    *a*, Mean atomic densities in the interval $#qty[-5][μm] < x < #qty[5][μm]$ normalized by the reference density $n_0 (x, y)$.
    The solid line shows the fit result of the transition frequency #fnm(1, 4) computed from $Vx1064(x, y)$, $Vx532(x, y)$, and $phase slash pi = -#num[0.250(4)]$.
    *b*, Lattice depths $Vx1064(x, y)$ (red) and $Vx532(x, y)$ (green) averaged in the same interval as the data in *a*.
    The $y$-axes are scaled to correctly display the different waists.
  ],
  label: <fig:mod-super-result>,
)

The parameters of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ are compiled in @tab:mod-super-result.
While the uncertainties of the #x532\-lattice parameters are larger than the uncertainties of the #x1064\-lattice parameters, they are on par with the fit results of the #y1064 and #z532 lattice in @tab:mod-eval-results.
Compared to the time-of-flight technique @klemmer_ultracold_2020, the in-situ #slms is a significant upgrade for the #x532\-lattice calibration.

The precision of the calibration factor #fita0 is mainly limited by fluctuations of the lattice-beam positions.
Due to the small vertical waist $wx532^z approx #qty[50][μm]$, the #x532 lattice is significantly more sensitive than the other lattices.
Compared to the #x1064 lattice, we expect a tenfold increase of the shot-to-shot fluctuations of the calibration factor if we consider the lattice depths $Vx532(z)$ and $Vx1064(z)$.
As discussed at the beginning of @sec:mod-eval, the measured calibration factor #fita0 is approximately #qty[1][%] smaller compared to the central lattice plane if the #x532\-lattice beams overlap perfectly.
The single-plane tomography (see @ssec:setup-sequence-detect) would be required for an improvement of the lattice calibration.
Within the context of this thesis, we directly use the measured calibration factor #fita0 in @tab:mod-super-result since all measurements in the superlattice potential also take the weighted average of the vertical lattice planes.

For the position #fity0 we find the difference $delta fity0 approx #qty[3][μm]$ between the #x1064\-lattice potential and the #x532\-lattice potential.
This positional shift is most likely caused by the non-orthogonal transmission of the lattice beams through the glass cell and off-center transmission through the lenses surrounding the glass cell (see @fig:super-setup).
Due to the shared optical path, we could only compensate this shift with a refractive optical element in the retro path.
This would, however, introduce an additional source for fluctuations of the superlattice phase #phase due to the temperature $T$.
Since the shift $delta fity0$ is significantly smaller than the size of the atom cloud as well as the waists of the respective lattices we decided against a compensation of the positional shift.

Compared to the positions #fity0, the angles #fitang of the lattice wavefronts have to match perfectly to achieve a homogeneous superlattice phase $phase(x, y)$.
With the in-situ #slms, we can only determine the angle #fitang in the #xy-plane with an uncertainty of #deg[0.4].
In comparison, the relative angle $Delta fitang$ between the lattice wavefronts requires an accuracy better than #qty[10][μrad] to achieve a homogeneous superlattice phase $phase(x, y)$.
In @ssec:phase-measure-detect, we achieve this accuracy with a phase-sensitive measurement based on the time evolution of the atoms in the superlattice potential.
The in-situ #slms can, therefore, only be used for a coarse alignment of the angle #fitang.

#floating-figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header("Lattice", $fitw0 slash#unit[μm]$, fita0, $fity0 slash#unit[px]$, $fitang slash degree$),

    x1064, num[139.4(17)], num[1.0011(5)], num[-1.60(23)], num[-5.50(17)],
    x532,
    $#num[115(6)]#hide[1.4]$,
    $#num[1.029(3)]#hide[1]$,
    $#hide[#sym.minus]#num[1.5(5)]#hide[03]$,
    $#num[-5.2(4)]#hide[01]$,
  ),
  caption: [
    Calibration results of the #x1064 lattice and #x532 lattice.
    The #x1064\-lattice parameters are determined independently with the in-situ #lms (see @tab:mod-eval-results).
    The mean values and errors for the #x532\-lattice parameters are determined with the scheme introduced in @ssec:mod-eval-error.
    Compared to the #x1064\-lattice parameters, the uncertainties of the #x532\-lattice parameters are greater by up to one order of magnitude.
  ],
  label: <tab:mod-super-result>,
)

In conclusion, we are able to apply the in-situ #slms for calibrating the #x532\-lattice depth.
This is required due to the insufficient maximal lattice depth $Vx532 = #qty[30][Erec]$, where the width of the excited band $n' = 3$ prevents the data analysis of the resonances in the atomic densities.
Nevertheless, using the in-situ #slms for the calibration of the #x532\-lattice depth is a compromise.
Ideally, we want to calibrate the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ independently in the respective lattices.
Then, we can use the in-situ #slms to investigate the overlap of the two lattices as they form the superlattice potential.
One option to overcome the limitation of the measurement in the superlattice potential is to repeat the calibration in different superlattice configurations $(Vx1064, Vx532)$.
As shown in @fig:mod-super-scaling, the sensitivity of the band structure to the #x532\-lattice depth is consistent over a wide range of lattice parameters.
If the calibration factor #fita0 changes as a function of #Vx532 or #Vx1064, it would indicate a systematic error of the calibration measurement.
Only if the calibration factor #fita0 is constant, we can claim the absolute accuracy of the calibration measurement introduced in this section.
