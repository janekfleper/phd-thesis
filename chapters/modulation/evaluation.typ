#import "/header.typ": *

== Evaluation <sec:mod-eval>

#[
  #set text(red)
  - Mention that only x1064-lattice is shown in detail. Other monochromatic lattices are briefly shown at the end of this section.
  - Mention depth of focus regarding the outermost layers?
]

With the evaluation procedure we want to find the parameters that describe the lattice depth $v(x, y)$ as a function of the position in the $x y$ plane.
We would like the evaluation to only require a single fit to a series of images shown in @fig:mod-intro-images with the corresponding modulation frequencies.
This will make the most of the in-situ lattice modulation spectroscopy as a calibration technique.
To minimize the number of fit parameters, we make several assumptions about the lattice depth $v(x, y)$.
While the resonances are two-dimensional signals in the atom images, the underlying lattice depth can be modelled by a one-dimensional function.

For the lattices in a standing-wave configuration, this assumption is based on the Rayleigh lengths of the optical lattices that determine the change of the lattice depths on the optical axes.
The x532 lattice has the shortest Rayleigh length of $z_R approx #qty[1.2][mm]$ due to the waist $w_0 approx #qty[45][μm]$ along the $z$ axis.
With a typical diameter of up to #qty[100][μm], the atom cloud is two orders of magnitude smaller.
We can therefore use a constant lattice depth along the optical axis for the fit model of the in-plane lattices.

For the z532 lattice we also have to consider the projection of the lattice depth onto the $x y$ plane.
Due to its shallow-angle configuration, we expect the lattice depth to form an ellipse with an aspect ratio of $r_y slash r_x approx 4$, see #tr[ref figure] for the optical setup.
We are able to see this elliptical shape in the resonances when the lattice beams are not centered along the $y$ direction.
In @ssec:mod-align-z532 we are using this signal to optimize the alignment of the z532 lattice.
If the z532 lattice is properly aligned to the position $y = 0$, the resonances are always parallel and we cannot resolve the ellipticity anymore.
We are therefore also assuming that the z532-lattice depth only changes perpendicular to the projection of the optical axis onto the $x y$ plane.
We can then use the same fit model for the y1064 lattice and the z532 lattice.

The second assumption for the evaluation addresses the $z$ axis.
Since the atom images show the accumulated optical density of the vertical lattice planes, we would need to use the single-plane slicing introduced in @sec:setup-detect to resolve the lattice depth as a function of the position $z$.
The required effort for such a measurement is however not practical for a calibration measurement of the lattice depth #tr[really mention this?].
We will therefore estimate whether the inhomogeneity $v(z)$ of the optical lattices is even relevant for the in-situ lattice modulation spectroscopy.
If we compare the beam waists of all lattices to the extent of the atom cloud along the $z$ axis, we find that the expected change of the lattice depth is only significant for the x532 lattice.
Due to the ellipticity of the horizontal dipole trap, the atom cloud typically has a vertical extent up to #qty[10][μm].
With a waist of $w_0 approx #qty[45][μm]$, the x532-lattice depth is therefore decreased by #qty[2.5][%] in the outermost vertical layers.
For the resonance signal, the weight of those layers is however smaller than the weight of the central layers due to a lower #tr[atom density/occupation].
This will reduce the systematic error of the mean lattice depth to less than #qty[1][%].
If we only want to determine the lattice depth in the central layers, we could apply a correction factor to the calibration measurement to cancel this systematic error.

For all other optical lattices, the change of $v(z)$ is smaller by at least one order of magnitude.
We can therefore neglect the inhomogeneity along the $z$ axis when the lattice beams are well aligned.
During the alignment itself, we actually use the inhomogeneity along the $z$ axis to get information about the vertical position of the lattice beams.
In @ssec:mod-align-x1064 this procedure is explained in detail using the example of the x1064-lattice alignment.


=== Development of the fit model <ssec:mod-eval-fit>

Based on the aforementioned assumptions to simplify the fit model, the lattice depth $v(x, y)$ will only require four parameters.
The factor $fita0$ will quantify the correction of the measured lattice depth relative to the set value $v_0$.
We are using a one-dimensional Gaussian function with the position $y_0$ and the beam waist $w_0$ to model the lattice depth perpendicular to the optical axis.
The fourth parameter is the angle $theta.alt$ that allows a rotation of the optical axis in the $x y$ plane.
We expect an angle of $theta.alt approx #num[5]degree$ for the x1064 lattice relative to the $x$ axis based on the images in @fig:mod-intro-images.
For the y1064 lattice and the z532 lattice, the angle is $theta.alt < #num[1]degree$ relative to the $y$ axis.
The coordinate axis of the Gaussian function is also changed accordingly.
To generalize the fit model for all lattices in the experimental setup, we are introducing the radius $rho(x, y, x_0, y_0, theta.alt)$ that handles the different optical axes.
The resulting function for the lattice depth is then

$
  v(x, y, v_0; fita0, x_0, y_0, theta.alt, w_0) = fita0 dot v_0 dot exp(-2 rho^2 / w_0^2) thin .
$ <eq:mod-eval-model-lattice-depth>

From the lattice depth and the band structure as shown in @fig:mod-intro-theory we can then compute the transition frequency $f_(1->3)(v)$ in #unit[kHz].
The first three parameters are variables passed to the fit model, and the last five parameters will be optimized by the fit.
Only one of the parameters $x_0$ and $y_0$ is used at a time depending on the optical axis of the lattice.

The modulation is parametrized by a gaussian function centered at the modulation frequency $f_"mod"$.
The actual shape of the resonances is only a qualitative observable, we could therefore use any symmetric distribution with an amplitude and a width.
If we use the transition frequency $f_(1->3)(v)$ as a function of the local lattice depth, we will directly get the resonances in position space from the following model function

$
  R(v, f_"mod"; a_R, sigma_R) = a_R dot exp(-(f_(1->3)(v) - f_"mod")^2 / (2 sigma_R^2))
$ <eq:mod-eval-model-resonance>

with the dimensionless amplitude $a_R$, the lattice depth $v$ @eq:mod-eval-model-lattice-depth[] and the width $sigma_R$.
The axes *e* to *h* in @fig:mod-eval-model show the resulting resonances for different modulation frequencies.
For constant steps of the modulation frequency, the resonances #tr[move faster] and become wider towards the center.
This is a direct consequence of the local lattice depth as visualized by the overlap with the modulation frequency in *a* to *d*.

To finalize the fit model we need to take the #tr[(underlying)] optical density $n_0(x, y)$ into account.
We decided to use a two-dimensional Gaussian function that can be shifted and rotated in the $x y$ plane.
Just like the shape of the resonances, this is only an empirical model that does not affect the calibration of the actual lattice depth @eq:mod-eval-model-lattice-depth[].
Since the resonance function @eq:mod-eval-model-resonance[] is defined with a positive amplitude, we need to subtract it from the optical density $n_0(x, y)$.
The resulting fit model that we can directly use on the atom images is

$
  n(x, y) = n_0(x, y) dot (1 - R) thin .
$ <eq:mod-eval-model>

In @fig:mod-eval-model the total fit model is shown for several modulation frequencies in subfigures *i* to *l*.
With this fit model we assume that the optical density $n_0(x, y)$ does not change significantly between the images in a measurement as shown in @fig:mod-intro-images.
This requires a #tr[constant/stable] atom number in each sequence before the modulation starts.
During the measurement time of #num[10] to #qty[15][min], the typical atom number variation is sufficiently small.
#tr[ref anything in @ch:setup?]

#figure(
  image("figures/modulation_evaluation_fit_model.png"),
  caption: [
    Fit model for the in-situ lattice modulation spectroscopy.
    The lattice in the figure has a depth of $v_0 = #qty[60][Erec]$ and the lattice beams have a waist of #qty[140][μm].
    In *a* to *d*, the solid black lines show the transition frequency $f_(1->3)(y)$ computed from the local lattice depth $v(y)$, and the shaded areas show the modulation that is scanned from #qty[116.0][kHz] to #qty[122.0][kHz] in steps of #qty[2.0][kHz].
    The parameters of the gaussian modulation function in frequency space are $a_R = #num[0.9]$ and $sigma_R = #qty[0.6][kHz]$
    In *e* to *h* to corresponding resonance functions $R(v, f_"mod")$ are plotted as a function of the position $y$.
    Depending on the #tr[overlap/intersection] of the frequency $f_(1->3)(y)$ with the modulation frequency $f_"mod"$, the amplitude $a_R$ and the width in position space can change.
    The resonances get wider towards the center at $y = 0$, and their amplitude decreases if $f_"mod" > max(f_(1->3))$.
    In *i* to *l* the resonance functions are applied to the optical density $n_0(y)$ to show the signal that we will actually measure with the atoms.
    A modulation frequency near the center of the lattice will deplete a significant area of the atom cloud, whereas smaller frequencies will only create thin resonances.
    This behavior qualitatively matches the series of images in @fig:mod-intro-images.

    #show list: set text(red)
    - Add abc indices...
    - Use #unit[μm] on the x-axis...
    - Add a legend/label for $f_(1->3)$ and $n_0(y)$?
  ],
) <fig:mod-eval-model>

The alternative to including the optical density in the fit model would be to run a reference measurement that determines $n_0(x, y)$ independently.
Dividing $n(x, y)$ by $n_0(x, y)$ and subtracting $1$ would then directly return the data that is modelled by the resonance function @eq:mod-eval-model-resonance[].
This would shorten the runtime required for the evaluation, but in return the measurement time would be increased.
For a meaningful reference measurement we need to take #num[5] to #num[10] images before every lattice modulation measurement, which would roughly double the total measurement time.
The result of the lattice depth @eq:mod-eval-model-lattice-depth[] would not actually be improved since the lattice-depth parameters $fita0$, $x_0$, $y_0$, $theta.alt$ and $w_0$ do not show any correlations with the fit parameters of $n_0(x, y)$.

Before passing the atom images and modulation frequencies to the fit model @eq:mod-eval-model[], we apply an elliptical mask to the atom images that removes the outer area where the mean optical density is zero.
This removes around $2 slash 3$ of the pixels from each image, thereby improving the runtime of the fits significantly.
The mask does not affect the lattice-depth parameters since the resonances would not be visible anyway in the masked area.
In #subref(<fig:mod-eval-x1064-result>, "a") we can see that the fit result agrees with the positions of the normalized resonances.
We take the average of the two-dimensional data near the center $x = 0$ to allow a visualization as a function of the position $y$.
The measured lattice depth in the center is slightly larger than expected, resulting in a correction factor $fita0 > 1$.
At the modulation frequency $f_"mod" = #qty[122.0][kHz]$ we #tr[can/could] still see a single resonance, as already discussed in @sec:mod-intro.
The comparison to the lattice depth now confirms that this resonance is indeed above the actual lattice depth.

#figure(
  image("figures/modulation_x1064-result.png"),
  caption: [
    Calibration result of the x1064-lattice depth.
    The data in *a* shows the resonances computed from the atom images in @fig:mod-intro-images.
    Each image is divided by the envelope $n_0(x, y)$ from the fit model @eq:mod-eval-model[] to normalize the resonances.
    We average the images over the interval $#qty[-5][μm] < x < #qty[5][μm]$ to only show the resonances as a function of the position $y$.
    The solid red line is the result for the lattice depth @eq:mod-eval-model-lattice-depth[] averaged in the same interval.
    *b* to *e* show the corresponding fit parameters $w_0$, $fita0$, $y_0$ and $theta.alt$.
    The solid lines are the results of the combined fit to all images, and the markers show the results of the separate fits to each individual image.

    #show list: set text(red)
    - Show the lattice depth as a secondary x-axis in *a*?
    - Really use different colors for the individual parameters?
  ],
) <fig:mod-eval-x1064-result>


=== Error estimation <ssec:mod-eval-error>

While the visual match of the normalized resonances and the result of the fit already looks good in @fig:mod-eval-x1064-result, we would like to quantify this in a second evaluation step.
We can not use the uncertainties of the fit parameters of the combined fit.
In most cases they are unreasonably small because the initial data does not include any uncertainties.
Even though the atom images are noisy, we cannot quantify a useful uncertainty for each pixel.
This would require averaging of the atom images before the fit #tr[ref EOS paper?].
For this evaluation we would however like to use the full resolution of the resonances as a function of the position $(x, y)$.
We will therefore estimate the uncertainties of the fit result by repeating the fit for each image individually.
This will also show whether there is a systematic error in the assumptions that we made in @sec:mod-intro about the parameters of the lattice depth.

For the individual fits we can not optimize the correction factor $fita0$ and the waist $w_0$ at the same time.
We will therefore use the fixed value of $fita0$ from the combined fit for the individual fits to determine the waist $w_0$ and vice-versa.
The fit parameters $y_0$ and $theta.alt$ are always varied since the position and the orientation of the lattice depth $v(x, y)$ can be determined reliably from a single image.
It only makes sense to try the individual fits #tr[on/for] the images where resonances are visible in the atom cloud.
We are therefore not considering the images with $f_"mod" >= #qty[122.0][kHz]$ for the error estimation.

The comparison of the combined fit result and the individual fit results is shown in @fig:mod-eval-x1064-result.
For all fit parameters, the individual results are scattered randomly around the combined results.
If the lattice depth could not be modelled by a Gaussian function, either the waist $w_0$ or the correction factor $fita0$ should change systematically as a function of the modulation frequency.
We can therefore conclude that the fit model @eq:mod-eval-model[] is #tr[sufficient] to describe the x1064-lattice depth $v(x, y)$.
The waist $w_0$ varies by a few #unit[μm] across the scan of the modulation frequency.
This is reasonable amount given the size of the lattice beams compared to the size of the atom cloud.
We can only measure the resonances up to a radius of $rho approx #qty[20][μm]$ which is significantly smaller than the waist of $w_0 approx #qty[140][μm]$.
For the correction factor $fita0$ we can observe a variation on the order of #num[1e-3], which highlights the measurement resolution of the in-situ lattice modulation technique.
The variation of the position $y_0$ is on par with the expected variation of the atom-cloud position in the camera frame #tr[ref another section?].
This is a general limitation for all measurements that rely on signals in position space.
The angle $theta.alt$ shows variations that are comparable to the errors of the individual fits.
#tr[something else to mention here? compare this to the phase gradient in @sssec:phase-measure-resolve-horizontal?]

#figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header(
      [],
      $"Waist" w_0 slash #unit[μm]$,
      $"Lattice depth" a_0$,
      $"Position" y_0 slash #unit[px]$,
      $"Angle" theta.alt slash degree$,
    ),

    [Gaussian], num[142(4)], num[0.9852(12)], num[0.6(9)], num[-5.47(17)],
    [Parabola], num[144(4)], num[0.9851(13)], num[0.6(9)], num[-5.47(17)],
  ),
  caption: [
    Comparison of the fit results of the different lattice depth models.
    The two rows show the parameters resulting from the different models in @eq:mod-eval-model-resonance.
    For the waist only the data with $f < #qty[115][kHz]$ is taken.
    All data points in @fig:mod-eval-x1064-result are used for the other three averages.
    The averages and the standard deviations (the uncertainties) are computed with weights based on the errors of the individual fits.
    The absolute values of the fit errors are not taken into account.
  ],
) <tab:mod-eval-error>

From the values presented in @tab:mod-eval-error we can draw the conclusion that the depth $a_0$ of the x1064-lattice can be measured with a relative error of $approx #num[1e-3]$ regardless for both a parabolic function and a gaussian function to model the lattice depth.
The position $y_0$ and the angle $theta.alt$ yield the same result for the two model functions as well.
The waist $w_0$ is the only parameter with a measurable difference between the two model functions, which is also expected since the parabola only takes the leading order of the gaussian beam profile into account.
While the difference of the waist between the two functions is still smaller than error we obtained from the individual fits, it is nevertheless just better to use the gaussian function to model the lattice depth.
Since both functions require the same number of fit parameters, we do not actually gain anything by using a parabola as the approximation of the lattice depth.
The (relatively) large errors show us that the waist $w_0$ is the least accurate parameter we can extract from the in-situ lattice modulation measurements.
This is understandable if we take into account that the atoms only occupy the lattice up to $~1 slash 3$ of the waist.
The fit/measurement would be a lot more accurate if we could measure the local lattice up do a greater radius $rho$.
On the other hand it is also completely fine to have an error of #qty[4][μm] for the waist since the atoms are only occupying the center up the radius where we can run this measurement.
The waist is therefore not as important as the lattice depth $a_0$ which directly affects the region of the highest atom density in the center of the lattice.


=== Other monochromatic lattices <ssec:mod-eval-other>

#[
  #set text(red)
  - Add any actual images such as @fig:mod-intro-images here?
  - Add an "interpretation" of the fit errors in @tab:mod-eval-error-other
    - Mention better waist resolution because of the shape of the atom cloud
  - Add drawing of all measured angles relative to glass cell/camera frame?
]
We use the same evaluation as introduced in @ssec:mod-eval-fit for the y1064-lattice and the z532-lattice.
The main difference compared to the x1064-lattice is the direction of the propagation of the lattice beams and therefore the orientation of the lattice depth model $v(x, y)$.
For the y1064-lattice the forward-propagating beam is (almost) perfectly on the $y$-axis, we therefore expect the lattice depth to change as a function of the position $x$.
The z532-lattice is slightly more complicated due to the shallow-angle setup.
While the lattice vector $Delta phy.vb(k)$ points along the $z$-axis, the beams are both propagating in the $y z$-plane.
We therefore "see" the actual waist of $w_0 approx #qty[120][μm]$ along the $x$-axis, but the "effective" waist along the $y$-axis is reduced due to the angle $alpha approx 14.5 degree$ relative to the $x y$-plane, see @sec:setup-z #text(red)[ref the figure here instead?].
The effective waist along the $y$-axis amounts to $w_0 slash tan(alpha) approx #qty[450][μm]$.
Since the "inverse width" parameter $a$ of the lattice depth scales quadratically with the waist, we expect the changes of the lattice depth to be $~14$ times smaller compared to the changes of the lattice depth along the $x$-axis.
While it would be possible to include such an aspect ratio in the lattice depth model @eq:mod-eval-model-resonance, we cannot resolve the ellipticity in the resonance lines if the z532-lattice is properly aligned.
#text(red)[Mention signals that directly show misalignment of the z532-lattice?]
We will therefore only include a variation of the lattice depth along the $x$-axis in the evaluation.

The error estimation introduced in @ssec:mod-eval-error can be applied to the z532-lattice and the y1064-lattice as well.
We will not look at the detailed comparison of the global fit to the individual fits again, we just use the same procedure to compute the fit parameters and corresponding errors.

#figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header(
      [],
      $"Waist" w_0 slash #unit[μm]$,
      $"Lattice depth" a_0$,
      $"Position" x_0 slash #unit[px]$,
      $"Angle" theta.alt slash degree$,
    ),

    [z532], num[113.1(8)], num[0.9549(11)], num[0.9(5)], table.cell(align: right, num[0.0(6)]),
    [y1064], num[167(7)], num[0.9888(23)], num[1.3(5)], table.cell(align: right, num[-0.5(4)]),
  ),
  caption: [
    Comparison of the fit results of the other lattices.
    The two rows show the parameters resulting from the different models in @eq:mod-eval-model-resonance.
    For the waist of the z532-lattice only the data with $f < #qty[41.5][kHz]$ is taken, and for the waist of the y1064-lattice only the data with $f < #qty[115][kHz]$.
    The averages of the other three parameters are computed for $f < #qty[42][kHz]$ and $f < #qty[117][kHz]$ respectively.
    The averages and the standard deviations (the uncertainties) are computed with weights based on the errors of the individual fits.
    The absolute values of the fit errors are not taken into account.
  ],
) <tab:mod-eval-error-other>

#figure(
  image("figures/modulation_evaluation_depth_parabola_y1064_and_z532.png"),
  caption: [
    Fitted lattice depth of z532-lattice at $v_0 = #qty[110][Erec]$ and y1064-lattice at $v_0 = #qty[55][Erec]$.
    // The two axes show the equivalent data of @fig:mod-eval-parabola for the x1064-lattice.
    The optical densities are normalized by the corresponding results of the gaussian envelope $n_0(x, y)$.
    Since the angle $theta.alt$ of the (effective) optical axes relative to the $y-$axis is negligible, the mean of the images is taken in the interval $y = [120, 180]$.
    The orange line shows the resulting resonance frequency for the transition $1 -> 3$ corresponding to the fitted lattice depth $v_"gaussian"(x, y)$ at $y = 150$ (or rather $y = 0$?).
    - #text(red)[Include colorbar between the two axes?]
  ],
) <fig:mod-eval-comparison-other>
