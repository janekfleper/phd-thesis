#import "/header.typ": *

== Qualitative explanation and results <sec:mod-results>

#[
  #set text(red)
  - Add logarithmic plot for band width as a function of lattice depth?
  - Add sketch for parity argument. Show harmonic oscillator and lattice?
  - Mention depth of perpendicular lattice with reference to coupling section.
  - Mention modulation amplitude and length of modulation? With reference to the optimization section.
]

There are different approaches available to modulate an optical lattice.
The most common one is the (sinusoidal) modulation of the lattice depth

$
  v(t) = v_0 + delta v dot sin(2 pi f t) #text(red)[move this to the introduction?]
$ <eq:mod-results-function>

with the modulation amplitude $delta v$ and the modulation frequency $f$.
The second option in monochromatic lattices is a modulation of the lattice phase/position such that the potential minima are moved periodically.
In superlattices there are even more modulation options since there are two lattices amplitudes and the superlattice phase $phi$ that can be tuned. #text(red)[ref PhD Carla]

The parity of the modulation has important implications on the band transitions that can be driven/accessed.
While the amplitude modulation has an even parity since the symmetry of the lattice potential (from the POV of an atom on a lattice site) is not changed.
The phase/position modulation on the other hand has an odd parity since the lattice sites are actually moved.
In a harmonic oscillator potential this parity argument is used to determine the allowed transitions $n -> n'$.
Since the eigenstates have alternating parity, the amplitude modulation requires $Delta n = 2$ and the position modulation requires $Delta n = 1$.

In the Bloch waves #text(red)[ref what figure?] and the Wannier functions @fig:theory-wannier-tunneling we can see the same dependence of the parity on the band index $n$.
For the amplitude modulation we will therefore target band transitions with $Delta n = 2$.
#footnote[#text(red)[Footnote? In practice we can also drive transitions with an odd parity but their efficiency/strength will be significantly reduced. We would therefore require a stronger modulation amplitude $delta v$ which can further broaden the transition.]]
Since the atoms initially occupy the lowest band with $n = 1$ the main transition responsible for the lattice modulation spectroscopy is $1 -> 3$.

As already mentioned in the introduction, the bands that are used for the (in-situ) lattice modulation spectroscopy should be very narrow compared to the modulation frequency $f$.
This is mainly a concern for the excited/upper band with $n = 3$ since this corresponds to a much higher energy where the Bloch waves are impacted less by the lattice potential.
@fig:mod-results-theory shows that the energy bands start to narrow as soon as they are trapped.
But this is not nearly narrow enough for a lattice modulation spectroscopy measurement.
There is however no universal function to quantify the minimum lattice depth for a given band transition.
This has to be checked individually for each band, and if the width of the upper band is not completely negligible the it has to be taken into account as a systematic error.
For the transition $1 -> 3$ we usually use a lattice depth of at least #qty[60][Erec] where the width of the third band amounts to $approx #qty[0.17][kHz]$.
The transition frequency is three orders of magnitude greater at $approx #qty[120][kHz]$ and we can therefore confidently say that the band width is negligible.

#figure(
  grid(
    columns: 2,
    gutter: 1em,
    image("figures/modulation-results-theory-bandstructure.png"),
    block[
      #image("figures/modulation-results-theory-bandwidth.png")
      #place(curve(stroke: 0.5pt, curve.move((24pt, -30pt)), curve.line((165pt, -148pt))))
    ],
  ),

  caption: [
    Width of excited bands as a function of the lattice depth.
    The figure on the left shows an optical lattice with a depth of $v_0 = #qty[40][Erec]$ where the bands $1$ to $4$ are trapped in the sense that $epsilon_n (q) < v_0$.
    The bands $5$ and $6$ are untrapped and there is only a very small gap between the two bands since their dispersion relation is basically that of a free particle.
    The figure on the right highlights how the widths of the bands change around the amplitude where the bands start to be trapped.
    While the change is not instant, we can see a clear connection between the bandwidth and the difference between $epsilon_n (q)$ and $v_0$.
    - #text(red)[Somehow also show $epsilon_n$ as a function of $q$ here?]
  ],
) <fig:mod-results-theory>


With suitable modulation parameters (#text(red)[ref to optimization section?]) the in-situ lattice modulation spectroscopy produces nicely visible "resonances" where the local lattice depth matches the modulation frequency.
In @fig:mod-results-images a series of images is shown for the lattice modulation spectroscopy measurement in the x1064-lattice.
The lattice has a $1 slash e^2$ waist of $approx #qty[140][μm]$ and the atoms occupy a region of $plus.minus #qty[50][μm]$ around the optical axis.
We can therefore use a parabola to approximate the lattice depth as a function of the radius (#text(red)[see ref evaluation section for the quantitative comparison between a parabola and a Gaussian function]).
The behaviour of the resonances in @fig:mod-results-images qualitative matches a parabolic lattice depth.
With an increasing radius the resonances become narrower and their spacing also decreases for equidistant frequencies.

In theory, the modulation frequency that creates a resonance in the center of the atom cloud is sufficient to calibrate the lattice depth by comparing the frequency to the transition frequency computed from the band structure.
The "outer" frequencies then only allow us to extract the beam waist and the position of the modulated lattice in addition to the lattice depth.
In practice, only looking at the "center" frequency would introduce a significant uncertainty for the lattice depth since the resonances become really wide around the maximum of the parabola.
In @fig:mod-results-images any of the last three images only show a single resonance in the center with a varying depth/contrast.
We therefore process all images of a lattice modulation frequency scan in a single fit to get the lattice depth, the lattice waist and the lattice position.
The details of the evaluation are presented in @sec:mod-eval.

#figure(
  image("figures/2025-01-28_calibration_images_thesis.png"),
  caption: [
    In-situ lattice modulation spectroscopy measurement.
    The images show the optical densities after the modulation of the x1064-lattice at a lattice depth of #qty[55][Erec].
    The expected frequency for the transition $1 -> 3$ is $f approx #qty[115.5][kHz]$ which removes the atoms in the center (on the optical axis) of the lattice.
    As the modulation frequency is decreased, the "resonance" moves away from the optical axis.
    The spacing of the resonances and their widths also become smaller as a function of the radius.
    Note that the angle of the resonances matches the angle of $approx #num[4.5] degree$ of the x1064-lattice relative to the camera frame.
  ],
) <fig:mod-results-images>
