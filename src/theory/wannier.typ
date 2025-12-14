#import "/header.typ": *
#import "figures/wannier_functions/figure.typ": figure as figure-functions

== Wannier functions <sec:theory-wannier>

The Bloch waves introduced in @sec:theory-bloch have a discrete quasimomentum $q$ and are, therefore, completely delocalized over the optical lattice potential.
In the Wannier basis, maximally localized wavefunctions are used to describe individual particles in the optical lattice @wannier_structure_1937.
We can compute the Wannier functions from the Bloch waves $bloch(q, n)(x)$ with the Fourier transformation

$
  w_n (x - x_i)
  = 1 / sqrt(N) sum_(q in #h(0em) "BZ") bloch(q, n)(x) med ncexp(q x_i) eqc
$ <eq:theory-wannier-transformation>

where $n$ is the band index and $N$ is the number of sites in the optical lattice.
The Wannier function is localized at $x_i$ by superimposing the Bloch waves for all quasimomenta $q$ in the first Brillouin zone.
Just like the Bloch waves, the Wannier functions form an orthonormal basis with respect to the band index $n$ and, additionally, the lattice site $i$ (see @fig:theory-wannier).
As highlighted in #subref(<fig:theory-wannier>, "b"), the Wannier functions have a finite amplitude on the neighboring lattice sites that enables the localized particles to tunnel to a different lattice site.
The tunneling amplitude from the lattice site $i$ to the lattice site $j$ can be computed as the off-diagonal matrix element

$
  t_(i,j) = integral phy.dd(x) thin w_0 (x - x_j) thin hat(H) thin w_0 (x - x_i)
$ <eq:theory-wannier-tunneling-amplitude>

of the Hamiltonian @eq:theory-bloch-hamiltonian[] in the Wannier basis @jaksch_cold_2005.
While the tunneling amplitude is defined for arbitrary lattice sites $i != j$, the most common case is $t_1 := t_(i, i plus.minus 1)$ between neighboring lattice sites as shown in #subref(<fig:theory-wannier>, "b").
We can usually neglect tunneling over longer distances since it is exponentially suppressed compared to $t_1$.

#floating-figure(
  figure-functions(),
  caption: [
    Wannier functions in an optical lattice.
    *a*, Wannier functions $w_n (x)$ offset by the mean energy of the corresponding band $epsilon_n (q)$ in an optical lattice potential with the depth $V0 = #qty[15][Erec]$.
    The Wannier function with index $n = 1$ appears to be completely localized to the lattice site at $x = 0$.
    For the bands $n = 2$ and $n = 3$, a small amplitude is already visible on the neighboring lattice sites.
    The Wannier function of the untrapped band $n = 4$ is delocalized over multiple lattice sites.
    *b*, Wannier functions in the lowest band of an optical lattice potential with the depth $V0 = #qty[6][Erec]$.
    The horizontal line highlights the finite amplitude on the neighboring lattice sites.
  ],
  label: <fig:theory-wannier>,
)

So far, we have only considered a one-dimensional optical lattice potential.
This is a valid approach for a single particle in a separable potential $V(phy.vb(r)) = V(x) + V(y) + V(z)$, where the wavefunctions can be determined individually for each dimension @bloch_many-body_2008.
The total wavefunction is the product of the individual wavefunctions $w(phy.vb(r)) = w(x) dot w(y) dot w(z)$.
In a three-dimensional optical lattice potential, the ground state is composed of the Wannier functions of the band $n = 1$ for each axis.
If two particles with the same spatial wavefunction $w(phy.vb(r))$ and opposite spin #ketup or #ketdown occupy the same lattice site#footnote[
  There are also off-site interaction terms @dutta_non-standard_2015, which we neglect in the scope of this thesis.
], their interaction energy is

$
  U
  = (4 pi phy.hbar^2 asc) / m
  integral phy.dd(phy.vb(r), 3) abs(w(phy.vb(r)))^4 eqc
$ <eq:theory-wannier-interaction-strength>

where #asc is the scattering length that characterizes the magnitude and sign of the interaction~@jaksch_cold_1998.
If the scattering length is negative (positive), the interaction is attractive (repulsive) and the energy of the two particles is decreased (increased).
Since the integrand in @eq:theory-wannier-interaction-strength is proportional to the squared density $n(phy.vb(r)) = abs(w(phy.vb(r)))^2$, the magnitude of the interaction energy depends on the confinement of the particles.
A strong confinement compresses the wavefunction and increases the integral in @eq:theory-wannier-interaction-strength.
To estimate the scaling due to the confinement, we approximate a lattice site by a three-dimensional harmonic oscillator with the trap frequencies $omega_x$, $omega_y$ and $omega_z$.
The resulting interaction energy $U prop sqrt(omega_x omega_y omega_z)$ is already reduced significantly if only one axis has a weaker confinement.
Since the trap frequency in the harmonic approximation scales like $omega prop sqrt(v_0) slash a^2$, the lattice period $a$ generally has a stronger impact on the confinement and the interaction energy than the lattice depth $v_0$.

The Hamiltonian @eq:theory-bloch-hamiltonian[] describes a single particle in an optical lattice, which is an inherently non-interacting system.
We can, therefore, not take the interaction energy into account for the computation of the Wannier functions.
For strongly-attractive (repulsive) interactions, we expect the wavefunction to shrink (expand).
In a three-dimensional harmonic oscillator potential, the ground state of two interacting particles can be found with a variational approach.
The energy of the interacting Hamiltonian is minimized by decomposing the wavefunction $psi(phy.vb(r))$ in the non-interacting basis.
The resulting energy shift $Delta E(asc)$ compared to the non-interacting ground state depends on the scattering length #asc.
This variational approach has been applied to the isotropic harmonic oscillator $(omega_x = omega_y = omega_z)$ @busch_two_1998, the cylindrically-symmetric harmonic oscillator $(omega_x = omega_z != omega_z)$ @idziaszek_two_2005 @idziaszek_analytical_2006 and the anisotropic harmonic oscillator $(omega_x != omega_y != omega_z)$ @chen_analytical_2020.
For the three-dimensional optical lattice, we then use the expression

$
  U = U_"Wannier" / U_"Gauss" dot Delta E(asc)
$ <eq:theory-wannier-interaction-correction>

to take the small differences between the Wannier functions and the Gaussian wavefunctions as the ground state of the harmonic oscillator into account @schneider_ab-initio_2009.
