#import "/header.typ": *

== Coupled lattices <sec:modulation-coupled>

We have always selected the depths of the "other" lattices such that they do not "interfere" with the lattice that is currenctly getting modulated.
As mentioned in @sec:modulation-results we would set the depth of the y1064-lattice to #qty[30][Erec] when modulating the x1064-lattice at a depth of #qty[60][Erec].
#text(red)[What about the depth of the z532-lattice?]
This was based on the (empirical) observation that the modulation of the x1064-lattice can also address the y1064-lattice (and vice-versa).
Since the lattices are not perfectly perpendicular we also expected this "cross-talk" to happen because of a (small) coupling of the lattices.
To actually understand where the coupling shows up in the Bloch theorem and how this affects the band structure(s) we had to solve the Bloch theorem in two dimensions.
I will only present the resulting band structures in this section, the step-by-step calculation and the technical details of the theory are shown in #text(red)[ref appendix].

Based on the in-situ lattice modulation measurement results @tab:modulation-evaluation-error and @tab:modulation-evaluation-error-other we know that the relative angle of the x-lattices and the y1064-lattice deviates by $#num[4.9(5)]degree$ from $90degree$.
In the theoretical model we assume that the y1064-lattice is perfectly parellel to the $y$-axis, and the x-lattices have an angle of $alpha = #num[4.9]degree$ relative to the $x$-axis.
#text(red)[Mention here again that this is easier than two angles? Or just mention this in the appendix?]
This is only the relevant angle in the $x y$-plane, but the $x$-lattices also have an angle relative to the $x y$-plane #text(red)[ref figure setup/x-lattices].
This will also cause a coupling between the $x$-lattices and the z532-lattice (which is perfectly parallel to the $x y$-plane).
There is no coupling between the y1064-lattice and the z532-lattice since the two lattice vectors are perfectly perpendicular.

This section will only address the coupling between the x1064-lattice and the y1064-lattice in detail.
The effects of the coupling between the x1064-lattice and the z532-lattice will only be covered briefly to get the relevant results.
How the coupling affects the x-superlattice will be addressed in #text(red)[ref section modulation/superlattice].
Since we only ever use the x532-lattice together with the x1064-lattice, we don't have to address the individual coupling of the x532-lattice with the (almost) perpendicular lattices.

As explained in #text(red)[ref appendix] an angle $alpha != 0$ introduces a coupling between the x1064-lattice and the y1064-lattice.
Such a coupling allows bands with different indices $(n_x, n_y)$ to mix.
#text(red)[First show the case of the $(2, 1)$ here since it is much easier to understand? Or show this in the appendix in detail?]
#text(red)[The coupling is strongest when the "total" band index $n_x + n_y$ is conserved (#text(red)[Why? mention the zero-coupling between $(3, 1)$ and $(2, 3)$?]) and it gets gradually weaker with the "distance" of the coupling.]
We will first look at the coupling of the band $(3, 1)$.
The same approach can however be used for other bands in the two-dimensional coupled lattice.
We will use this at the end of this section in #text(red)[ref subsection] to explain the "dip" in the resonance contrast shown in @fig:modulation-loss-recovery.

In the case of the band $(3, 1)$ that we use as the (first) excited band in the in-situ lattice modulation measurements, the coupling will cause a mixture with the bands $(2, 2)$ and $(1, 3)$.
We will look at this case in detail here for $v_x = #qty[60][Erec]$ to figure out the correction we have to apply to the result we obtain from the in-situ lattice modulation spectroscopy measurements.
Compared to the example before (#text(red)[or in the appendix]) the coupling of these three bands is quite complex since they overlap for a similar lattice depth $v_y$.
We are therefore dealing with an avoided crossing of three states that/which are all coupled (#text(red)[this is automatically the case if two states couple?]).
Overlapping the (mean) energies of the coupled bands with the (mean) energies of the uncoupled bands already helps a lot to understand the effect of the coupling on the in-situ results #text(red)[ref figure...].
If we want to get into the details of the coupling, we can also look at the composition of the coupled eigenstates in the basis of the uncoupled ones #text(red)[ref figure...].

Working with a two-dimensional band structure comes with a certain difficulty regarding the ordering and labeling of the energy bands.
In one dimension the energy bands will never "cross" during a "scan" of the quasi-momentum $q$, and the band index can only be incremented starting from $n = 1$.
In two dimensions neither of those two assumptions can be used.
Since the Bloch Hamiltonian (#text(red)[ref any eq from appendix?]) is diagonalized individually for each quasi-momentum $q$, the eigenvalues will not be sorted correctly when two bands cross in the interval $q = [-pi, pi]$.
We therefore have to sort the eigenvalues and eigenstates before analyzing them further #text(red)[ref appendix. Should I really already mention this? Or wait for the transition $3 -> 6$?]
And regarding the band indicies we only know that the lowest eigenstate is the band $(n_x, n_y) = (1, 1)$.
The indices of the higher bands have to be inferred from the eigenvalues or eigenstates #text(red)[ref appendix].
While the sorting can also be applied to the coupled eigenvalues and eigenstates, the labeling of the bands only works for the uncoupled system.
Due to the coupling we can not assign definitive band indices to the eigenstates anyway since we expect mixtures of the uncoupled eigenstates.
Instead we can look at the composition of the coupled bands in terms of the uncoupled bands to understand how the mixing works.

In the left axis in @fig:modulation-coupled-band-31 the coupling of the aforementioned bands at $v_x = #qty[60][Erec]$ is shown as a function of the lattice depth $v_y$.
While we want to use the transition to the state $"n31"$ we are "automatically" addressing the coupled state $psi_c$.
Since the transition frequency to that state/band increases as a function of the lattice depth $v_y$, we have to correct the depth parameter $a_0$ that we obtain from the evaluation as described in @sec:modulation-evaluation.
This is still true at $v_y = #qty[30][Erec]$ where we usually calibrate the depth of the x1064-lattice.
The correction we need to apply at that lattice depth is $~1%$ which is greater than the estimated error of the lattice depth by one order of magnitude, see @tab:modulation-evaluation-error.
While the required correction would further decrease by reducing the lattice depth $v_y$, this would also increase the tunneling amplitude along the y1064-lattice.
At $v_y = #qty[20][Erec]$ the tunneling amplitude is already $t slash h approx #qty[10][Hz]$.
If the atoms can tunnel over a significant distance during the lattice modulation, the resonances will "move" in the atom cloud and therefore falsify the evaluated signal.
#text(red)[
  Look at $t$ as a function of $v_y$ (in a notebook).
  Maybe $v_y = #qty[40][Erec]$ is actually the "ideal" configuration?
  According to the measurements from 2024-10-25, the resonance lines are straight up to #qty[36][Erec]. This also agrees with the different evalutions shown in @fig:modulation-coupled-band-31.
]

#figure(
  grid(
    columns: 2,
    image("../../figures/modulation_coupling_mixture_band_31.png"),
    image("../../figures/modulation_coupling_measurement_band_31.png"),
  ),
  caption: [
    Coupling of the bands $(3, 1)$, $(2, 2)$ and $(1, 3)$.
    The lines in the axis on the left show the mean energy/frequency differences between the lowest band $(1, 1)$ and the respective uncoupled bands (black lines) and coupled bands (colored lines).
    While the uncoupled bands $(3, 1)$ and $(2, 2)$ already cross at $v_y approx #qty[50][Erec]$, the crossing of the bands $(3, 1)$ and $(1, 3)$ is at $v_y = #qty[60][Erec]$ (as expected).
    On the right the state $psi_a$ is already converted into an effective lattice depth and shown as the "theory" for the data points.
    We evaluated the data points twice with different masks since we are getting curved/elliptical resonances at $v_y > #qty[40][Erec]$.
    By only evaluating the resonances near the center, we are reducing/eliminating the systematic error due to the curved resonances.

    - #text(red)[Add a third axis to show the "accessibility" of the states $psi_?$ from (1, 1)?]
    - #text(red)[Increase sampling to get rid of the kinks in $psi_a$]
    - #text(red)[Add insets to show some curved/elliptical resonances?]
    - #text(red)[Add an error estimation to the different masks?]
  ],
) <fig:modulation-coupled-band-31>

The axis on the RHS in @fig:modulation-coupled-band-31 shows a measurement of the lattice depth at $v_x = #qty[60][Erec]$ with variable lattice depth $v_y$.
Since the evaluation assumes the theory as shown by the line $"n31"$ in the axis on the left, the increase of the transition frequency as a function of $v_y$ will be intrepreted as an increase of the lattice depth $a_0$.
The y-axis is scaled such that the effective lattice depth $1.0$ corresponds to the uncoupled theory.
Starting at $v_y approx #qty[40][Erec]$ we can see a strong increase of the correction factor.
#text(red)[While this is not problematic itself, this increase goes hand-in-hand with the coupling to the band $(1, 3)$ which results in curved/elliptical resonances]
For the evaluation it would be best to eliminate the additional complexity of non-straight resonances.
If we have to apply a mask to only select the "straight" portion of the resonances, we significantly reduce the data we use from each atom image.
And an evaluation with the coupled band structure theory is not practical because of the complexity of the theory and fit compared to the one-dimensional band structure theory.
The best approach is therefore to use the highest lattice depth $v_y$ that has a negligible contribution of the uncoupled band $"n13"$ in the coupled band $psi_c$.


=== Two-tone modulation <ssec:modulation-coupled-two-tone>

#[
  #set text(red)
  - Move figure @fig:modulation-loss-recovery and the corresponding text here?
  - And then move everything into its own section?
  - Discuss whether $f_1 + f_2$ or $f_1 -> f_2$ is better?
  - Mention that only band $(6, 1)$ is discussed. Band $(7, 1)$ will be equivalent...
  - Mention that the lattice depth compensation is already applied here...
]

We already confirmed in @sec:modulation-loss and specifically in @fig:modulation-loss-recovery that a second modulation frequency can recover the in-situ signal.
The band structures from the one-dimensional theory could however not explain the additional gaps we could see inside of the untrapped bands.
After understanding the coupling of the bands due to the finite angle $alpha$ we could maybe explain such a gap by a mixture of the band $(6, 1)$ with the bands $(5, 2)$ or $(4, 3)$?
In @fig:modulation-coupled-band-31 the widths of the bands were much smaller than the coupling between the bands.
We could therefore directly look at the mean energy of each band.
When dealing with the highly excited bands in this subsection, this approach is no longer valid.
We therefore have to look at the coupled band structure and compare it to the uncoupled one.
We are doing this again for different depths of the y1064-lattice around $v_y = #qty[30][Erec]$ to confirm that the measurements accurately represent/confirm the changes in the coupled band structure.
In addition we want to find the optimal configuration where the additional band gaps do not interfere with the two-tone lattice modulation.

When we compare the uncoupled band structure to the coupled one in @fig:modulation-coupled-two-tone-theory, we can indeed see that the bands $(5, 2)$, $(4, 3)$ and $(3, 4)$ are causing the new band gaps.
Since the coupling strength decreases with the "band index distance", the band gap from/with the band $(3, 4)$ is tiny and we are not able to resolve it during the two-tone lattice modulation.
#text(red)[Is the band gap just proportional to the width of the coupling band?]
Initially at $v_y = #qty[25][Erec]$ only the band $(5, 2)$ overlaps with our target band $(6, 1)$, causing a single gap to open up.
The gap caused/created by the band $(4, 3)$ only becomes prominent at $v_y = #qty[35][Erec]$, where it splits the band $(6, 1)$ roughly in half.
At $v_y = #qty[40][Erec]$ the uncoupled band structure suggests that there is a three-way coupling similar to @fig:modulation-coupled-band-31.
Since the bands $(5, 2)$ and $(4, 3)$ also couple with eachother, the two gaps in the band $(6, 1)$ are further apart than one would expect from the uncoupled band structure. are further apart than one would expect from the uncoupled band structure.

#figure(
  image("../../figures/2025-01-29_two-tone_PH_x1064_bandstructure_70Erec.png", width: 85%),
  caption: [
    Coupled band structure around the excited band $(6, 1)$.
    The axes show the transition frequencies relative to the band $(3, 1)$ since this is the initial state of the atoms after the modulation with the frequency $f_(1 -> 3)$.
    The "slope" of the uncoupled bands is increasing $prop (n_y - 1)$ since the reference band has $n_y = 1$.

    - #text(red)[Move this into one row similar to @fig:modulation-coupled-band-31?]
    - #text(red)[Also include $v_y = #qty[20][Erec]$ to make it symmetric around #qty[30][Erec]?]
    - #text(red)[Completely hide bands that are not relevant for the band gaps?]
    - #text(red)[Also color the band $(3, 4)$ that creates the band gap at #qty[40][Erec]?]
  ],
) <fig:modulation-coupled-two-tone-theory>

The positions/frequencies of the band gaps in @fig:modulation-coupled-two-tone-theory depend on the lattice depth $v_y$.
We can use this signal to confirm that the band gap we initially observed in @fig:modulation-loss-recovery is actually caused by the coupling to the band $(5, 2)$.
Furthermore we can try to find an optimal lattice depth configuration where the additional band gaps would not interfere with the two-tone lattice modulation.
Ideally we want to use a single secondary frequency $f_2$ to cover the entire scan of the principal frequency $f_(1->3)$ across the atom cloud.
If a specific frequency $f_2$ is required for each principle frequency, the two-tone modulation scheme would not be practical.

#figure(
  image("../../figures/2025-01-29_two-tone_PH_x1064_result_70Erec.png"),
  caption: [
    Band gaps in the two-tone lattice modulation scheme.
    The axes in the first row show the uncoupled bands $(6, 1)$ and $(7, 1)$ in black and the coupled bands in solid colors.
    All other/irrelevant bands are hidden on purpose.
    The x-axis shows the secondary modulation frequency $f_2$ from the principal modulation frequency $f_(1->3)$ up to the lower end of the band $(7, 1)$.
    The colored areas mark the "valid" frequency intervals according to the coupled band structure.
    We can clearly see the additional band gaps inside the "original" band $(6, 1)$.
    The data points show the resonance amplitudes $"r13fa"$ from invididual two-tone modulation measurements.
    Note that a large amplitude corresponds to a significant/strong loss of atoms.

    - #text(red)[Add transition $1 -> 3$ here in solid black?]
    - #text(red)[Use #qty[75][Erec] for this measurement.]
  ],
) <fig:modulation-coupled-two-tone-result>


For this measurement of the band gaps we use the same approach as in/for @fig:modulation-loss-recovery.
We scan $f_(1->3)$ across the atom cloud once to get a reference measurement.
During the scans of the lattice depth $v_y$ and the secondary modulation frequency $f_2$ we will then only measure a single frequency $f_(1->3)$ and use the fit parameters $a$ and $a_0$ from the reference measurement.
To find and understand the band gaps, we are only interested in the resonance parameters $"r13fa"$ (and $"r13fw"$) anyway.

We can see a nice/perfect match of the data points in @fig:modulation-coupled-two-tone-result to the theoretical band gaps.
The resonance amplitudes are decreased by a factor $2$ in the "coupled" band gaps as well as the "uncoupled" band gaps.
In terms of the efficiency of the two-tone lattice modulation we therefore have to be equally careful to avoid the different kinds of band gaps.

#text(red)[Completely rewrite this when the data with $v_y = #qty[75][Erec]$ is used!]
For each lattice depth $v_y$ there is a gapless interval of $~ #qty[10][kHz]$ that can be used for the two-tone lattice modulation.
If we use the recommended lattice depth $v_y = #qty[35][Erec]$ from the earlier considerations in @sec:modulation-coupled regarding the coupling of the band $(3, 1)$ and the tunneling along the y1064-lattice, the most suitable secondary modulation frequency would be $f_2 approx #qty[135][kHz]$.
There is only a tiny band gap that ever crosses that frequency such that we can expect a uniform resonance amplitude $"r13fa"$.

#text(red)[
  Add a plot here that shows the (mean) band gaps in an actual scan of $v_y$?
  This would not require $q$-resolution and the figure could look similar to @fig:modulation-coupled-band-31.
  How could I also include the scan of $v_x$ that naturally happens during the in-situ lattice modulation?
  Also show an actual measurement here that confirms these parameters?
]
