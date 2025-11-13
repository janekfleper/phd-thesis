#import "/header.typ": *
#import "figures/doublewell_two_symmetric/figure.typ": figure as figure-doublewell-two-symmetric

#let marks(body, color: black) = markrect(body, color: color, outset: 0.5em, radius: 1mm)

== Interacting fermions in a double-well potential <sec:theory-double>

If the Wannier functions are strongly localized to their respective lattice sites, we can treat the system in the tight-binding approximation @slater_simplified_1954.
This enables a significant simplification for the description of optical lattices.
Instead of using the Wannier functions $w_0 (x - x_i)$, we quantify the occupation of the lattice sites by the index $i$.
The Wannier functions are only required to compute the tunneling amplitude $t$ @eq:theory-wannier-tunneling-amplitude[] and the interaction energy $U$ @eq:theory-wannier-interaction-strength[].
For the expression of many-body states, the occupation number representation#footnote[
  This is also referred to as the second quantization.
] is inevitable.
In a monochromatic optical lattice, this formalism is used for the Hamiltonian of the Fermi-Hubbard model with the tunneling amplitude $t$ and the interaction energy $U$ @esslinger_fermi-hubbard_2010.
The general superlattice potential with the tunneling amplitudes #tin and #tout and a phase $phi != 0$ is described by the Rice-Mele model @rice_elementary_1982 @lin_interacting_2020.
If the superlattice phase is symmetric ($phi = 0$), the system can be simplified with the Su-Schrieffer-Heger model @su_solitons_1979 @di_salvo_topological_2024.

In the context of this thesis, we mainly investigate the dynamics inside the unit cells of the superlattice potential.
By selecting the lattice depths $V_l$ and $V_s$ such that $tin >> tout$, we can describe the superlattice potential as an array of weakly coupled double wells.
In this section, I will introduce the behavior of one and two particles inside the double-well potential based on @bergschneider_strong_2017.
This is the reference for all measurements related to the superlattice phase $phi$ in @ch:phase.


=== One particle in a double well <ssec:theory-double-one>

A single particle can only be located on the left or right site.
The corresponding basis states, in place of the maximally localized Wannier functions $w_L (x)$ and $w_R (x)$, are #ketL and #ketR.
Instead of the on-site energies #eL and #eR, we only consider the energy offset $2 Delta = eL - eR$.
We ignore the mean energy $(eL + eR) slash 2$ inside the double well since it only contributes to the global phase of the system.
Analogous to the maximally localized Wannier functions, the two states #ketL and #ketR are coupled by the tunneling amplitude $t := tin$.
This model is illustrated in the inset of #subref(<fig:theory-double-one>, "a") inside a unit cell of the underlying superlattice potential#footnote[
  In general, the underlying potential can have any shape as long as it features two minima. Only the parameters $t$ and $Delta$ are relevant, and all detailed information about the potential is lost.
].
With the basis states ${ketL = vec(1, 0), ketR = vec(0, 1)}$, the Hamiltonian of a single particle in a double well is

$
  hat(H) = mat(Delta, -t; -t, -Delta)
$ <eq:theory-double-one-hamiltonian>

which is equivalent to the Hamiltonian @eq:theory-super-hamiltonian-bpo[] with the system size $N = 1$.
If the energy offset is $Delta = 0$, the ground state and the excited state of the Hamiltonian are

$
  ketg = 1 / sqrt(2) (ketL - ketR) quad "and "quad kete = 1 / sqrt(2) (ketL plus ketR)
$ <eq:theory-double-one-eigenstate-plus-minus>

with the corresponding eigenenergies $epsilon_g = -t$ and $epsilon_e = +t$.
A particle localized on either site is in an equal superposition of the eigenstates #ketg and #kete.
The resulting time evolution of the system is described by a coherent Rabi oscillation between the states #ketL and #ketR with the oscillation frequency $f = 2 t slash h$.
For the maximally localized Wannier functions in the symmetric superlattice potential in @eq:theory-super-wannier-superposition, we can find the equivalent time evolution based on the band gap $Delta epsilon$.
If the double well has an offset $Delta != 0$, the gap between the eigenenergies grows as indicated in #subref(<fig:theory-double-one>, "a").
At the same time, the ground (excited) state approaches the basis state corresponding to the site with the lower (higher) energy as shown in #subref(<fig:theory-double-one>, "b").
The growing energy gap results in an increase of the oscillation frequency, while the unequal superposition of the eigenstates reduces the amplitude of the Rabi oscillation.
The general expressions for the frequency and the amplitude of the oscillation are

$
  f = 2 sqrt(t^2 + Delta^2) slash h quad "and" quad A = t^2 / (t^2 + Delta^2) thin .
$ <eq:theory-double-one-rabi-parameters>

For a large offset $abs(Delta) >> t$, the coupling between the sites vanishes and the eigenenergies approach $epsilon_g = minus Delta$ and $epsilon_e = plus Delta$.
This behavior of the eigenstates in the double-well potential matches the composition of the maximally localized Wannier functions for an asymmetric phase $phi$ in #subref(<fig:theory-super-wannier-mixing>, "b").
The only difference between the double-well potential described by the Hamiltonian @eq:theory-double-one-hamiltonian[] and the actual unit cell of the superlattice potential is the change of the confinement in an asymmetric configuration.
Since the maximally localized Wannier functions depend on the exact shape of the lattice sites, the overlap with the other lattice site in the unit cell is different for $phi != 0$.
In theory, the tunneling amplitude $t$ should therefore be a function of the energy offset $Delta(phi)$.
We can however neglect this since the oscillation frequency and amplitude in @eq:theory-double-one-rabi-parameters are significantly more sensitive to $Delta$.

#floating-figure(
  image("figures/theory_doublewell_single.png", width: 90%),
  caption: [
    One particle in a double-well potential.
    *a*, Spectrum with the ground state and the excited state as a function of the energy offset $Delta slash t$.
    The inset shows the double-well potential in the unit cell of the superlattice potential @eq:theory-super-potential[] with $phi = -0.04 pi$.
    The corresponding energy offset is #box[$Delta slash t approx #num[-1.8]$].
    *b*, Composition of the ground state in the basis ${ketL, ketR}$.
    For the excited state, the composition is inverted due to the symmetry of the double-well potential with respect to $Delta$.

    // TODO: Add color gradients to *a*...
    // TODO: Add particles + tunneling + Delta to the inset (CeTZ)
  ],
  label: <fig:theory-double-one>,
  placement: bottom,
)


=== Two particles in a double well <ssec:theory-double-two>

With a second particle in the double well, the interaction energy $U$ introduced in @eq:theory-wannier-interaction-strength and the spin state of the particles become relevant.
The Pauli exclusion principle prevents two particles with the same spin to occupy the same lattice site.
The states $phy.ket(arrow.t\, arrow.t)$ and $phy.ket(arrow.b\, arrow.b)$, where both particles have the same spin, are therefore trivial since the particles can neither tunnel nor interact with each other.
If the two particles have opposite spins #ketup and #ketdown, several configurations are possible.
Here, we use the basis ${ketLL, ketLR, ketRL, ketRR}$ that orders the particles by their spins#footnote[
  The order of the particles is relevant for the antisymmetry of the wavefunction that is always required for fermionic particles.
  The other option would be to order the particles from left to right.
  The corresponding basis states would be ${phy.ket(arrow.t arrow.b\, 0), phy.ket(arrow.t\, arrow.b), phy.ket(arrow.b\, arrow.t), phy.ket(0\, arrow.t arrow.b)}$, where only the third state is different from the spin-ordered basis.
  The tunneling between the interacting states $phy.ket(arrow.t arrow.b\, 0)$ and $phy.ket(0\, arrow.t arrow.b)$ and the split state $phy.ket(arrow.b\, arrow.t)$ requires an exchange of the two particles.
  This requires a sign flip $-t -> t$ to fulfill the antisymmetry of the fermionic wavefunction.
].
The first letter indicates the site of the particle with the spin #ketup and the second letter indicates the site of the particle with the spin #ketdown.
The interacting states #ketLL and #ketRR have both particles on the same lattice site, making the states subject to the interaction energy $U$ and the offset $Delta$.
On the other hand, the split states #ketLR and #ketRL experience no interaction#footnote[
  The nearest-neighbor interaction $V_"NN"$ is part of the extended Hubbard parameters @dutta_non-standard_2015.
] and their energy offset $Delta$ averages to zero.
In first order, the tunneling amplitude $t$ connects the interacting states and the coupled states in the Hamiltonian

$
  hat(H) = mat(
    U + 2 Delta, -t, -t, 0;
    -t, 0, 0, -t;
    -t, 0, 0, -t;
    0, -t, -t, U - 2 Delta;
  ) .
$ <eq:theory-double-two-hamiltonian>

We can find the eigenenergies and the eigenstates as a function of the interaction $U slash t$ and the offset $Delta slash t$ by numerical diagonalization of the Hamiltonian.
Expressing the interaction and the offset in units of the tunneling amplitude $t$ is the common approach to make the Hamiltonian dimensionless.
In this subsection, I will show the solution for two specific configurations that are relevant in the context of this thesis.

#floating-figure(
  grid(
    columns: (60%, auto),
    figure-doublewell-two-symmetric(height: 7cm),
    // TODO: Change y-axis ticks to [-8, -6, ..., 6, 8]?
    block(
      width: 100%,
      {
        [#math.equation(block: true, [Symmetry basis]) <eq:theory-double-two-symmetry-basis>]
        set math.equation(numbering: none)
        show math.equation.where(block: true): set par(leading: 1.5em)
        $
          marks(kets & = 1 / sqrt(2) (ketLR + ketRL), color: #blue) \
          marks(kett & = 1 / sqrt(2) (ketLR - ketRL), color: #red) \
          marks(ketdp & = 1 / sqrt(2) (ketLL + ketRR), color: #purple) \
          marks(ketdm & = 1 / sqrt(2) (ketLL - ketRR), color: #olive) \
        $
      },
    ),
  ),
  caption: [
    Two particles in the symmetric double-well potential.
    The spectrum is symmetric with respect to the left and right lattice site if the offset is $Delta = 0$.
    In the symmetry basis, the split states and the interacting states are combined in symmetric and antisymmetric superpositions.
    This allows a simple representation of the eigenstates in the symmetric double well, as indicated by the colors of the eigenenergies $epsilon_n$.

    // TODO: Apply a color gradient to the energies $epsilon_1$ and $epsilon_4$...
    // TODO: Add arrows to mark the gaps $2t$ and $J$?
    // TODO: Fix the spacing of the equation (title + boxes)
  ],
  label: <fig:theory-double-two-symmetric>,
)

In the symmetric double-well potential where $Delta = 0$, the two lattice sites are degenerate.
This results in the characteristic symmetry of the spectrum shown in @fig:theory-double-two-symmetric.
The symmetry basis uses equal superpositions of the states in the spin-ordered basis.
This follows the observed behavior for the symmetric configuration of the superlattice potential in @eq:theory-super-wannier-superposition and for the symmetric double-well potential with a single particle in @eq:theory-double-one-eigenstate-plus-minus.
The two split states #ketLR and #ketRL form the singlet state #kets and the triplet state #kett.
The names of the basis states become clear if we separate the spatial wavefunction and the spin wavefunction.
For an exchange of the particles $L <-> R$, the state #kets is unchanged (symmetric) while the state #kett picks up a minus sign (antisymmetric).
To make the total wavefunction antisymmetric, the spin wavefunctions must have the opposite symmetry of the spatial wavefunctions @foot_double_2011.
Therefore, the spin wavefunction of the state #kets is the spin singlet $1 / sqrt(2) (phy.ket(arrow.t arrow.b) - phy.ket(arrow.b arrow.t))$, and the spin wavefunction of the state #kett is the spin triplet $1 / sqrt(2) (phy.ket(arrow.t arrow.b) + phy.ket(arrow.b arrow.t))$.
For the basis states #ketdp and #ketdm, the spatial wavefunction is symmetric and the spin wavefunction is the spin singlet.

The spectrum in @fig:theory-double-two-symmetric shows the eigenenergies $epsilon_n$ in the symmetry basis defined by @eq:theory-double-two-symmetry-basis.
The composition of the eigenstates $phy.ket(psi_2) = ketdm$ and $phy.ket(psi_3) = kett$ does not change with the interaction energy $U$.
Since the basis state #ketdm only contains the interacting states #ketLL and #ketRR, the eigenenergy is $epsilon_2 = U$.
In the case of the triplet state #kett, the antisymmetric spin wavefunction prevents a coupling to any of the other basis states.
The associated eigenenergy is $epsilon_3 = 0$ since the split states #ketLR and #ketRL do not experience any interaction.
The basis states #kets and #ketdp are directly coupled by the tunneling amplitude $t$ and form an avoided crossing around the interaction energy $U slash t = 0$.
Depending on the sign of the interaction, the ground state $phy.ket(psi_1)$ either favors the interacting state #ketdp or the split state #kets.
The excited state $phy.ket(psi_4)$ always has the opposite composition of the ground state.
For strongly repulsive interactions $U >> t$, the ground-state energy $epsilon_1$ only slowly approaches the energy $epsilon = 0$ we would expect from a completely split state.
This gap is a result of the second-order tunneling process between the split state #kets and the interacting state #ketdp.
The corresponding energy scale is the superexchange constant

$
  J = (4t^2) / U thin ,
$ <eq:theory-double-two-superexchange>

that is computed with the second-order perturbation theory @auerbach_interacting_2012.
In the ground state $phy.ket(psi_1)$, this process is enabled by a tiny fraction of the interacting state #ketdp even for large interactions $U >> t$.
The same energy gap $J$ also shows up between the strongly attractive ground state and the state #ketdm.
While the process itself is not referred to as the superexchange, we can interpret the gap with the equivalent second-order tunneling process between the states #ketdp and #kets.

#floating-figure(
  grid(
    rows: 2,
    row-gutter: 1em,
    $"Basis:" quad marks(ketLL, color: #blue) wide marks(ketRR, color: #red) wide marks(kets, color: #olive) wide marks(kett, color: #orange)$,
    image("figures/theory_doublewell_two_general.png", width: 80%),
  ),
  caption: [
    Two attractively interacting particles in the double-well potential.
    *a*, Spectrum of two particles with the interaction energy $U slash t = -4$.
    The colors of the eigenenergies $epsilon_n$ indicate the basis states.
    *b*, *c*, Time evolution of the initial state #ketLL at the offsets $Delta slash t = 2.1$ (*b*) and $Delta slash t = 0$ (*c*).

    // TODO: Apply color gradients to the eigenenergies in *a*...
    // TODO: Match the colors with the other DoD figure.
    // TODO: Put the legend for the basis inside *a*? Or in a third column to the right?
    // TODO: Add insets of the double-well potential to highlight the definition of $Delta$?
  ],
  label: <fig:theory-double-two-general>,
)

In the second configuration, we look at the double-well potential with a fixed interaction energy $U slash t = -4$.
The spectrum in #subref(<fig:theory-double-two-general>, "a") shows three avoided crossings between the eigenstates $phy.ket(psi_1)$, $phy.ket(psi_2)$ and $phy.ket(psi_4)$, while the third eigenstate $phy.ket(psi_3) = kett$ is isolated again due to its spin wavefunction.
Here, we use a mixed basis to show the composition of the eigenstates.
The interacting states #ketLL and #ketRR are part of the original basis of the Hamiltonian @eq:theory-double-two-hamiltonian[], and the states #kets and #kett are part of the symmetry basis @eq:theory-double-two-symmetry-basis[] that introduces the superpositions of the basis states #ketLR and #ketRL.

Around the offset $Delta = 0$, the composition of the ground state $phy.ket(psi_1)$ rapidly switches between the states #ketLL and #ketRR due to the attractive interaction.
The corresponding energy of two particles in the lower well is $epsilon_1 approx U - 2 abs(Delta)$.
At $Delta = 0$, the double-well potential is symmetric, and the ground state is mainly composed of the state #ketdp (c.f. @fig:theory-double-two-symmetric).
The neighboring eigenstate is $phy.ket(psi_2) = ketdm$ with the opposite parity of the state #ketdp.
A coupling between the two states #ketdp and #ketdm is only possible with a second-order tunneling process that involves the singlet state #kets.
In #subref(<fig:theory-double-two-general>, "c"), a small occupation of the singlet state #kets mediates the slow oscillation between the states #ketLL and #ketRR.
The oscillation frequency is $f approx J slash h$, with the superexchange constant $J$ introduced in @eq:theory-double-two-superexchange.

Besides the avoided crossing at $Delta = 0$, there are two more avoided crossings at $plus.minus Delta approx abs(U) slash 2$ in #subref(<fig:theory-double-two-general>, "a").
In both cases, the eigenstates $phy.ket(psi_2)$ and $phy.ket(psi_4)$ mix the interacting state (#ketLL or #ketRR) on the upper site and the singlet state #kets.
We can interpret this coupling as the resonant tunneling of a single particle since the energy of the interacting states is $U + 2 abs(Delta) approx 0$.
The time evolution of the initial state #ketLL at the offset $Delta slash t = 2.1$ in #subref(<fig:theory-double-two-general>, "b") highlights this process.
Apart from a tiny contribution by the state #ketRR, the occupation oscillates with the maximum amplitude between the states #ketLL and #kets.
The corresponding frequency is $f approx 2.7 t slash h$, which is slightly larger than the expected frequency for the single-particle tunneling in @eq:theory-double-one-rabi-parameters.
This is caused by the proximity of the avoided crossing to the symmetric double-well potential.
With stronger interactions $abs(U) >> t$, the energy gap becomes $epsilon_4 - epsilon_2 = 2t$ and the positions of the avoided crossings approach $plus.minus Delta = abs(U) slash 2$.
