#import "../../header.typ": *

== Evaluation <sec:modulation-evaluation>

#[
  #set text(red)
  - Compute the change of the lattice depth across the planes for the x532-lattice
  - Discuss error sources in depth? E.g. lattices moving from sequence to sequence?
  - Add disclaimer that all units are in pixels unless otherwise noted/mentioned?
  - Mention that only x1064-lattice is shown in detail. Other monochromatic lattices are briefly shown at the end of this section.
  - Mention the elliptic mask that is used for the fitting.
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
  v(x, y, v_0; theta.alt, x_0, y_0, a, a_0) &= v_0 dot a_0 dot (1 - a (y' - y_0)^2)
$ <eq:modulation-evaluation-model-resonance>

where the parameters $a_0$, $a$, $y_0$ (and $theta.alt$) describe the lattice depth $v(x, y)$.
For the x1064-lattice propagating along the $x$-axis, the coordinate $y'$ and the center position $y_0$ are used since they describe the distance/position relative to the optical axis.
Correspondingly, $x'$ and $x_0$ are used for the lattices z532, z1064 and y1064.
The coordinates $x'$ or $y'$ are the ones transformed/rotated by $theta.alt$ to allow an arbitrary angle of the optical axis.
In either case, the resonance function will not change along the optical axis.
See @fig:modulation-results-images for a few examples of the resonance function during a scan of the modulation frequency $f$.
