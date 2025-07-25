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
A single particle can only be located on the left site or on the right site.
The corresponding basis states, in place of the Wannier functions, are #ketL and #ketR.
Instead of the on-site energies, we only use the energy offset $2 Delta = eL - eR$.
We can ignore the mean energy $(eL + eR) slash 2$ since it only contributes to the global phase of the system.
Analogous to the maximally localized Wannier functions, the two states #ketL and #ketR are coupled by the tunneling amplitude $t := tin$.
This model is illustrated in #subref(<fig:theory-double-single>, "a") inside a unit cell of the superlattice potential#footnote[In general, the underlying potential can have any shape. In the second quantization, only the parameters $t$ and $Delta$ are relevant and all information about the potential is lost.].
In the basis ${ketL, ketR}$, the Hamiltonian of a single particle inside a double well is

$
  hat(H) = mat(Delta, -t; -t, -Delta)
$ <eq:theory-double-single-hamiltonian>

which is equivalent to the Hamiltonian @eq:theory-super-hamiltonian-bpo[] with a system size of $N = 1$.
If the offset is $Delta = 0$, the eigenstates of the Hamiltonian are

$
  phy.ket(plus.minus) = 1 / sqrt(2) (ketL plus.minus ketR)
$ <eq:theory-double-single-eigenstate-plus-minus>

with the corresponding eigenenergies $epsilon_plus.minus = minus.plus t$.
A particle localized on either site will be in an equal superposition of the eigenstates $phy.ket(plus)$ and $phy.ket(minus)$.
The resulting time evolution of the system is described by a coherent Rabi oscillation between the states #ketL and #ketR with the frequency $f = 2 t slash h$.
If the double well has an offset $Delta != 0$, the gap between the eigenenergies will grow as indicated in #subref(<fig:theory-double-single>, "b").
At the same time, the ground (excited) state will approach the basis state corresponding to the site with the lower (higher) energy as shown in #subref(<fig:theory-double-single>, "c").
The growing energy gap results in an increase of the Rabi frequency, while the unequal superposition of the eigenstates reduces the amplitude of the Rabi oscillation.
The general expressions for the frequency and the amplitude are

$
  f = 2 sqrt(t^2 + Delta^2) slash h quad "and" quad A = t^2 / (t^2 + Delta^2) thin .
$ <eq:theory-double-single-rabi-parameters>

For a large offset $abs(Delta) >> t$, the coupling between the sites vanishes and the eigenenergies are $epsilon_(g,e) = minus.plus Delta$

#floating-figure(
  image("figures/theory_doublewell_single.png"),
  caption: [
    One particle in a double-well potential.
    The sketch of the double well in *a* shows the unit cell of the superlattice potential in @fig:theory-super-potential-phase at the phase $phi = 0.03 pi$.
    The corresponding energy offset is $Delta slash t approx #num[-1.8]$.
    In *b*, the energies of the ground state and the excited state are shown as a function of the offset $Delta slash t$.
    // We can see the characteristic avoided crossing between two coupled states.
    The composition of the ground state in the basis ${ketL, ketR}$ is displayed in *c*.
    For the excited state, the composition is always $abs(phy.braket(psi, e))^2 = 1 - abs(phy.braket(psi, g))^2$ since the state must be normalized.

    #notes[
      - Add particles and a tunneling arrow to *a*.
      - Add colored gradients to *b* to show the occupation from *c* (again)?
      - Add diagonal lines to *b* to show the limits $epsilon$?
      - Add labels/legend to *b* to show $epsilon_g$ and $epsilon_e$?
      - Use a better y-label for *c*? Something like $c_(L,R)^2$?
    ]
  ],
  label: <fig:theory-double-single>,
)
