#import "/header.typ": *

== Potassium #phy.isotope("K", a: [40]) <sec:setup-k40>

- Just cite the Tiecke Potassium properties here? Or copy the "primary" citations from him?

The isotope we are using in the experiment is fermionic potassium 40 with the atomic number $Z = 19$.
Being an alkali metal, potassium only has a single electron in the highest orbit(al).
The electrons in the lower orbits do not contribute to the basic electronic properties.
Besides #phy.isotope("K", a: [40]), the isotopes #phy.isotope("K", a: [39]) and #phy.isotope("K", a: [41]) are also naturally abundant #text(red)[and also (both) used for ultracold atom experiments?]
Since #phy.isotope("K", a: [40]) only has a natural abundance of $tilde 0.01%$, we are using an enriched source #text(red)[cite something from JILA?]

The electronic ground state of potassium has the principal quantum number $n = 4$ and the spectroscopic notation is $attach(S, tl: 2, br: 1 slash 2)$.
The relevant optical transitions for this thesis are the so-called D1 and D2 lines to the excited states $attach(P, tl: 2, br: 1 slash 2)$ and $attach(P, tl: 2, br: 3 slash 2)$ respectively, with an unchanged principal quantum number $n$.
The corresponding wavelengths are $tilde #qty[770.1][nm]$ for the D1 line and $tilde #qty[766.7][nm]$ for the D2 line.
Both wavelengths are in the near?-infrared spectrum with readily available laser sources.
We are only using the D2 line in the experiment since it has a closed transition.

With a nuclear spin of $I = 4$ the isotope #phy.isotope("K", a: [40]) experiences a rich hyperfine structure that is essential for our experimental methods.
In the electronic ground state $attach(S, tl: 2, br: 1 slash 2)$ with $J = 1 slash 2$, the resulting hyperfine structure manifolds have the quantum numbers $F = 9 slash 2$ and $F = 7 slash 2$.
Due to the positive sign of the nuclear gyromagnetic factor $g_I$, the hyperfine structure is inverted such that the manifold with $F = 9 slash 2$ has the lowest energy, see @fig:setup-k40-hfs.

The excited state $attach(P, tl: 2, br: 1 slash 2)$ with $J = 1 slash 2$ has the same available values for the quantum number $F$.
The excited state $attach(P, tl: 2, br: 3 slash 2)$ with $J = 3 slash 2$ on the other hand has a hyperfine structure from $F = 5 slash 2$ to $F = 11 slash 2$.
Since (the sign of) the factor $g_I$ does not depend on the electronic state, all of the aforementioned states experience an inverted hyperfine structure.
We are using the closed transition between the ground state manifold $phy.ket(attach(S, tl: 2, br: 1 slash 2)\, F = 9 slash 2)$ and the excited state manifold $phy.ket(attach(S, tl: 2, br: 3 slash 2)\, F = 11 slash 2)$ for the #text(red)[MOT] and the #text(red)[imaging].
See @fig:setup-k40-hfs for a sketch of the hyperfine structure of those three states.

#figure(
  image("../../figures/setup-potassium-hfs.png"),
  caption: [
    Hyperfine structure of Potassium #phy.isotope("K", a: [40]).
    The states on the left show the electronic structure for the principal quantum number $n = 4$.
    In the ground state $attach(S, tl: 2, br: 1 slash 2)$ the hyperfine splitting is by far the largest at $tilde #qty[1.29][GHz]$.
    The D2 transition between $F = 9 slash 2$ and $F' = 11 slash 2$ is used for the MOT cooling and the imaging.
    In addition, the D2 transition between $F = 7 slash 2$ and $F' = 9 slash 2$ is required for the repumping in the MOT, #text(red)[ref section].

    The Breit-Rabi diagram of the ground state $attach(S, tl: 2, br: 1 slash 2)$ highlights the lowest four hyperfine states $m_F = -9 slash 2$ to $m_F = -3 slash 2$ (and a single excited HFS state?) that are used for the state manipulation in the optical lattices.

    #set text(red)
    - Add arrows for MOT + imaging and repumping?
    - Hide the D1 state? Or make it very transparent?
    - Add magnetic field range to the HFS plot?
    - Highlight the HFS states that are actually used?
  ],
) <fig:setup-k40-hfs>
