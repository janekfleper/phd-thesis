#import "../../header.typ": *

== Loss mechanism <sec:modulation-loss>

#[
  #set text(red)
  - Should I mention the z532-lattice and the depth of $v_0 > #qty[100][Erec]$ here?
  - Mention the resonance amplitude before the section?
  - Use error estimation for the resonance amplitude here?
  - Compute the overlaps based on the Wannier functions for $3 -> 5$ and $3 -> 6$
  - Argue that only looking at r13fa (and "ignoring" r13fw) is sufficient?
]

At the start of @sec:modulation-results we only discussed the requirements on the width of the upper band for the (in-situ) modulation spectroscopy.
The conclusion was that the upper band (usually $n = 3$) should be deeply trapped in the lattice potential to have a negligible width compared to the transition frequency.
This does however raise the question why we can actually see the in-situ signal?
If the atoms are only in the third band, they are still trapped inside the lattice with a tunneling amplitude of $t slash h = cal(O)(#qty[100][Hz])$.
With an (additionally) strong confinement by the infrared in-plane lattices, the atoms could not escape from the lattice potential.
The atoms could of course tunnel in the modulated lattice, but this cannot explain such a cleanly depleted region.
We would rather expect the atoms to accumulate in the center of the lattice again due to the confinement by the perpendicular lattice.

When we initially started to use the in-situ lattice modulation spectroscopy, we already found it to be working quite nicely.
We could do some optimization of the modulation amplitude and the modulation time to improve the contrast/visibility of the resonance lines #text(red)[ref optimization section?], but it did not require any additional effort to get in-situ signals compared to the time-of-flight signals we used before.
At the time we were always running the in-situ measurements for the in-plane lattices at #qty[55][Erec] or #qty[60][Erec].
We only realized how "lucky" we were with the in-situ measurements when we could achieve lattice depths up to #qty[90][Erec].
When we tried to calibrate the lattices at $v_0 > #qty[60][Erec]$, the in-situ signal quickly became a lot worse to the point where it was not visible anymore (at reasonable modulation amplitudes).
This cannot be caused by any changes to the transition $1 -> 3$.
While the bands will become narrower as a function of the lattice depth $v_0$, the difference between #qty[60][Erec] and #qty[90][Erec] is hardly significant as show in @fig:modulation-results-theory #text(red)[ref specific subfigure?].
And we have already observed that the resonances we see are wider than the upper band $n = 3$.
We would therefore not expect the resonances to disappear if the band width becomes too small.

To better understand the issue we conducted a measurement of the transition $1 -> 3$ in the x1064-lattice with a variable lattice depth $v_x$ from #qty[50][Erec] to $>#qty[70][Erec]$.
The other lattice depths are $v_y = #qty[30][Erec]$ and $v_z = #qty[110][Erec]$.
We adjusted the frequency interval according to the expected increase of the transition frequency $1 -> 3$ based on the band structure theory.
We then evaluated the images for each lattice depth $v_x$ with the method introduced in @sec:modulation-evaluation.
The only significant changes we can observe across the measurements are the resonance parameters $a_f$ and $w_f$, see @fig:modulation-loss-parameters.
These two parameters qualitatively describe the contrast/visibility of the resonances as highlighted by the insets in @fig:modulation-loss-parameters.
The result matches our observation that the in-situ resonances "suddenly" become worse at lattice depths $>#qty[60][Erec]$.
We can observe a kink at $~#qty[65][Erec]$ in the fit parameters of the resonance amplitude and the resonance width.
From the kink to a lattice depth of $~#qty[75][Erec]$ the resonance amplitude decreases by a factor of $3-4$ while the resonance width decreases by a factor of $~2$.

#figure(
  image("../../figures/2024-10-25_PH_x1064_band_overlap_average_result.png"),
  caption: [
    Decrease of "loss efficiency" in deep lattices.
    We ran the in-situ parametric heating measurement for lattice depths from #qty[50][Erec] to #qty[74][Erec].
    The modulation time was #qty[0.5][s] and the modulation amplitude was #num[0.1].
    For these parameters we could achieve a great contrast at #qty[60][Erec].
    - #text(red)[Only show r13fa and r13fw here]
    - #text(red)[Is there anything else required here to just describe the figure?]
    - #text(red)[Where to mention the decrease between #qty[50][Erec] and #qty[65][Erec]?]
    - #text(red)[Add insets here that highlight the difference between the amplitudes 0.8 and 0.2]
  ],
) <fig:modulation-loss-parameters>

To understand why the resonance signal decreases at lattice depths $>#qty[65][Erec]$ we have to take the band structure beyond the transition $1 -> 3$ into account, see @fig:modulation-loss-theory.
The atoms in the third band could be excited to an even higher band if the transition is resonant with the modulation frequency $f$.
When we look at the frequencies associated with the transitions $3 -> 5$ and $3 -> 6$, we notice that the latter transition is actually "resonant" with the frequency $f_(1->3)$.
Since the band $n = 6$ has a width of a few #qty[10][kHz] (#text(red)[ref @fig:modulation-results-theory here?]) the overlap between the transitions is fullfilled for a wide range of lattice depths.
However, at #qty[65][Erec] there is no overlap of the modulation frequency $f_(1->3)$ with the transition $3 -> 6$ anymore.
This behavior (perfectly) matches our observations in @fig:modulation-loss-parameters.

If we know that the (second) transition $3 -> 6$ actually makes the in-situ lattice modulation signal visible, we can go back to the question why the atoms are even lost?
At the beginning of @sec:modulation-loss we concluded that the tunneling amplitude in the third band was not sufficient for the atoms to leave the lattice.
The sixth band is however still untrapped at $v_x = #qty[60][Erec]$ and the tunneling amplitude is $t slash h = cal(O)(#qty[10][kHz])$ as shown in @fig:modulation-loss-theory.
Atoms in the sixth band would therefore be able to leave the trap against/despite the confinement by the y1064-lattice.

#figure(
  grid(
    columns: 2,
    gutter: 0.5em,
    image("../../figures/2024-10-25_band_structure_theory.png", width: 85%),
    image("../../figures/2024-10-25_band_overlap_theory.png", width: 85%),
  ),
  caption: [
    Available transitions $3 -> n$ in a deep lattice.
    The figure on the left shows a lattice depth of #qty[60][Erec] where the in-situ lattice modulation measurement shows a nicely visible signal.
    The overlap of the transitions $1 -> 3$ and $3 -> 6$ in the figure on the right shows that we would expect the two-step transition $1 -> 3 -> 6$ to work up to #qty[65][Erec].
    The frequency of the transition $3 -> 5$ is significantly lower than the frequency $f_(1 -> 3)$, we would only expect the two frequencies to be equal in a (perfect) harmonic oscillator potential.
    - #text(red)[Anything I should still mention here?]
    - #text(red)[Show the transition $1 -> 3 -> 6$ with two arrows]
    - #text(red)[Actually show the q-resolved bands somewhere?]
  ],
) <fig:modulation-loss-theory>

The expected time scale for the loss of the atoms would be much shorter than the modulation time of up to #qty[1][s].
Even if the atoms would need to tunnel over #num[100] lattice sites, the associated time scale would only be $cal(O)(#qty[10][ms])$.
We can therefore run the detection right after the end of the lattice modulation.

The resonance parameters r13fa and r13fw in @fig:modulation-loss-parameters do not show a step-like behavior since the lattice depth $v_x$ is only reached on the optical axis.
As discussed in @sec:modulation-evaluation (#text(red)[ref another section here]) and shown in @fig:modulation-evaluation-parabola a single measurement includes a range of lattice depths. #text(red)[what is the actually expected range for the x1064-lattice?]
The fit model will therefore show the (weighted) average across the images, which leads to a "slower" decrease of the resonance parameters.
#text(red)[Do an error-estimation style evaluation of the resonance parameters for the individual images here? Or just refer to the two-tone lattice modulation section?]

#text(red)[Put some kind of transition here?]

Compared to the width of third band, the width of the sixth band does not limit the resolution of the measurement.
Only the atoms that are already in the third band can also be excited further to the sixth band #text(red)[draw a comparison to detection transitions and clock transitions?].
If anything, having a wide band for the second transition is beneficial to ensure an overlap with $f_(1->3)$ over a wide range of lattice depths.

#text(red)[Is this discussion really necessary? Or is it fine to just accept the fact that the transition works and we can see the in-situ resonances?]
Displaying the transition $3 -> 6$ as a "simple" area in @fig:modulation-loss-theory does ignore that the band energies $epsilon_n$ are a function of the quasi-momentum $q$.
This does not matter for a really narrow band where the band energy barely changes across the Brillouin zone.
If the band is really wide (such as band $n = 6$), we would also expect the resonance transition $f_(3 -> 6)$ to be a function of the quasi-momentum $q$ in the Bloch basis.
We would then only be able to transfer the atoms that occupy the states with the "resonant" quasi-momenta $q$.
In the Wannier basis on the other hand we could explain the transfer of all/most of the atoms to the sixth band despite the $q$-dependent resonance frequency.
We would just expect the transition matrix element to be reduced compared to a transition where all quasi-momenta $q$ are resonant.
In practice we are lacking the technical capability to run a measurement that resolves the occupation of $q$ in the sixth band.
And since the third band will only be occupied where the local lattice depth is resonant with the modulation frequency $f$, the signal we would try to measure would be really small (which is not at all practical for TOF).
#text(red)[Is there something in the Heinze PhD thesis about this?]

To finally confirm our hypothesis that an untrapped (or at least really wide) band is required to enable in-situ lattice modulation spectroscopy measurements, we added a second modulation frequency to specifically probe the transition $3 -> 6$.
#footnote[
  #text(red)[Should this really be a footnote?]
  It would also be possible to split this into two time steps in the sequence.
  In the first time step we would use the modulation frequency $f_1$ to excite the atoms to the third band.
  And in a second time step we would use the modulation frequency $f_2$ to drive the "detection" transition to the sixth band.
]
We use a (local) lattice depth of #qty[70][Erec] (or #qty[80][Erec]?) where we expect the transitions $1 -> 3$ and $3 -> 6$ to be well separated.
The first modulation frequency $f_1$ will then excite the atoms from the first band to the third band where they are still trapped in the lattice.
We can then scan the second frequency $f_2$ to probe the band structure starting from the third band.
As long as the condition $f_(1->3) < f_2 < f_(1->4)$ is fullfilled, we don't expect the two-tone modulation to show any unexpected/undesired behavior.

Instead of measuring multiple frequencies to cover the entire lattice depth $v(x, y)$ that is occupied by the atoms, we only run this measurement at a single frequency $f_(1->3)$.
We can use the calibration of the lattice depth from a previous measurement as the "reference" for the atom density parameters and the gaussian waist.
Only the lattice depth $a_0$, the lattice position $y_0$, the lattice angle $theta.alt$ and (most importantly) the resonance parameters r13fa and r13fw are varied during the single-image fits.
We already used this producedure for the error estimation presented in @ssec:modulation-evaluation-error and @fig:modulation-evaluation-error.
Compared to the data shown in @fig:modulation-loss-parameters the resonance amplitudes r13fa from the single-image fits will not be washed out (better convoluted?) by the varying lattice depth.
We can therefore expect a "step-like" behavior when the modulation frequency $f_2$ enters (and exits) the transition $3 -> 6$.

The data in @fig:modulation-loss-recovery nicely shows a recovery of the in-situ resonances if the second modulation frequency excites the atoms to either the sixth band or the seventh band.
We also tried to measure a dependence on the amplitudes of the two modulation frequencies, but this came out rather unspectacular.
Stronger modulation amplitudes will just slightly increase the signal "inside" the band transitions.
And the baseline signal/amplitude between the band transitions was unaffected.

Inside the transition $3 -> 6$ there is a region/an interval where the resonance amplitude r13fa is smaller again.
This cannot be explained by the one-dimensional band structure that we have considered so far.
If anything, we would have expected a maximal resonance amplitude at the upper boundary of the band (transition) where the (conserved) quasi-momentum is $q = 0$.
To understand the additional gap in the band $n = 6$ we have to look at the two-dimensional band structure.
Since the x1064-lattice and the y1064-lattice are not perfectly perpendicular, the band structures are not perfectly separated either.
This coupling between the (in-plane) lattices is discussed in detail in @sec:modulation-coupled and the gap in the band $n = 6$ is reproduced by the band structure in @fig:modulation-coupled-two-tone-result .

#figure(
  image("../../figures/2025-01-27_two-tone_PH_x1064_result_80Erec.png"),
  caption: [
    Recovery of the resonance contrast by a second modulation frequency.
    The frequency $f_(1 -> 3) approx #qty[140][kHz]$ at $v_x = #qty[80][Erec]$ is shown by the blue line in the upper row.
    The gap to the transition $3 -> 6$ is more than #qty[10][kHz] wide, and a similar (band) gap is expected to the transition $3 -> 7$.
    The lower axis shows the measured resonance amplitudes as a function of the second modulation frequency.
    Just as a reminder, a large resonance amplitude r13fa corresponds to a strongly visible resonance!

    - #text(red)[Limit the x-axis to $f_2 < f_(1->4)$?]
    - #text(red)[Only show a single LattModAmp! (most likely 0.1?)]
    - #text(red)[Is there an interesting "second" figure here? Just show some atom images?]
    - #text(red)[Also show the resonance width here?]
  ],
) <fig:modulation-loss-recovery>
