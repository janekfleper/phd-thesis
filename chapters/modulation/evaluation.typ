#import "/header.typ": *

== Evaluation <sec:mod-eval>

#[
  #set text(red)
  - Discuss error sources in depth? E.g. lattices moving from sequence to sequence?
  - Add disclaimer that all units are in pixels unless otherwise noted/mentioned?
  - Mention that only x1064-lattice is shown in detail. Other monochromatic lattices are briefly shown at the end of this section.
  - Mention the elliptic mask that is used for the fitting.
  - Compare the lattice parameters to any Basler images?
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
  v(x, y, v_0; alpha, x_0, y_0, theta.alt, w_0) = alpha dot v_0 dot exp(-2 rho^2 / w_0^2) thin .
$ <eq:mod-eval-model-lattice-depth>

From the lattice depth and the band structure as shown in @fig:mod-intro-theory we can then compute the transition frequency $f_(1->3)(v)$ in #unit[kHz].
The first the parameters are variables passed to the fit model, and the last five parameters will be optimized by the fit.
Only one of the parameters $x_0$ and $y_0$ is used at a time depending on the optical axis of the lattice.

The modulation is parametrized by a Lorentzian function centered at the modulation frequency $f_"mod"$.
The actual shape of the resonances is only a qualitative observable, we could therefore use any symmetric distribution with an amplitude and a width.
We ultimately chose the Lorentzian function since it is commonly used to describe resonances.
If we use the transition frequency $f_(1->3)(v)$ as a function of the local lattice depth, we will directly get the resonances in position space from the following model function

$
  R(v, f_"mod"; a_R, gamma_R) = a_R dot 1 / (1 + ((f_(1->3)(v) - f_"mod") / gamma_R)^2)
$ <eq:mod-eval-model-resonance>

with the dimensionless amplitude $a_R$, the lattice depth $v$ @eq:mod-eval-model-lattice-depth[] and the half width at half maximum (HWHM) $gamma_R$ in #unit[kHz].
The axes *e* to *h* in @fig:mod-eval-model show the resulting resonances for different modulation frequencies.
For constant steps of the modulation frequency, the resonances move faster and become wider towards the center.
This is a direct consequence of the local lattice depth as visualized by the overlap with the modulation frequency in *a* to *d*.

To finalize the fit model we need to take the #tr[(underlying)] optical density $n_0(x, y)$ into account.
We decided to use a two-dimensional Gaussian function that can be shifted and rotated in the $x y$ plane.
Just like the shape of the resonances, this is only an empirical model that does not affect the calibration of the actual lattice depth @eq:mod-eval-model-lattice-depth[].
Since the resonance function @eq:mod-eval-model-resonance[] is defined with a positive amplitude, we need to subtract it from the optical density $n_0(x, y)$.
The resulting fit model that we can directly use on the atom images is therefore

$
  n(x, y) = n_0(x, y) dot (1 - R) thin .
$ <eq:mod-eval-model>

In @fig:mod-eval-model the total fit model is shown for several modulation frequencies in subfigures *i* to *l*.
With this fit model we assume that the optical density $n_0(x, y)$ does not change significantly between the images in a measurement as shown in @fig:mod-intro-images.
This requires a #tr[constant/stable] atom number in each sequence before the modulation starts.
During the measurement time of #num[10] to #qty[15][min], the typical atom number variation is sufficiently small.
#tr[ref anything in @ch:setup?]

The alternative to including the optical density in the fit model would be to run a reference measurement that determines $n_0(x, y)$ independently.
Dividing $n(x, y)$ by $n_0(x, y)$ and subtracting $1$ would then directly return the data that is modelled by the resonance function @eq:mod-eval-model-resonance[].
This would shorten the runtime required for the evaluation, but in return the measurement time would be increased.
For a meaningful reference measurement we need to take #num[5] to #num[10] images before every lattice modulation measurement, which would roughly double the total measurement time.
The result of the lattice depth @eq:mod-eval-model-lattice-depth[] would not actually be improved since lattice-depth parameters $alpha$, $x_0$, $y_0$, $theta.alt$ and $w_0$ do not show any correlations with the fit parameters of $n_0(x, y)$.

#figure(
  image("figures/modulation_evaluation_fit_model.png"),
  caption: [
    Fit model for the in-situ lattice modulation spectroscopy.
    The lattice in the figure has a depth of $v_0 = #qty[60][Erec]$ and the lattice beams have a waist of #qty[140][μm].
    In *a* to *d*, the solid black lines show the transition frequency $f_(1->3)(y)$ computed from the local lattice depth $v(y)$, and the shaded areas show the modulation that is scanned from #qty[116.0][kHz] to #qty[122.0][kHz] in steps of #qty[2.0][kHz].
    The parameters of the Lorentzian modulation function in frequency space are $a_R = #num[0.9]$ and $gamma_R = #tr[#qty[1.2][kHz]]$
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

To get an idea of the match between the lattice modulation spectroscopy signals in @fig:mod-intro-images and the lattice depth determined by the fit model @eq:mod-eval-model we are going to look at a cut along the $y$-axis.
The normalized optical density data in @fig:mod-eval-parabola shows a good agreement with the two fit models.
Since the data is only averaged near the center $x = 0$ of the lattice, it is still rather noisy.
For the y1064-lattice and the z532-lattice this is is less of an issue and the resulting averaged images look much nicer #text(red)[make this a footnote? In any case ref the subsection later].
The parabola and the gaussian function to model the lattice depth are both evaluated at $x = 0$ with the respective fit parameters $a$, $a_0$, $theta.alt$ and $y_0$.
There are no differences visible between the two fit models, which is a good thing regarding the lattice depth factor $a_0$.
This was also expected since a gaussian function can be approximated really well by a parabola around the center.
We do however expect the resulting waists to be slightly different because the fit models must have a different value of the parameter $a$ if the functions visually overlap.

#figure(
  image("figures/modulation_evaluation_depth_parabola.png", width: 70%),
  caption: [
    Comparison of fitted lattice depth to atom densities.
    The plot shows the normalized data from @fig:mod-intro-images.
    The images are divided by the fitted gaussian envelope $n_0(x, y)$ to improve the visibility of the resonances.
    The mean of the images in @fig:mod-intro-images is taken in the interval $x = [140, 160]$ to reduce the noise compared to just using a single pixel column at $x = 150$.
    Due to the finite angle $theta.alt$, the interval has to be small to avoid "washing" out of the data.
    The parabola in orange is evaluated at $x = 0$ with the lattice parameters $a$, $a_0$, $y_0$ and $theta.alt$ taken from the fit.
    The black dashed line shows the equivalent function that resulted from the fit with a gaussian lattice depth.
    There is no difference between the two fit results visible here, for the detailed comparison see @ssec:mod-eval-error.
    - #text(red)[Show the lattice depth here as the y-axis on the right]
  ],
) <fig:mod-eval-parabola>


=== Error estimation <ssec:mod-eval-error>

Since the evaluation uses individual atom images (with a mask) without any binning or averaging to come up with an error corresponding to the data, the resulting fit errors will generally be tiny.
Even if the data had an error on the amplitude "axis", this would not actually the correct "dimension" for the fit parameters that describe the lattice depth $v$.
We are only concerned with the "positional" signal of the resonances which an error in the $x y$-plane.
We therefore need to come up with a scheme to estimate the error of the fit (or rather the fit model).

By using a single parabola or gaussian function to model the lattice depth across the entire measurement, we are assuming that the depth is actually correctly described by such a function.
While this is a valid assumption unless the lattice is misaligned or the beam quality of the gaussian lattice beams is bad, we would like to confirm that the simple model is actually sufficient to describe the data.
We can achieve this by fitting the model @eq:mod-eval-model to the individual images.
We can then compare the "global" fit parameters to the individual ones to get an idea how much the invidiual images actually deviate from the simple fit model.
Running the full fit will not be possible since a single image provides at maximum two points to the lattice depth parabola (or gaussian function).
Only one of the fit parameters $a$ and $a_0$ can be varied during the fits.
We will therefore run each fit to the individual images twice for a paroblic lattice depth and twice for a gaussian lattice depth.
The first runs will vary the "inverse width" $a$ and the second runs will vary the lattice depth $a_0$.
The constant parameter will use the corresponding value from the global fit as shown in @fig:mod-eval-parabola.
Since the position/orientation of the lattice depth function $v(x, y)$ can be determined even from individual images, the fit parameters $y_0$ and $theta.alt$ are always varied.
The results of the individual fits are shown in @fig:mod-eval-error.

Looking at the individual fit results for the gaussian waist shows the systematic deviation between the parabolic function and the gaussian function.
The waist is smaller for the latter fits since a gaussian function will always be wider than a parabolic function for the same value of the parameter $a$.
For the frequencies from #qty[112][kHz] to #qty[114][kHz] the waist decreases by $approx #qty[10][μm]$.
The most likely cause for this change is an imperfect overlap of the forward-propagating beam and the retro-propagating beam.
We cannot differentiate whether this is caused a misalignment of the optical axes or a small mismatch of the optical waists #text(red)[or is there a way to check this?].
At modulation frequencies $>#qty[114][kHz]$ the waist deviates significantly.
This is caused by the lack of two resonances as shown in @fig:mod-intro-images and @fig:mod-eval-parabola.
We will therefore only consider the waists up to #qty[114][kHz] to estimate the error.
See the summarized results in @tab:mod-eval-error for the actual mean waist(s) and the corresponding error(s).

For the lattice depth $a_0$ there is no significant difference visible between the parabolic function and the gaussian function.
The data points at #qty[112][kHz] show a relative deviation of $approx #num[1e-3]$, and this is by far the maximum deviation across the measurement.
While it appears that the global result deviates significantly from the mean of the individual results, this is not true when taking the errors of the individual parameters into account.
The two outer frequencies have the largest error, the weighted averages will therefore be much closer to the global values.
These weights are also implicitely included in the global fit.
The lattice depth parameter $a_0$ will be most sensitive to the resonances that "move" the most as a function of the lattice depth (or the modulation frequency).
Both the minimal resonance and the maximal resonance are not that sensitive to the lattice depth.
At #qty[112][kHz] this is due to the (large) slope of the parabola and at #qty[115][kHz] the resonance is already "above" the actual lattice depth function, see @fig:mod-eval-parabola.
The actual results are again shown in @tab:mod-eval-error.

As mentioned in @fig:mod-eval-error both the lattice position $y_0$ and the lattice angle $theta.alt$ did not show different results for the four evaluations of the fit.
We therefore only have to consider the differences between the individual freuqencies/sequences.
It looks like the position $y_0$ of the lattice is just changing randomly during the measurement between #qty[-1][px] and #qty[2][px].
These are however expected fluctuations from sequence to sequence for our experiment.
If we take into account that the pixel size in the atom plane is $~#qty[0.6][μm]$, we are talking about a total positional change of $<#qty[2][μm]$.
Such a change of the position is not a contradiction to/with how constant the lattice depth is.
With a lattice waist that is larger than the changes of the position by two orders of magnitude, we do not expect the lattice depth to be affected here.
As long as the changes of the position are much smaller than the measured resonances, the global fit will just take the average position of the individual sequences and the other fit parameters will not be (negatively) impacted.
The angle $theta.alt$ can also slightly vary from sequence to sequence since it depends on the position of the beam in front of the last lens #text(red)[ref any figure here?]
#text(red)[Do we have any estimation here how much that would be? Can this explain the outlier?]
Since the rotation is done at/around $x = 0$, a change of the angle will not affect the lattice depth.
If an individual fit returns a different angle, the distance of the resonances at $x = 0$ will still be the same to get the best overlap between the fit model and the resonance signal.
See @tab:mod-eval-error for the averaged results of the position $y_0$ and the angle $theta.alt$ together with the other fit parameters.

#figure(
  image("figures/modulation_evaluation_error_estimation.png", width: 80%),
  caption: [
    Lattice modulation spectroscopy error estimation.
    The figure shows the results of four different fits to the individual images from the measurement in @fig:mod-intro-images.
    The horizontal lines always refer to the parameters from the initial "global" fits to the "stack" of images.
    The errors from the global fit are all smaller than the width of the horizontal lines, displaying them in this figure is therefore not possible.
    Only the frequencies up to #qty[115][kHz] are shown here since the individual fits are not stable for the higher frequencies.
    Looking at the lattice depth in @fig:mod-eval-parabola we can see that even #qty[115][kHz] is already above the "maximum" frequency.
    The data at #qty[114.5][kHz] already only uses a single data point since there is a "joint" resonance in the center of the cloud.
    For the lattice position $y_0$ and the lattice angle $theta.alt$, the four individual fits per image returned perfectly overlapping results.
    The figure therefore only shows the data points once in a "neutral" color.
    For the gaussian waist (which is used instead of the fit parameter $a$) and the lattice depth $a_0$, the parabolic function and the gaussian function show slightly different results.
    - #text(red)[Show the gaussian waist in pixels instead?]
    - #text(red)[Or rather show the position $y_0$ in μm as well?]
  ],
) <fig:mod-eval-error>


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
    All data points in @fig:mod-eval-error are used for the other three averages.
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

#text(red)[Compare values of waists to the trap frequency measurements in the x-superlattice setup chapter]


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
    The two axes show the equivalent data of @fig:mod-eval-parabola for the x1064-lattice.
    The optical densities are normalized by the corresponding results of the gaussian envelope $n_0(x, y)$.
    Since the angle $theta.alt$ of the (effective) optical axes relative to the $y-$axis is negligible, the mean of the images is taken in the interval $y = [120, 180]$.
    The orange line shows the resulting resonance frequency for the transition $1 -> 3$ corresponding to the fitted lattice depth $v_"gaussian"(x, y)$ at $y = 150$ (or rather $y = 0$?).
    - #text(red)[Include colorbar between the two axes?]
  ],
) <fig:mod-eval-comparison-other>
