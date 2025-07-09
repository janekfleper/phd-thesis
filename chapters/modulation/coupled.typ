#import "/header.typ": *

== Coupled lattices <sec:mod-coupled>

#[
  #set text(red)
  - Mention the coupling of the x1064 lattice and the z532 lattice?
  - Where to introduce the general band index $eta$?
  - Use $tilde(epsilon)$ to mark the coupled band structure?
  - Compute the tunneling in the coupled band structure?
  - Use $v_(x 1064)$ and $v_(y 1064)$ everywhere?
]

Throughout this chapter, I have already mentioned that the coupling of the x1064 lattice #tr[and/to] the y1064 lattice can affect the band structure.
Using a depth of #qty[60][Erec] for the modulated lattice and a depth of #qty[30][Erec] for the other lattice was decided based on the empirical understanding of the coupling of the lattices.
// If both lattices were set to a similar depth, we could observe a crosstalk in the calibration measurements.
Thanks to the in-situ lattice modulation spectroscopy we can now investigate this coupling in detail.
The precision of the lattice-depth measurement will show that the coupling is still present even if we use the lattice depths of #qty[60][Erec] and #qty[30][Erec].
Furthermore, the local loss of the atoms can visualize the coupled band structure with elliptical and circular resonances.
In this section, I will only show the coupled band structure that is directly related to the results of the in-situ lattice modulation spectroscopy.
The step-by-step calculation and the technical details of the coupled band structure are shown in #tr[ref appendix].

Based on the in-situ lattice modulation measurement results @tab:mod-eval-results we know that the x1064 lattice and the y1064 lattice are not perpendicular in the $x y$ plane.
Their angle of intesection deviates by $theta.alt = (#num[-4.9(5)])degree$ from orthogonality, which results in a coupling of the band structures.
The coupled energy bands $tilde(epsilon)_eta (q_x, q_y)$ are now two-dimensional functions of the quasimomenta $q_x$ and $q_y$ with a general band index $eta$.
We can not use the uncoupled indices $n_x$ and $n_y$ as labels anymore, we can however interpret the coupled bands as superpositions of the uncoupled bands $epsilon_phy.vb(n) (q_x, q_y)$ with $phy.vb(n) = (n_x, n_y)$.
For the transition $1 -> 3$, we now have to consider all bands with an energy close to the uncoupled band with index $phy.vb(n) = (3, 1)$.
If the two lattices have a similar depth, the relevant uncoupled bands will be $(2, 2)$ and $(1, 3)$.
In #subref(<fig:mod-coupled-theory>, "d") we can see the coupled bands $tilde(epsilon)_eta$ as a function of the lattice depth $v_y$#footnote[#tr[Where to add this footnote?] The two lattice depths are interchangeable, the coupling is only computed from the angle of intersection.].
The uncoupled bands intersect at $v_y approx #qty[50][Erec]$, at $v_y = #qty[60][Erec]$ and at $v_y = #qty[70][Erec]$.
At each intersection, the corresponding coupled bands show the signature of an avoided crossing.
The composition of the coupled bands in #subref(<fig:mod-coupled-theory>, "a-c") shows how the superpositions evolve with the lattice depth $v_y$.

#figure(
  image("figures/modulation_coupled_theory.png", width: 85%),

  caption: [
    Theory of the band transition $1 -> 3$ in coupled lattices.
    The lattice parameters are $v_x = #qty[60][Erec]$ and $theta.alt = #num[-4.9]degree$.
    In *d* the transition frequencies of the coupled bands $tilde(epsilon)_eta$ (colored lines) and the uncoupled bands $epsilon_phy.vb(n)$ (black lines) are shown.
    The band structure is computed with the quasimomenta $phy.vb(q)$ along the x1064-lattice vector $phy.vb(a)$.
    Since the widths of the bands are small compared to the transition frequency, only the average of the coupled bands $tilde(epsilon)_eta (phy.vb(q))$ and the uncoupled bands $epsilon_phy.vb(n) (phy.vb(q))$ in quasimomentum space is used.
    The transition frequencies are computed relative to the lowest band $phy.vb(n) = (1, 1)$ which is the initial state before the lattice modulation.
    In *a* to *c* we can see the composition of the coupled bands in the uncoupled basis as we would expect for a triple avoided crossing.

    #show list: set text(red)
    - Directly label the coupled bands and remove the second legend?
    - Reverse order of *a* to *c*?
    - Find a better position for the uncoupled legend
    - Is the band width actually negligible for (1, 3)?
    - Find a better y-axis label for *a* to *c*?
    - Add the accessibility with the lattice modulation as an alpha channel in *d*?
  ],
) <fig:mod-coupled-theory>

For the in-situ lattice modulation spectroscopy, we need to look at the contribution of the uncoupled band with index $phy.vb(n) = (3, 1)$ to the coupled bands $tilde(epsilon)_eta$.
If the x1064-lattice depth is modulated, the transition $(1, 1) -> (3, 1)$ will still be the strongest one due to the perturbation of the wave functions.
As long as we set $v_y < #qty[40][Erec]$, we will mainly be able to excite the atoms to the coupled band $tilde(epsilon)_c$.
This includes the configuration with $v_y = #qty[30][Erec]$ that we use by default for the modulation of the x1064 lattice.
At $v_y > #qty[70][Erec]$, the coupled band $tilde(epsilon)_a$ will then show the strongest transition.
In the intermediate regime for $v_y$, we can also see a contribution in the coupled band $tilde(epsilon)_b$.
For the in-situ lattice modulation spectroscopy, we would like to select a configuration where we only target a single excited band.
If there are multiple accessible transitions, the association to the resonances in the atom cloud can be ambiguous.
Furthermore, we would be forced to use the coupled band structure theory for the evaluation if there are different resonances visible at the same modulation frequency.
We should therefore avoid the intermediate regime $#qty[40][Erec] < v_y < #qty[70][Erec]$ alltogether.
There are at least two, sometimes even three, pairs of resonances possible with rapidly varying amplitudes.

To measure the coupled band structure, we are applying the modulation to the x1064 lattice as introduced in @sec:mod-intro.
We are using the uncoupled band structure for the evaluation, and therefore expect the correction factor $fita0$ to follow the transition frequencies to the coupled bands in #subref(<fig:mod-coupled-theory>, "d").
Directly using the coupled band structure evaluation for the evaluation is not practical.
The computation takes a long time, and a manual identification of the coupled bands $tilde(epsilon)_eta$ can be necessary depending on the lattice depths $v_x$ and $v_y$.
In #subref(<fig:mod-coupled-result>, "a") we can see the result of the evaluation compared to the coupled bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$.
For $v_y < #qty[40][Erec]$ the correction factor $fita0$ deviates by less than #qty[1][%] from the uncoupled band structure.
In this regime, the measurement matches the theory, and the waist $w_0$ in #subref(<fig:mod-coupled-result>, "b") shows consistent results.
In the range $#qty[40][Erec] < v_y < #qty[60][Erec]$ we can a significant increase of the expected correction factor $fita0$ and the measured one.
The measured correction factors are however slightly too small compared to the coupled band $tilde(epsilon)_c$.
At the same time, the waists increases from #qty[145][μm] to #qty[170][μm].
This shows the breakdown of the evaluation with the uncoupled theory close to the first avoided crossing at $v_y = #qty[50][Erec]$.
To understand this we have to consider the coupled theory as a function of the lattice depth $v_x$ at a constant lattice depth $v_y$.
If we set $v_y = #qty[50][Erec]$, the correction factor $fita0$ will increase as the local lattice depth $v_x (x, y)$ decreases towards the outside of the atom cloud.
This will slow down the decrease of the transition frequencies away from the center of the atom cloud.
Since the evaluation assumes a global correction factor $fita0$, it will show a larger waist $w_0$ instead.
This limitation could only be overcome by directly using the coupled band structure as the theory for the evaluation.

At $v_y > #qty[60][Erec]$, we can see the results of the transition to the coupled band $tilde(epsilon)_a$.
The correction factor $fita0$ matches the theory, and the waists are consistent with the expected waist apart from the measurement at $v_y = #qty[70][Erec]$.
Since that measurement is closest to the avoided crossing at $v_y = #qty[60][Erec]$, we can understand the increased waist as a breakdown of the evaluation again.


#figure(
  image("figures/modulation_coupled_result.png", width: 100%),

  caption: [
    Lattice-depth calibration in the coupled band structure.
    The measurement was done with $v_x = #qty[60][Erec]$ and $t_"mod" = #qty[0.75][s]$.
    We apply a mask to the images such that we only select the pixels $#qty[-10][μm] < x < #qty[10][μm]$, and the data points show the mean value and the corresponding uncertainty based on the evaluation procedure introduced in @ssec:mod-eval-error.
    *a* shows the correction factor $fita0$ evaluated with the uncoupled band structure.
    The shaded areas then show the expected correction factors for the coupled bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$ computed with $v_x = #qty[58.9][Erec]$ and $theta = (#num[-4.9(5)])degree$.
    The lattice depth $v_x$ was selected to match the theory at $v_y = #qty[30][Erec]$, which is the usual lattice depth for the in-situ lattice modulation measurements.
    We selected the modulation frequencies to only cover the expected transitions to the bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$.
    The intermediate band $tilde(epsilon)_b$ is therefore not shown.


    // *a* shows the correction factor $fita0$

    #show list: set text(red)
    - Synchronize colors with @fig:mod-eval-x1064-result and @fig:mod-coupled-theory!
    - Show the evaluation mask in the insets?
    - Add legend for the coupled bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$.
    - Mention that/why manually selecting the lattice depth $v_x$ is required?
    - Show the band $tilde(epsilon)_c$ anyway?
  ],
) <fig:mod-coupled-result>


#pagebreak()

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

In the left axis in @fig:mod-coupled-band-31 the coupling of the aforementioned bands at $v_x = #qty[60][Erec]$ is shown as a function of the lattice depth $v_y$.
While we want to use the transition to the state $"n31"$ we are "automatically" addressing the coupled state $psi_c$.
Since the transition frequency to that state/band increases as a function of the lattice depth $v_y$, we have to correct the depth parameter $a_0$ that we obtain from the evaluation as described in @sec:mod-eval.
This is still true at $v_y = #qty[30][Erec]$ where we usually calibrate the depth of the x1064-lattice.
The correction we need to apply at that lattice depth is $~1%$ which is greater than the estimated error of the lattice depth by one order of magnitude, see @tab:mod-eval-results.
While the required correction would further decrease by reducing the lattice depth $v_y$, this would also increase the tunneling amplitude along the y1064-lattice.
At $v_y = #qty[20][Erec]$ the tunneling amplitude is already $t slash h approx #qty[10][Hz]$.
If the atoms can tunnel over a significant distance during the lattice modulation, the resonances will "move" in the atom cloud and therefore falsify the evaluated signal.
#text(red)[
  Look at $t$ as a function of $v_y$ (in a notebook).
  Maybe $v_y = #qty[40][Erec]$ is actually the "ideal" configuration?
  According to the measurements from 2024-10-25, the resonance lines are straight up to #qty[36][Erec]. This also agrees with the different evalutions shown in @fig:mod-coupled-band-31.
]

#figure(
  grid(
    columns: 2,
    image("figures/modulation_coupling_mixture_band_31.png"),
    image("figures/modulation_coupling_measurement_band_31.png"),
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
) <fig:mod-coupled-band-31>

The axis on the RHS in @fig:mod-coupled-band-31 shows a measurement of the lattice depth at $v_x = #qty[60][Erec]$ with variable lattice depth $v_y$.
Since the evaluation assumes the theory as shown by the line $"n31"$ in the axis on the left, the increase of the transition frequency as a function of $v_y$ will be intrepreted as an increase of the lattice depth $a_0$.
The y-axis is scaled such that the effective lattice depth $1.0$ corresponds to the uncoupled theory.
Starting at $v_y approx #qty[40][Erec]$ we can see a strong increase of the correction factor.
#text(
  red,
)[While this is not problematic itself, this increase goes hand-in-hand with the coupling to the band $(1, 3)$ which results in curved/elliptical resonances]
For the evaluation it would be best to eliminate the additional complexity of non-straight resonances.
If we have to apply a mask to only select the "straight" portion of the resonances, we significantly reduce the data we use from each atom image.
And an evaluation with the coupled band structure theory is not practical because of the complexity of the theory and fit compared to the one-dimensional band structure theory.
The best approach is therefore to use the highest lattice depth $v_y$ that has a negligible contribution of the uncoupled band $"n13"$ in the coupled band $psi_c$.


=== Two-tone modulation <ssec:mod-coupled-two>

#[
  #set text(red)
  - Move figure @fig:mod-loss-channels and the corresponding text here?
  - And then move everything into its own section?
  - Discuss whether $f_1 + f_2$ or $f_1 -> f_2$ is better?
  - Mention that only band $(6, 1)$ is discussed. Band $(7, 1)$ will be equivalent...
  - Mention that the lattice depth compensation is already applied here...
]

We already confirmed in @sec:mod-loss and specifically in @fig:mod-loss-channels that a second modulation frequency can recover the in-situ signal.
The band structures from the one-dimensional theory could however not explain the additional gaps we could see inside of the untrapped bands.
After understanding the coupling of the bands due to the finite angle $alpha$ we could maybe explain such a gap by a mixture of the band $(6, 1)$ with the bands $(5, 2)$ or $(4, 3)$?
In @fig:mod-coupled-band-31 the widths of the bands were much smaller than the coupling between the bands.
We could therefore directly look at the mean energy of each band.
When dealing with the highly excited bands in this subsection, this approach is no longer valid.
We therefore have to look at the coupled band structure and compare it to the uncoupled one.
We are doing this again for different depths of the y1064-lattice around $v_y = #qty[30][Erec]$ to confirm that the measurements accurately represent/confirm the changes in the coupled band structure.
In addition we want to find the optimal configuration where the additional band gaps do not interfere with the two-tone lattice modulation.

When we compare the uncoupled band structure to the coupled one in @fig:mod-coupled-two-theory, we can indeed see that the bands $(5, 2)$, $(4, 3)$ and $(3, 4)$ are causing the new band gaps.
Since the coupling strength decreases with the "band index distance", the band gap from/with the band $(3, 4)$ is tiny and we are not able to resolve it during the two-tone lattice modulation.
#text(red)[Is the band gap just proportional to the width of the coupling band?]
Initially at $v_y = #qty[25][Erec]$ only the band $(5, 2)$ overlaps with our target band $(6, 1)$, causing a single gap to open up.
The gap caused/created by the band $(4, 3)$ only becomes prominent at $v_y = #qty[35][Erec]$, where it splits the band $(6, 1)$ roughly in half.
At $v_y = #qty[40][Erec]$ the uncoupled band structure suggests that there is a three-way coupling similar to @fig:mod-coupled-band-31.
Since the bands $(5, 2)$ and $(4, 3)$ also couple with eachother, the two gaps in the band $(6, 1)$ are further apart than one would expect from the uncoupled band structure. are further apart than one would expect from the uncoupled band structure.

#figure(
  rect(),
  // image("figures/2025-01-29_two-tone_PH_x1064_bandstructure_70Erec.png", width: 85%),
  caption: [
    Coupled band structure around the excited band $(6, 1)$.
    The axes show the transition frequencies relative to the band $(3, 1)$ since this is the initial state of the atoms after the modulation with the frequency $f_(1 -> 3)$.
    The "slope" of the uncoupled bands is increasing $prop (n_y - 1)$ since the reference band has $n_y = 1$.

    - #text(red)[Move this into one row similar to @fig:mod-coupled-band-31?]
    - #text(red)[Also include $v_y = #qty[20][Erec]$ to make it symmetric around #qty[30][Erec]?]
    - #text(red)[Completely hide bands that are not relevant for the band gaps?]
    - #text(red)[Also color the band $(3, 4)$ that creates the band gap at #qty[40][Erec]?]
  ],
) <fig:mod-coupled-two-theory>

The positions/frequencies of the band gaps in @fig:mod-coupled-two-theory depend on the lattice depth $v_y$.
We can use this signal to confirm that the band gap we initially observed in @fig:mod-loss-channels is actually caused by the coupling to the band $(5, 2)$.
Furthermore we can try to find an optimal lattice depth configuration where the additional band gaps would not interfere with the two-tone lattice modulation.
Ideally we want to use a single secondary frequency $f_2$ to cover the entire scan of the principal frequency $f_(1->3)$ across the atom cloud.
If a specific frequency $f_2$ is required for each principle frequency, the two-tone modulation scheme would not be practical.

#figure(
  rect(),
  // image("figures/2025-01-29_two-tone_PH_x1064_result_70Erec.png"),
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
) <fig:mod-coupled-two-result>


For this measurement of the band gaps we use the same approach as in/for @fig:mod-loss-channels.
We scan $f_(1->3)$ across the atom cloud once to get a reference measurement.
During the scans of the lattice depth $v_y$ and the secondary modulation frequency $f_2$ we will then only measure a single frequency $f_(1->3)$ and use the fit parameters $a$ and $a_0$ from the reference measurement.
To find and understand the band gaps, we are only interested in the resonance parameters $"r13fa"$ (and $"r13fw"$) anyway.

We can see a nice/perfect match of the data points in @fig:mod-coupled-two-result to the theoretical band gaps.
The resonance amplitudes are decreased by a factor $2$ in the "coupled" band gaps as well as the "uncoupled" band gaps.
In terms of the efficiency of the two-tone lattice modulation we therefore have to be equally careful to avoid the different kinds of band gaps.

#text(red)[Completely rewrite this when the data with $v_y = #qty[75][Erec]$ is used!]
For each lattice depth $v_y$ there is a gapless interval of $approx #qty[10][kHz]$ that can be used for the two-tone lattice modulation.
If we use the recommended lattice depth $v_y = #qty[35][Erec]$ from the earlier considerations in @sec:mod-coupled regarding the coupling of the band $(3, 1)$ and the tunneling along the y1064-lattice, the most suitable secondary modulation frequency would be $f_2 approx #qty[135][kHz]$.
There is only a tiny band gap that ever crosses that frequency such that we can expect a uniform resonance amplitude $"r13fa"$.

#text(red)[
  Add a plot here that shows the (mean) band gaps in an actual scan of $v_y$?
  This would not require $q$-resolution and the figure could look similar to @fig:mod-coupled-band-31.
  How could I also include the scan of $v_x$ that naturally happens during the in-situ lattice modulation?
  Also show an actual measurement here that confirms these parameters?
]
