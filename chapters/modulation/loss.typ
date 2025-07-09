#import "/header.typ": *

== Investigation of the atom-loss mechanism <sec:mod-loss>

#[
  #set text(red)
  - Mention the resonance amplitude before the section?
  - Use error estimation for the resonance amplitude here?
  - Compute the overlaps based on the Wannier functions for $3 -> 5$ and $3 -> 6$
  - Argue that only looking at r13fa (and "ignoring" r13fw) is sufficient?
  - Explain why the z532 lattice is generally weaker than the infrared lattices?
  - Discuss why $a_R$ does not go to zero immediately?
]

In @sec:mod-intro we have discussed the requirements on the width of the upper band for the calibration of the lattice depth.
We concluded that the upper band needs to be #tr[deeply] trapped in the lattice potential to be considered narrow.
For the x1064 lattice and the y1064 lattice this condition is fulfilled for the upper band $n' = 3$ at a lattice depth of #qty[60][Erec].
With a tunneling amplitude of $t slash h = cal(O)(#qty[100][Hz])$ the atoms are not completely frozen in the upper band, but they are not able to leave the lattices either.
The overall potential is still strongly confining due to the red-detuned x1064 lattice and the y1064 lattice.
We can therefore not explain the visible resonances in @fig:mod-intro-images if we only consider the transition $1 -> 3$.

During regular calibration measurements of the lattice depth we discovered that the visibility of the resonances is significantly worse at #qty[70][Erec] and #qty[80][Erec].
This behaviour cannot be explained in the context of the transition $1 -> 3$.
The changes to the band structure compared to the lattice depth of #qty[60][Erec] are insignificant.
When modulating the z532 lattice at a depth of #qty[100][Erec], the transition $1 -> 3$ is not visible at all.
We therefore have to use the transition $1 -> 5$ to achieve visible resonances for the lattice calibration.
To investigate the #tr[disappearance] of the transition $1 -> 3$ at lattice depths above #qty[60][Erec], we measured the in-situ lattice modulation spectroscopy as a function of the lattice depth $v_0$ from #qty[50][Erec] to #qty[80][Erec].
We will look at the x1064 lattice as well as the z532 lattice since we do not know whether the observed behavior is related to the coupling of the x1064 lattice and the y1064 lattice.

To measure the visibility of the resonces we are going to use the #tr[(dimensionless)] resonance amplitudes $a_R$.
We introduced the resonance function @eq:mod-eval-model-resonance[] as an empirical model to describe the shape of the resonances in the atom cloud.
The amplitude $a_R$ and the width $sigma_R$ are not based on any theoretical model.
We are only using the amplitude $a_R$ to illustrate the changes of the resonance visibility as a function of the lattice depth $v_0$.
In #subref(<fig:mod-loss-result>, "a") we can see that the resonance amplitudes show a kink near the lattice depth $v_0 = #qty[65][Erec]$.
For higher lattice depths the resonance amplitude decreases rapidly, matching the observed visibility of the resonances.
In the x1064 lattice the resonances were already too faint for the evaluation at lattice depths $v_0 > #qty[75][Erec]$
This was not an issue in the z532 lattice where the evaluation returned consistent results even for $a_R < #num[0.1]$.

#figure(
  image("figures/modulation_loss_result.png"),

  caption: [
    Rapid decrease of the resonance amplitude $a_R$ for the transition $1 -> 3$ in deep lattices.
    In *a* we can see the results for the x1064 lattice and the z532 lattice.
    During the modulation in the x1064 lattice, the depth of the y1064 lattice is set to #qty[30][Erec] and the depth of the z532 lattice is set to #qty[100][Erec].
    This is the default configuration already introduced in @sec:mod-intro.
    For the modulation in the z532 lattice, the depth of the x1064 lattice and the y1064 lattice is set to #qty[20][Erec] which maximizes the resonance visibility for a fixed modulation amplitude.

    #show list: set text(red)
    - Find better colors for both axes...
    - Just use labels for the transitions in *b* instead of the legend?
    - Improve the ylabel in *b*?
    - Add a description for figure *b*...
    - Set the linestyle to \"none\"?
    - Mention the modulation amplitudes that were used here?
    - Is the data here actually good enough?
    - Add some images to show the low-amplitude resonances?
    - Add the transition $1 -> 4$?
  ],
) <fig:mod-loss-result>

Due to the kink in #subref(<fig:mod-loss-result>, "a"), we took a closer look at the band structure as a function of the lattice depth $v_0$.
While the energy associated with the transition $1 -> 3$ is just increasing monotonously with $v_0$, we found something interesting when looking at the possible transitions $3 -> n''$ in #subref(<fig:mod-loss-result>, "b").
Up to the lattice depth $v_0 approx #qty[65][Erec]$, the transition $3 -> 6$ overlaps with the transition $1 -> 3$.
Due to the width of the band $n'' = 6$, this overlap #tr[is valid/exists] for a wide range of lattice depths from #qty[30][Erec] to #qty[65][Erec].
This overlap can explain both the loss of atoms in general, as well as the rapid decrease of the resonance amplitude $a_R$.
If the modulation frequency $f_"mod"$ is resonant with the transitions $1 -> 3$ and $3 -> 6$ at the same time, the atoms can be completely removed from the lattice.
Above the band $n'' = 6$ the band structure is a continuous spectrum, and the atoms can be steadily heated out of the lattice potential.
Since this process only works if the atoms are already in the excited band $n' = 3$, the heating does not affect the initial measurement of the local lattice depth.
We just need this additional transition to an untrapped band to make the local occupation of the excited band visible.
The lack of overlap between the two transitions at $v_0 > #qty[65][Erec]$ will then rapidly reduce the resonance amplitude $a_R$.
The atoms will remain trapped in the excited band $n' = 3$, which is not resolvable with the in-situ imaging.

Since we can observe the kink for both the x1064 lattice and the z532 lattice, we can be certain that the loss mechanism does not require the coupling of two lattices.
We do however have to discuss the odd parity of the transition $3 -> 6$, which can have an effect on the #tr[efficienty/strength] of the heating process.
In @sec:mod-intro we learned that only transitions with even $Delta n$ are possible when the lattice depth is modulated.
For the x1064 lattice and the y1064 lattice we already knew that odd transitions such as $1 -> 4$ are possible #tr[ref Eugenio].
They will just be significantly weaker than the even transitions such as $1 -> 3$ and $1 -> 5$.
There are two possible effects that enable odd transitions after all.
If the lattice has a running-wave component, the modulation $delta v$ will also result in a small perturbation with an odd parity.
Furthermore, the overall confinement of the atoms will affect the Wannier functions such that their parity is no longer purely even or odd #tr[ref anything?].
While both effects are small, the resulting finite matrix elements for odd transitions are sufficient to #tr[allow/enable] the in-situ lattice modulation spectroscopy.

To confirm that the transition $3 -> n''$ is required for the visibility of the resonances, we are going to probe this transition with a secondary modulation frequency $f_"mod"^((2))$.
This secondary modulation is applied at the same time as the primary modulation.
If our understanding about the overlap of the transitions $1 -> 3$ and $3 -> 6$ is correct, we should see a recovery of the resonance amplitude at $v_0 > #qty[65][Erec]$ when applying the appropriate secondary modulation frequency.
To see the isolated effect of the secondary modulation frequency, we are going to conduct the measurement at $v_0 = #qty[70][Erec]$ where the gap between the transitions $1 -> 3$ and $3 -> 6$ is already #qty[4][kHz] wide.
For the primary modulation we are going to use the default amplitude $delta_v = #tr[??]$, where the resonances are barely visible.
If we would make the primary modulation too strong, we would already have a broadening on the primary transition $1 -> 3$.
#tr[We would just not be able to see the broadened resonances without the secondary modulation.]
The goal of this measurement is however to keep the primary transition as is, and to investigate the resonance amplitude $a_R$ as a function of the secondary modulation frequency.
As long as there is no other transition $1 -> n'$ available at the frequency $f_"mod"^((2))$, the secondary modulation will not result in additional resonances and we can use a strong modulation amplitude $delta v^((2)) slash delta v approx 5$.

In #subref(<fig:mod-loss-channels>, "b") we can see the recovery of the atom loss if the secondary modulation frequency $f_"mod"^((2))$ is resonant with one of the available transitions $3 -> n''$ in #subref(<fig:mod-loss-channels>, "a").
The scan of $f_"mod"^((2))$ starts just above the transition $1 -> 3$ and ends just below the transition $1 -> 4$ at #qty[190][kHz].
It does not make sense to start this scan with the secondary modulation frequency equal to the (primary) modulation frequency.
The transition $1 -> 3$ would get broadened due to the stronger modulation amplitude, and we would have a different initial state compared to the data in #subref(<fig:mod-loss-channels>, "b").
Instead, we have to use the resonance amplitude from a measurement without the secondary modulation.
At a lattice depth of $v_0 = #qty[71][Erec]$ we measured the resonance amplitude $a_R approx #num[0.1]$, which matches the baseline where the secondary modulation frequency is not resonant.
We used the expected frequency of the transition $1 -> 4$ as the upper limit for the secondary modulation frequency to avoid an additional loss channel.
While the transition $1 -> 4$ is suppressed because of its parity, the strong modulation amplitude $delta v^((2))$ is sufficient to create additional resonances in the atom cloud.
If these resonances would be in the proximity of the primary resonances, we can no longer use the resonance amplitude $a_R$ to quantify the atom loss through the channel $1 -> 3 -> n''$.

Even though the enhancement of the resonance amplitude $a_R$ due to the secondary modulation frequency works as expected, it is generally not worth it to use this for the lattice calibration.
For the x1064 lattice and the y1064 lattice, there is no upside to calibrating the lattice depth at #qty[70][Erec] or #qty[80][Erec] compared to the usual lattice depth of #qty[60][Erec].
The width of the excited band $n' = 3$ is already #tr[negligible/irrelevant] compared to the width of the resonances $sigma_R$.
An even #tr[lower/smaller] band width can therefore not improve the calibration.
The downside of the measurement is the sensitivity to the secondary modulation frequency.
If we set the lattice depth to $v_0 = #qty[80][Erec]$ in the sequence, the local lattice depth $v(x, y)$ can go down to #qty[75][Erec] towards the outside of the atom cloud.
We therefore have to check that the secondary modulation frequency is resonant across the entire atom cloud.
If we could use the entire upper band $n'' = 6$ or $n'' = 7$, this would not be an issue.
The additional gaps due to the coupling of the x1064 lattice and the y1064 lattice can however make the secondary modulation frequency off-resonant #tr[(again)].
This additional complexity is not worth the effort for regular calibration measurements.
Conveniently, the transition $1 -> 5$ is sufficiently narrow for the in-situ lattice modulation spectroscopy starting from the lattice depth $v_0 approx #qty[85][Erec]$.
The corresponding loss channels $1 -> 5 -> 10$ and $1 -> 5 -> 11$ work with a single modulation frequency again.
For the z532 lattice we are already using this as at the lattice depth $v_0 = #qty[100][Erec]$.
The band structure predicts that the transition $1 -> 5$ can be used up to $v_0 = #qty[220][Erec]$, before the overlap with the transition $5 -> 11$ #tr[stops/vanishes].
In practice, this range of possible lattice depths will be sufficient #tr[something to conclude the section?].

#figure(
  image("figures/modulation_loss_channels.png"),
  caption: [
    Loss channels as a function of the lattice depth.
    In *a* the frequencies corresponding to the transitions $3 -> n''$ are shown for an x1064-lattice depth of #qty[70][Erec].
    For this #tr[(specific)] lattice depth, the expected frequency for the transition $1 -> 3$ is #qty[133][kHz], which is marked by the vertical dashed line.
    The solid black lines are computed from the one-dimensional band structure, and the colored lines are computed from the coupled band structure with the y1064-lattice depth #qty[25][Erec] and the coupling angle #tr[$alpha = #num[4.6]degree$].
    The coupling of the x1064 lattice #tr[and/to] the y1064 lattice is responsible for the gap in the transition $3 -> 6$, see @sec:mod-coupled for the details.
    The shaded regions in *b* show the transitions in *a* without the quasimomentum resolution.
    We can see that the resonance amplitude $a_R$ follows the available transitions $3 -> n''$.
    In the gaps of the coupled band structure, the atoms are not excited to an untrapped band, resulting in faint resonances.
    The areas in *c* showcase the recommended atom-loss channel depending on the lattice depth.
    Up to #qty[65][Erec] we can just use the transitions $1 -> 3$ with a single modulation frequency.
    In deeper lattices we have to use the #tr[two-tone modulation] as shown in *a* and *b* to lose the atoms efficiently.
    Above a lattice depth of #qty[85][Erec] we can #tr[(just)] use the transition $1 -> 5$ with a single modulation frequency again.
    We expect the atom loss to work up to a lattice depth of #qty[220][Erec], above shich a secondary modulation frequency would be required again.

    #show list: set text(red)
    - How to reference the @sec:mod-coupled?
    - Mention transition $1 -> 4$ as the limit?
    - Should I really combine these two axes?
    - Annotate the full loss channels $1 -> 3 -> 6$ in *c*?
    - Show anything for the transition $1 -> 5$ here?
    - Add a point or line for $a_R$ without the secondary modulation?
    - Discuss the slight mismatch between the data and the coupled theory?
  ],
) <fig:mod-loss-channels>
