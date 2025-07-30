#import "/header.typ": *

== Evaluation <sec:mod-eval>

#notes[
  - Find a better section title...
  - Mention the resonance widths $sigma_R$ to compare them to the expected $Delta f$?
  - Where should I mention the transition $1 -> 4$?
]

With the evaluation procedure, we want to find the parameters that describe the local lattice depth $V(x, y)$ as a function of the position in the $x y$ plane.
We would like the evaluation to only require a single fit to a series of images shown in @fig:mod-intro-images with the corresponding modulation frequencies.
This will make the most of the in-situ lattice modulation spectroscopy as a calibration technique.
To minimize the number of fit parameters, we have to make several assumptions about the lattice depth $V(x, y)$.
While the resonances are two-dimensional signals in the atom images, the underlying lattice depth can be modeled by a one-dimensional function.
For the lattices in a standing-wave configuration, this assumption is based on the Rayleigh lengths of the optical lattices.
The x532 lattice has the shortest Rayleigh length of $z_R approx #qty[1.2][mm]$ along the $z$ axis.
With a typical diameter of up to #qty[100][μm], the atom cloud is two orders of magnitude smaller.
We can therefore use a constant lattice depth along the optical axis for the fit model of the in-plane lattices.

For the z532 lattice we also have to consider the projection of the lattice depth onto the $x y$ plane.
Due to its shallow-angle configuration, we expect the lattice depth to form an ellipse with an aspect ratio of $r_y slash r_x approx 4$, see #tr[ref figure] for the optical setup.
We are able to see this elliptical shape in the resonances when the lattice beams are not centered relative to the atom cloud.
In @ssec:mod-align-z532 we are even using this signal to optimize the alignment of the z532 lattice.
If the z532 lattice is centered, the resonances are always parallel and we cannot resolve the ellipticity anymore.
We are therefore also assuming that the z532-lattice depth only changes perpendicular to the projection of the optical axis onto the $x y$ plane.
The z532 lattice and the y1064 lattice can then be described by the same fit model.

The second assumption for the evaluation addresses the $z$ axis.
Since the atom images show the accumulated optical density of the vertical lattice planes, we would need to use the single-plane slicing introduced in @ssec:setup-sequence-detect to resolve the lattice depth as a function of the position $z$.
The required effort for such a measurement is however not practical for the calibration of the lattice depth.
We will therefore estimate whether the inhomogeneity $V(z)$ of the optical lattices is even relevant for the in-situ lattice modulation spectroscopy.
If we compare the beam waists of all lattices to the extent of the atom cloud along the $z$ axis, we find that the expected change of the lattice depth is only significant for the x532 lattice.
Due to the ellipticity of the horizontal dipole trap, the atom cloud typically has a vertical extent of #qty[10][μm].
With a waist of $w_0 approx #qty[45][μm]$, the x532-lattice depth decreases by #qty[2.5][%] in the outermost vertical layers.
For the resonance signal, the weight of those layers is however smaller than the weight of the central layers due to a lower occupation.
This will reduce the systematic error of the mean lattice depth to less than #qty[1][%].
If we only want to determine the lattice depth in the central layers, we could apply a correction factor to the calibration measurement to cancel this systematic error.

For all other optical lattices, the systematic error due to the change of $v(z)$ is less than #qty[0.1][%].
We will therefore neglect the inhomogeneity along the $z$ axis when the lattice beams are well aligned.
During the alignment itself, we can actually use the inhomogeneity along the $z$ axis to get information about the vertical position of the lattice beams.
In @ssec:mod-align-x1064 this procedure is explained in detail using the example of the x1064-lattice alignment.


=== Development of the fit model <ssec:mod-eval-model>

Based on the aforementioned assumptions to simplify the fit model, the lattice depth $V(x, y)$ will only require four parameters.
The factor $fita0$ will quantify the correction of the measured lattice depth relative to the set value $V$.
We are using a one-dimensional Gaussian function with the beam waist $w_0$ at the position $y_0$ to model the lattice depth perpendicular to the optical axis.
The fourth parameter is the angle $theta.alt$ that allows a rotation of the optical axis in the $x y$ plane.
We expect an angle of $theta.alt approx #num[5]degree$ for the x1064 lattice relative to the $x$ axis based on the images in @fig:mod-intro-images.
For the y1064 lattice and the z532 lattice, the expected angle is $theta.alt < #num[1]degree$ relative to the $y$ axis.
To generalize the fit model for all lattices in the experimental setup, we are introducing the radius $rho(x, y, x_0, y_0, theta.alt)$ that handles the different optical axes.
The resulting function for the lattice depth is then defined as

$
  V(x, y, V_0; fita0, x_0, y_0, theta.alt, w_0) = fita0 dot V_0 dot exp(-2 rho^2 / w_0^2) thin .
$ <eq:mod-eval-model-lattice-depth>

From the lattice depth and the band structure as shown in @fig:mod-intro-theory we can then compute the transition frequency $f_(1->3)(V)$ in #unit[kHz].
The first three parameters of @eq:mod-eval-model-lattice-depth[] are variables passed to the fit model, and the last five parameters will be optimized by the fit.
Only one of the parameters $x_0$ and $y_0$ is used at a time, depending on the optical axis of the lattice.
Since the waists $w_0$ of all lattices are larger than the atom cloud by a factor of $3 "to" 4$, we
could also use a parabola in place of the lattice depth @eq:mod-eval-model-lattice-depth[].

The resonances are parametrized by a Gaussian function centered at the modulation frequency $f_"mod"$.
The actual shape of the resonances is only a qualitative observable, we could use any symmetric distribution with an amplitude and a width.
If we use the transition frequency $f_(1->3)(V)$ as a function of the local lattice depth, we will directly get the resonances in position space from the following model function

$
  R(v, f_"mod"; a_R, sigma_R) = a_R dot exp(-(f_(1->3)(V) - f_"mod")^2 / (2 sigma_R^2))
$ <eq:mod-eval-model-resonance>

with the dimensionless amplitude $a_R$, the lattice depth $V$ @eq:mod-eval-model-lattice-depth[] and the width $sigma_R$.
The axes *e* to *h* in @fig:mod-eval-model show the resulting resonances for different modulation frequencies.
For constant steps of the modulation frequency, the resonance spacing increases and the resonances become wider towards the center.
This is a direct consequence of the local lattice depth as visualized by the overlap with the modulation frequency in *a* to *d*.

To finalize the fit model we need to take the underlying optical density $n_0(x, y)$ into account.
We decided to use a two-dimensional Gaussian function that can be moved and rotated in the $x y$ plane.
Just like the shape of the resonances, this is only an empirical model that does not affect the calibration of the actual lattice depth @eq:mod-eval-model-lattice-depth[].
Since the resonance function @eq:mod-eval-model-resonance[] is defined with a positive amplitude, we need to subtract it from the optical density $n_0(x, y)$.
The resulting fit model that we can directly use on the atom images is

$
  n(x, y) = n_0(x, y) dot (1 - R) thin .
$ <eq:mod-eval-model>

In @fig:mod-eval-model *i* to *l*, the total fit model is shown for several modulation frequencies.
With this fit model, we assume that the optical density $n_0(x, y)$ does not change significantly between the images in a measurement as shown in @fig:mod-intro-images.
During the typical measurement time of #num[10] to #qty[15][min], the atom number is sufficiently constant to support this assumption.

#floating-figure(
  image("figures/modulation_evaluation_fit_model.png"),
  caption: [
    Fit model for the in-situ lattice modulation spectroscopy.
    The lattice in the figure has a depth of $V_0 = #qty[60][Erec]$ and the lattice beams have a waist of #qty[140][μm].
    In *a* to *d*, the solid black lines show the transition frequency $f_(1->3)(V)$ computed from the local lattice depth $V(y)$, and the shaded areas show the modulation that is scanned from #qty[116.0][kHz] to #qty[122.0][kHz] in steps of #qty[2.0][kHz].
    The parameters of the Gaussian modulation function in frequency space are $a_R = #num[0.9]$ and $sigma_R = #qty[0.6][kHz]$
    In *e* to *h* to corresponding resonance functions $R(v, f_"mod")$ are plotted as a function of the position $y$.
    Depending on the overlap of the frequency $f_(1->3)(V)$ with the modulation frequency $f_"mod"$, the amplitude $a_R$ and the width in position space can change.
    The resonances get wider towards the center at $y = 0$, and their amplitude decreases if $f_"mod" > max(f_(1->3))$.
    In *i* to *l* the resonance functions are applied to the optical density $n_0(y)$ to show the signal that we will actually measure with the atoms.
    A modulation frequency near the center of the lattice will deplete a significant area of the atom cloud, whereas smaller frequencies will only create thin resonances.
    This behavior qualitatively matches the series of images in @fig:mod-intro-images.
  ],
  label: <fig:mod-eval-model>,
)

The alternative to including the optical density in the fit model would be to run a reference measurement that determines $n_0(x, y)$ independently.
Dividing $n(x, y)$ by $n_0(x, y)$ and subtracting $1$ would then directly return the data that is modeled by the resonance function @eq:mod-eval-model-resonance[].
This would shorten the runtime required for the evaluation, but in return the measurement time would be increased.
For a meaningful reference measurement we need to take #num[5] to #num[10] images before every lattice modulation measurement, which would almost double the total measurement time.
The result of the lattice depth @eq:mod-eval-model-lattice-depth[] would not actually be improved since the lattice-depth parameters $fita0$, $x_0$, $y_0$, $theta.alt$ and $w_0$ do not show any correlations with the fit parameters of $n_0(x, y)$.

Before passing the atom images and modulation frequencies to the fit model @eq:mod-eval-model[], we apply an elliptical mask to the atom images that discards the outer area where the mean optical density is zero.
This removes around $2 slash 3$ of the pixels from each image, thereby improving the runtime of the fits significantly.
The mask does not affect the parameters of the lattice depth since the resonances are not visible in the masked area.
In #subref(<fig:mod-eval-x1064-result>, "a") we can see that the fit result agrees with the positions of the normalized resonances.
We take the average of the two-dimensional data near the center $x = 0$ to allow a visualization as a function of the position $y$.
The measured lattice depth in the center is slightly larger than expected, resulting in a correction factor $fita0 > 1$.
At the modulation frequency $f_"mod" = #qty[122.0][kHz]$ we can still see a single resonance, as already discussed in @sec:mod-intro.
The comparison to the lattice depth now confirms that this resonance is indeed above the actual lattice depth.

#floating-figure(
  image("figures/modulation_x1064-result.png"),
  caption: [
    Resonances and fit parameters of the x1064-lattice calibration.
    The data in *a* shows the resonances computed from the atom images in @fig:mod-intro-images.
    Each image is divided by the envelope $n_0(x, y)$ from the fit model @eq:mod-eval-model[] to normalize the resonances.
    The images are averaged in the interval $#qty[-5][μm] < x < #qty[5][μm]$ to show the resonances as a function of the position $y$.
    The solid line is the result for the lattice depth @eq:mod-eval-model-lattice-depth[] averaged in the same interval.
    *b* to *e* show the corresponding fit parameters $w_0$, $fita0$, $y_0$ and $theta.alt$.
    The solid lines are the results of the combined fit to all images, and the markers show the results of the separate fits to each individual image.
  ],
  label: <fig:mod-eval-x1064-result>,
)


=== Estimation of the calibration uncertainty <ssec:mod-eval-error>

While the visual match of the normalized resonances and the result of the fit already looks good in @fig:mod-eval-x1064-result, we would like to quantify this in a second evaluation step.
We can not use the uncertainties of the fit parameters of the combined fit to assess the goodness of the fit model, since they are unreasonably small in most cases.
Even though the atom images are noisy, we cannot quantify a useful uncertainty for each pixel.
This would require averaging of the atom images before the fit, such as in #tr[cite EOS paper?].
For the lattice-depth calibration we would however like to use the full resolution of the resonances as a function of the position $(x, y)$.
We will therefore estimate the uncertainties by repeating the fit for each image individually.
This will also show whether there is a systematic error in the assumptions that we made in @sec:mod-intro about the required parameters of the lattice depth.
For the individual fits we can not optimize the correction factor $fita0$ and the waist $w_0$ at the same time.
We will therefore use the fixed value of $fita0$ from the combined fit to determine the waist $w_0$ with the individual fits and vice-versa.
The fit parameters $y_0$ and $theta.alt$ are always varied since the position and the orientation of the lattice depth $v(x, y)$ can be determined reliably from a single image, as long as resonances are visible.
We are therefore not considering the images with $f_"mod" >= #qty[122.0][kHz]$ for the error estimation.

The comparison of the combined fit result and the individual fit results is shown in @fig:mod-eval-x1064-result.
For all fit parameters, the individual results are scattered around the combined results.
If the lattice depth could not be modeled by a Gaussian function, either the waist $w_0$ or the correction factor $fita0$ would have changed systematically as a function of the modulation frequency.
We can therefore conclude that the fit model @eq:mod-eval-model[] is suitable to describe the x1064-lattice depth $v(x, y)$.
The waist $w_0$ varies by a few #unit[μm] across the scan of the modulation frequency.
This is reasonable amount given the size of the lattice beams compared to the size of the atom cloud.
We can only measure the resonances up to a radius of $rho approx #qty[20][μm]$ which is significantly smaller than the waist of $w_0 approx #qty[140][μm]$.
For the correction factor $fita0$ we can observe a variation $delta fita0 = cal(O)(#qty[0.1][%])$, which highlights the accuracty of the in-situ lattice modulation technique.
The variation of the position $y_0$ is on par with the expected variation of the atom-cloud position in the camera frame #tr[ref setup].
This is a general limitation for all measurements that rely on signals in position space.
The angle $theta.alt$ shows variations that are comparable to the uncertainties of the individual fits.
For all parameters in @fig:mod-eval-x1064-result, we compute the mean value and the standard deviation of the individual fits.
The resulting fit parameters are compiled in @tab:mod-eval-results.

#floating-figure(
  image("figures/modulation_other-lattices.png"),
  caption: [
    Lattice-modulation resonances in the y1064 lattice and in the z532 lattice.
    The y1064 lattice in *a* is set to a depth of $Vy1064 = #qty[60][Erec]$, and the z532 lattice in *b* is set to a depth of $Vz532 = #qty[100][Erec]$.
    In the y1064 lattice we are using the transition $1 -> 3$ and in the z532 lattice we are using the transition $1 -> 5$ for the lattice modulation spectroscopy.
    The data shows the normalized resonances averaged in the interval $#qty[-15][μm] < y < #qty[15][μm]$.
    Due to the small angles $theta.alt$ relative to the camera frame, we can use a larger interval for the averaging compared to the x1064 lattice.
    The solid red lines show the results for the lattice depth @eq:mod-eval-model-lattice-depth[] averaged in the same interval.

    #notes[
      - Include colorbar between the two axes?
      - Add secondary y-axis for the lattice depth like in @fig:mod-eval-x1064-result?
    ]
  ],
  label: <fig:mod-eval-other-result>,
)

The in-situ lattice modulation spectroscopy in the y1064 lattice works largely the same as in the x1064 lattice.
We are now using a lattice depth of $Vy1064 = #qty[60][Erec]$ for the y1064 lattice, and a lattice depth of #qty[30][Erec] for the x1064 lattice to limit the coupling introduced in @sec:mod-coupled.
Since both lattices have the same period $a$, the resonance frequencies of the transition $1 -> 3$ will be similar.
We are again selecting a modulation amplitude of $delta V slash Vy1064 approx #tr[#qty[3][%]]$ to achieve a good contrast of the resonances.
The overlap between the resonances and the lattice depth $V(x, y)$ is shown in #subref(<fig:mod-eval-other-result>, "a"), and the calibration result computed from the individual fits is shown in @tab:mod-eval-results.
For the error estimation, we are only using the images with $f_"mod" <= #qty[118.5][kHz]$.
The last image with $f_"mod" = #qty[119.5][kHz]$ does not show a resonance anymore.

For the z532 lattice we are using a lattice depth of $Vz532 = #qty[100][Erec]$ since this is the default value in most sequences.
This requires us to use the transition $1 -> 5$ instead of the $1 -> 3$ to realize a decent resonance visibility.
The details behind this choice of the excited band are discussed in @sec:mod-loss.
With $#unit[Erec]slash h = #qty[1.101][kHz]$ in the z532 lattice, the maximum modulation frequency is $f_"mod" approx #qty[75][kHz]$ and the width of the excited band is $Delta f = Delta band_5 slash h approx #qty[0.3][kHz]$.
In terms of the relative frequency width $Delta f slash f_"mod" approx #num[4e-3]$, this is slightly worse than the corresponding parameters in the x1064 lattice and the y1064 lattice.
We are however still in the regime where $Delta f$ does not affect the width of the resonances.

Compared to the modulation in the x1064 lattice and the in the y1064 lattice, we need a stronger amplitude of $delta v slash v_0 approx #qty[10][%]$ in the z532 lattice to achieve a good resonance contrast.
While this does not qualify as a small perturbation anymore, we have confirmed that the strong modulation does not cause a systematic error of the calibration.
Furthermore, we are using a depth of #qty[20][Erec] for the x1064 lattice and the y1064 lattice to improve the resonance visibility.
This is not related to the coupling of the lattices but rather to the required loss of the atoms.
For the details, see the discussion of the loss mechanism in @sec:mod-loss.

#floating-figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header([Lattice], $w_0 slash#unit[μm]$, $fita0$, $x_0 "or" y_0 slash#unit[μm]$, $theta.alt slash degree$),

    [x1064], num[139.4(17)], num[1.0011(5)], $#hide[#sym.minus]#num[0.62(15)]$, num[-5.50(17)],
    [y1064], num[158(4)], num[0.9611(20)], num[-1.60(23)], num[-0.9(5)],
    [z532], num[118.0(28)], num[1.0011(11)], $#hide[#sym.minus]#num[1.6(5)]$, num[-0.7(6)],
  ),
  caption: [
    Calibration results of the monochromatic lattices.
    The overlap of the resonances with the fit results are shown in @fig:mod-eval-x1064-result for the x1064 lattice and in @fig:mod-eval-other-result for the y1064 lattice and the z532 lattice.
    The values and uncertainties are determined from the individual fits as described in @ssec:mod-eval-error.
  ],
  label: <tab:mod-eval-results>,
)

The calibration results in @tab:mod-eval-results show the strengths as well as the limitations of the in-situ lattice modulation spectroscopy.
The main parameter is the correction factor $fita0$ to use the correct lattice depths in the experimental sequences.
With a relative uncertainty $delta alpha = #num[5e-4]$, the precision of the result shows a significant improvement compared to the previous calibration technique #tr[cite PhD Luke].
From the time-of-flight images we could only determine the lattice depth with a relative uncertainty up to #num[0.03].
In practice, the calibration of the lattice depth is now only limited by drifts of the lattice beams over time.
If we need to know the correction factors $fita0$ with the precision as stated in @tab:mod-eval-results, we need to frequently run the calibration measurements introduced in this chapter.

The three spatial parameters $w_0$, $x_0 "or" y_0$ and $theta.alt$ are less significant for the calibration than the correction factor $fita0$, since the atoms only occupy the lattices close to the optical axes.
We will nevertheless compare the in-situ lattice modulation spectroscopy to the respective measurements that would otherwise be necessary to determine these parameters.
For the waist $w_0$, we have already discussed that the precision of the measurement is limited by the small extent of the atom cloud relative to the size of the lattice beams.
In return, the uncertainty of the waist of a few #unit[μm] is insignificant for the lattice depth $V(x, y)$ in the region where the atoms occupy the lattices.
The reference measurement for the waists makes use of dipole oscillations along the two principal axes #tr[cite PhD Luke and Nicola?].
The radial trap frequency of a red-detuned optical lattice roughly scales as #tr[$f prop sqrt(V_0 slash w_0)$].
Using this technique, we are able to achieve measurement uncertainties $delta w_0 < #qty[1][μm]$.
It is however not always possible to measure the isolated trap frequency of a single lattice.
In the case of the y1064 lattice and the z532 lattice, both contribute to the radial potential along the $x$ axis.
For a reliable determination of the waists we therefore need to measure the trap frequency $f_x$ as a function of the depths of the two lattices.
This measurement takes several hours to complete for each axis, and the precision of the resulting beam waists only shows a small improvement compared to the results in @tab:mod-eval-results.
The advantage of measuring the spatial parameters of all lattices is that we can then compute the radial potential for all lattice configurations.
If we only want to get the trap frequencies for one specific lattice configuration, the measurement takes around #qty[1][h] in total.
In the past, this was done regularly to calibrate the confinement in the lattice configuration to simulate the two-dimensional Hubbard model #tr[cite Luke - Nicola].

The uncertainties of the lattice positions $x_0 "or" y_0$ are limited by the beam pointing of the lattice beams.
From measurements of the position of the atom cloud we know that the lattice positions vary by up to #qty[1][μm] from sequence to sequence.
With the infrared lattices we can directly measure their positions with the atom cloud.
Such a measurement takes around #num[10] minutes and would achieve the same precision as the in-situ lattice modulation.
In the case of the z532 lattice this is however not possible.
Instead, we would need to infer the lattice position from the combined potential with the y1064 lattice or the dimple beam along the $x$ axis.
This is a similar limitation to the radial trap frequency $f_x$ where we can only measure the total radial potential.
The consequences on the alignment procedure of the z532-lattice beams are discussed in @ssec:mod-align-z532.

Besides the waist, the angle $theta.alt$ is another parameter of the lattice depth $v(x, y)$ where the reference measurement has a higher precision.
For fermionic atoms in optical lattices, we can use the density-density correlations when releasing the atoms in a time-of-flight measurement to see the lattice angles relative to the camera frame #tr[cite Eugenio].
The antibunching due to the Pauli blocking occurs at the edges of the Brillouin zones.
Therefore, we can directly see the lattice vectors $phy.vb(k)_(x 1064)$ and $phy.vb(k)_(y 1064)$ in the time-of-flight images.
The resulting uncertainties of this measurement are lower by one order of magnitude compared to the results in @tab:mod-eval-results.
To acquire a good antibunching signal, this measurement requires averaging for several hours.
Furthermore, this measurement does not work for the z532 lattice since the lattice vector $phy.vb(k)_(z 532)$ is perpendicular to the imaging plane.
The angle $theta.alt$ we are measuring in the case of the z532 lattice only shows the projection of the optical axes onto the $x y$ plane.

With the in-situ lattice modulation spectroscopy we have developed a calibration technique for the lattice depth $V(x, y)$ that combines several measurements at a fraction of the runtime.
We only need #num[10] minutes per lattice compared to an entire workday for all the reference measurements mentioned above.
Furthermore, the lattice modulation can be fully automated, from the measurement to the evaluation.
It would therefore be possible to run the calibration every day to keep track of drifts and other possible changes to the lattices.
This would significantly improve the debugging workflow, which is often hindered by the lack of recent calibrations.
As of the writing of this thesis, the automation is still limited by the available modulation hardware.
We are currently using a single arbitrary-waveform generator#footnote[Keysight 33622A Waveform Generator] for the modulation of all lattices.
If we had separate devices for each lattice or a single device with a sufficient number of channels, we could target the different lattices with a control variable in the experimental sequence.
The automated evaluation of the measurements is already possible.
We can detect the last sequence of the modulation frequency scan for each lattice to identify the images.
These images are then processed as introduced in @ssec:setup-sequence-detect before running the evaluation introduced in @ssec:mod-eval-model
The fit model is robust as long as the beam waist $w_0$ does not change significantly.
If this would be the case, manual intervention is required anyway and it would be sufficient if the automated evaluation issues a warning about the unsuccessful fit.
Besides the lattice-depth calibration, the in-situ lattice modulation spectroscopy can also significantly improve the alignment of the lattice beams.
With a single pair of resonances, we can directly see the position of the optical lattice and we can see relative changes of the lattice depth when moving the lattice beams.
This is discussed in detail in @sec:mod-align for the x1064 lattice and the z532 lattice.
