#import "/header.typ": *

== Properties of Potassium-40 <sec:setup-k40>

#notes[
  - Where to mention the low abundance of K40? Here or in @sec:setup-mot?
  - Any "primary" citations to grab from the Tiecke properties?
  - Explain what s-wave Feshbach resonances are? In comparison to p-wave resonances?
]

Potassium is an alkali metal with the atomic number $Z = 19$.
The electronic properties of potassium depend on the single electron in the outermost shell/orbital, while the other electrons occupying the inner shells/orbitals only shield the charge of the nucleus.
In this thesis, we are working with the fermionic isotope #phy.isotope("K", a: [40]).
There are also two naturally abundant bosonic isotopes, #phy.isotope("K", a: [39]) and #phy.isotope("K", a: [41]), which are also used in experiments with ultracold atoms and molecules #tr[cite what?].
The physical properties, optical properties and scattering properties of these three potassium isotopes are compiled in #tr[cite Tiecke].
In this section, I will only mention a selection of the most important properties to understand the experimental setup and the manipulation of the internal states of the potassium atoms.

The electronic ground state of potassium has the principal quantum number $n = 4$ and the spectroscopic notation is $sn(S, 1/2)$.
As with all alkali atoms, the primary electronic transitions are the D1 and D2 lines to the excited states $sn(P, 1/2)$ and $sn(P, 3/2)$.
The corresponding wavelengths are $lambda_"D1" approx #qty[770.1][nm]$ and $lambda_"D2" approx #qty[766.7][nm]$.
Both wavelengths are in the near-infrared regime with readily available laser sources and optical elements.
In the context of this experiment, we are only using the D2 line since it allows a closed optical transition.

With a nuclear spin of $I = 4$, the isotope #phy.isotope("K", a: [40]) experiences a rich hyperfine structure that is essential for the internal-state manipulation during the experimental sequence.
In the electronic ground state $sn(S, 1/2)$ with $J = 1 slash 2$, there are two manifolds of hyperfine states corresponding to the total angular momenta $F = 7 slash 2$ and $F = 9 slash 2$.
Due to the positive sign of the nuclear gyromagnetic factor $g_I$, the hyperfine structure is inverted and the state with $F = 9 slash 2$ has the lowest energy (see @fig:setup-k40-hfs).
The excited state $sn(P, 1/2)$ is also split into the states $F' = 7 slash 2$ and $F' = 9 slash 2$, while the excited state $sn(P, 3/2)$ has four hyperfine states from $F' = 5 slash 2$ to $F' = 11 slash 2$.
The optical transitions in the hyperfine structure of these electronic states are shown in #subref(<fig:setup-k40-hfs>, "a").
Since $g_I$ does not depend on the electronic state, all of the aforementioned states experience an inverted hyperfine structure.

#floating-figure(
  image("figures/setup_k40_hyperfine.png"),
  caption: [
    Hyperfine structure of Potassium #phy.isotope("K", a: [40]).
    The states in *a* show the hyperfine splitting of the ground state $sn(S, 1/2)$ and the excited states $sn(P, 1/2)$ and $sn(P, 3/2)$.
    In the ground state $sn(S, 1/2)$, the hyperfine splitting is by far the largest with $Delta E slash h = #qty[1285.8][MHz]$.
    We use the D2 line between $F = 9 slash 2$ and $F' = 11 slash 2$ for the magneto-optical trap (see @sec:setup-mot) and the imaging of the atoms (see @sec:setup-detect).
    In addition, the transition between $F = 7 slash 2$ and $F' = 9 slash 2$ is required for the repumping in the magneto-optical trap.
    In *b*, the hyperfine structure of the ground state $sn(S, 1/2)$ is shown as a function of an external magnetic field $B$.
    In the lower manifold with $F = 9 slash 2$, the four upper $m_F$ states (black) are used for the magnetic evaporation (see @sec:setup-ioffe).
    The four lowest $m_F$ states and the state $m_F = -7 slash 2$ in the upper manifold are used for the internal-state manipulation during the detection and imaging (see @sec:setup-detect).

    #notes[
      - Add arrows for MOT + imaging and repumping?
      - Really mention the D1 transition? Or make it very transparent?
      - Synchronize the HFS colors with the later sequence figures...
      - Actually use the y-label "Energy shift $delta E$" in *b*?
    ]
  ],
  label: <fig:setup-k40-hfs>,
)

In an external magnetic field, the hyperfine states will split up based on their quantum number $m_F$.
If the magnetic field is weak compared to the coupling of the electron angular momentum $hat(phy.vb(J))$ and the nuclear angular momentum $hat(phy.vb(I))$, the states will be shifted by $delta E prop m_F B$ according to the Zeeman effect.
This linear shift breaks down in intermediate magnetic fields.
For large magnetic fields the Paschen-Back regime is reached where the energy shift is $delta E prop m_J B$.
In general, the energy shifts can be computed with the Breit-Rabi formula that takes the internal coupling of the angular momenta and their coupling to the external magnetic field $B$ into account #tr[cite Breit (1931)].
In #subref(<fig:setup-k40-hfs>, "b"), the energy shifts $delta E(B)$ are shown for both manifolds in the ground state $sn(S, 1/2)$.
At $B = 0$, the difference between the two manifolds corresponds to the total hyperfine splitting of the ground state in #subref(<fig:setup-k40-hfs>, "a").

During the later stages of the experimental sequence, the atoms will only occupy the four lowest $m_F$ states in #subref(<fig:setup-k40-hfs>, "b").
We are therefore using the naming convention

$
  phy.ket(N) eq.triple phy.ket(F = 9 slash 2\, m_F = -N slash 2)
$ <eq:setup-k40-hfs-naming>

to refer to these states as #mF(9), #mF(7), #mF(5) and #mF(3).
While they experience slightly different energy shifts $delta E(B)$, we are mainly interested in their scattering properties.
As already mentioned for the interaction strength $U$ in @eq:theory-wannier-interaction-strength, two atoms can interact if they are close to each other#footnote[#tr[Mention three-body collisions?]].
This interaction is characterized by the scattering length #asc, which depends on the internal states of the two atoms.
Furthermore, the scattering length can be tuned in an external magnetic field $B$ with so-called _Feshbach resonances_ #tr[cite Chin (2010)].
The tunability is described by the expression

$
  asc = a_"bg" (1 - Delta / (B - B_0))
$ <eq:setup-k40-feshbach>

where $a_"bg"$ is the background scattering length, $Delta$ is the resonance width and $B_0$ is the resonance position #tr[cite Chin (2010)].
Feshbach resonances have been studied extensively in ultracold atoms since their initial observation in a Bose-Einstein condensate of #phy.isotope("Na", a: [23]) #tr[cite Shin (1998)].
For Potassium-40, an extensive compilation of Feshbach resonances and their properties can be found in #tr[cite Ludewig (2012)].
In the context of this thesis, we are only looking at the s-wave Feshbach resonances for the four lowest $m_F$ states (see @fig:setup-k40-fesbhach).
The Feshbach resonance of the states #mF(9) and #mF(3) is missing, since atoms in these states experience exothermic spin-exchange collisions #tr[cite Eugenio].
As a consequence of the energy shifts in #subref(<fig:setup-k40-hfs>, "b"), the states $mF(7) \& mF(5)$ have a lower energy than the states $mF(9) \& mF(3)$.
The excess energy from the inelastic spin-exchange collision is turned into kinetic energy, and the atoms are #tr[immediately] removed from the trapping potential.
While the excess energy would also be an issue for two atoms in the states $mF(9) \& mF(5)$ or $mF(7) \& mF(3)$, these spin-exchange collisions are forbidden by Pauli blocking since the atoms would end up in the same states $mF(7) \& mF(7)$ or $mF(5) \& mF(5)$.
Of the mixtures shown in @eq:setup-k40-feshbach, only the mixture $mF(9) \& mF(7)$ is fully stable.
All other mixtures can experience losses due to magnetic dipole-dipole relaxation #tr[cite Ludewig (2012)].
The resulting lifetimes of the mixtures $mF(9) \& mF(7)$ and $mF(7) \& mF(5)$ are presented in #tr[cite Eugenio].

#floating-figure(
  image("figures/setup_k40_feshbach.png"),
  caption: [
    Magnetic Feshbach resonances in #phy.isotope("K", a: [40]).
    The Feshbach resonances are computed from the coupled-channel parameters in #tr[cite Ludewig (2012)].
    Each solid line refers to the scattering length $asc(B)$ of a mixture of $m_F$ states in the naming convention @eq:setup-k40-hfs-naming[].
    The dashed vertical lines show the resonance positions $B_0$ where the scattering length diverges.
    For mixture of states $mF(7) \& mF(5)$, there are two Feshbach resonances close to each other.
    In such a case, we have to use a more elaborate expression to compute the scattering length from the properties of both Feshbach resonances #tr[cite Ludewig (2012)].

    #notes[
      - Find better colors...
      - Really "hide" the resonances 73 and 53 with a weaker line?
      - Make the figure smaller? Anything to add as an inset #emoji.eyes?
    ]
  ],
  label: <fig:setup-k40-fesbhach>,
)
