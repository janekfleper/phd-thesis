#import "/header.typ": *
#import "figures/figures.typ": figure-level-structure
#import "figures/k40_hyperfine/figure.typ": figure as figure-hyperfine
#import "figures/k40_feshbach/figure.typ": figure as figure-feshbach

== Properties of #K40 <sec:setup-k40>

Potassium is an alkali metal with the atomic number $Z = 19$.
As for any alkali metal, the electronic properties of potassium depend on the single electron in the outermost orbital, while the electrons occupying the inner orbitals mainly shield the charge of the nucleus @foot_atomic_2005.
The experimental setup in this thesis was built to work with the fermionic isotope #K40.
Compared to the bosonic isotopes #phy.isotope("K", a: [39]) and #phy.isotope("K", a: [41]), the isotope #K40 has a very low natural abundance which requires the usage of an enriched potassium source @feld_low_2011.
The physical properties, optical properties and scattering properties of these three potassium isotopes are compiled in @tiecke_properties_2011.
In this section, I will only mention a selection of the most important properties to understand the experimental setup and the manipulation of the internal states of the potassium atoms.

The electronic ground state of potassium is $4 sn(S, 1/2)$ in the spectroscopic notation $n attach(L, tl: 2S+1, br: J)$.
The primary optical transitions are the D1 and D2 lines to the excited states $4 sn(P, 1/2)$ and $4 sn(P, 3/2)$ respectively#footnote[
  The principal quantum number $n = 4$ is omitted from here on.
].
The corresponding wavelengths are $lambda_"D1" approx #qty[770.1][nm]$ and $lambda_"D2" approx #qty[766.7][nm]$, where laser sources and optical elements are readily available.
In the context of this experiment, we are only using the D2 line since it offers a closed optical transition.

With a nuclear spin of $I = 4$, the isotope #K40 has a rich hyperfine structure that is essential for the internal-state manipulation during the experimental sequence (see @sec:setup-sequence).
In the electronic ground state $sn(S, 1/2)$, there are two hyperfine manifolds corresponding to the total angular momenta $F = 7 slash 2$ and $F = 9 slash 2$.
Due to the positive sign of the nuclear gyromagnetic factor $g_I$, the hyperfine structure is inverted (see @fig:setup-k40-hfs).
Analogous to the ground state $sn(S, 1/2)$, the excited state $sn(P, 1/2)$ is split into the two hyperfine states $phy.ket(F' = 7 slash 2)$ and $phy.ket(F' = 9 slash 2)$.
With $J = 3 slash 2$, the excited state $sn(P, 3/2)$ is split into four hyperfine states from $phy.ket(F' = 5 slash 2)$ to $phy.ket(F' = 11 slash 2)$.
Since the factor $g_I$ does not depend on the electronic state, the excited states also experience an inverted hyperfine structure.
The relevant optical transitions between the hyperfine states are shown in #subref(<fig:setup-k40-hfs>, "a").

#floating-figure(
  grid(
    columns: (1.2fr, 2fr),
    column-gutter: 1em,
    figure-level-structure(), figure-hyperfine(height: 6.7cm),
  ),
  caption: [
    Hyperfine structure of #K40.
    *a*, Level structure with the hyperfine splitting of the ground state $sn(S, 1/2)$ and the excited state $sn(P, 3/2)$.
    We use the D2 line between the states $phy.ket(F = 9 slash 2)$ and $phy.ket(F' = 11 slash 2)$ for the magneto-optical trap (see @sec:setup-prepare-mot) and the imaging of the atoms (see @ssec:setup-sequence-detect).
    In addition, the transition between $phy.ket(F = 7 slash 2)$ and $phy.ket(F' = 9 slash 2)$ is required for the repumping in the magneto-optical trap.
    *b*, $m_F$ states of the ground state $sn(S, 1/2)$ as a function of the external magnetic field $B$.
    In the lower hyperfine manifold $phy.ket(F = 9 slash 2)$, the upper four $m_F$ states (black) are used for the magnetic evaporation (see @sec:setup-prepare-ioffe).
    The lowest three $m_F$ states (blue) in the lower manifold and the state $m_F = -7 slash 2$ in the upper manifold are used for the detection and the imaging.
  ],
  label: <fig:setup-k40-hfs>,
)

In an external magnetic field, the hyperfine states split up based on the quantum number $m_F$ @foot_atomic_2005.
If the magnetic field is weak compared to the coupling of the electron angular momentum $hat(phy.vb(J))$ and the nuclear angular momentum $hat(phy.vb(I))$, the states are shifted by $E prop m_F B$ according to the Zeeman effect.
In intermediate magnetic fields, the coupling of the two angular momenta $hat(phy.vb(J))$ and $hat(phy.vb(I))$ starts to break down.
For large magnetic fields, the Paschen-Back regime is reached where the energy shift is $E prop m_J B$.
In general, the energy shifts can be computed with the Breit-Rabi formula that takes the internal coupling of the angular momenta and their coupling to the external magnetic field $B$ into account @breit_measurement_1931.
In #subref(<fig:setup-k40-hfs>, "b"), the energies $E(B)$ are shown for both hyperfine manifolds in the ground state $sn(S, 1/2)$.
At $B = 0$, the difference between the two manifolds corresponds to the total hyperfine splitting of the ground state in #subref(<fig:setup-k40-hfs>, "a").
During the later stages of the experimental sequence, the atoms only occupy the lowest $m_F$ states in #subref(<fig:setup-k40-hfs>, "b").
We are therefore using the naming convention

$
  phy.ket(N) eq.triple FmF(9/2, -N/2)
$ <eq:setup-k40-hfs-naming>

to refer to these states as #mF(9), #mF(7), #mF(5) and #mF(3).
All other states are always labeled explicitly with the quantum numbers $F$ and $m_F$.

As already mentioned for the interaction strength $U$ in @eq:theory-wannier-interaction-strength, two atoms interact if they are close to each other.
This interaction is characterized by the scattering length #asc that depends on the internal states of the two atoms.
In an external magnetic field, the scattering length can be tuned by a Feshbach resonance

$
  asc = a_"bg" (1 - Delta / (B - B_0)) eqc
$ <eq:setup-k40-feshbach>

where $a_"bg"$ is the background scattering length, $Delta$ is the resonance width and $B_0$ is the resonance position @chin_feshbach_2010.
For the isotope #K40, an extensive compilation of Feshbach resonances and their properties can be found in @ludewig_feshbach_2012.
In the context of this thesis, we use the s-wave Feshbach resonances of the lowest three $m_F$ states (see @fig:setup-k40-fesbhach).
Of the three possible mixtures, only the mixture #mix(9, 7) is fully stable.
The other two mixtures can experience losses due to magnetic dipole-dipole relaxation @ludewig_feshbach_2012.
This can lead to a reduction of the lifetime if we keep the mixture for an extended amount of time @cocchi_analogue_2016.
We are therefore using the mixture #mix(9, 7) to represent the spin states #ketup and #ketdown during the experimental sequence (see @fig:setup-sequence).
The Feshbach resonance at $B_0 = #qty[202.1][G]$ provides access to all required interaction regimes.
Strongly repulsive interactions are available in the range $#qty[190][G] < B < #qty[200][G]$, where they were previously used for measurements of the two-dimensional Fermi-Hubbard model @cocchi_equation_2016.
Around the zero-crossing at $B approx #qty[210][G]$, we can continuously tune the interactions from the strongly attractive regime to the background scattering length $a_"bg" slash a_0 = #num[167]$.

#floating-figure(
  figure-feshbach(width: 11cm, height: 6.5cm),
  caption: [
    Magnetic Feshbach resonances in #K40.
    The Feshbach resonances are computed from the coupled-channel parameters in @ludewig_feshbach_2012.
    The dashed vertical lines indicate the resonance positions $B_0$.
  ],
  label: <fig:setup-k40-fesbhach>,
  placement: bottom,
)
