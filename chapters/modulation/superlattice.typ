#import "/header.typ": *

== Application to the superlattice potential <sec:mod-super>

#notes[
  - Check the coupled lattice theory for the superlattice?
  - Discuss using the transition $1 -> 2$ for the x532 lattice instead?
  - Already reference this section earlier when introducing the x532-lattice? With a maximum lattice depth of #qty[20][Erec] we have to rely on the superlattice modulation to measure the lattice depth $V_s$.
  - Mention why the x1064 lattice could not be calibrated with the superlattice transition $1 -> 4$?
  - Discuss the avoided crossings in @fig:mod-super-scaling?
  - Actually include any alignment stuff in this section? Or just add a short reference to @sec:mod-align to mention that the x532-lattice is more sensitive etc...?
  - Mention expected x532-lattice waist based on the optical setup?
]

The standalone calibration of the x532 lattice with the in-situ lattice modulation spectroscopy is not possible due to the maximum lattice depth of $Vx532 = #qty[20][Erec]$.
In @sec:mod-intro we concluded that the width of the excited band $n' = 3$ would already start to limit the precision of the calibration at $Vx532 < #qty[40][Erec]$.
At $Vx532 = #qty[20][Erec]$, the mean transition frequency is $f_(1->3) approx #qty[250][kHz]$ while the width of the band is $Delta band_3 slash h approx #qty[31][kHz]$.
A single resonance can therefore cover the entire atom cloud, making the in-situ lattice modulation spectroscopy impossible.
We are therefore using the superlattice potential along the $x$ axis to optimize and calibrate the x532-lattice depth.
The core principle of the in-situ lattice modulation spectroscopy does not change in a superlattice potential.
We need a narrow band with index $n'$ that can be excited from the lowest band via modulation of the lattice depth.
For the visibility of the resonances we also need a loss channel that works with the primary modulation frequency $f_"mod"$.
While the secondary modulation frequency in @sec:mod-loss could also be applied to a superlattice potential, we want to avoid this additional complexity if possible.
The difference compared to the lattice modulation in a monochromatic lattice potential arises from the multiple lattice parameters $V_l$, $V_s$ and $phi$.
In this section I will explain the additional theoretical considerations required for the in-situ superlattice modulation spectroscopy, focusing on the calibration of the x532-lattice depth.

The simplest configuration of the superlattice potential is obtained at the antisymmetric phase $phi = plus.minus pi slash 4$.
In that configuration, the depth of the lower well is effectively the sum $Vx1064 + Vx532$ of the two lattices.
This should minimize the width of the excited bands, which is desirable for the in-situ lattice modulation spectroscopy.
Nevertheless, we will look at the sensitivity of the band structure in the range of the superlattice phase $phi$ from #num[0] to $pi slash 4$.
Since we do not want to measure the phase $phi$ before the calibration of the x532-lattice depth, the change of the transition frequencies due to the phase $phi$ should be as small as possible.
As illustrated in #subref(<fig:mod-super-phase>, "a"), the band structure shows the least sensitivity around the antisymmetric configuration $phi = pi slash 4$ for all displayed bands.
We can therefore ignore small deviations up to $delta phi tilde.eq #qty[1][MHz]$ for the lattice-depth calibration.

In the antisymmetric phase configuration, we can now check the parity and the overlap of the Wannier functions to find the possible transitions.
Unlike in the monochromatic lattice, the parity of the Wannier functions does not always alternate with the band index $n$.
We therefore have to check the Wannier functions individually to determine their parity.
Furthermore, the double-well structure of the superlattice potential adds an additional condition for the selection of the transitions $1 -> n'$.
The Wannier function of the excited band $n'$ also has to be located in the lower well.
If the Wannier function is located in the upper well instead, the transition will be strongly suppressed due to a lack of spatial overlap.
In #subref(<fig:mod-super-phase>, "b") we can see that the transition $1 -> 4$ is the most suitable based on the parity and the position of the Wannier function.
This transition is in fact equivalent to the transition $1 -> 3$ we are using in the monochromatic lattices at $V = #qty[60][Erec]$.
The width of the fourth band is $Delta band_4 slash h approx #qty[0.4][kHz]$, which is sufficiently small compared to the transition frequency of $f_(1->4) approx #qty[270][kHz]$.
All conditions for the general lattice modulation discussed in @sec:mod-intro are therefore fulfilled.
To see the in-situ resonances, we also need to ensure that a loss channel $4 -> n''$ is available to actually remove the atoms from the trap.
If we add the modulation frequency $f_"mod" = #qty[270][kHz]$ to the energy of the fourth band, we find the band with index $n'' = 9$.
This is already the third untrapped band, ensuring that there is a loss channel available for a wide range of lattice depths #Vx1064 and #Vx532.

#floating-figure(
  image("figures/modulation_superlattice_phase.png", width: 90%),
  caption: [
    Phase configuration for the in-situ superlattice modulation.
    The lattice depths are set to $Vx1064 = #qty[60][Erec]$ and $Vx532 = #qty[18][Erec]$.
    *a* shows the sensitivity of the band structure to the phase $phi$.
    All bands either have a maximum or a minimum at the antisymmetric phase $phi = pi slash 4$, resulting in a minimal sensitivity.
    In *b* the superlattice potential (black) is shown for the antisymmetric phase.
    The Wannier functions are computed directly from the Bloch waves of the bands $n = 1$ to $n = 4$.
    Using the BPO mechanism introduced in @sec:theory-super is not necessary since none of the bands are close to each other.

    #notes[
      - Add a vertical line in *a* to show the configuration in *b*?
      - Use labels instead of a legend?
      - Hide the band energies in *b* and only show the Wannier functions?
      - Add arrow for the transition $1 -> 4$?
      - Explain why we are looking at Wannier functions instead of Bloch functions?
    ]
  ],
  label: <fig:mod-super-phase>,
)

Since the potential of the lower well at $phi = pi slash 4$ is effectively the sum of the individual lattices, the modulation of either lattice depth can drive the transition $1 -> 4$.
In terms of the transition strength, there is however a difference due to the lattice periods $a_(x 532)$ and $a_(x 1064)$.
Modulating the x532 lattice is more effective by a factor of $(a_(x 1064) slash a_(x 532))^2 = 4$.
We find that with a modulation time of $tau_"mod" = #qty[0.75][s]$, the required modulation amplitude to achieve a good visibility of the resonances is #tr[$delta V slash Vx532 approx ??%$].
When we scan the modulation frequency $f_"mod"$, we can see resonances moving across the atom cloud, just like in the monochromatic lattice shown in @fig:mod-intro-images.
While this does indicate the inhomogeneity of the effective lattice depth $Vx1064 + Vx532$, we need to check the scaling with the invidiual lattice depths.
If the transition frequency $f_(1->4)$ would primarily depend on #Vx1064, we should not use this transition to calibrate the x532-lattice depth.
Ideally, the transition frequency $f_(1->4)$ would only depend on #Vx532 while being insensitive to #Vx1064.
The x1064 lattice would then just provide an offset potential, and we could reliably calibrate the x532-lattice depth.
In @fig:mod-super-scaling we can see that the transition $1 -> 4$ is primarily sensitive to the lattice depth #Vx532.
If we compare the slopes $m = phy.pdv(f_(1->4), V) slash V$ around the configuration $Vx1064 = #qty[60][Erec]$ and $Vx532 = #qty[18][Erec]$ indicated by the dashed vertical lines, we find the ratio $m_(x 532) slash m_(x 1064) approx 3$.
The transition $1 -> 4$ is therefore suitable for the calibration of the x532-lattice depth with the superlattice potential.
For the evaluation, we are reusing the parameters of the lattice depth $Vx1064(x, y)$ from @tab:mod-eval-results.
We can then apply the same procedure as introduced in @sec:mod-eval with the superlattice band structure as the theory.
In the function @eq:mod-eval-model-resonance to model the resonance, we replace the transition frequency with $f_(1->4) (Vx1064, Vx532, phi)$ where the parameters of the lattice depth $Vx1064(x, y)$ are fixed and the phase is set to $phi = pi slash 4$.

#floating-figure(
  image("figures/modulation_superlattice_scaling.png"),
  caption: [
    Sensitivity of the superlattice band structure to the lattice depths #Vx1064 and #Vx532.
    The superlattice phase is set to the antisymmetric configuration $phi = pi slash 4$.
    In *a* the transition frequencies $f_(1->n')$ are shown as a function of the lattice depth #Vx1064, and in *b* they are shown as a function of the lattice depth #Vx532.
    The dashed vertical lines indicate the reference configuration $Vx1064 = #qty[60][Erec]$ and $Vx532 = #qty[18][Erec]$.

    #notes[
      - Add alpha channel to show the actual overlap with $n = 1$!
      - Any deeper explanation why the sensitivity to #Vx1064 is not possible?
    ]
  ],
  label: <fig:mod-super-scaling>,
)

In #subref(<fig:mod-super-result>, "a") we can see the result of the in-situ superlattice modulation spectroscopy to calibrate the x532-lattice depth.
The black line shows the transition frequency $f_(1->4) (Vx1064, Vx532, phi = pi slash 4)$ computed from the superlattice band structure.
Compared to the monochromatic lattices, we cannot directly associate the transition frequency with a lattice depth.
Instead, the frequency depends on both lattice depths, while being approximately #num[3] times more sensitive to #Vx532 compared to #Vx1064.
The calibrated lattice depths are displayed in #subref(<fig:mod-super-result>, "b") to compare their spatial properties.
As expected from the optical measurements of the waists in @sec:super-thermal, the x1064-lattice beams are slightly larger than the x532-lattice beams.
Furthermore, we can see a small positional shift $delta y_0$ between the two lattices.
This is a fundamental limitation of the alignment with the shared retro-reflecting mirror.
The mirrors for the forward-propagating beams cannot change the mean position of the overlapping beams.
We are therefore only able to apply equal shifts to the position of the two lattices with the retro-reflecting mirror.
If we have already optimized the x1064-lattice alignment with the procedure introduced in @ssec:mod-align-x1064, we only need to move the forward-propagating beam to optimize the alignment of the x532 lattice.
With the transition $1 -> 4$ and a constant modulation frequency $f_"mod"$, we can use the simple optimization technique shown in @fig:mod-align-x1064-forward for both the horizontal position as well as the vertical position.
Without the vertical optimization of the x1064 lattice in @fig:mod-align-x1064-walking, the alignment and the calibration of the x532 lattice would show inconsistent results.
Due to the small waist along the $z$ axis, we need the beams to be aligned to $delta z tilde.eq #qty[1][μm]$ to observe resonances with a good contrast.

#floating-figure(
  image("figures/modulation_superlattice_result.png"),
  caption: [
    Calibration of the x532-lattice depth with the superlattice potential.
    The selected lattice depths for the measurement were $Vx1064 = #qty[60][Erec]$ and $Vx532 = #qty[18][Erec]$, and the superlattice phase was fixed at $phi slash pi = #num[0.250(4)]$.
    *a* shows the normalized resonances overlapped with the result of the transition frequency $f_(1->4)$.
    The data is averaged in the interval $#qty[-5][μm] < x < #qty[5][μm]$, just like in @fig:mod-eval-x1064-result.
    In *b* the corresponding lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ are shown.
    The x-axis ticks are scaled to correctly display the different waists.

    #notes[
      - Set x-ticks in *a* to match the measured frequencies.
    ]
  ],
  label: <fig:mod-super-result>,
)

The parameters of the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ are compiled in @tab:mod-super-result.
We can see that the uncertainties of the x532-lattice parameters are generally larger than the uncertainties of the x1064-lattice parameters.
This is a limitation of the calibration in the superlattice potential.
While we have ensured that the transition $1 -> 4$ is optimal for the calibration of the x532 lattice, the precision is not on par with the in-situ lattice modulation spectroscopy in the x1064 lattice.
In the case of the waist $w_0$, we could have expected a smaller uncertainty if we could run a standalone measurement in the x532 lattice.
The limitation for the measurement of the waist is the size of the atom cloud.
Smaller waists are therefore generally easier to measure.

The correction factor $fita0$ will again be limited by drifts of the lattice beams and the variation of the lattice depth as a function of the vertical position $z$.
Due to the small vertical waist of the x532 lattice, this will be significantly more sensitive than the other lattices.
Compared to the x1064 lattice, we expect a tenfold increase if we consider the lattice depths $Vx532(z)$ and $Vx1064(z)$.
As discussed at the beginning of @sec:mod-eval, the measured correction factor $fita0$ will be up to #qty[1][%] smaller compared to the central lattice plane if the x532-lattice beams are perfectly overlapped.
This is however only relevant if we use the single-plane tomography to image a specific vertical lattice plane.
Within this thesis, we can directly use the measured correction factor $fita0$ in @tab:mod-super-result.

For the position $y_0$ we can see a difference of $delta y_0 approx #qty[3][μm]$ between the x1064 lattice and the x532 lattice.
This shift is most likely caused by a non-orthogonal transmission of the lattice beams through the walls of the glass cell and the lenses surrounding the glass cell, see #tr[ref figure in @ch:setup or @ch:super].
Due to the shared optical path, we could only compensate this shift by introducing an additional optical element in the retro-reflecting path.
This would however introduce an additional source for a variation of the superlattice phase $phi$ due to the temperature $T$.
Since the shift $delta y_0$ is significantly smaller than the size of the atom cloud as well as the waists of the respective lattices, we have decided not to pursue a possible compensation.
Compared to the positions $y_0$, the angles $theta.alt$ have to be perfectly matched to achieve a homogoneous superlattice phase $phi(x, y)$.
With the in-situ lattice modulation spectroscopy, we can however only determine the absolute angle $theta.alt$ in the $x y$-plane.
For the determination of the relative angle $Delta theta.alt$, we are using a phase-sensitive measurement based on the time evolution of atoms in the superlattice potential, see #tr[@ssec:phase-measure-detect something more specific?].
In @sec:mod-coupled we already discussed the coupling between the x1064 lattice and the y1064 lattice due to their absolute angles $theta.alt$.
For the calibration in the superlattice potential we can neglect this coupling because of the different energy scales.
The transition frequencies as shown in #subref(<fig:mod-super-result>, "a") would correspond to the band index $phy.vb(n) = (1, 8)$ if we set the y1064-lattice depth to $Vy1064 = #qty[30][Erec]$.
Based on the differences of the band indices, the coupling to the excited band $phy.vb(n) = (4, 1)$ is completely negligible.

#floating-figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header([], $w_0 slash#unit[μm]$, $fita0$, $y_0 slash#unit[px]$, $theta.alt slash degree$),

    [x1064], num[139.4(17)], num[1.0011(5)], num[-1.60(23)], num[-5.50(17)],
    [x532], num[116(7)], num[1.028(3)], $#hide[#sym.minus]#num[1.5(5)]$, num[-5.2(4)],
  ),
  caption: [
    Calibrated parameters of the x1064 lattice and the x532 lattice.
    The x1064-lattice parameters are equal to the results in @tab:mod-eval-results.
    These values were used as reference parameters for the fit model using the superlattice band structure.
    The mean values and errors for the x532-lattice depth are computed with the scheme introduced in @ssec:mod-eval-error.
    Only the measurements with $f_"mod" <= #qty[276][kHz]$ are taken into account to exclude the images where $f_"mod"$ is greater than the maximum transition frequency $f_(1->4)$ in the center of the superlattice potential.

    #notes[
      - Merge this with the other results table? @tab:mod-eval-results
      - Reference to waists in the thermal lensing @sec:super-thermal?
    ]
  ],
  label: <tab:mod-super-result>,
)
