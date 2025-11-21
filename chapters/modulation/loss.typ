#import "/header.typ": *
#import "figures/loss_result/figure.typ": figure as figure-loss-result
#import "figures/loss_channels/figure.typ": figure as figure-loss-channels

== Investigation of the atom-loss mechanism <sec:mod-loss>

#notes[
  // - Mention the resonance amplitude before the section?
  // - Use error estimation for the resonance amplitude here?
]

In @sec:mod-intro, I already discussed the requirement of an untrapped band to lose the excited atoms in the band $n'$.
For the in-situ #lms in the #x1064 lattice and the #y1064 lattice, we use the lattice depth $V0 = #qty[60][Erec]$ and the band transition $1 -> 3$.
In the band $n' = 3$, the atoms are not completely frozen with the tunneling amplitude $t slash h approx #qty[40][Hz]$.
While this is sufficient for the atoms to tunnel in the modulated lattice, the radial potential by the perpendicular in-plane lattice still imposes a strong confinement on the atoms.
Therefore, if the atoms are only excited to the band $n' = 3$, the in-situ detection does not show depleted resonances.
To visualize the occupation of the band $n' = 3$ an additional excitation of the atoms to the band $n'' = 6$ is required.
Above the band $n'' = 6$, the band structure forms a continuous spectrum to heat the atoms out of the three-dimensional potential.
In this section, I will determine the threshold of the lattice depth #V0 for the atom-loss mechanism with a single modulation frequency.
Subsequently, I will discuss the generalization of the in-situ #lms for lattice depths $V0 >= #qty[40][Erec]$.

To investigate the atom-loss mechanism that enables the resonance visibility, we modulate the #x1064 lattice and scan the lattice depth #Vx1064 from #qty[50][Erec] to #qty[75][Erec].
We do not expect the transition $1 -> 3$ to affect the resonance visibility since the widths of the lower and upper band are only subject to small changes.
Instead, we attribute all changes of the resonance visibility to the transition $3 -> 6$.
To quantify the resonance visibility, we use the dimensionless resonance amplitude #fitaR from the fit model in @eq:mod-eval-model-resonance.
In #subref(<fig:mod-loss-result>, "a"), we observe a rapid decrease of the resonance amplitude above the lattice depth $Vx1064 approx #qty[65][Erec]$.
This critical lattice depth matches the overlap between the transition frequencies #fnm(1, 3) and #fnm(3, 6) in #subref(<fig:mod-loss-result>, "b").
Below $Vx1064 approx #qty[65][Erec]$, a single modulation frequency is sufficient for the loss channel $1 -> 3 -> 6$.
In deeper lattices, the transition $3 -> 6$ is no longer resonant for the modulation frequency #fmod.
As a consequence, most of the excited atoms remain in the band $n' = 3$ where they are still trapped in the optical lattice.
The resonance amplitude #fitaR does not decrease in a single step due to the inhomogeneity of the lattice depth $Vx1064(x, y)$.
While the setpoint #Vx1064 quantifies the lattice depth on the lattice axis, the mean lattice depth is always lower by a few percent.

#floating-figure(
  figure-loss-result(),
  caption: [
    Decrease of the resonance amplitude $a_R$ in deep lattices.
    *a*, Resonance amplitude #fitaR as a function of the lattice depth #V0.
    We observe a significant decrease of the resonance amplitude at $V0 >= #qty[65][Erec]$.
    The insets highlight the reduced visibility of the resonances.
    *b*, Available band transitions depending on the lattice depth #V0.
    The transition $3 -> 6$ can only be accessed by the modulation frequency $fmod = fnm(1, 3)$ up to $V0 approx #qty[65][Erec]$, while the transition $3 -> 5$ is never resonant.
    In deeper lattices, most of the atoms remain in the higher band $n' = 3$ which reduces the visibility of the resonances.
  ],
  label: <fig:mod-loss-result>,
)

In @sec:mod-intro, we explain that band transitions with even #Dn are preferred for the modulation of the lattice depth according to @eq:mod-intro-function.
The even parity of the modulation induces a small overlap of Wannier functions with the same parity, while Wannier functions with the opposite parity remain orthogonal.
Nevertheless, the band transition $3 -> 6$ is possible here to achieve the atom loss.
There are two possible effects that enable odd transitions between energy bands.
If the lattice potential has a running-wave component, the modulation #dV also results in a small perturbation with an odd parity.
Furthermore, the overall confinement of the atoms in the three-dimensional optical lattice affects the Wannier functions such that their parity is no longer purely even or odd.
This effect becomes stronger for higher bands since the corresponding Wannier functions are no longer strongly localized to the lattice sizes (see #subref(<fig:mod-intro-theory>, "a")).
While both effects are small, the resulting matrix elements for odd transitions are sufficient to enable the loss channel $3 -> 6$ for the in-situ #lms.
However, compared to even transitions such as $1 -> 3$ or $1 -> 5$, the odd transitions remain weaker.

#floating-figure(
  figure-loss-channels(),
  caption: [
    In-situ #lms with a secondary modulation frequency.
    *a*, Resonance amplitude #fitaR depending on the secondary modulation frequency #fmod2.
    We apply a constant modulation frequency $fmod = #qty[133.0][kHz]$ (dashed line) corresponding to the lattice depth $Vx1064 = #qty[70][Erec]$ to excite the atoms to the band $n' = 3$.
    If #fmod2 is resonant for a transition $3 -> n''$, the resonance amplitude goes up to $fitaR = 0.9$.
    In the band gaps, we observe the same resonance amplitude #fitaR as in the reference measurement without the secondary modulation frequency (solid line).
    *b*, Band transitions $3 -> 6$ and $3 -> 7$ according to the coupled band structure (see @sec:mod-coupled) with the lattice depth $Vy1064 = #qty[25][Erec]$ and the relative angle $fitang = #deg[-4.9]$.
    The solid lines show the transitions in the one-dimensional band structure without the coupling.
    *c*, Regimes for the in-situ #lms.
    Up to $V0 approx #qty[65][Erec]$, we use the loss channel $1 -> 3 -> 6$ with a single modulation frequency.
    Above $V0 approx #qty[85][Erec]$, we use the transition $1 -> 5$ where the modulation frequency enables the atom loss through the band $n'' = 10$.
    In the intermediate regime $#qty[65][Erec] lt.approx V0 lt.approx #qty[85][Erec]$, we have to rely on the secondary modulation frequency to use the in-situ #lms.

    // TODO: Anything to add for the description of axes *b*?
    // TODO: Make the vertical line in *a* and *b* solid?
  ],
  label: <fig:mod-loss-channels>,
)

To confirm that the transition $3 -> n''$ is required for the visibility of the resonances, we probe the transition with the secondary modulation#footnote[
  For technical reasons, the secondary modulation is applied at the same time as the primary modulation.
] at the frequency #fmod2.
If our understanding about the loss channel $1 -> 3 -> 6$ is correct, we can see a recovery of the resonance visibility at $V0 > #qty[65][Erec]$ with the appropriate secondary modulation frequency.
To see the isolated effect of the secondary modulation frequency, we conduct the measurement at $Vx1064 = #qty[70][Erec]$ where the frequencies of the transitions $1 -> 3$ and $3 -> 6$ are already detuned by approximately #qty[4][kHz].
For the primary modulation, we use the default amplitude $dV slash Vx1064 = #tr[#qty[3][%]]$ where the resonances are barely visible at $Vx1064 = #qty[70][Erec]$.
Since no other transition $1 -> n'$ is available at the frequency #fmod2, we can use a strong modulation amplitude $dV^((2)) slash dV approx 5$ without affecting the atoms in the lowest band.
In #subref(<fig:mod-loss-channels>, "a") we observe the recovery of the resonance visibility if the secondary modulation frequency #fmod2 is resonant with one of the available transitions $3 -> n''$ in #subref(<fig:mod-loss-channels>, "b").
Despite the additional band gaps of the coupled band structure, we can always find a fixed modulation frequency #fmod2 to enable the atom-loss mechanism across the entire atom cloud.
This is essential to extend the parameter regime of the in-situ #lms as a calibration technique for the lattice depth $V0(x, y)$.

For the #z532 lattice, where we can set the lattice depth to $V0 > #qty[85][Erec]$, we use the band transition $1 -> 5$ instead of the band transition $1 -> 3$ for the in-situ #lms.
For lattice depths $V0 < #qty[85][Erec]$, using the excited band $n' = 5$ is not recommended since its band width $delta band_5$ is not small compared to the transition frequency #fnm(1, 5).
As shown in #subref(<fig:mod-intro-theory>, "a"), the band $n' = 5$ is only weakly trapped in the lattice potential at $V0 = #qty[60][Erec]$, and it has a substantial band width compared to the band $n' = 3$.
In lattices with $V0 > #qty[85][Erec]$, the relative band width is $delta band_5 slash (h dot fnm(1, 5)) <= 0.01$.
For the band $n' = 5$, the atom-loss mechanism is automatically enabled through the untrapped band $n'' = 10$ (see #subref(<fig:mod-loss-channels>, "c")).
If we also take the band $n'' = 11$ into account, the in-situ #lms with a single modulation frequency works up to $V0 = #qty[220][Erec]$.
With these two regimes for the transitions $1 -> 3$ and $1 -> 5$, we can apply the in-situ #lms in a wide range of lattice depths.
The secondary modulation frequency introduced in this section enables us to seamlessly connect these two regimes.
