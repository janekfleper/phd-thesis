#import "../../header.typ": *

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
  According to the measurements from 2024-10-25, the resonacne lines are straight up to #qty[36][Erec]. This also agrees with the different evalutions shown in @fig:modulation-coupled-band-31.
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
