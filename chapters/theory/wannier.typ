#import "/header.typ": *

== Wannier functions <sec:theory-wannier>

#notes[
  - Find the correct name for the transformation Bloch -> Wannier
  - Use "atoms" or "particles" in the theory?
  - Check the orthonormal basis...
  - Explain why the Wannier function can always be real?
  - Where to mention fermion statistics for the first time?
  - Use interaction "energy" or interaction "strength"?
  - Use "strong" or "strongly" repulsive/attractive interaction?
  - Mention relation between the tunneling and the band width?
]

The Bloch waves introduced in @sec:theory-bloch have a discrete quasimomentum $q$ and are therefore completely delocalized over the optical lattice potential.
In the Wannier basis, maximally localized wavefunctions are used to describe individual particles localized on a lattice site #tr[cite Wannier].
The _Wannier functions_ can be computed directly from the Bloch waves $psi_q^n (x)$ with a Fourier-like transformation

$
  w_n (x - x_i)
  = 1 / sqrt(N) sum_(q in #h(0em) "BZ") psi_q^n (x) med ncexp(q x_i)
$ <eq:theory-wannier-transformation>

where $n$ is the band index and $N$ is the number of lattice sites.
The Wannier function will be located at $x_i$ by superimposing the Bloch waves for all quasimomenta $q$ in the first Brillouin zone.
The sum over $q$ takes all quasimomentum states in the first Brillouin zone into account, and the coordinate $x_i$ represents the position where the Wannier function will be located.
Just like the Bloch waves, the Wannier functions form an orthonormal basis with respect to the band index $n$ and the lattice site $i$.
In #subref(<fig:theory-wannier>, "a") the Wannier functions computed from the Bloch waves in @fig:theory-bloch-energy-bands are shown.
The Wannier function of the lowest band confirms the similarity of the band structure and the Bloch wave to the ground state of the harmonic oscillator.
On the lattice site at $x_i = 0$, the Wannier function looks just like the Gaussian wavefunction in a harmonic oscillator potential.
However, the Wannier function has a finite amplitude on the neighbouring lattice sites, as shown in a shallow lattice in #subref(<fig:theory-wannier>, "b").
This property enables a tunneling process of the localized particle in the optical lattice.
The tunneling amplitude from the lattice site $i$ to the lattice site $j$ can be computed as the off-diagonal matrix element

$
  t_(i,j) #sym.slash#unit[Erec]
  = - integral phy.dd(x) w_n (x - x_j) med hat(h) med w_n (x - x_i)
$ <eq:theory-wannier-tunneling-amplitude>

of the dimensionless Hamiltonian @eq:theory-bloch-hamiltonian-dimensionless[] in the Wannier basis.
While the tunneling amplitude is defined for arbitrary lattice sites $i$ and $j$, the most common case is $t_1 := t_(i, i plus.minus 1)$ between neighbouring lattice sites as shown in #subref(<fig:theory-wannier>, "b").
We can usually neglect tunneling over longer distances since it is exponentially suppressed compared to $t_1$.

#floating-figure(
  image("figures/theory_wannier_functions.png"),
  caption: [
    Wannier functions in an optical lattice.
    *a* shows the Wannier functions in an optical-lattice potential with a depth of $V_0 = #qty[15][Erec]$.
    Since the Wannier functions are computed from the superposition of all Bloch waves, the mean energy of the corresponding bands $epsilon_n (q)$ is used as the offset.
    The Wannier function of the lowest band with index $n = 1$ appears to be completely localized to the lattice site at $x = 0$.
    For the bands $n = 2$ and $n = 3$, a small amplitude is visible on the neighbouring sites.
    In the untrapped band with index $n = 4$, the Wannier function appears to be delocalized over multiple lattice sites.
    *b* shows the Wannier functions in the lowest band for a lattice depth of $V_0 = #qty[6][Erec]$.
    The horizontal line highlights the finite amplitude on neighbouring lattice sites.

    #notes[
      - Go into more detail for the intermediate and untrapped bands?
    ]
  ],
  label: <fig:theory-wannier>,
)

Since the Wannier functions @eq:theory-wannier-transformation[] are only one-dimensional, they cannot completely describe a particle.
The total wavefunction of a particle must always be three-dimensional.
For the tunneling amplitude, the other two dimensions can however be ignored if the potential is separable into three orthogonal #tr[axes/potentials] such as $V(phy.vb(r)) = V(x) + V(y) + V(z)$.
In that case, the Schrödinger equation can be solved separately for each axis, and the total wavefunction will be the product of the wavefunctions in the three dimensions $psi(phy.vb(r)) = psi_x (x) dot psi_y (y) dot psi_z (z)$.
#tr[Add explanation why the one-dimensional calculation is sufficient...]
For a general potential $V(phy.vb(r))$, the tunneling amplitude @eq:theory-wannier-tunneling-amplitude[] would require a three-dimensional integral of the total wavefunctions.
If the optical dipole potential consists of a single red-detuned optical lattice, only one of the wavefunctions will be a Wannier function according to @eq:theory-wannier-transformation.
The wavefunctions #tr[for/of] the other two axes will depend on the radial confinement as discussed in @sec:theory-dipole.
In a three-dimensional optical lattice on the other hand, the total wavefunction will be the product of three Wannier functions.

Considering the total wavefunction in three dimensions is required to compute the interaction energy.
Compared to the tunneling amplitude, the #tr[contact] interaction is a two-particle effect that scales with the density $n(phy.vb(r)) = abs(psi(phy.vb(r)))^2$ of both particles.
While the interaction can also be computed for particles on different sites, the on-site interaction is always the strongest one (#tr[Should this just be a footnote?]).
The interaction energy of two particles with the same spatial wavefunction $w(phy.vb(r))$ is

$
  U
  = (4 pi phy.hbar^2 asc) / m
  integral phy.dd(phy.vb(r), 3) abs(w(phy.vb(r)))^4
$ <eq:theory-wannier-interaction-strength>

where #asc is the scattering length that characterizes the magnitude and the sign of the interaction.
If the scattering length is negative (positive), the corresponding interaction will be attractive (repulsive) and the energy of the two particles will be decreased (increased).
Since the integrand in @eq:theory-wannier-interaction-strength is proportional to the squared density, the magnitude of the interaction energy strongly depends on the confinement of the particles.
A strong confinement will compress the wavefunction and therefore increase the integral in @eq:theory-wannier-interaction-strength.
While the interaction energy can be computed for particles in excited states, only the ground state is considered from here on (#tr[Mention this earlier with the off-site interaction?]).
To estimate the scaling due to the confinement, we can approximate a lattice by a three-dimensional harmonic oscillator with the trap frequencies $omega_(x, y, z)$.
Then, the interaction energy is proportional to the geometric mean

$
  U prop sqrt(omega_x omega_y omega_z)
$ <eq:theory-wannier-interaction-scaling>

which will significantly reduce the interaction energy if only one axis has a weaker confinement.
The trap frequency in the harmonic approximation scales like $omega prop sqrt(v_0) slash a^2$, where $v_0$ is the dimensionless lattice depth and $a$ is the lattice period.
Therefore, different lattice periods will usually have the strongest impact on the confinement and the resulting interaction energy.

Since the interaction energy @eq:theory-wannier-interaction-strength[] is computed with the non-interacting Wannier functions, a change of the wavefunctions due to the interaction cannot be taken into account.
However, unless the interaction energy is small compared to the kinetic term and the potential term in the single-particle Hamiltonian, the actual wavefunction will change to take the interaction into account.
In the case of a strong repulsive interaction, the wavefunction will expand to reduce the integral in @eq:theory-wannier-interaction-strength.
Correspondingly, the wavefunction will shrink in response to a strong attractive interaction.
Solving this interplay of the kinetic energy, the potential energy and the interaction energy to find the interacting Wannier functions is not practical.
However, in a three-dimensional harmonic oscillator the ground state energy $E$ of two interacting particles can be found with a variational approach.
This correction of the interaction energy is applied to the Wannier functions with the expression

$
  U = U_"Wannier" / U_"Gauss" dot Delta E(asc)
$ <eq:theory-wannier-interaction-correction>

where the shift of the energy $Delta E$ compared to the non-interacting harmonic oscillator only depends on the scattering length #asc in units of the oscillator length $x_0 = sqrt(phy.hbar / (m omega))$.
The analytical solution decomposes the wavefunction $psi(phy.vb(r))$ in the non-interacting basis and minimizes the energy of the interacting Hamiltonian.
In an isotropic three-dimensional harmonic oscillator where $omega_x = omega_y = omega_z$, the spherical symmetry of the potential can be used to find the analytical solution #tr[cite Busch (1998)].
Since then, this approach has been extended to cylindrically symmetric potentials where $omega_x = omega_y != omega_z$ #tr[cite Idziaszek and Calarco (2005 + 2006)], and to completely anisotropic potentials where $omega_x != omega_y != omega_z$ #tr[cite Chen (2020)].
The fraction $U_"Wannier" / U_"Gauss"$ in @eq:theory-wannier-interaction-correction applies a correction to the energy $Delta E$ that takes the subtle differences between the Wannier functions and the Gaussian wavefunctions as the ground state of the harmonic oscillator into account #tr[cite Schneider 2009].
