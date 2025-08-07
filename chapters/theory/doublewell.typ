#import "/header.typ": *

== Interacting fermions in a double-well potential <sec:theory-double>

#notes[
  - Really make the introduction this long? Maybe move some of the RM and SSH stuff to the introduction?
  - Really use "offset" for $Delta$? Is "detuning" the better term?
]

In the basis of the maximally localized Wannier functions, the dynamics in the superlattice potential can be described in the #tr[language] of second quantization #tr[again].
As already discussed in @ssec:theory-super-wannier, the properties of the Wannier functions can be read from the Hamiltonian @eq:theory-super-hamiltonian-bpo[] in the Wannier basis.
The Wannier functions $w_L (x)$ and $w_R (x)$ have the associated on-site energies #eL and #eR, and the tunneling between the lattice sites is characterized by the amplitudes #tin and #tout.
If two particles occupy the same lattice site, we also have to take the interaction energy $U$ @eq:theory-wannier-interaction-strength[] with the correction @eq:theory-wannier-interaction-correction[] into account.
In an extended superlattice potential, this system can be described by the Rice-Mele model #tr[cite Rice (1982)] which was also extended to interacting particles #tr[cite Lin (2020)].
If the superlattice phase is symmetric $phi = 0$, the system can be simplified since the on-site energies #eL and #eR are equal.
The corresponding Su-Schrieffer-Heger model #tr[cite Su (1979)] has also been studied for interacting particles #tr[cite Di Salvo (2024), Huang (2025)].
Both models are used to investigate the topological properties of the superlattice potential #tr[cite anything experimental?].
However, in the context of this thesis we are working exclusively with the dynamics inside the unit cells.
By selecting the lattice depths $V_l$ and $V_s$ such that $tin >> tout$, we can study the superlattice potential as an array of isolated double wells#footnote[While the coupling of the double wells by the tunneling amplitude #tout cannot be completely neglected, it is sufficient to treat it as a perturbation. #tr[ref any later results?]].
In this section, I will introduce the behavior of one and two particles inside a double-well potential based on #tr[cite Andrea (PhD)].

Compared to an extended superlattice with an exponentially increasing number of states, the description of the double-well potential only requires a small number of states.


=== One particle in a double well <ssec:theory-double-one>

A single particle can only be located on the left site or on the right site.
The corresponding basis states, in place of the maximally localized Wannier functions $w_L (x)$ and $w_R (x)$, are #ketL and #ketR.
Instead of the on-site energies #eL and #eR, we are only considering the energy offset $2 Delta = eL - eR$.
We can ignore the mean energy $(eL + eR) slash 2$ inside the double well, since it only contributes to the global phase of the system.
Analogous to the maximally localized Wannier functions, the two states #ketL and #ketR are coupled by the tunneling amplitude $t := tin$.
This model is illustrated in #subref(<fig:theory-double-one>, "a") inside a unit cell of the superlattice potential#footnote[In general, the underlying potential can have any shape with two minima. Only the parameters $t$ and $Delta$ are relevant, and all detailed information about the potential is lost.].
In the basis #fix("line wrap of the equation")[${ketL = vec(1, 0), ketR = vec(0, 1)}$], the Hamiltonian of a single particle inside of a double well is

$
  hat(H) = mat(Delta, -t; -t, -Delta)
$ <eq:theory-double-one-hamiltonian>

which is equivalent to the Hamiltonian @eq:theory-super-hamiltonian-bpo[] with a system size of $N = 1$.
If the energy offset is $Delta = 0$, the ground state and the excited state of the Hamiltonian are

$
  ketg = 1 / sqrt(2) (ketL - ketR) quad "and "quad kete = 1 / sqrt(2) (ketL plus ketR)
$ <eq:theory-double-one-eigenstate-plus-minus>

with the corresponding eigenenergies $epsilon_g = -t$ and $epsilon_e = +t$.
A particle localized on either site will be in an equal superposition of the eigenstates #ketg and #kete.
The resulting time evolution of the system is described by a coherent Rabi oscillation between the states #ketL and #ketR with the frequency $f = 2 t slash h$.
For the maximally localized Wannier functions in the symmetric superlattice potential in @eq:theory-super-wannier-superposition, we can find the equivalent time evolution based on the band gap $Delta epsilon$.
If the double well has an offset $Delta != 0$, the gap between the eigenenergies will grow as indicated in #subref(<fig:theory-double-one>, "b").
At the same time, the ground (excited) state will approach the basis state corresponding to the site with the lower (higher) energy as shown in #subref(<fig:theory-double-one>, "c").
The growing energy gap results in an increase of the Rabi frequency, while the unequal superposition of the eigenstates reduces the amplitude of the Rabi oscillation.
The general expressions for the frequency and the amplitude of the oscillation are

$
  f = 2 sqrt(t^2 + Delta^2) slash h quad "and" quad A = t^2 / (t^2 + Delta^2) thin .
$ <eq:theory-double-one-rabi-parameters>

For a large offset $abs(Delta) >> t$, the coupling between the sites vanishes and the eigenenergies approach $epsilon_g = minus Delta$ and $epsilon_e = plus Delta$.
This behavior of the eigenstates in the double-well potential matches the composition of the maximally localized Wannier functions for an asymmetric phase $phi$ in #subref(<fig:theory-super-wannier-mixing>, "b").
The only difference between the double-well potential described by the Hamiltonian @eq:theory-double-one-hamiltonian[] and the actual unit cell of the superlattice potential is the change of the confinement in an asymmetric configuration.
Since the maximally localized Wannier functions depend on the exact shape of the lattice sites, the overlap with the other lattice site in the unit cell will be different for $phi != 0$.
The tunneling amplitude $t$ should therefore be a function of the energy offset $Delta(phi)$.
However, we can neglect this change compared to the frequency and the amplitude in @eq:theory-double-one-rabi-parameters as functions of the offset $Delta$.
For the time evolution inside the double well, we can therefore use the constant tunneling amplitude $t$ computed in the symmetric configuration.

#floating-figure(
  image("figures/theory_doublewell_single.png"),
  caption: [
    One particle in a double-well potential.
    The sketch of the double well in *a* shows the unit cell of the superlattice potential in @fig:theory-super-potential-phase at the phase $phi slash pi = 0.03$.
    The corresponding energy offset is $Delta slash t approx #num[-1.8]$.
    In *b*, the energies of the ground state and the excited state are shown as a function of the offset $Delta slash t$.
    // We can see the characteristic avoided crossing between two coupled states.
    The composition of the ground state in the basis ${ketL, ketR}$ is displayed in *c*.
    For the excited state, the composition is just inverted due to the symmetry of the double-well potential with respect to the offset $Delta$.

    #notes[
      - Add particle, a tunneling arrow and the offset $Delta$ to *a*.
      - Add colored gradients to *b* to show the occupation from *c* (again)?
    ]
  ],
  label: <fig:theory-double-one>,
)


=== Two particles in a double well <ssec:theory-double-two>

With a second particle in the double well, the interaction energy $U$ introduced in @eq:theory-wannier-interaction-strength and the spin states of the particles become relevant again.
The Pauli exclusion principle prevents two particles with the same to occupy the same lattice site.
In the context of the double-well potential, the states where two particles have the same spin are therefore trivial.
Each particle has to occupy a separate lattice site, and neither tunneling nor an interaction are possible.
The resulting energy of the states $phy.ket(arrow.t\, arrow.t)$ and $phy.ket(arrow.b\, arrow.b)$ is therefore $E = Delta - Delta = 0$.
If the two particles have opposite spins #ketup and #ketdown, several configurations are possible.
Here, we are using the basis ${ketLL, ketLR, ketRL, ketRR}$ where the particles are ordered by their spin.
The first letter indicates the site of the particle in the spin state #ketup, and the second letter indicates the site of the particle in the spin state #ketdown.
The order of the particles is relevant for the antisymmetry of the wavefunction that is always required for fermionic particles#footnote[
  The other option would be to order the particles from left to right.
  The corresponding basis states would be ${phy.ket(arrow.t arrow.b\, 0), phy.ket(arrow.t\, arrow.b), phy.ket(arrow.b\, arrow.t), phy.ket(0\, arrow.t arrow.b)}$, where only the third state is actually different from the spin-ordered basis.
  The tunneling between the interacting states $phy.ket(arrow.t arrow.b\, 0)$ and $phy.ket(0\, arrow.t arrow.b)$ and the split state $phy.ket(arrow.b\, arrow.t)$ requires an exchange of the two particles.
  This will introduce a sign flip to fulfill the antisymmetry of the fermionic wavefunction.
].
We can sort the basis states into two categories based on the occupation of the sites in the double well.
The _interacting_ states #ketLL and #ketRR have both particles on the same lattice site, making the states subject to the interaction energy $U$ and the offset $Delta$.
On the other hand, the particles in the _split_ states #ketLR and #ketRL do not interact#footnote[
  The nearest-neighbor interaction $V_"nn"$ is part of the extended Hubbard parameters @dutta_non-standard_2015.
] and their total energy due to the offset $Delta$ averages to zero.
In first order, the interacting states are coupled to the split states by the tunneling amplitude $t$.
We will neglect the coupling terms between the states in the same category, since they are only small corrections compared to the parameters $t$ and $U$.
The resulting Hamiltonian of two particles inside a double well is

$
  hat(H) = mat(
    U + 2 Delta, -t, -t, 0;
    -t, 0, 0, -t;
    -t, 0, 0, -t;
    0, -t, -t, U - 2 Delta;
  ) .
$ <eq:theory-double-two-hamiltonian>

We can find the eigenenergies and the eigenstates as a function of the interaction $U slash t$ and the offset $Delta slash t$ by numerical diagonalization of the Hamiltonian.
Expressing the interaction and the offset in units of the tunneling amplitude $t$ is a common approach to make the Hamiltonian dimensionless.
The general solution is not easy to visualize, due to the additional parameter $U$ compared to the single-particle spectrum in @fig:theory-double-one.
I will therefore show two specific configurations that are relevant in the context of this thesis.

#floating-figure(
  grid(
    columns: (60%, auto),
    // align: horizon,
    image("figures/theory_doublewell_two_symmetric.png"),
    block(
      width: 100%,
      {
        set math.equation(numbering: none)
        show math.equation.where(block: true): set par(leading: 1.5em)
        let mark(body, color: black) = mannot.markrect(body, color: color, outset: 0.5em, radius: 1mm)
        [Symmetry basis]
        $
          mark(phy.ket(s) & = 1 / sqrt(2) (ketLR + ketRL), color: #blue) \
          mark(phy.ket(t) & = 1 / sqrt(2) (ketLR - ketRL), color: #red) \
          mark(phy.ket(d_+) & = 1 / sqrt(2) (ketLL + ketRR), color: #purple) \
          mark(phy.ket(d_-) & = 1 / sqrt(2) (ketLL - ketRR), color: #olive) \
        $
      },
    ),
  ),
  caption: [
    Two particles in the symmetric double-well potential.
    If the offset is $Delta = 0$, the double-well potential shows a symmetry with respect to left and the right lattice site.
    The spectrum shows the eigenenergies as a function of the interaction energy $U slash t$ and the composition of the corresponding eigenstates.
    In the symmetry basis, the split states and the interacting states are combined in symmetric and antisymmetric superpositions.
    This allows a simple represenation of the eigenstates in the symmetric double well.
    The eigenstates $phy.ket(psi_2) = phy.ket(d_-)$ and $phy.ket(psi_3) = phy.ket(t)$ do not change as a function of the interaction energy $U slash t$, and the corresponding eigenenergies are $epsilon_2 = U$ and $epsilon_3 = 0$.

    #notes[
      - Use a gradient for the energies $epsilon_1$ and $epsilon_4$.
    ]
  ],
  label: <fig:theory-double-two-symmetric>,
)
