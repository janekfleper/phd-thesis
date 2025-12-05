#import "/header.typ": *
#import "figures/fit_model/figure.typ": figure as figure-fit-model
#import "figures/x1064_result/figure.typ": figure as figure-x1064-result
#import "figures/other_lattices/figure.typ": figure as figure-other-lattices

#pagebreak()

== Data analysis for the lattice-depth calibration <sec:mod-eval>

From the series of images in @fig:mod-intro-images, we want to determine the parameters of the lattice depth $V(x, y)$.
To minimize the number of fit parameters, we make two presumptions about the profile of the lattice depth.
We use a one-dimensional Gaussian function that is extruded along the lattice axis to model the lattice depth $V(x, y)$.
For the standing-wave lattices, the variation of the lattice depth along the lattice axis depends on the Rayleigh length.
Even the shortest Rayleigh length $z_R approx #qty[1.2][mm]$, corresponding to the waist $wx532^z approx #qty[50][μm]$, is larger by one order of magnitude compared to the typical diameter of the atom cloud at #qty[100][μm].
As a result, the equipotential lines appear to be straight and we only vary the lattice depth perpendicular to the lattice axis for the fit model.
For the horizontal axis of the #x532 lattice and both axes of the infrared in-plane lattices, the Rayleigh lengths are even larger.

In the case of the #z532 lattice, we have to consider the projection of the lattice beams onto the #xy-plane.
Due to the shallow-angle configuration, we expect the equipotential lines to have an elliptical shape with the aspect ratio of $1 : 4$ between the #x-axis and the #y-axis.
Around the center of the optical lattice in the #xy-plane the equipotential lines are nearly straight, and we also use the one-dimensional function to model the #z532\-lattice depth.
However, when the lattice beams are not centered on the atom cloud, we can observe the ellipticity of the equipotential lines#footnote[
  We use this signal to improve the alignment of the lattice beams (see @ssec:mod-align-z532).
].

The second presumption for the fit model addresses the #z-axis.
Due to the ellipticity of the horizontal dipole trap, the atom cloud typically has a vertical extent of #qty[10][μm].
Towards the outermost layers in the atom cloud, the lattice depth, therefore, decreases by less than #qty[0.1][%] for the #z532 lattice, the #x1064 lattice and the #y1064 lattice.
In the case of the #x532 lattice, the decrease amounts to approximately #qty[2.5][%] due to the smaller waist $wx532^z approx #qty[50][μm]$.
The measured #x532\-lattice depth shows the weighted average of the vertical lattice planes and is therefore approximately #qty[1][%] lower than the #x532\-lattice depth of the vertical lattice plane at $z = 0$.
For the data analysis, we do not take any variation of the lattice depth along the #z-axis into account and evaluate the weighted average of the lattice depth instead#footnote[
  If we need to measure the #x532\-lattice depth in a specific lattice plane, we would need to include the single-plane tomography introduced in @ssec:setup-sequence-detect in the sequence for the #lms.
].
Even for the #x532 lattice, the variation along the #z-axis is much smaller than the inhomogeneity in the #xy-plane.


=== Development of the fit model <ssec:mod-eval-model>

Based on the aforementioned presumptions to simplify the fit model, the lattice depth $V(x, y)$ only requires four parameters.
The calibration factor #fita0 quantifies the deviation of the measured lattice depth on the lattice axis from the setpoint #V0.
To model the lattice depth perpendicular to the lattice axis, we use a one-dimensional Gaussian function with the beam waist #fitw0 and, depending on the modulated lattice, the center position #fitx0 or #fity0.
The fourth parameter is the angle #fitang to rotate the lattice axis in the #xy-plane.
For the #x1064 lattice and the #x532 lattice, we expect an angle $fitang approx #deg[-5]$ relative to the #x-axis of the camera frame (see @ssec:setup-lattices-xy).
The expected angle for the #y1064 lattice and the #z532 lattice is $fitang < #deg[1]$ relative to the #y-axis of the camera frame.
To generalize the fit model, we use the radius #fitr to quantify the distance from the respective lattice axes.
The resulting function for the lattice depth is

$
  V(fitr) = fita0 dot V0 dot exp(-2 fitr^2 / fitw0^2)
$ <eq:mod-eval-model-lattice-depth>

based on the electric field of a Gaussian laser beam in @eq:theory-dipole-gaussian.
With the lattice depth $V(fitr)$ and the band structure in @fig:mod-intro-theory, we compute the local transition frequency $fnm(1, 3)(V)$ in #unit[kHz] (see #subref(<fig:mod-eval-model>, "a-d")).

#floating-figure(
  figure-fit-model(),
  caption: [
    Fit model for the data analysis of the in-situ resonances.
    *a* - *d*, Transition frequency $fnm(1, 3)(V)$ computed from the local lattice depth $V(y)$.
    The horizontal shaded areas show the modulation frequency that is scanned from #qty[116.0][kHz] (*a*) to #qty[122.0][kHz] (*d*) in steps of #qty[2.0][kHz].
    The setpoint of the lattice depth is $V0 = #qty[60][Erec]$ and the waist of the lattice beams is $w_0 = #qty[140][μm]$.
    *e* - *h*, Resonance function $R(fmod)$ corresponding to the modulation frequencies in *a* - *d*.
    The parameters of the resonance function are $a_R = 0.9$ and $sigma_R = #qty[0.6][kHz]$.
    Depending on the overlap of the frequency $fnm(1, 3)(V)$ with the modulation frequency #fmod, the shape of the resonances changes.
    The width of the resonances decreases towards the center at $y = 0$, while their amplitude decreases if $fmod > max(fnm(1, 3))$.
    *i* - *l*, Atomic density $n(y)$ with the resonance functions in *e* - *h*.
    A modulation frequency near the center of the lattice potential depletes a significant area of the atom cloud, whereas smaller frequencies only create thin resonances.
    // This behavior qualitatively matches the series of images in @fig:mod-intro-images.

    // TODO: Name y-label of the third row "Atomic density $n$"
  ],
  label: <fig:mod-eval-model>,
)

The resonances are parameterized by a Gaussian function#footnote[
  The shape of the resonances is not crucial, we could use another symmetric distribution here.
] centered at the modulation frequency #fmod.
With the transition frequency #fnm(1, 3) as a function of the local lattice depth $V(fitr)$, we directly obtain the resonances in position space from the following model function

$
  R(fitr) = fitaR dot exp(-(fnm(1, 3)(V) - fmod)^2 / (2 fitsR^2))
$ <eq:mod-eval-model-resonance>

with the dimensionless amplitude #fitaR and the width #fitsR.
The resulting resonances for different modulation frequencies are shown in #subref(<fig:mod-eval-model>, "e-h").
Starting at $y approx plus.minus #qty[30][μm]$, the resonance spacing increases and the resonances become wider towards the center for constant steps of the modulation frequency.
The same behavior is observed in the overlap of the modulation frequency and the transition frequency $fnm(1, 3)(V)$ in #subref(<fig:mod-eval-model>, "a-d").

To finalize the fit model, we need to take the underlying atomic density $n_0(x, y)$ into account.
We use a two-dimensional Gaussian function in the #xy-plane to qualitatively model the shape of the atom cloud#footnote[
  This is an empirical model that does not affect the calibration of the lattice depth @eq:mod-eval-model-lattice-depth[].
].
Since the resonance function @eq:mod-eval-model-resonance[] is defined with a positive amplitude, we subtract the resonances from the optical density $n_0(x, y)$.
The resulting function is

$
  n(x, y) = n_0(x, y) dot (1 - R) eqc
$ <eq:mod-eval-model>

where the resonance function is always applied relative to the local atomic density $n_0(x, y)$ (see #subref(<fig:mod-eval-model>, "i-l")).
With this fit model, we assume that the atomic density $n_0(x, y)$ and the lattice depth $V(x, y)$ do not change during the series of images in @fig:mod-intro-images.
Since the total measurement time for the calibration of one optical lattice is only #qty[10][min] to #qty[15][min], both conditions are typically met if the experimental setup is in a thermal equilibrium.

Prior to the fit, we apply an elliptical mask to the atomic densities to discard the outer area where the mean atomic density is zero.
The mask does not affect the parameters of the lattice depth $V(x, y)$ since the resonances are not visible outside of the atom cloud.
In #subref(<fig:mod-eval-x1064-result>, "a"), the fit result matches the positions of the normalized resonances down to the modulation frequency #qty[118.0][kHz].
The measured lattice depth in the center is slightly larger than #qty[60][Erec], resulting in a calibration factor $fita0 > 1$.

#floating-figure(
  figure-x1064-result(),
  caption: [
    Resonances and fit parameters of the x1064-lattice calibration.
    *a*, Mean atomic densities in the interval $#qty[-5][μm] < x < #qty[5][μm]$ normalized by the reference density $n_0(x, y)$.
    The solid line shows the fit result for the lattice depth @eq:mod-eval-model-lattice-depth[].
    *b* - *e*, Fit parameters #fitw0, #fita0, #fity0 and #fitang for the individual images and the combined fit (solid line).
    The error bars show the individual fit errors.
  ],
  label: <fig:mod-eval-x1064-result>,
)


=== Estimation of the calibration uncertainty <ssec:mod-eval-error>

The normalized resonances and the result of the fit show a visual match in @fig:mod-eval-x1064-result, and we want to quantify this match in a second evaluation step.
Additionally, the errors of the parameters from the combined fit with all images are too small for a reasonable estimation of the calibration uncertainty.
Therefore, we repeat the fit with the model @eq:mod-eval-model[] for each image individually.
For these individual fits, we cannot optimize the calibration factor #fita0 and the waist #fitw0 at the same time since they would be completely correlated.
Instead, we fix the value of #fita0 from the combined fit to determine the waist $w_0$ with the individual fits, and vice versa.
The fit parameters #fity0 and #fitang are always varied since the position and the rotation of the lattice depth $V(x, y)$ can be determined reliably from a single image.//, as long as resonances are visible.

The comparison of the combined and individual fit results is shown in #subref(<fig:mod-eval-x1064-result>, "b-e").
For all fit parameters, the individual results are scattered evenly around the combined results.
If the lattice depth could not be modeled by a Gaussian function, either the waist #fitw0 or the calibration factor #fita0 would have changed systematically as a function of the modulation frequency.
We therefore conclude that the fit model @eq:mod-eval-model-lattice-depth[] is suitable to describe the lattice depth $V(x, y)$.
The waist #fitw0 varies by a few #unit[μm] across the scan of the modulation frequency.
This parameter is mainly limited by the small radius of the atom cloud $fitr approx #qty[25][μm]$ compared to the #x1064\-lattice waist of $fitw0 approx #qty[140][μm]$.
For the calibration factor #fita0, we can observe a variation on the order of #num[e-3], which highlights the precision of the lattice calibration with the in-situ #lms.
The variation of the position #fity0 is slightly smaller than the standard deviation of #qty[0.5][μm] of the atom-cloud position in the camera frame.
This is a general limitation for all measurements that rely on signals in position space.
The angle #fitang shows variations that are comparable to the uncertainties of the individual fits.
For all parameters in #subref(<fig:mod-eval-x1064-result>, "b-e"), we compute the mean value and the standard deviation of the individual fits.
We only take the images with $fmod < #qty[122.0][kHz]$ into account for the computation since the last image does not show a resonance signal.
The resulting fit parameters are compiled in @tab:mod-eval-results.

#floating-figure(
  figure-other-lattices(),
  caption: [
    Calibration of the #y1064 lattice and the #z532 lattice.
    *a*, Resonances and fit result for the #y1064 lattice at $Vy1064 = #qty[60][Erec]$.
    *b*, Resonances and fit result for the #z532 lattice at $Vz532 = #qty[100][Erec]$.
    The atomic densities are normalized by the reference density $n_0(x, y)$ and the mean is computed in the interval $#qty[-15][μm] < y < #qty[15][μm]$.
    The solid lines show the result of the combined fit for each lattice.

    // TODO: Somehow add a colorbar?
    // TODO: Fix the pcolormesh plotting...
  ],
  label: <fig:mod-eval-other-result>,
)

For the calibration of the #y1064 lattice, the in-situ #lms works analogous to the #x1064 lattice.
We set the lattice depths $Vy1064 = #qty[60][Erec]$ and $Vx1064 = #qty[30][Erec]$, and apply the lattice modulation for $#qty[0.75][s]$ with the modulation amplitude $dV slash Vy1064 approx #tr[#qty[3][%]]$.
The visual overlap of the normalized resonances and the fit model @eq:mod-eval-model-lattice-depth[] is shown in #subref(<fig:mod-eval-other-result>, "a"), and the calibration result computed from the individual fits is listed in @tab:mod-eval-results.
To estimate the calibration uncertainty we only consider the images with $fmod <= #qty[118.5][kHz]$.

For the calibration of the #z532 lattice we use the lattice depth $Vz532 = #qty[100][Erec]$, which is the default value in the experimental sequence (compare @fig:setup-sequence).
To achieve a good resonance visibility, we use the band transition $1 -> 5$ instead of the band transition $1 -> 3$ (see @sec:mod-loss).
Furthermore, we set the #x1064 lattice and the #y1064 lattice to the depth #qty[20][Erec] to minimize the overall confinement.
With $#unit[Erec]slash h = #qty[1.1][kHz]$, the expected modulation frequency in the center of the #z532 lattice is $fmod approx #qty[75][kHz]$.
Compared to the #lms of the infrared in-plane lattices, we need a stronger amplitude $dV slash Vz532 approx #qty[10][%]$ in the #z532 lattice to achieve a good resonance visibility.
We verified that the strong modulation does not result in a systematic calibration error.
The evaluation with the fit model shows consistent results for smaller modulation amplitudes, but the resonances are not clearly visible by eye anymore.

The results in @tab:mod-eval-results show the strengths as well as the limitations of the lattice calibration with the in-situ #lms.
The main parameter is the calibration factor #fita0 that we use to apply the correct lattice depths in the experimental sequences.
With a relative uncertainty between #num[5e-4] and #num[2e-3], the precision of the lattice calibration is improved significantly compared to the estimated uncertainty of #num[0.03] with the time-of-flight detection technique @miller_ultracold_2016.
Additionally, the systematic error due to the inhomogeneity of the lattice depths is much smaller.
With the time-of-flight detection, the resonant modulation frequency shows the weighted average of the lattice depth.
In @fig:mod-eval-x1064-result, we can see that the #x1064\-lattice depth decreases by up to #qty[5][%] across the atom cloud.
For the #y1064 lattice and the #z532 lattice in @fig:mod-eval-other-result result, the lattice depths decrease even further due to the ellipticity of the atomic density $n_0(x, y)$.
The lattice calibration with the time-of-flight technique is, therefore, sensitive to the size of the atom cloud as well as the position of the atom cloud relative to the position of the optical lattices.
With the in-situ detection technique, we completely resolve the inhomogeneity in the #xy-plane.
The systematic error due to the inhomogeneity along the #z-axis is on par with the uncertainties of the calibration factor #fita0 for the lattices in @tab:mod-eval-results.

// #tr[
//   For now, the uncertainties of the calibration factors are only valid at the lattice depths #V0 that are used during the lattice modulation.
//   Other lattice depths can show small systematic deviations due to an error of the power calibration that connects the setpoint #V0 and the photodiode signal.
//   To investigate this, we would need to repeat the lattice calibration at different lattice depths #V0 within the requirements for the width of the upper band (see @sec:mod-intro) and the atom-loss mechanism (see @sec:mod-loss).
// ]

#floating-figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header([Lattice], $fitw0 slash#unit[μm]$, fita0, $(fitx0 "or" fity0) slash#unit[μm]$, $fitang slash degree$),

    x1064, num[139.4(17)], $#num[1.0011(5)]#hide[0]$, $#hide[#sym.minus]#num[0.62(15)]$, num[-5.50(17)],
    y1064, $#num[158(4)]#hide[.00]$, num[0.9611(20)], num[-1.60(23)], $#num[-0.9(5)]#hide[00]$,
    z532, num[118.0(28)], num[1.0011(11)], $#hide[#sym.minus]#num[1.6(5)]#hide[00]$, $#num[-0.7(6)]#hide[00]$,
  ),
  caption: [
    Calibration results of the #x1064 lattice, #y1064 lattice and #z532 lattice.
    The values and uncertainties are determined from the individual fits as described in @ssec:mod-eval-error.
    For all lattices, the measured waists #fitw0 match the expected values from @sec:setup-lattices.
    The calibration factor #fita0 of the #y1064 lattice indicates that the power calibration in the experimental sequence is off by a few percent.
    For the #x1064 lattice and the #z532 lattice, the calibration factor is close to $1$.
    The positions #fitx0 or #fity0 of the lattices are close to the center of the camera frame.
    The deviations are reasonable within the technical limitations of the lattice alignment (see @sec:mod-align).
  ],
  label: <tab:mod-eval-results>,
)

In addition to the calibration factor #fita0, the in-situ #lms also reveals the beam waist #fitw0, the lattice position #fitx0 or #fity0, and the angle #fitang in the #xy-plane.
While there are other measurement techniques available to determine these parameters individually, they require significant additional measurement time.
The reference measurement for the beam waists #fitw0 is based on the trap frequency perpendicular to the lattice axes.
If the retro-reflected beam of the #x1064 lattice is blocked, we induce dipole oscillations of the atom cloud to probe the radial potential along the #x-axis @miller_ultracold_2016.
The oscillation directly reveals the trap frequency $f_x$ of the total confinement from the #y1064 lattice and the #z532 lattice.
To determine the waists of the individual lattices we run a series of measurements where the lattice depths #Vy1064 and #Vz532 are varied, which would take several hours to complete for each axis.
However, in terms of the precision this technique is slightly better than the in-situ #lms.
With the trap frequencies, the lattice waists #fitw0 can be determined with uncertainties $< #qty[1][μm]$.

For the lattice positions #fitx0 or #fity0 the reference measurement is also based on the radial potential of the lattices.
If we only use one of the two infrared in-plane lattices, the position of the atom cloud perpendicular to the lattice axes shows the position #fitx0 or #fity0 since the potential minimum is located at the maximum of the intensity.
This measurement takes around #qty[10][min] for each axis and achieves the same precision as the in-situ #lms.
While the lattice depth $V$ is only proportional to the intensity of the interfering term in the optical lattice potential, the measured positions are equal as long as the lattice beams are perfectly aligned.
For the #z532 lattice we cannot use the radial potential to accurately determine the lattice position $(fitx0, fity0)$ since the optical potential is repulsive.
Instead, we needed to infer the lattice position from the combined potential with the #y1064 lattice or the dimple beam, resulting in a much lower accuracy compared to the infrared lattices.
This was also a significant limitation for the alignment of the #z532 lattice (see @ssec:mod-align-z532).

The angle #fitang of the #x1064 lattice and the #y1064 in the #xy-plane can be determined from density-density correlations when releasing the atoms from the lattices in a time-of-flight measurement.
At the edges of the Brillouin zones, Pauli blocking results in an antibunching signal in the time-of-flight images @cocchi_analogue_2016.
From the positions of the minima in the atomic density, we can infer the lattice vectors $phy.vb(k)_x1064$ and $phy.vb(k)_y1064$, as well as the magnification of the #z-axis imaging system.
To achieve a good signal-to-noise ratio, this measurement requires averaging for several hours.
Compared to the in-situ #lms, the uncertainties of the angles $fitang_x1064$ and $fitang_y1064$ are lower by one order of magnitude.

In conclusion, we developed a calibration technique for the lattice depth $V(x, y)$ based on the in-situ #lms that combines several measurements at a fraction of the runtime.
For each modulated lattice, only #qty[10][min] to #qty[15][min] of measurement time are necessary to determine the calibration factor #fita0, the beam waist #fitw0, the lattice position #fitx0 or #fity0 and the angle #fitang in the #xy-plane.
This technique has enormous potential for the automation of the experimental setup.
Thanks to the precision of the calibration factor #fita0, we can already detect tiny changes in the lattice depth $V(x, y)$.
In @sec:mod-align we use this high sensitivity to optimize the alignment of the lattice beams.
With motorized mirror mounts to move the lattice beams, the automation could also include the alignment procedure.
This would allow a daily optimization and calibration of the optical lattice potentials that is fully autonomous.
