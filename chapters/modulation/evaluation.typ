#import "../../header.typ": *

== Evaluation <sec:modulation-evaluation>

#[
  #set text(red)
  - Compute the change of the lattice depth across the planes for the x532-lattice
  - Discuss error sources in depth? E.g. lattices moving from sequence to sequence?
  - Add disclaimer that all units are in pixels unless otherwise noted/mentioned?
  - Mention that only x1064-lattice is shown in detail. Other monochromatic lattices are briefly shown at the end of this section.
  - Mention the elliptic mask that is used for the fitting.
  - Just skip the entire parabolic fits? Just using the gaussian function from the start actually sounds easier?
  - Compare the lattice parameters to any Basler images?
]

The goal of the evaluation procedure is to yield the parameters to describe the lattice depth $v(x, y)$ from a series of images as shown in @fig:modulation-results-images.
Since the atoms only occupy the center of the optical lattice, we can approximate the lattice depth by a parabolic function.
While the data shows two-dimensional distributions of atoms, the function to describe the lattice depth only changes with the distance from the optical axis.
We can therefore use a one-dimensional parabola that is "extruded" along the optical axis to parametrize the lattice depth.
The assumption that the lattice depth does not change with the position $z$ along the optical axis is valid if the Rayleigh length is much greater than the region that is occupied by the atoms.
This is definitely the case for all optical lattices in this experiment, with the shortest Rayleigh length being #text(red)[which lattice?] (#text(red)[ref setup section!]).

Another assumption for the evaluation is that the lattice depth is constant in the different vertical lattice planes.
The atoms usually occupy the vertical lattice planes over $tilde #qty[10][μm]$.
Even the smallest vertical waist of the x532-lattice #text(red)[ref setup section] at $tilde #qty[50][μm]$ is greater by a factor $10$ if the lattice is centered on the atom cloud.
For the infrared in-plane lattices with waists of $tilde #qty[150][μm]$ this is even less critical.
If the lattices are not properly centered on the atoms, we can however see a significant reduction of the "resonances".
We can use this signal to optimize the lattice alignment along the vertical axis where we would otherwise not have the imaging capabilities we have in the $x y$-plane.
Even measuring the lattice modulation spectroscopy with the single-plane slicing as introduced in @sec:setup-detection would not provide a faster/better alignment procedure.
By integrating over multiple lattice planes we just have to find the alignment where both the lattice depth and the resonance "contrast" are maximized.
While both parameters can have many local maxima, the combined maximum is always unambiguous.
This alignment procedure is described in detail in #text(red)[ref modulation/alignment].


=== Fit model description <ssec:modulation-evaluation-fit-model>

#text(red)[Where to put this disclaimer?]
The evaluation of the lattice modulation spectroscopy measurements uses a model that was developed based on empirical observations of many atom images.
Using gaussian functions to model the atomic cloud and the resonances is not based on any theory, it is just the simplest way of getting reliable fit results.
Only the function that actually describes the lattice depth as a function of the position uses the band structure theory to relate the modulation frequency to a local lattice depth.
The fit parameters of the lattice depth, the lattice waist and the lattice position are therefore actually quantitative results.
The other resonance fit parameters will only be considered from a qualititive point of view (if anything).

#figure(
  image("../../figures/modulation_evaluation_fit_model.png"),
  caption: [
    Illustration of the lattice modulation spectroscopy fit model.
    The lattice in the figure has a depth of #qty[60][Erec] (in the center) and the waist of the lattice is #qty[140][μm].
    In the first row the figures show the frequency of the transition $1 -> 3$ computed from the lattice depth as a function of the distance from the optical axis/lattice site.
    The modulation is parametrized by a one-dimensional gaussian function in frequency space with the amplitude #num[0.9] and the $1 slash e^2$ radius #num[1.2] #text(red)[use FWHM here instead...].
    The shaded regions in the first row indicate the modulation which is uniform across the entire lattice.
    Depending on the intersection of the modulation frequency with the "resonance" parabola, the actual resonance function will have a different amplitude and width.
    This is shown in the second row where the resonance widths decrease as the modulation frequency approaches the center of the optical lattice.
    The amplitude of the resonance function only decreases when the modulation frequency is greater than the center frequency for the maximum lattice depth.
    In the third row the application of the resonance function to the optical density shows the signal that we will actually measure with the atoms.
    A modulation frequency near the center of the lattice will significantly deplete the atom cloud, whereas smaller frequencies will only "draw" a thin resonance line into the optical density.
  ],
) <fig:modulation-evaluation-model>

The function we use to evaluate the images @fig:modulation-results-images is the product of a gaussian envelope $n_0(x,y)$ for the optical density of the atom cloud and the "resonance" function $R(x, y, v_0, f)$ to represent the lattice modulation as a function of the lattice depth $v_0$ and the modulation frequency $f$.
Since the "resonance" function is defined to be positive as shown in @fig:modulation-evaluation-model, it needs to be subtraced from the optical density $n_0(x,y)$.
The total fit function of the lattice modulation spectroscopy is therefore

$
  n(x, y) = n_0(x, y) dot (1 - R(x, y, v_0, f))
$ <eq:modulation-evaluation-model>

where the actual fit parameters of the functions $n_0(x, y)$ and $R(x, y, v_0, f)$ are omitted for the sake of readability.
The resonance function $R$ internally computes the lattice depth as a one-dimensional parabola.
Having both coordinates $x$ and $y$ as parameters is only used as a generalization for all available lattices and for a rotation of the optical axis of the lattice in the $x y$-plane.
The complete fit function of the optical density $n_0(x, y)$ is given by the expression

$
  n_0(x, y; theta.alt, a, y_0, x_0, w_y, w_x) &= a dot g(x', x_0, w_x) dot g(y', y_0, w_y) \
  "with" #h(1em) g(x, x_0, w) &= exp(-2 ((x-x_0) / w)^2)
$ <eq:modulation-evaluation-model-density>

where $x'$ and $y'$ are the coordinates transformed/rotated by the angle $theta.alt$.
Also making the optical density $n_0(x, y)$ rotatable was a choice to accomodate the fact that the atomic density distribution follows the optical axis of the x1064-lattice as seen in @fig:modulation-results-images.
The optical density function $n_0(x, y)$ is used for all of the images in a single measurement.
This assumes that the atom number during each sequence before the modulation starts is constant over the measurement time.
With a measurement time of #num[10] to #qty[15][min], this is a valid assumption to make.

The alternative to including the optical density in the fit model would be to run a reference measurement to determine $n_0(x, y)$ independently.
Dividing $n(x, y)$ by $n_0(x, y)$ and subtracting $1$ would then directly return $-R(x, y, v_0, f)$.
While this sounds really tempting, we would need to do this before every modulation measurement since the atom number is not constant over timescales from hours to days.
In addition, the atom density $n_0(x, y)$ can change between sequences that modulate different lattices since we use different lattice depths.
The increased measuring time would only shorten the runtime of the fits since the model will have fewer parameters.
The result of the fit of the lattice depth is not actually improved since those parameters do not show any relevant correlations with the fit parameters of $n_0(x, y)$.

The resonance function $R(x, y, v_0, f)$ uses a one-dimensional parabola to model the lattice depth $v(x, y)$.
To apply the modulation frequency, the frequency $f_(1->3)$ is computed from the lattice depth.
The frequency as a function of $x$ and $y$ is then evaluated in a one-dimensional gaussian function with the modulation frequency, the resonance amplitude and the resonance width as follows

$
  R(x, y, v_0, f; theta.alt, x_0, y_0, a, a_0, a_f, w_f) &= a_f dot exp(-2 ((f_(1->3)(v) - f) / w_f)^2) \
  "with" #h(1em)
  v_"gaussian" (x, y, v_0; theta.alt, x_0, y_0, a, a_0) &= v_0 dot a_0 dot exp(-a rho^2) \
  "or" #h(1em)
  v_"parabola" (x, y, v_0; theta.alt, x_0, y_0, a, a_0) &= v_0 dot a_0 dot (1 - a rho^2)
$ <eq:modulation-evaluation-model-resonance>

where the parameters $a_0$, $a$, $y_0$ (and $theta.alt$) describe the lattice depth $v(x, y)$.
The distance $rho$ from the optical axis is computed from the coordinates $x$ and $y$, the origin $(x_0, y_0)$ and the angle $theta.alt$.
For the lattices propagating along the $x$-axis, the parameter $x_0$ is not varied during the fit.
The same applies to the parameter $y_0$ for the lattices propagating along the $y$-axis.
Since the lattice depth does not change along the optical axis, it does not make sense to define an "origin" in that direction.
See @fig:modulation-evaluation-model for a few examples of the resonance function during a scan of the modulation frequency $f$.

The fit parameter $a_0$ in @eq:modulation-evaluation-model-resonance will quantify the correction factor of the programmed lattice depth $v_0$.
While it might look odd to have two "correlated" factors in the formula, this is much nicer to work with than a single factor that would include the lattice depth in the fit.
The fit parameter $a$ describes the "inverse width" fo the parabola which can then be related to the gaussian waist of the optical lattice.
If you look at the two different lattice depth functions in @eq:modulation-evaluation-model-resonance, you can see that the parabolic function is just the first order expansion of the gaussian function.
The relation of the gaussian waist $w_0$ and the "inverse width" a is given by the equation

$
  w_0 = sqrt(2/a)
$ <eq:modulation-evaluation-waist>

// By multiplying the waist $w_0$ by the pixel size of the camera, we can get the waist in #unit[μm].

#linebreak()

To get an idea of the match between the lattice modulation spectroscopy signals in @fig:modulation-results-images and the lattice depth determined by the fit model @eq:modulation-evaluation-model we are going to look at a cut along the $y$-axis.
The normalized optical density data in @fig:modulation-evaluation-parabola shows a good agreement with the two fit models.
Since the data is only averaged near the center $x = 0$ of the lattice, it is still rather noisy.
For the y1064-lattice and the z532-lattice this is is less of an issue and the resulting averaged images look much nicer #text(red)[make this a footnote? In any case ref the subsection later].
The parabola and the gaussian function to model the lattice depth are both evaluated at $x = 0$ with the respective fit parameters $a$, $a_0$, $theta.alt$ and $y_0$.
There are no differences visible between the two fit models, which is a good thing regarding the lattice depth factor $a_0$.
This was also expected since a gaussian function can be approximated really well by a parabola around the center.
We do however expect the resulting waists to be slightly different because the fit models must have a different value of the parameter $a$ if the functions visually overlap.

#figure(
  image("../../figures/modulation_evaluation_depth_parabola.png", width: 70%),
  caption: [
    Comparison of fitted lattice depth to atom densities.
    The plot shows the normalized data from @fig:modulation-results-images.
    The images are divided by the fitted gaussian envelope $n_0(x, y)$ to improve the visibility of the resonances.
    The mean of the images in @fig:modulation-results-images is taken in the interval $x = [140, 160]$ to reduce the noise compared to just using a single pixel column at $x = 150$.
    Due to the finite angle $theta.alt$, the interval has to be small to avoid "washing" out of the data.
    The parabola in orange is evaluated at $x = 0$ with the lattice parameters $a$, $a_0$, $y_0$ and $theta.alt$ taken from the fit.
    The black dashed line shows the equivalent function that resulted from the fit with a gaussian lattice depth.
    There is no difference between the two fit results visible here, for the detailed comparison see @ssec:modulation-evaluation-error.
    - #text(red)[Show the lattice depth here as the y-axis on the right]
  ],
) <fig:modulation-evaluation-parabola>


=== Error estimation <ssec:modulation-evaluation-error>

Since the evaluation uses individual atom images (with a mask) without any binning or averaging to come up with an error corresponding to the data, the resulting fit errors will generally be tiny.
Even if the data had an error on the amplitude "axis", this would not actually the correct "dimension" for the fit parameters that describe the lattice depth $v$.
We are only concerned with the "positional" signal of the resonances which an error in the $x y$-plane.
We therefore need to come up with a scheme to estimate the error of the fit (or rather the fit model).

By using a single parabola or gaussian function to model the lattice depth across the entire measurement, we are assuming that the depth is actually correctly described by such a function.
While this is a valid assumption unless the lattice is misaligned or the beam quality of the gaussian lattice beams is bad, we would like to confirm that the simple model is actually sufficient to describe the data.
We can achieve this by fitting the model @eq:modulation-evaluation-model to the individual images.
We can then compare the "global" fit parameters to the individual ones to get an idea how much the invidiual images actually deviate from the simple fit model.
Running the full fit will not be possible since a single image provides at maximum two points to the lattice depth parabola (or gaussian function).
Only one of the fit parameters $a$ and $a_0$ can be varied during the fits.
We will therefore run each fit to the individual images twice for a paroblic lattice depth and twice for a gaussian lattice depth.
The first runs will vary the "inverse width" $a$ and the second runs will vary the lattice depth $a_0$.
The constant parameter will use the corresponding value from the global fit as shown in @fig:modulation-evaluation-parabola.
Since the position/orientation of the lattice depth function $v(x, y)$ can be determined even from individual images, the fit parameters $y_0$ and $theta.alt$ are always varied.
The results of the individual fits are shown in @fig:modulation-evaluation-error.

Looking at the individual fit results for the gaussian waist shows the systematic deviation between the parabolic function and the gaussian function.
The waist is smaller for the latter fits since a gaussian function will always be wider than a parabolic function for the same value of the parameter $a$.
For the frequencies from #qty[112][kHz] to #qty[114][kHz] the waist decreases by $tilde #qty[10][μm]$.
The most likely cause for this change is an imperfect overlap of the forward-propagating beam and the retro-propagating beam.
We cannot differentiate whether this is caused a misalignment of the optical axes or a small mismatch of the optical waists #text(red)[or is there a way to check this?].
At modulation frequencies $>#qty[114][kHz]$ the waist deviates significantly.
This is caused by the lack of two resonances as shown in @fig:modulation-results-images and @fig:modulation-evaluation-parabola.
We will therefore only consider the waists up to #qty[114][kHz] to estimate the error.
See the summarized results in @tab:modulation-evaluation-error for the actual mean waist(s) and the corresponding error(s).

For the lattice depth $a_0$ there is no significant difference visible between the parabolic function and the gaussian function.
The data points at #qty[112][kHz] show a relative deviation of $tilde #num[1e-3]$, and this is by far the maximum deviation across the measurement.
While it appears that the global result deviates significantly from the mean of the individual results, this is not true when taking the errors of the individual parameters into account.
The two outer frequencies have the largest error, the weighted averages will therefore be much closer to the global values.
These weights are also implicitely included in the global fit.
The lattice depth parameter $a_0$ will be most sensitive to the resonances that "move" the most as a function of the lattice depth (or the modulation frequency).
Both the minimal resonance and the maximal resonance are not that sensitive to the lattice depth.
At #qty[112][kHz] this is due to the (large) slope of the parabola and at #qty[115][kHz] the resonance is already "above" the actual lattice depth function, see @fig:modulation-evaluation-parabola.
The actual results are again shown in @tab:modulation-evaluation-error.

As mentioned in @fig:modulation-evaluation-error both the lattice position $y_0$ and the lattice angle $theta.alt$ did not show different results for the four evaluations of the fit.
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
See @tab:modulation-evaluation-error for the averaged results of the position $y_0$ and the angle $theta.alt$ together with the other fit parameters.

#figure(
  image("../../figures/modulation_evaluation_error_estimation.png", width: 80%),
  caption: [
    Lattice modulation spectroscopy error estimation.
    The figure shows the results of four different fits to the individual images from the measurement in @fig:modulation-results-images.
    The horizontal lines always refer to the parameters from the initial "global" fits to the "stack" of images.
    The errors from the global fit are all smaller than the width of the horizontal lines, displaying them in this figure is therefore not possible.
    Only the frequencies up to #qty[115][kHz] are shown here since the individual fits are not stable for the higher frequencies.
    Looking at the lattice depth in @fig:modulation-evaluation-parabola we can see that even #qty[115][kHz] is already above the "maximum" frequency.
    The data at #qty[114.5][kHz] already only uses a single data point since there is a "joint" resonance in the center of the cloud.
    For the lattice position $y_0$ and the lattice angle $theta.alt$, the four individual fits per image returned perfectly overlapping results.
    The figure therefore only shows the data points once in a "neutral" color.
    For the gaussian waist (which is used instead of the fit parameter $a$) and the lattice depth $a_0$, the parabolic function and the gaussian function show slightly different results.
    - #text(red)[Show the gaussian waist in pixels instead?]
    - #text(red)[Or rather show the position $y_0$ in μm as well?]
  ],
) <fig:modulation-evaluation-error>


// make this a global function in header.typ?
#let table-stroke(x, y, stroke: none) = {
  if (y == 0) { (bottom: stroke) }
  if (x == 0) { (right: stroke) }
}

#figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header(
      [],
      $"Waist" w_0 slash#unit[μm]$,
      $"Lattice depth" a_0$,
      $"Position" y_0 slash#unit[px]$,
      $"Angle" theta.alt slash degree$,
    ),

    [Gaussian], num[142(4)], num[0.9852(12)], num[0.6(9)], num[-5.47(17)],
    [Parabola], num[144(4)], num[0.9851(13)], num[0.6(9)], num[-5.47(17)],
  ),
  caption: [
    Comparison of the fit results of the different lattice depth models.
    The two rows show the parameters resulting from the different models in @eq:modulation-evaluation-model-resonance.
    For the waist only the data with $f < #qty[115][kHz]$ is taken.
    All data points in @fig:modulation-evaluation-error are used for the other three averages.
    The averages and the standard deviations (the uncertainties) are computed with weights based on the errors of the individual fits.
    The absolute values of the fit errors are not taken into account.
  ],
) <tab:modulation-evaluation-error>

From the values presented in @tab:modulation-evaluation-error we can draw the conclusion that the depth $a_0$ of the x1064-lattice can be measured with a relative error of $~#num[1e-3]$ regardless for both a parabolic function and a gaussian function to model the lattice depth.
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


#pagebreak()

=== Other monochromatic lattices <ssec:modulation-evaluation-other>

#[
  #set text(red)
  - Add any actual images such as @fig:modulation-results-images here?
  - Add an "interpretation" of the fit errors in @tab:modulation-evaluation-error-other
    - Mention better waist resolution because of the shape of the atom cloud
  - Add drawing of all measured angles relative to glass cell/camera frame?
]
We use the same evaluation as introduced in @ssec:modulation-evaluation-fit-model for the y1064-lattice and the z532-lattice.
The main difference compared to the x1064-lattice is the direction of the propagation of the lattice beams and therefore the orientation of the lattice depth model $v(x, y)$.
For the y1064-lattice the forward-propagating beam is (almost) perfectly on the $y$-axis, we therefore expect the lattice depth to change as a function of the position $x$.
The z532-lattice is slightly more complicated due to the shallow-angle setup.
While the lattice vector $Delta phy.vb(k)$ points along the $z$-axis, the beams are both propagating in the $y z$-plane.
We therefore "see" the actual waist of $w_0 approx #qty[120][μm]$ along the $x$-axis, but the "effective" waist along the $y$-axis is reduced due to the angle $alpha approx 14.5degree$ relative to the $x y$-plane, see @sec:setup-z-lattices #text(red)[ref the figure here instead?].
The effective waist along the $y$-axis amounts to $w_0 slash tan(alpha) approx #qty[450][μm]$.
Since the "inverse width" parameter $a$ of the lattice depth scales quadratically with the waist according to @eq:modulation-evaluation-waist, we expect the changes of the lattice depth to be $~14$ times smaller compared to the changes of the lattice depth along the $x$-axis.
While it would be possible to include such an aspect ratio in the lattice depth model @eq:modulation-evaluation-model-resonance, we cannot resolve the ellipticity in the resonance lines if the z532-lattice is properly aligned.
#text(red)[Mention signals that directly show misalignment of the z532-lattice?]
We will therefore only include a variation of the lattice depth along the $x$-axis in the evaluation.

The error estimation introduced in @ssec:modulation-evaluation-error can be applied to the z532-lattice and the y1064-lattice as well.
We will not look at the detailed comparison of the global fit to the individual fits again, we just use the same procedure to compute the fit parameters and corresponding errors.

#figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header(
      [],
      $"Waist" w_0 slash#unit[μm]$,
      $"Lattice depth" a_0$,
      $"Position" x_0 slash#unit[px]$,
      $"Angle" theta.alt slash degree$,
    ),

    [z532], num[113.1(8)], num[0.9549(11)], num[0.9(5)], table.cell(align: right, num[0.0(6)]),
    [y1064], num[167(7)], num[0.9888(23)], num[1.3(5)], table.cell(align: right, num[-0.5(4)]),
  ),
  caption: [
    Comparison of the fit results of the different lattice depth models.
    The two rows show the parameters resulting from the different models in @eq:modulation-evaluation-model-resonance.
    For the waist of the z532-lattice only the data with $f < #qty[41.5][kHz]$ is taken, and for the waist of the y1064-lattice only the data with $f < #qty[115][kHz]$.
    The averages of the other three parameters are computed for $f < #qty[42][kHz]$ and $f < #qty[117][kHz]$ respectively.
    The averages and the standard deviations (the uncertainties) are computed with weights based on the errors of the individual fits.
    The absolute values of the fit errors are not taken into account.
  ],
) <tab:modulation-evaluation-error-other>

#figure(
  image("../../figures/modulation_evaluation_depth_parabola_y1064_and_z532.png"),
  caption: [
    Fitted lattice depth of z532-lattice at $v_0 = #qty[110][Erec]$ and y1064-lattice at $v_0 = #qty[55][Erec]$.
    The two axes show the equivalent data of @fig:modulation-evaluation-parabola for the x1064-lattice.
    The optical densities are normalized by the corresponding results of the gaussian envelope $n_0(x, y)$.
    Since the angle $theta.alt$ of the (effective) optical axes relative to the $y-$axis is negligible, the mean of the images is taken in the interval $y = [120, 180]$.
    The orange line shows the resulting resonance frequency for the transition $1 -> 3$ corresponding to the fitted lattice depth $v_"gaussian"(x, y)$ at $y = 150$ (or rather $y = 0$?).
    - #text(red)[Include colorbar between the two axes?]
  ],
) <fig:modulation-evaluation-comparison-other>
