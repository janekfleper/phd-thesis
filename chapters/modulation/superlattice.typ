#import "/header.typ": *

== Superlattice <sec:mod-super>

#[
  #set text(red)
  - Check the coupled lattice theory for the superlattice.
  - Write something about the alignment of the x532-lattice?
  - Already reference this section earlier when introducing the x532-lattice? With a maximum lattice depth of #qty[20][Erec] we have to rely on the superlattice modulation to measure the lattice depth $v_s$.
  - Compare the lattice depth slope of the transition $1 -> 4$ to the x1064-lattice?
  - Actually include any alignment stuff in this section? Or just add a short reference to @sec:mod-align to mention that the x532-lattice is more sensitive etc...?
]

In a superlattice potential the core principle of the in-situ lattice modulation technique does not change.
We need a narrow band that can be excited from the lowest band with the modulation of the lattice amplitude.
For the visibility of the in-situ signal we then need an untrapped band that can be "reached" from the excited band with the applied modulation frequency.
While the two-tone modulation introduced in @sec:mod-loss could also be applied in a superlattice potential, we would prefer to avoid this additional complexity.
The difference compared to the lattice modulation in a monochromatic lattice potential arises from the multiple lattice parameters $v_l$, $v_s$ and $phi$.
The increased complexity of the band structure as introduced in @sec:theory-super #text(red)[(ref figure from theory?)] requires some additional care before running the in-situ lattice modulation measurements.
In this section I will briefly explain the (additional) theoretical considerations required for the in-situ superlattice modulation in a superlattice potential.
From an experimental point of view the superlattice modulation is essential for the superlattice along the $x$-axis.
Due to the maximum lattice depth of $approx #qty[20][Erec]$ we can not use the monochromatic lattice modulation technique #text(red)[(not even the TOF-version would be okay)].
We are therefore required to use the superlattice modulation technique to calibrate the depth of the x532-lattice.

As already discussed in @sec:super-radial #text(red)[and in the theory?] the antisymmetric phase $phi = plus.minus pi slash 4$ is the simplest configuration of the superlattice potential.
The lower well is then effectively the sum of the individual lattices, whereas the upper well is effectively the difference of the individual lattices.
We would therefore obtain the maximum lattice depth for the atoms in the lower well.
This should result in narrow excited bands that we can employ/use for the in-situ lattice modulation technique.
Just using the antisymmetric phase configuration for the in-situ superlattice modulation technique therefore seems reasonable.
We will nevertheless look at the sensitivity of the band structure across the full range of the superlattice phase $phi$ from #num[0] to $pi slash 4$.
Since we do not want to calibrate/measure the phase $phi$ with the in-situ superlattice modulation, the sensitivity of the transition frequencies to the phase $phi$ should be as small as possible.
While we can/will include the superlattice phase as a constant/static parameter in the theory used for the fits, it is not practical to allow changes of the phase during a measurement/scan or to include a gradient of the phase $phi$ in the $x y$-plane #text(red)[How to reference this to the superlattice phase chapter?].
As illustrated in @fig:mod-super-phase the band structure shows the least sensitivity around the antisymmetric configuration $phi = pi slash 4$ for all displayed bands.
This confirms the suitability of the antisymmetric configuration for the (in-situ) superlattice modulation measurements.
While we can see that the sensitivity to the phase around/at $phi = 0$ decreases for higher bands, the measurement/transitions would still be sensitive to $phi$ because of the initial band $n = 1$.
We can see that the sensitivity at $phi = 0$ decreases for higher bands.
In the case of band $n = 6$ we can only see a small change across the entire range of the superlattice phase $phi$.
Since the initial band will always be $n = 1$, its sensitivity to the phase will always be the limitation of the in-situ superlattice modulation around the phase $phi = 0$.

#figure(
  image("figures/modulation-superlattice-phase.png", width: 70%),
  caption: [
    Sensitivity of the band structure to the superlattice phase $phi$.
    The (corresponding) lattice depths are $v_l = #qty[60][Erec]$ and $v_s = #qty[20][Erec]$, which are the usual parameters we use for the in-situ superlattice modulation measurements.

    #show list: set text(red)
    - Show the transitions $1 -> n$ here instead of the plain band structure?
    - Anything to add to this caption?
    - Use $phi = -pi / 4$ here or $phi = pi / 4$?
    - Add vertical lines at $phi = plus.minus pi / 4$ and $phi = 0$? Just very thin ones...
    - Show a magnified version of the bands at $phi = pi slash 4$?
    - Or just compute the difference in the slopes at $phi = pi slash 4$ and $phi = 0$?
    - Add any arrows here to already indicate transitions?
  ],
) <fig:mod-super-phase>

#text(red)[Actually mention this?]
If the in-situ superlattice modulation is supposed to be used as the tool to actually measure the superlattice phase, the symmetric configuration would be the best candidate.
Such a measurement would not even require a precise knowledge of the lattice depths $v_l$ and $v_s$.
By scanning the phase $phi$ and _minimizing_ the frequency of the transition $1 -> n$ the symmetric phase configuration could be identified with a decent resolution #text(red)[Add any quantitative numbers here?].
For all purposes in this thesis the in-situ lattice modulation is however only supposed to be used to determine the lattice depths.
The measurement of the superlattice phase $phi$ is introduced in #text(red)[ref phase chapter...].

In the antisymmetric phase configuration we can now check the parity and the overlap of the excited bands with the initial band $n = 1$.
Due to the (more) complex potential structure, we can not automatically infer the parity from the band index $n$.
(And?) besides the parity we also have to consider the (general) positional overlap since the excited bands/states could also be located/localized at/on the upper/wrong well.
We will therefore look at the four lowest Wannier functions for the lattice depths $v_l = #qty[60][Erec]$ and $v_s = #qty[20][Erec]$ and the phase $phi = pi slash 4$, see @fig:mod-super-wannier.
The Wannier functions of the lowest two bands $n = 1$ and $n = 2$ are equivalent/similar to the Wannier functions in a monochromatic lattice.
A transition $1 -> 2$ is therefore again forbidden/suppressed due to the opposite parity of the Wannier functions.
For the bands $n = 3$ and $n = 4$ the Wannier functions both have positive parity, but only one of the Wannier functions is actually located on the "correct"/left well.
The Wannier function $n = 3$ appears to be the (local) ground state on the upper well.
An overlap with the Wannier function $n = 1$ will therefore be strongly suppressed, despite the similar/identical shape of the two Wannier functions.
The Wannier function $n = 4$ is then located on the "correct"/left well again and the shape of the function reminds us of the Wannier function $n = 3$ in the monochromatic lattice #text(red)[ref what?].
Since we are (exclusively) using the transition $1 -> 3$ for the monochromatic/regular lattices as introduced in @sec:mod-intro, we can expect the transition $1 -> 4$ to work "out of the box" in the superlattice potential.
The width of the fourth band is $approx #qty[200][Hz]$ in the superlattice configuration shown in @fig:mod-super-wannier.
With a modulation/transition frequency $f$ of almost #qty[300][kHz], this is well within the requirements for a narrow excited band #text(red)[ref anything?].
For the in-situ lattice modulation signal we also have to consider the transition from the enxcited (fourth) band to an untrapped band.
Since the first untrapped band ($n = 7$, not shown in @fig:mod-super-wannier) is $approx #qty[150][kHz]$ above the fourth band, the/this condition for the in-situ lattice modulation technique is fulfilled.
Even for slightly greater lattice depths there is no (imminent) threat to lose the in-situ lattice modulation signal.
#text(red)[Check whether this would actually be possible at all?]

#figure(
  image("figures/modulation-superlattice-wannier.png", width: 90%),
  caption: [
    Possible (band) transitions in the modulated superlattice potential.
    The potential is shown here for the lattice depths $v_l = #qty[60][Erec]$ and $v_s = #qty[20][Erec]$ and the phase $phi = pi slash 4$.
    The Wannier functions are directly calculated from the Bloch waves since no band mixing is required given the gaps between the visible bands #text(red)[ref BPO formalism?].

    #show list: set text(red)
    - Show the maximally localized Wannier functions here instead?
    - Explain why we are looking at Wannier functions instead of Bloch functions?
    - Add any arrows here to already indicate transitions?
    - Indicate modulation of either $v_l$ or $v_s$?
    - Somehow show the band widths in this figure?
    - Limit the x-axis to $plus.minus 1.1$
    - Anything to add to this caption?
  ],
) <fig:mod-super-wannier>

So far we have only looked at the superlattice phase $phi$ and (the parity/overlap of) the Wannier functions without considering the role of the individual lattices.
For the superlattice configuration/potential shown in @fig:mod-super-wannier the transition $1 -> 4$ can be driven by either modulating the amplitude of the long lattice or the amplitude of the short lattice.
Since the "correct"/left/lower well is effectively the sum of the individual lattice potentials, both modulation sources? will show the same qualitative behavior.
The required modulation amplitude will however be different because of the different length scales/curvatures of the individual lattices.
A significant difference between the two individual lattices is the sensitivity of the transition frequency $1 -> 4$ to the lattice depths $v_l$ and $v_s$.
If the in-situ lattice modulation should be used to calibrate the lattice depths, the frequency actually has to change as a function of $v_l$ and $v_s$.
In the monochromatic lattice this was simple since we knew that the bands energies simply change with the lattice depth $v$.
In the superlattice potential we have to look at the band structure as a function of the lattice depths $v_l$ and $v_s$ to find the sensitivity (of the frequency) of the transition $1 -> 4$.
The individual scans in @fig:mod-super-depth show that the transition $1 -> 4$ is primarily sensitive to the short lattice depth $v_s$ around the reference point with $v_l = #qty[60][Erec]$ and $v_s = #qty[20][Erec]$.
While a small change can be seen as a function of the long lattice depth $v_l$, the slope is smaller by a factor of #text(red)[what?] compared to the short lattice depth $v_s$.
For the transition $1 -> 3$ we can see the opposite behavior.
This transition is however not suitable for the (positive-parity) (in-situ) lattice modulation as indicated by the transparency of the corresponding bands/traces.
As discussed earlier this is not caused by the parity of the Wannier functions but rather by the/their #text(red)[center-of-mass?].

#figure(
  grid(
    columns: 2,
    column-gutter: 1em,
    image("figures/modulation-superlattice-vl.png"), image("figures/modulation-superlattice-vs.png"),
  ),
  caption: [
    Sensitivity of the superlattice band structure to the lattice depths $v_l$ and $v_s$.
    The phase for both figures is set to $phi = pi slash 4$.
    For the scan of $v_l$ in the left image/figure $v_s$ is fixed/set to #qty[20][Erec], and $v_l$ is fixed/set to #qty[60][Erec] for the scan of $v_s$ in the right image/figure.
    The energies/frequencies are shown relative to the (mean) energy of the band $n = 1$.

    #show list: set text(red)
    - Add vertical lines to the reference values?
    - Add alpha channel to show the overlap!
    - Anything to add to this caption?
    - Any deeper explanation why the sensitivity to $v_l$ is not possible?
  ],
) <fig:mod-super-depth>

In @fig:mod-super-depth can see an avoided crossing of the excited bands $n = 3$ and $n = 4$ at $v_l approx #qty[72][Erec]$ and at $v_s approx #qty[14][Erec]$
This is actually the same? avoided crossing, we are just on opposite "sides" depending on the lattice depth that is scanned.
If we start at the reference point (also indicated by the dashed/vertical lines), we can see that the excited band $n = 3$ will be the accessible one at the other side of the avoided crossing.
Since this is just the continuation of band $n = 4$ (before the avoided crossing) it has the same properties/sensitivity to the respective lattice depths.
We can therefore only find a transition in the antisymmetric superlattice configuration that is (primarily) sensitive to the short lattice depth $v_s$.
Even the transition $1 -> 2$ that would just require a different modulation parity does not scale (well) with the long lattice depth $v_l$.
Since the matrix element for the transition $1 -> 3$ (at the reference point) is not a matter of the parity, the only chance to access this transition would be a really large amplitude to make use of the tiny amplitude of the (excited) Wannier function on the "correct"/left/lower well.
#text(red)[Mention here that we have actually seen this? Or reference to later part of the section?]

#text(red)[Actually mention the next sentence?]
It could be possible to find a transition that is sensitive to $v_l$ at a phase $phi eq.not pi slash 4$.
This would however also introduce a (stronger) sensitivity to the phase $phi$ again.
While this can of course be ruled out/handled by (experimentally) stabilizing the phase, it will definitely make the measurements more difficult/prone to errors.

At the start of this section we motivated the in-situ superlattice modulation as a tool to (indirectly) calibrate the lattice depth $v_s (x, y)$.
The (primary) sensitivity of the transition frequency $1 -> 4$ to $v_s$ is therefore (actually) perfect for our use case.
While the transition frequency is (significantly) less sensitive to $v_l$, it is still essential to use the actual lattice depth $v_l (x, y)$ to get correct result for the lattice depth $v_s (x, y)$.
We will therefore use the result of the in-situ lattice modulation measurement in the x1064-lattice for the theory of the superlattice fit model.
The parameters of the x1064-lattice depth will then only be included as constant function arguments.
The actual evaluation then works as already explained in @sec:mod-eval for the monochromatic lattices.
There are four parameters to model the short lattice depth $v_s (x, y)$ and there is an amplitude and a width to model the resonance/transition $1 -> 4$.
The resonance function @eq:mod-eval-model-resonance will then use the frequency $f_(1->4) (v_s; v_l, phi)$ from the superlattice band structure introduced in @sec:theory-super to model the resonance(s) (lines) in the atom images.

For the in-situ superlattice modulation measurements we have decided to modulate the amplitude/depth of the short lattice.
Due to the smaller spacing of the short lattice the modulation amplitude can be smaller than for the long lattice to achieve the same resonance signal. #text(red)[is this actually true? confirm with theory + data?]
We are using a (relative) modulation amplitude of #text(red)[$? %$] for a modulation time of #qty[0.75][s] to obtain resonance lines with a good visibility #text(red)[define any threshold here in @sec:mod-eval?].
On the left side in @fig:mod-super-result we can see the (good?) overlap of the atom images around the center of the cloud and/with the transition frequency $f_(1->4)$ computed from the (superlattice) band structure (theory).
Since the frequency is a function of $v_s$, $v_l$ and $phi$, we see an effective (superlattice) depth in the fit result/theory.
We have to compare the individual lattice depth functions $v_s (x, y)$ and $v_l (x, y)$ (on the right side of the figure) to (actually) see the result of the measurement.
The functions only show the relative lattice depths to allow a (simple) comparison/visualization on the same y-axis.
Both maxima are (slightly) different from #num[1.0], see @tab:mod-super-result for the detailed results.
Some variation around $a_0 = #num[1.0]$ is expected for all lattices #text(red)[(as mentioned earlier in start of chapter)] since we do not update the calibration factors in the alignment sequence.

We can see that the amplitude $v_s$ decreases much faster than the amplitude $v_l$ because of the smaller waist #text(red)[ref setup/superlattice section?].
While the waists were already expected to be different, we can also see a small positional shift between the two lattices.
Compared to the waists of the lattices (see @tab:mod-super-result) this shift is however negligible.
Only if this shift would be larger, e.g. on the order of #qty[10][μm], we would have to figure out a way to align the positions of the two lattices separately.
This would not have been trivial since the lattice positions can mainly/only be changed by the retro-reflecting mirror.
Since this mirror is shared for the two lattices, we can only ever move them by the same distance.
We would have needed to add a refractive element to the retro-propagating path to achieve a shift between the lattices.
#text(red)[Actually reference the x532-plate?]
In the forward-propagating path of the x532-lattice we are doing something similar to adjust the relative angle of the lattices.
This is relevant for the phase $phi(x, y)$ as a function of the position and will be discussed/introduced in #text(red)[chapter phase].

For the estimation of the measurement errors we are using the evaluation/fits in two steps.
The initial evaluation/fit will consider all images of the scan to get the global result.
With these parameters as the starting values we are then evaluating the individual images of each scan with the same fit model.
Only the lattice parameters $y_0$, $theta.alt$ and $a_0$ or $a$ are then varied.
The averages of these individual lattice parameters are then used to compute the mean values and errors of the measurement.
In @tab:mod-super-result the results for the x1064-lattice and x532-lattice are compared/presented.
The results for/of the x1064-lattice are taken from the monochromatic measurement just before the superlattice one.
As a reminder, these values are also used as the parameters of the long lattice in the evaluation of the superlattice data/measurement.
Only the (superlattice) angle $theta.alt$ can slightly change the x1064-lattice depth again.

#figure(
  image("figures/2025-01-28_calibration_thesis_result_xsuper.png", width: 90%),
  caption: [
    Result of the lattice depth calibration with the in-situ superlattice modulation technique.
    The selected lattice depths for the measurement were $v_l = #qty[60][Erec]$ and $v_s = #qty[18][Erec]$, and the superlattice phase was set to $phi = #qty[0.250(4)][#sym.pi]$.
    The figure on the left shows the average of the images in the interval $x = [-10, 10] #text(red)[#unit[px]]$.
    Due to the angle $theta.alt$ of the x-lattices relative to the x-axis, the signal is slightly broadened by the averaging.
    The resulting transition frequency $f_(1 -> 4)(x, y)$ is averaged over the same interval to get a #text(red)[meaningful] comparison.
    In the figure on the right the relative lattice depth functions $v_s (x, y)$ and $v_l (x, y)$ are shown in the interval corresponding to the data in the figure on the left.
    The vertical offset shows the calibration/correction factor that want to measure with the in-situ lattice modulation technique.

    #show list: set text(red)
    - Add a colorbar for the left figure?
    - Mention the real phase here? Estimate the error due to the phase?
    - Change to $v_s = #qty[18][Erec]$ in the entire section?
    - Add shaded area to indicate the error of $v_s$ and $v_l$?
    - Use #unit[μm] as the x-axis?
    - Add vertical lines to show $y_0$ in the figure on the right?
  ],
) <fig:mod-super-result>

#text(red)[Find a better first sentence here...]
If we look at the resulting parameters in @tab:mod-super-result, we can see that the in-situ lattice modulation also works well in a superlattice potential.
The (relative) error of the x532-lattice depth is slightly larger than the errors from the monochromatic lattice measurements.
With just $approx #num[0.2]%$ the result is however still great considering that the x532-lattice was measured "on top" of the x1064-lattice.
At $v_s = #qty[18][Erec]$ a regular/monochromatic lattice modulation measurement would have been significantly worse due to the width of all (accessible/available?) excited bands.
The positions $y_0$ of the two lattices confirm the visible shift from/in @fig:mod-super-result.
Since the difference/shift is only $approx #qty[1.5][μm]$ we can however neglect this compared to the waists $w_0$.
Both waists are greater by a factor (of) #num[100], matching their respective values from the thermal lensing investigation in @sec:super-thermal #text(red)[check this!].
The resulting angles from the two measurements are in good/perfect agreement.
While we have a much more sensitive measurement of the relative angle of the lattices as shown in #text(red)[ref phase chapter/section] the in-situ lattice modulation should also reflect/show this (up to the available resolution).
If we had a large (relative) angle between the lattices that is too large for the phase-sensitive/phase-based measurement, we could use the in-situ lattice modulation technique for the coarse alignment.
At/after the resolution limit of the in-situ lattice modulation measurement, we can then use the phase-sensitive measurement for the precise alignment.
Note that this would only work (directly) for a (horizontal) relative angle in the $x y$-plane.
For a (vertical) angle in the $x z$-plane we would have to rely on the contrast of the resonance lines during the in-situ superlattice modulation or the contrast of the symmetry line in the in-situ phase measurement as shown in #text(red)[ref phase chapter/section].

#figure(
  table(
    columns: 5,
    stroke: table-stroke.with(stroke: black + 0.5pt),
    table.header(
      [],
      $"Lattice depth" a_0$,
      $"Position" y_0 slash #unit[px]$,
      $"Waist" w_0 slash #unit[μm]$,
      $"Angle" theta.alt slash degree$,
    ),

    [x1064], num[0.9852(12)], num[0.6(9)], num[142.5(28)], num[-5.47(18)],
    [x532], num[1.0323(23)], num[3.2(13)], num[118(5)], num[-5.5(4)],
  ),
  caption: [
    Calibrated parameters of the x1064-lattice and the x532-lattice.
    The (mean) values and errors are computed with the same schema as introduced in @ssec:mod-eval-error.
    Only the images that show relevant data for a single-image evaluation/fit are selected.
    For the parameters $a_0$, $y_0$ and $theta.alt$ this includes all images where a loss signal is visible ($f_"mod" < #qty[280][kHz]$).
    In the case of the waist $w_0$ (which is computed from the parameter $a$) only the images with two visible resonance(s) (lines) are selected ($f_"mod" < #qty[276][kHz]$).
    The lattice depth $a_0$ from/of the x1064-lattice measurement is corrected/fudged by #text(red)[what?] according to the coupled theory discussed in @sec:mod-coupled.

    #text(red)[Mention this again? Or is the reference to @ssec:mod-eval-error sufficient?]
    The errors are (then) computed as the weighted standard deviation of the individual fit results.

    #show list: set text(red)
    - Merge this with the other results table? @tab:mod-eval-results
    - At least match the column order with @tab:mod-eval-results...
    - Reference to waists in the thermal lensing @sec:super-thermal?
    - Compute the position $y_0$ in #unit[μm].
    - Use the same x1064-lattice data here as in @sec:mod-intro and @sec:mod-eval?
  ],
) <tab:mod-super-result>
