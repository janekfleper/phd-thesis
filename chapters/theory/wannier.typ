#import "/header.typ": *

== Wannier functions <sec:theory-wannier>

The Bloch waves introduced in @sec:theory-bloch have a discrete quasimomentum $q$ and are therefore completely delocalized over the optical-lattice potential.
On the other hand, in the Wannier basis, maximally localized wavefunctions are used to describe individual particles in the optical lattice @wannier_structure_1937.
The Wannier functions can be computed directly from the Bloch waves $psi_q^n (x)$ with the Fourier transformation

$
  w_n (x - x_i)
  = 1 / sqrt(N) sum_(q in #h(0em) "BZ") psi_q^n (x) med ncexp(q x_i)
$ <eq:theory-wannier-transformation>

where $n$ is the band index and $N$ is the number of sites in the optical lattice.
The Wannier function is localized at $x_i$ by superimposing the Bloch waves for all quasimomenta $q$ in the first Brillouin zone.
Just like the Bloch waves, the Wannier functions form an orthonormal basis with respect to the band index $n$ and, additionally, the lattice site $i$.
#subref(<fig:theory-wannier>, "a") shows the Wannier functions computed from the Bloch waves in @fig:theory-bloch-energy-bands.
On the lattice site at $x_i = 0$, the Wannier function of the lowest band looks similar to the Gaussian wavefunction in a harmonic-oscillator potential.
However, the Wannier function has a finite amplitude on the neighboring lattice sites, as shown in the shallow lattice in #subref(<fig:theory-wannier>, "b").
This property enables the localized particle to tunnel in the optical lattice.
The tunneling amplitude from the lattice site $i$ to the lattice site $j$ can be computed as the off-diagonal matrix element

$
  t_(i,j) = integral phy.dd(x) w_n (x - x_j) med hat(H) med w_n (x - x_i)
$ <eq:theory-wannier-tunneling-amplitude>

of the Hamiltonian @eq:theory-bloch-hamiltonian[] in the Wannier basis @jaksch_cold_2005.
While the tunneling amplitude is defined for arbitrary lattice sites $i != j$, the most common case is $t_1 := t_(i, i plus.minus 1)$ between neighboring lattice sites as shown in #subref(<fig:theory-wannier>, "b").
We can usually neglect tunneling over longer distances since it is exponentially suppressed compared to $t_1$.

#floating-figure(
  image("figures/theory_wannier_functions.png"),
  caption: [
    Wannier functions in an optical lattice.
    *a* shows the Wannier functions in an optical-lattice potential with a depth of $V_0 = #qty[15][Erec]$.
    Since the Wannier functions are computed from the superposition of all Bloch waves, the mean energy of the corresponding bands $epsilon_n (q)$ is used as the offset.
    The Wannier function of the lowest band with index $n = 1$ appears to be completely localized to the lattice site at $x = 0$.
    For the bands $n = 2$ and $n = 3$, a small amplitude is visible on the neighboring sites.
    In the untrapped band with index $n = 4$, the Wannier function appears to be delocalized over multiple lattice sites.
    *b* shows the Wannier functions in the lowest band for a lattice depth of $V_0 = #qty[6][Erec]$.
    The horizontal line highlights the finite amplitude on neighboring lattice sites.

    #notes[
      - Go into more detail for the intermediate and untrapped bands?
      - Use the same x-limits in *a* and *b*?
    ]
  ],
  label: <fig:theory-wannier>,
)

So far, we have only considered a one-dimensional system for the band structure, the Bloch waves and the Wannier functions.
This is a valid approach for a single particle in a separable potential $V(phy.vb(r)) = V(x) + V(y) + V(z)$, where the wavefunctions can be determined individually for each dimension @bloch_many-body_2008.
However, the actual potential and the total wavefunction must be three dimensional.
In accordance with our experimental setup, we therefore consider a three-dimensional optical lattice, where each dimension is described by the Wannier function corresponding to the lowest band $n = 1$.
Additionally, instead of being a single-particle system, the optical lattice is occupied by many particles with the spin states $phy.ket(arrow.t)$ and $phy.ket(arrow.b)$.
Within the Pauli exclusion principle, this enables the interaction of two particles of opposite spin on the same lattice site#footnote[
  In general, there are also off-site interaction terms @dutta_non-standard_2015. However, they are negligible for the optical-lattice potentials in the context of this thesis.
].
The corresponding interaction energy of two particles with the same spatial wavefunction $w(phy.vb(r))$ is

$
  U
  = (4 pi phy.hbar^2 asc) / m
  integral phy.dd(phy.vb(r), 3) abs(w(phy.vb(r)))^4
$ <eq:theory-wannier-interaction-strength>

where #asc is the scattering length that characterizes the magnitude and the sign of the interaction @jaksch_cold_1998.
If the scattering length is negative (positive), the corresponding interaction is attractive (repulsive) and the energy of the two particles is decreased (increased).
Since the integrand in @eq:theory-wannier-interaction-strength is proportional to the squared density $n(phy.vb(r)) = abs(w(phy.vb(r)))^2$, the magnitude of the interaction energy depends on the confinement of the particles.
A strong confinement will compress the wavefunction and therefore increase the integral in @eq:theory-wannier-interaction-strength.
To estimate the scaling due to the confinement, we can approximate a lattice by a three-dimensional harmonic oscillator with the trap frequencies $omega_x$, $omega_y$ and $omega_z$.
The resulting interaction energy is proportional to the geometric mean

$
  U prop sqrt(omega_x omega_y omega_z)
$ <eq:theory-wannier-interaction-scaling>

which is reduced significantly if only one axis has a weaker confinement.
The trap frequency in the harmonic approximation scales like $omega prop sqrt(v_0) slash a^2$, where $v_0$ is the dimensionless lattice depth and $a$ is the lattice period.
Therefore, different lattice periods have the strongest impact on the confinement and the interaction energy.

The Wannier functions @eq:theory-wannier-transformation[] are inherently non-interacting, since the Hamiltonian @eq:theory-bloch-hamiltonian[] only describes a single particle in an optical lattice.
Therefore, we cannot take the change of the wavefunction into account when computing the interaction energy with the Wannier functions.
In the case of a strongly repulsive interaction, we expect the wavefunction to expand to reduce the integral in @eq:theory-wannier-interaction-strength.
Correspondingly, the wavefunction should shrink in response to a strongly attractive interaction.
The actual change of the wavefunction depends on the interplay of the kinetic energy, the potential energy and the interaction energy.
In a three-dimensional harmonic-oscillator potential, the ground state of two interacting particles can be found with a variational approach.
The shift of the energy $Delta E(asc)$ compared to the non-interacting ground state depends on the scattering length #asc in units of the oscillator length $x_0 = sqrt(phy.hbar / (m omega))$ and the geometry of the harmonic oscillator.
In an isotropic three-dimensional harmonic oscillator where $omega_x = omega_y = omega_z$, the spherical symmetry of the potential can be used to find the analytical solution @busch_two_1998.
The analytical solution decomposes the wavefunction $psi(phy.vb(r))$ in the non-interacting basis and minimizes the energy of the interacting Hamiltonian.
Since then, this approach has been extended to cylindrically symmetric potentials where $omega_x = omega_y != omega_z$ @idziaszek_two_2005 @idziaszek_analytical_2006, and to completely anisotropic potentials where $omega_x != omega_y != omega_z$ @chen_analytical_2020.
We can apply the correction $Delta E(asc)$ to the interaction energy with the expression

$
  U = U_"Wannier" / U_"Gauss" dot Delta E(asc)
$ <eq:theory-wannier-interaction-correction>

where the fraction $U_"Wannier" / U_"Gauss"$ takes the small differences between the Wannier functions and the Gaussian wavefunctions as the ground state of the harmonic oscillator into account @schneider_ab-initio_2009.
