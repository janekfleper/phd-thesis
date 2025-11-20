#import "/header.typ": *
#import "figures/x1064-images/figure.typ": figure as figure-x1064-images

== Introduction to #lms <sec:mod-intro>

The general idea of the #lms as a calibration technique is to probe the band structure by exciting atoms from the lowest band to higher bands @friebel_co_1998.
Here, we apply a modulation to the lattice depth #V0 to get the time-dependent lattice potential

$
  V(tau) = V0 + dV dot sin(2 pi fmod tau)
$ <eq:mod-intro-function>

with the modulation amplitude #dV and the modulation frequency #fmod.
The modulation acts as a perturbation with an even parity on the Wannier functions#footnote[
  We use the Wannier basis since the lattice potential is frozen and the atoms are strongly localized.

] (see #subref(<fig:mod-intro-theory>, "a")).
With the perturbation, the pairs of Wannier functions with an even $Dn = n' - n$ show a small overlap, while the those with an odd #Dn remain orthogonal.
As a result, the modulation can excite atoms to higher bands if #Dn is even#footnote[
  In practice, excitations with $Dn = 1$ are only suppressed compared to excitations with $Dn = 2$, but not completely forbidden @cocchi_analogue_2016.
  This is discussed in more detail in @sec:mod-loss in the context of the loss mechanism.
] and the energy $h dot fmod$ is equal to the gap $Delta epsilon = epsilon_n' - epsilon_n$ between the bands.
In the Wannier picture, we consider the mean energy of the bands, which is appropriate as long as the gap $Delta epsilon$ is much larger than the respective band widths $delta epsilon_n$.

If the atoms initially occupy the lowest band $n = 1$, the band with index $n' = 3$ is the first higher band that is suitable for the even parity of the modulation.
To realize a band structure where the width of the two bands is negligible compared to the energy gap, we need a lattice depth $V0 >= #qty[40][Erec]$ (see #subref(<fig:mod-intro-theory>, "b")).
In this regime, the band width $delta epsilon_3$ is smaller than the energy gap $Delta epsilon = epsilon_3 - epsilon_1$ by at least two orders of magnitude#footnote[
  Compared to any higher band, the width of the first band is always negligible (see @fig:theory-bloch-energy-bands).
].
While the narrow bands are generally desirable for the #lms as a calibration technique, they are an essential condition for the in-situ measurement of the lattice depth $V0(x, y)$.
If the band widths are not negligible, the equipotential lines we measure in the atomic densities are broadened.
This would impose a limitation on the precision of the measurement, and we would need to consider the density of states of the energy bands $band_n (q)$.

As already discussed in the introduction of this chapter, the in-situ detection requires a loss of the atoms that are excited to the higher band $n' = 3$.
The tunneling amplitude in the third band is not sufficient to remove the atoms from the three-dimensional optical lattice.
To realize the atom loss, the atoms are excited to an even higher band $n''$ with an energy greater than the lattice depth #V0.
From this band, the atoms are heated out of the lattice potential to deplete the atom cloud along the equipotential lines that are resonant for the modulation frequency.
Up to the lattice depth $V0 = #qty[65][Erec]$, this loss mechanism is automatically enabled since a modulation at the resonance frequency #fnm(1, 3) also drives the transition $3 -> 6$.
Due to the width of the band $n'' = 6$ (see #subref(<fig:mod-intro-theory>, "a")), the loss mechanism is uniform across the atom cloud.
The loss mechanism is discussed in detail in @sec:mod-loss, where we use a lattice depth $V0 >= #qty[65][Erec]$ and a second modulation frequency to confirm the requirement of the untrapped band $n''$.

#floating-figure(
  image("figures/modulation_introduction.png", width: 100%),
  caption: [
    Wannier functions and energy bands in an optical lattice potential.
    *a*, Wannier functions $w_n (x)$ and energy bands $epsilon_n (q)$ for the band indices $n <= 6$ in an optical lattice with the depth $V0 = #qty[60][Erec]$ and the modulation amplitude $dV = #qty[2][Erec]$ (shaded area).
    The Wannier functions are localized at $x_0 = 0$ and shifted by the mean energy of the corresponding bands $epsilon_n (q)$.
    The parity of the Wannier functions alternates with the band index $n$.
    *b*, Width of the energy bands depending on the lattice depth #V0.
    The diagonal line indicates the maximum #V0 of the lattice potential, and the dashed vertical line marks the lattice depth $V0 = #qty[60][Erec]$ in *a*.

    // TODO: Use annotations instead of the legend?
  ],
  label: <fig:mod-intro-theory>,
)

In the experimental sequence to measure the in-situ #lms, we load the atoms into the three-dimensional optical lattice consisting of the #z532 lattice and the two infrared in-plane lattices shown in @fig:setup-lattices.
The #x532 lattice is only turned on for its own calibration sequence (see @sec:mod-super).
After the initial loading, the lattices are frozen to pin the atoms to their lattice sites.
All lattices must be frozen to suppress the tunneling of the atoms along all three dimensions.
This is essential for the in-situ #lms to prevent a redistribution of the remaining atoms.
Before applying the modulation according to @eq:mod-intro-function, we remove the atoms in the $m_F$ state #mF(9) using a resonant light pulse to prepare a spin-polarized atom cloud.
The interaction energy $U$ would introduce additional energy levels, while we only want to probe the band structure computed from Bloch's theorem in @sec:theory-bloch.

The optical setup of each lattice features a power regulation with a photodiode on the experimental table and an acousto-optical modulator (AOM) on the laser table.
We apply the modulation to the amplitude of the radio-frequency signal that drives the AOM.
For all lattices in the experimental setup, the possible modulation frequencies #fmod are much greater than the band width of the power regulation.
We can, therefore, apply the modulation without affecting the power regulation.
Depending on the modulated lattice, we use a modulation amplitude $dV slash V0$ between #qty[1][%] and #qty[10][%] for a modulation time up to $tau_"mod" = #qty[1][s]$.
We select the modulation amplitude #dV to achieve a good visibility of the resonances in the atom cloud.

For the infrared in-plane lattices, we use the lattice depth $V0 = #qty[60][Erec]$ for the modulated lattice and #qty[30][Erec] for the other lattice to minimize the effects of the coupled band structure (see @sec:mod-coupled).
With $#unit[Erec] slash h = #qty[4.4][kHz]$, the expected transition frequency in the center of the optical lattice is $f_(1->3) approx #qty[121.6][kHz]$.
Based on the waists of the #x1064 lattice and the #y1064 lattice, we expect the modulation frequency to change by $delta fmod approx #qty[5][kHz]$ across the atom cloud.
For a calibration of the lattice depth $V0(x, y)$, we scan the modulation amplitude in steps of #qty[0.5][kHz] up to the frequency $fmod = #qty[122.5][kHz]$.
In @fig:mod-intro-images, the series of in-situ images is shown for the modulation of the #x1064 lattice.
For the lowest modulation frequency $fmod = #qty[118.0][kHz]$, we observe narrow resonances near the edge of the atom cloud.
The resonances move towards the lattice axis with increasing step sizes as the modulation frequency is incremented.
The inhomogeneity of the lattice depth also causes the resonances to broaden towards the center.
Both effects match the expected behavior of the intensity profile of the Gaussian lattice beams.

#floating-figure(
  figure-x1064-images(),
  caption: [
    In-situ #lms of the #x1064 lattice.
    The modulation frequency is scanned from #qty[118.0][kHz] (*a*) to #qty[122.5][kHz] (*j*) in steps of #qty[0.5][kHz].
    The resonances show the equipotential lines where the energy gap between the bands $n = 1$ and $n' = 3$ in the lattice potential $Vx1064(x, y)$ is equal to $h dot fmod$.
    The lattice depth is set to $#Vx1064 = #qty[60][Erec]$, the modulation time is set to $tau_"mod" = #qty[0.75][s]$ and the modulation amplitude is set to $dV slash Vx1064 = #tr[#qty[3][%]]$.
    The angle of the resonances in the #xy-plane matches the expected angle of the #x1064\-lattice axis relative to the camera frame.

    // TODO: Only use a single label for the y-axis and the x-axis?
    // TODO: Use a different colormap?
  ],
  label: <fig:mod-intro-images>,
  placement: bottom,
)
