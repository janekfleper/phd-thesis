#import "/header.typ": *

== Coupled band structure <sec:mod-coupled>

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
In the range $#qty[40][Erec] < v_y <= #qty[50][Erec]$ we can a significant increase of the expected correction factor $fita0$ and the measured one.
The measured correction factors are however slightly too small compared to the coupled band $tilde(epsilon)_c$.
At the same time, the waist increases from #qty[145][μm] to #qty[170][μm] and its uncertainty increases as well.
This shows the breakdown of the evaluation with the uncoupled theory close to the first avoided crossing at $v_y = #qty[50][Erec]$.
To understand this, we will consider the coupled theory as a function of the lattice depth $v_x$ at a constant lattice depth $v_y$.
The correction factor $fita0$ will increase as the local lattice depth $v_x (x, y)$ decreases towards the outside of the atom cloud.
Since the evaluation assumes a global correction factor $fita0$, this will result in an increase of the waist $w_0$ instead.
We could only overcome this limitation by directly using the coupled band structure as the theory for the evaluation.
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
    The shaded areas show the expected correction factors for the coupled bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$ computed with $v_x = #qty[58.9][Erec]$ and $theta = (#num[-4.9(5)])degree$.
    We selected the modulation frequencies to only cover the expected transitions to the bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$, the intermediate band $tilde(epsilon)_b$ is therefore not shown here.
    The lattice depth $v_x$ was selected to match the theory at $v_y = #qty[30][Erec]$, which is the usual lattice depth for the in-situ lattice modulation measurements.
    The $y$ axis is rescaled to get the correction factor $fita0 = 1.0$ at $v_y = #qty[0][Erec]$.
    *b* shows the average waist $w_0$ from the evaluation of the individual atom images.
    The horizontal line and the shaded area show the measured waist from the most recent lattice-depth calibration.

    #show list: set text(red)
    - Synchronize colors with @fig:mod-eval-x1064-result and @fig:mod-coupled-theory!
    - Show the evaluation mask in the insets?
    - Add legend for the coupled bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$.
    - Mention that/why manually selecting the lattice depth $v_x$ is required?
    - Show the band $tilde(epsilon)_b$ anyway?
    - Mention the number of average sets?
  ],
) <fig:mod-coupled-result>

Regarding the resonance #tr[contrast/visibility], the atom images at $v_y > #qty[60][Erec]$ are generally worse than the atom images at $v_y < #qty[60][Erec]$.
Qualitatively, we can see the reduced #tr[contrast/visibility] of the resonances in the insets of #subref(<fig:mod-coupled-result>, "a").
We interpret this to be a consequence of the stronger confinement along the $x$ axis, which results in a reduced atom loss.
With an increased modulation amplitude $delta v$, we could potentially recover the resonance #tr[contrast/visibility].
If we look at the theory of the coupled bands $tilde(epsilon)_a$ and $tilde(epsilon)_c$, we can see that the former one is wider.
This is a direct consequence of the uncertainty of the relative angle $theta.alt$.
The range $#qty[25][Erec] < v_y < #qty[40][Erec]$ is therefore the most suitable for the lattice-depth calibration.
We can get consistent results for the waist $w_0$ and the uncertainty of the correction factor $fita0$ due to the angle $theta.alt$ is minimal.
For $v_y < #qty[25][Erec]$ we can find another avoided crossing in the coupled band structure.
The uncoupled bands with the indices $phy.vb(n) = (3, 1)$ and $phy.vb(n) = (2, 3)$ have the same energy at $v_y approx #qty[20][Erec]$.
Due to the difference of $Delta n_y = 2$, the coupling is however weaker than in @fig:mod-coupled-theory.
We would nevertheless like to avoid running the calibration close to an avoided crossing.
Both the correction factor $fita0$ as well as the waist $w_0$ at $v_y = #qty[20][Erec]$ suggest that this can affect the measurement.

The coupling of the band structures also affects the shape of the resonances close to the avoided crossings.
In the insets in #subref(<fig:mod-coupled-result>, "a") we can observe an elliptical resonance at $v_y = #qty[50][Erec]$.
If both lattices have the same depth #qty[60][Erec], the resonances can even become circular.
We can explain this behavior with the change of the transition frequency as a function of the local lattice depth $v_y (x)$.
At a constant lattice depth $v_x$, the transition frequency will decrease towards the outer parts of the atom cloud.
Since we apply a constant modulation frequency, the position of the resonances is changed instead.
From the perspective of the x1064 lattice the resonances move towards its optical axis, indicating an effectively lower lattice depth $v_x$ as a function of the position $x$.
#tr[Anything else to add here?]
