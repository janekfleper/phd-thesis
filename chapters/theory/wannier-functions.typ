#import "@preview/physica:0.9.3" as phy
#import "../../stuff.typ": num, unit, qty

#let cexp(body) = [
  $upright(e)^(upright(i) #body)$
]

#let ncexp(body) = [
  $upright(e)^(- upright(i) #body)$
]

== Wannier functions <wannier-functions>

The Bloch waves introduced in @bloch-theorem have a discrete quasi-momentum $q$ and are therefore completely delocalized over the optical lattice potential.
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

While an actual particle will be described by a three-dimensional wavefunction, the axes perpendicular to the tunneling event can be ignored if the wave functions to not change as a function of those axes between the lattice sites $i$ and $j$.
In a three-dimensional optical lattice this is (almost) always the case, which greatly simplifies the computation of the tunneling amplitudes.

#figure(
    image("../../figures/wannier-functions-tunneling-overlap.png"),
    caption: [
        Wannier functions of the lowest band on neighbouring lattice sites in an optical lattice with depth $v_0 = #qty[??][Erec]$.
        The zero point of the second y-axis is shifted to the mean energy of the lowest band $epsilon_1 (q)$.
        The on-site portion of the Wannier functions resembles the ground state wavefunction of the harmonic oscillator potential.
        With increasing lattice depth the Wannier functions will converge towards the harmonic oscillator solution.
        The off-site portion of the Wannier functions is however vastly different than the harmonic oscillator solution.
    ]
) <wannier-functions-tunneling-illustration>

