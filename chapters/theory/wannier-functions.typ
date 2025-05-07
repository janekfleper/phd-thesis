#import "/header.typ": *

== Wannier functions <sec:theory-wannier-functions>

The Bloch waves introduced in @sec:theory-bloch-theorem have a discrete quasi-momentum $q$ and are therefore completely delocalized over the optical lattice potential.
Wannier functions on the other hand are (maximally) localized in space and provide an alternative basis to describe particles in an optical lattice potential.
They can be computed directly from the Bloch waves $psi_(n,q) (x)$ with a Fourier-like transformation

$
  w_(n,i)(x)
    := w_n (x - x_i)
    = 1 / sqrt(N_L) sum_(q in #h(-0.00em) upright("BZ")) #ncexp[$q x_i$] dot psi_(n,q) (x)
$ <wannier-functions-transformation>

where $n$ is the band index, $N_L$ is the number of lattice sites and the sum over $q$ takes all quasi-momentum states in the first Brillouin zone into account.
The coordinate $x_i$ represents the position of the lattice site where the Wannier function is located.
Because of the gauge freedom the (global) phases of the Bloch functions can be chosen such that the functions are always real.

Since the Wannier functions $w_(n,i)(x)$ describe localized particles, they are great candidates to compute the tunneling amplitude between (neighbouring) sites and the interaction energy of two particles on the same site.
For the tunneling amplitude it is sufficient to consider the one-dimensional Wannier functions $w_(n,i)(x)$.
#footnote[
  Taking the complex conjugate of the "target" Wannier function $w_(n,j)(x)$ is not necessary since the Wannier functions @wannier-functions-transformation are real.
]

$
  t_(i,j) #sym.slash #h(0.1em) #unit[Erec]
    = - integral phy.dd(x) w_(n,j)(x) (- phy.dv(,x,2) + v_0 dot sin^2(x)) w_(n,i)(x)
$ <wannier-functions-tunneling-amplitude>

The tunneling amplitudes $t_(i,j)$ are the off-diagonal matrix elements of the hamiltonian @optical-lattice-hamiltonian-dimensionless-xy in the Wannier basis, and they quantify the tunneling rate between the lattice sites $i$ and $j$.
The rate of tunneling can be tied to the finite amplitude of the Wannier function $w_(n,i)(x)$ on the target site $j$ (and vice-versa).
In a (reasonably) deep lattice the finite amplitude can also be clearly observed on the neighbouring lattice site, see @wannier-functions-tunneling-illustration.

#figure(
  image("../../figures/wannier-functions-tunneling-overlap.png"),
  caption: [
    Wannier functions of the lowest band on neighbouring lattice sites in an optical lattice with depth $v_0 = #qty[#text(red)[15]][Erec]?$.
    The zero point of the second y-axis is shifted to the mean energy of the lowest band $epsilon_1 (q)$.
    The on-site portion of the Wannier functions resembles the ground state wavefunction of the harmonic oscillator potential.
    With increasing lattice depth the Wannier functions will converge towards the harmonic oscillator solution.
    The off-site portion of the Wannier functions is however vastly different than the harmonic oscillator solution.
  ],
) <wannier-functions-tunneling-illustration>

While an actual particle will be described by a three-dimensional wavefunction, the axes perpendicular to the tunneling event can be ignored if the wave functions do not change along the axes perpendicular to the tunneling event between the lattice sites $i$ and $j$.
In a three-dimensional optical lattice this is (almost) always the case, which greatly simplifies the computation of the tunneling amplitudes.

To compute the interaction, on the other hand, the three-dimensional wave functions are required since the contact interaction is proportional to the actual density of the two particles.
If we consider that atoms/particles on the site $i$ are described by the Wannier function $w_(n,i)(phy.vb(r))$, the interaction strength of two particles on the same site is

$
  U
  = (4 pi phy.hbar^2 a_upright("sc")) / m
  integral phy.dd(phy.vb(r), 3) abs(w_(n,i)(phy.vb(r)))^4
$ <wannier-functions-interaction-strength>

where $a_upright("sc")$ is the scattering length that characterizes the magnitude and the sign of the interaction.
For attractive (repulsive) interactions $#asc < 0$ ($#asc > 0$) the interaction will decrease (increase) the energy of the particles.
Since @wannier-functions-interaction-strength is proportional to the squared density, the magnitude of the interaction energy will also strongly depend on the confinement of the particles.
A strong confinement will compress the wavefunction and therefore increase the integral in @wannier-functions-interaction-strength.
If the particles are trapped in the ground state of deep optical lattices along all three axes, we can estimate the trap by three perpendicular harmonic oscillator potentials with the trap frequencies $omega_(x,y,z)$.
The interaction strength is then proportional to the geometric mean of the trap frequencies

$
  U prop sqrt(omega_x omega_y omega_z)
$

A weak(er) confinement along any of the three axes will therefore significantly reduce the magnitude of the interaction strength.

Since the interaction energy @wannier-functions-interaction-strength is computed with the non-interacting Wannier functions, the change of the wavefunctions due to the interaction energy is not taken into account yet.
If the two particles have a strong repulsive interaction, we would expect their wavefunctions to "decompress" such that the integral in @wannier-functions-interaction-strength is reduced. #footnote[For attractive interactions we would expect the density to get compressed instead.]
The decompression will also reduce the energy of the kinetic term in the Hamiltonian, but the energy of the potential term will be increased.
Solving this interplay of the kinetic energy, the potential energy and the interaction energy to find the interacting Wannier functions in an optical lattice potential is not practical.
In a three-dimensional harmonic oscillator, however, this can be solved using a variational approach to find the ground state energy $E$ of two interacting particles as a function of $asc slash l$ where $l = sqrt((2 phy.hbar) / (m omega))$ is the characteristic oscillator length in the harmonic oscillator potential.
The shift of the ground state energy is then rescaled using @wannier-functions-interaction-strength with the non-interacting Wannier function and with the three-dimensional gaussian function as the ground state wavefunction of the non-interacting harmonic oscillator.

$
  U = U_"Wannier" / U_"Gauss" dot (E(asc) - E(asc=0))
$ <wannier-function-interaction-correction>

In an isotropic three-dimensional optical lattice where $omega_x = omega_y = omega_z$ the calculation is quite straight forward since all axes contribute equally.
If the trapping potential is only equal along two axes of the optical lattice, the problem can be solved in cylindrical coordinates with an aspect ratio $eta = omega_(x,y) slash omega_z$. #text(red)[Idziaszek and Calarco]
The general case of three different trapping potentials $omega_x eq.not omega_y eq.not omega_z$ was solved by ...
