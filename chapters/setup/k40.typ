#import "/header.typ": *
#import "figures/figures.typ": level-structure

== Properties of #K40 <sec:setup-k40>

#notes[
  - Mention the low natural abundance of K40? Here or in @sec:setup-prepare-mot?
  - Explain what s-wave Feshbach resonances are? In comparison to p-wave resonances?
]

Potassium is an alkali metal with the atomic number $Z = 19$.
The electronic properties of potassium depend on the single electron in the outermost orbital, while the electrons occupying the inner orbitals only shield the charge of the nucleus.
The experimental setup in this thesis was built to work with the fermionic isotope #K40.
There are also two naturally abundant bosonic isotopes, #phy.isotope("K", a: [39]) and #phy.isotope("K", a: [41]), which are used in experiments with ultracold atoms and molecules #tr[add some citations...].
The physical properties, optical properties and scattering properties of these three potassium isotopes are compiled in @tiecke_properties_2011.
In this section, I will only mention a selection of the most important properties to understand the experimental setup and the manipulation of the internal states of the potassium atoms.

The electronic ground state of potassium is $4 sn(S, 1/2)$ in the spectroscopic notation $n attach(L, tl: 2S+1, br: J)$.
As for all alkali atoms, the primary electronic transitions are the D1 and D2 lines to the excited states $4 sn(P, 1/2)$ and $4 sn(P, 3/2)$ respectively.
The corresponding wavelengths are $lambda_"D1" approx #qty[770.1][nm]$ and $lambda_"D2" approx #qty[766.7][nm]$.
Both wavelengths are in the near-infrared regime with readily available laser sources and optical elements.
In the context of this experiment, we are only using the D2 line since it has a closed optical transition.
I am also going to omit the principal quantum number from the spectroscopic notation since all electronic states of #K40 discussed in this thesis have $n = 4$.

With a nuclear spin of $I = 4$, the isotope #K40 has a rich hyperfine structure that is essential for the internal-state manipulation during the experimental sequence (see @sec:setup-sequence).
In the electronic ground state $sn(S, 1/2)$ with $J = 1 slash 2$, there are two hyperfine manifolds corresponding to the total angular momenta $F = 7 slash 2$ and $F = 9 slash 2$.
Due to the positive sign of the nuclear gyromagnetic factor $g_I$, the hyperfine structure is inverted and the state $phy.ket(F = 9 slash 2)$ has the lowest energy (see @fig:setup-k40-hfs).
The excited state $sn(P, 1/2)$ is split into the two hyperfine states $phy.ket(F' = 7 slash 2)$ and $phy.ket(F' = 9 slash 2)$, while the excited state $sn(P, 3/2)$ is split into four hyperfine states from $phy.ket(F' = 5 slash 2)$ to $phy.ket(F' = 11 slash 2)$.
Since $g_I$ does not depend on the electronic state, the excited states also experience an inverted hyperfine structure.
The relevant optical transitions between the hyperfine states are shown in #subref(<fig:setup-k40-hfs>, "a").

#floating-figure(
  block({
    image("figures/setup_k40_hyperfine.png")
    place(top + left, dx: 0.1cm, dy: 0.5cm, scale(50%, reflow: true, level-structure()))
  }),
  caption: [
    Hyperfine structure of #K40.
    The level structure in *a* shows the hyperfine splitting of the ground state $sn(S, 1/2)$ and the excited state and $sn(P, 3/2)$.
    In the ground state $sn(S, 1/2)$, the hyperfine splitting $Delta E slash h = #qty[1285.8][MHz]$ is large compared to the splitting in the excited state $sn(P, 3/2)$ with $Delta E slash h < #qty[100][MHz]$.
    We use the D2 line between the states $phy.ket(F = 9 slash 2)$ and $phy.ket(F' = 11 slash 2)$ for the magneto-optical trap (see @sec:setup-prepare-mot) and the imaging of the atoms (see @ssec:setup-sequence-detect).
    In addition, the transition between $phy.ket(F = 7 slash 2)$ and $phy.ket(F' = 9 slash 2)$ is required for the repumping in the magneto-optical trap.
    In *b*, the $m_F$ states of the ground state $sn(S, 1/2)$ are shown as a function of an external magnetic field $B$.
    In the lower manifold $phy.ket(F = 9 slash 2)$, the four upper $m_F$ states (black) are used during the magnetic evaporation (see @sec:setup-prepare-ioffe).
    The four lowest $m_F$ states in the lower manifold and the state $m_F = -7 slash 2$ in the upper manifold are used for the detection and the imaging.

    #notes[
      - Add labels for hyperfine splitting in *a*. Between $F' = 9 slash 2$ and $F' = 11 slash 2$ should be enough in the excited state...
      - Synchronize the HFS colors with the later sequence figures... Or just remove the HFS colors since they are not really useful later?
    ]
  ],
  label: <fig:setup-k40-hfs>,
)

In an external magnetic field, the hyperfine states will split up based on their quantum number $m_F$ @foot_atomic_2005.
If the magnetic field is weak compared to the coupling of the electron angular momentum $hat(phy.vb(J))$ and the nuclear angular momentum $hat(phy.vb(I))$, the states will be shifted by $E prop m_F B$ according to the Zeeman effect.
In intermediate magnetic fields, the coupling of the two angular momenta $hat(phy.vb(J))$ and $hat(phy.vb(I))$ starts to break down.
For large magnetic fields, the Paschen-Back regime is reached where the energy shift is $E prop m_J B$.
In general, the energy shifts can be computed with the Breit-Rabi formula that takes the internal coupling of the angular momenta and their coupling to the external magnetic field $B$ into account @breit_measurement_1931.
In #subref(<fig:setup-k40-hfs>, "b"), the energies $E(B)$ are shown for both manifolds in the ground state $sn(S, 1/2)$.
At $B = 0$, the difference between the two manifolds corresponds to the total hyperfine splitting of the ground state in #subref(<fig:setup-k40-hfs>, "a").
During the later stages of the experimental sequence, the atoms will only occupy the lowest $m_F$ states in #subref(<fig:setup-k40-hfs>, "b").
We are therefore using the naming convention

$
  phy.ket(N) eq.triple FmF(9/2, -N/2)
$ <eq:setup-k40-hfs-naming>

to refer to these states as #mF(9), #mF(7), #mF(5) and #mF(3).
All other states are always labeled explicitly with the quantum numbers $F$ and $m_F$.

As already mentioned for the interaction strength $U$ in @eq:theory-wannier-interaction-strength, two atoms can interact if they are close to each other.
This interaction is characterized by the scattering length #asc that is usually specified in units of the Bohr radius $a_0$.
The scattering length depends on the internal states of the two atoms, and it can be tuned in an external magnetic field $B$ with so-called _Feshbach resonances_ @chin_feshbach_2010.
The tunability is described by the expression

$
  asc = a_"bg" (1 - Delta / (B - B_0))
$ <eq:setup-k40-feshbach>

where $a_"bg"$ is the background scattering length, $Delta$ is the resonance width and $B_0$ is the resonance position.
Feshbach resonances have been studied extensively in ultracold atoms since their initial observation in a Bose-Einstein condensate of #phy.isotope("Na", a: [23]) @inouye_observation_1998.
For the isotope #K40, an extensive compilation of Feshbach resonances and their properties can be found in @ludewig_feshbach_2012.
In the context of this thesis, we are only looking at the s-wave Feshbach resonances between the three lowest $m_F$ states (see @fig:setup-k40-fesbhach).
Of the three mixtures, only the mixture #mix(9, 7) is fully stable.
The other two mixtures can experience losses due to magnetic dipole-dipole relaxation @ludewig_feshbach_2012.
This can lead to a reduction of the lifetime if we keep the mixture for an extended amount of time @cocchi_analogue_2016.
We are therefore mostly using the mixture #mix(9, 7) during the experimental sequence (see @fig:setup-sequence).
The Feshbach resonance at $B_0 = #qty[202.1][G]$ provides access to all required interaction regimes.
Strongly repulsive interactions are available in the range $#qty[190][G] < B < #qty[200][G]$, where they were previously used for measurements of the two-dimensional Fermi-Hubbard model @cocchi_equation_2016.
Around the zero-crossing at $B approx #qty[210][G]$, we can continuously tune the interactions from the strongly attractive regime to the background scattering length $a_"bg" slash a_0 = #num[167.0]$.
If we want to cross the Feshbach resonance, we have to transfer the atoms to the mixture #mix(9, 5) to avoid a loss of the atoms.
The required radio-frequency sweeps for the transition $mF(7) -> mF(5)$ are introduced in @ssec:setup-sequence-detect.

#floating-figure(
  image("figures/setup_k40_feshbach.png"),
  caption: [
    Magnetic Feshbach resonances in #K40.
    The Feshbach resonances are computed from the coupled-channel parameters in @ludewig_feshbach_2012.
    Each solid line refers to the scattering length $asc(B)$ of a mixture of $m_F$ states in the naming convention @eq:setup-k40-hfs-naming[].
    The dashed vertical lines show the resonance positions $B_0$ where the scattering length diverges.

    #notes[
      - Find better colors?
    ]
  ],
  label: <fig:setup-k40-fesbhach>,
)
