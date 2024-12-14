#import "@preview/physica:0.9.3" as phy
#import "../../stuff.typ": num, unit, qty

#let cexp(body) = [
  $upright(e)^(upright(i) #body)$
]

#let ncexp(body) = [
  $upright(e)^(- upright(i) #body)$
]

#pagebreak()
== Optical superlattices

In general an optical superlattice refers to (at least) two overlapping optical lattices with different lattice wavevectors $Delta phy.vb(k)$ that are not perpendicular.
If the lattice wavevectors would be perpendicular, the Schrödinger equation can be separated into the different axes again and the system can be described by multiple monochromatic lattices.
The simplest optical superlattice is created by overlapping commensurate lattices such that their lattice periods are connected by a factor of two ($a_"long" = 2 dot a_"short"$).
Assuming that the angle $alpha$ is equal for the individual lattices such a superlattice can be implemented using two wavelengths such that $lambda_"long" = 2 lambda_"short"$.
The labels _long_ and _short_ will be used throughout the thesis to refer to the individual lattices.

There are other complex superlattice structures available that allow interesting potentials to be created.
By interfering two perpendicular Gaussian beams on top of a regular monochromatic lattice, a potential can be created that is tunable from a regular square lattice to a hexagonal lattice, to dimers and to a checkerboard pattern #text(red)[ref ETH].
Overlapping three beam pairs with commensurate wavelengths at angles of $120 degree$ will create a hexagonal superlattice potential #text(red)[ref Stamper-Kurn]. 
More examples...

In this section I will cover the superlattice potential that is relevant for the optical superlattices in our experiment.
I will not go into much detail about solving the Schrödinger equation with Bloch waves since the steps are very similar to the calculation shown in @bloch-theorem.
For the computation of the Wannier functions some extra steps have to be taken since the unit cell in the superlattice will have two lattice sites.

The optical superlattice potential according to our convention is

$
  V(x) = V_s dot cos^2(k_s x) - V_l dot cos^2 (k_l x + phi)
$ <superlattice-potential>

where $(V_s, V_l)$ and $(k_s, k_l)$ are the respective depths and wavevectors of the _short_ lattice and the _long_ lattice, and $phi$ is the relative phase between the two individual lattices.
Since the short (long) lattice is blue (red)-detuned in the experimental setup, the signs of the terms in @superlattice-potential are chosen to correctly reflect the detuning.
The relative phase $phi$ is associated with the long lattice since we always tune the phase of the long lattice during the experiment.
At $phi = 0$ the superlattice potential will show balanced (symmetric) double wells.
Technically the potential is $pi$-periodic but a very similar potential is already realized at $phi = pi slash 2$.
See @superlattice-potential-phase for an illustration of the superlattice potential for different phases $phi$.

For the superlattice potential it is also useful to express @superlattice-potential in dimensionless units.
Since there are two characteristic length scales and two characteristic energy scales, one of the lattices has to be chosen as the reference.
In momentum space the quasi-momentum $q$ will again be limited to the first Brillouin-zone which will be based on the wavevector of the long lattice since $k_l = k_s slash 2$.
We will therefore transform the coordinate $x -> x slash k_l$ and we will use $E_"rec,l" = (phy.hbar^2 k_l^2) / (2m)$ as the characteristic energy scale.
The potential @superlattice-potential will therefore be

$
  V(x) slash E_"rec,l"
  = 4 v_s dot cos^2(2x) - v_l dot cos^2(x + phi)
$ <superlattice-potential-dimensionless>

where the prefactor of the short lattice term is chosen such that $v_s$ is the lattice depth in units of $E_"rec,s" = 4 E_"rec,l"$.
The illustration of the superlattice potential in @superlattice-potential-phase is using the dimensionless lattice depths.

#figure(
  grid(
    columns: 3,
    column-gutter: 2mm,
    image("../../figures/superlattice-potential-symmetric.png"),
    image("../../figures/superlattice-potential-asymmetric.png"),
    image("../../figures/superlattice-potential-antisymmetric.png"),
  ),
  caption: [
    Superlattice potential for different phases $phi$.
    The (dimensionless) lattice depths are $v_l = 30$ and $v_s = 15$ in all three cases.
    The individual potentials in green and red show that the actual depth of the short lattice is greater than the depth of the long lattice since the recoil energies differ by a factor of four.

    The figure on the left shows the superlattice potential for the phase $phi = 0$ where the total potential creates a balanced double well.
    In this thesis this configuration as well as all other phases $phi = n dot pi slash 2$ with integer $n$ are referred to as _symmetric_.
    The figure on the right shows the superlattice potential for the phase $phi = pi slash 4$ where the energy difference of the sublattice sites is maximal.
    This configuration is achieved whenever $phi = (n + 1 slash 2) dot pi slash 2$ with integer $n$ and it is referred to as _antisymmetric_ to highlight the contrast to the _symmetric_ superlattice.

    All configurations with other phases $phi$ will be referred to as _asymmetric_.
  ]
) <superlattice-potential-phase>


=== Bloch theorem

The potential @superlattice-potential-dimensionless can be plugged into the Schrödinger equation @bloch-theorem-psiq-schroedinger to compute the band structure and the Bloch waves in the superlattice potential.
Since the superlattice potential has two spatial frequency components, the Fourier series expansion also has coefficients $c_(plus.minus) eq.not 0$ which will lead to non-zero matrix elements on the second off-diagonal.

$
  c_0 = 2v_s - 1/2 v_l,
  c_(plus.minus 1) = - 1/4 upright(e)^(minus.plus upright(i) 2 phi),
  c_(plus.minus 2) = v_s
$ <superlattice-potential-fourier-coefficients>

Actually solving the Schrödinger equation works just like for the monochromatic lattice.
The eigenvalues will be the energy bands $epsilon_n (q)$ and the eigenvectors will lead to the Bloch waves $psi_(n,q) (x)$ where $n$ is the band index and $q$ is the quasi-momentum in the first Brillouin-zone of the long lattice.
See @superlattice-potential-phase for the band structure of a _symmetric_ superlattice.

#figure(
  image("../../figures/superlattice-band-structure-zoom.png"),
  caption: [
    Band structure in the superlattice potential for $v_l = ?$, $v_s = ?$ and $phi = 0$.
    In a symmetric superlattice potential the band structure shows pairs of bands that are only separated by a small energy gap.
    The energy gaps between the band pairs are much larger in comparison, similar to the energy gaps in the monochromatic band structure, see @bloch-theorem-energy-bands.
    The band structure in the center extends over the first Brillouin-zone of the short lattice to highlight how these so-called _mini bands_ are created.
    From a distance it looks like we have two (large) bands that are separated by a band gap at $q slash k_l = plus.minus 2$.
    Similar to the opening of the band gaps in the monochromatic band structure, the introduction of the long lattice will cause the bands to separate at $q slash k_l = plus.minus 1$.
    If we then reduce the range of the quasi-momentum axis to the first Brillouin-zone of the long lattice, the "outer" parts of the bands are shifted by $plus.minus 2 k_l$ to fit inside the first Brillouin-zone of the long lattice.
    The resulting band structure in the right figure now shows four bands in two pairs of mini bands.
    The gap between the mini bands is much smaller since it is "created" by the peak of the potential inside the double well.
    The gap between the pairs of the mini bands depends on the peak of the potential between the double wells which is much larger for all usual lattice configurations.
  ]
) <superlattice-band-structure>

As determined by Bloch's theorem, the function $u_(n,q) (x)$ in the Bloch waves must have the same periodicity as the potential.
Since the unit cell is given by the long lattice potential, the Bloch waves will also be periodic with respect to the long lattice.
The impact of the short lattice potential on the Bloch waves can be seen inside the unit cells, see @superlattice-bloch-waves.
In a symmetric superlattice the (inner function of the) Bloch waves will have the same symmetry properties regardless of the quasi-momentum $q$.
If the superlattice phase is however asymmetric, the symmetry between the two sites in the unit cell is broken and the odd (even) Bloch waves will start to localize on the lower (upper) sites to follow the respective on-site energies.

#figure(
  image("../../figures/superlattice-bloch-waves.png"),
  caption: [
    Bloch waves at $q = 0$ in the superlattice potential for $v_l = 15$, $v_s = 15$ and $phi = 0$.
    The Bloch waves $psi_(n,q) (x)$ are shifted by the mean of the respective energy bands $epsilon_n (q)$.
    The amplitude of the Bloch waves does not have a meaning here since they share the y axis with the potential and the energy bands despite having completely different units.
    Within the band pairs the Bloch waves are only different by the symmetry relative to the center of the unit cell (or double well).
    The (lower) odd bands are always symmetric with respect to the unit cell, whereas the (upper) even bands are antisymmetric with respect to the unit cell.
  ]
) <superlattice-bloch-waves>
