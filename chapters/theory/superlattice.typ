#import "/header.typ": *

== Optical superlattices <sec:theory-super>

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
I will not go into much detail about solving the Schrödinger equation with Bloch waves since the steps are very similar to the calculation shown in @sec:theory-bloch.
For the computation of the Wannier functions some extra steps have to be taken since the unit cell in the superlattice will have two lattice sites.

The optical superlattice potential according to our convention is

$
  V(x) = V_s dot cos^2(k_s x) - V_l dot cos^2 (k_l x + phi)
$ <eq:theory-super-potential>

where $(V_s, V_l)$ and $(k_s, k_l)$ are the respective depths and wavevectors of the _short_ lattice and the _long_ lattice, and $phi$ is the relative phase between the two individual lattices.
Since the short (long) lattice is blue (red)-detuned in the experimental setup, the signs of the terms in @eq:theory-super-potential are chosen to correctly reflect the detuning.
The relative phase $phi$ is associated with the long lattice since we always tune the phase of the long lattice during the experiment.
At $phi = 0$ the superlattice potential will show balanced (symmetric) double wells.
Technically the potential is $pi$-periodic but a very similar potential is already realized at $phi = pi slash 2$.
See @fig:theory-super-potential-phase for an illustration of the superlattice potential for different phases $phi$.

For the superlattice potential it is also useful to express @eq:theory-super-potential in dimensionless units.
Since there are two characteristic length scales and two characteristic energy scales, one of the lattices has to be chosen as the reference.
In momentum space the quasi-momentum $q$ will again be limited to the first Brillouin-zone which will be based on the wavevector of the long lattice since $k_l = k_s slash 2$.
We will therefore transform the coordinate $x -> x slash k_l$ and we will use $#unit[Erecl] = (phy.hbar^2 k_l^2) / (2m)$ as the characteristic energy scale.
The potential @eq:theory-super-potential will therefore be

$
  V(x) slash E_"rec,l"
  = 4 v_s dot cos^2(2x) - v_l dot cos^2(x + phi)
$ <eq:theory-super-potential-dimensionless>

where the prefactor of the short lattice term is chosen such that $v_s$ is the lattice depth in units of $#unit[Erecs] = 4 #unit[Erecl]$.
The illustration of the superlattice potential in @fig:theory-super-potential-phase is using the dimensionless lattice depths.

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
  ],
) <fig:theory-super-potential-phase>


=== Bloch theorem <ssec:theory-super-bloch>

The potential @eq:theory-super-potential-dimensionless can be plugged into the Schrödinger equation @eq:theory-bloch-psiq-schroedinger to compute the band structure and the Bloch waves in the superlattice potential.
Since the superlattice potential has two spatial frequency components, the Fourier series expansion also has coefficients $c_(plus.minus) eq.not 0$ which will lead to non-zero matrix elements on the second off-diagonal.

$
  c_0 = 2v_s - 1 / 2 v_l,
  c_(plus.minus 1) = - 1 / 4 upright(e)^(minus.plus upright(i) 2 phi),
  c_(plus.minus 2) = v_s
$ <eq:theory-super-potential-fourier-coefficients>

Actually solving the Schrödinger equation works just like for the monochromatic lattice.
The eigenvalues will be the energy bands $epsilon_n (q)$ and the eigenvectors will lead to the Bloch waves $psi_(n,q) (x)$ where $n$ is the band index and $q$ is the quasi-momentum in the first Brillouin-zone of the long lattice.
See @fig:theory-super-potential-phase for the band structure of a _symmetric_ superlattice.

#figure(
  image("../../figures/superlattice-band-structure-zoom.png"),
  caption: [
    Band structure in the superlattice potential for $v_l = ?$, $v_s = ?$ and $phi = 0$.
    In a symmetric superlattice potential the band structure shows pairs of bands that are only separated by a small energy gap.
    The energy gaps between the band pairs are much larger in comparison, similar to the energy gaps in the monochromatic band structure, see @fig:theory-bloch-energy-bands.
    The band structure in the center extends over the first Brillouin-zone of the short lattice to highlight how these so-called _mini bands_ are created.
    From a distance it looks like we have two (large) bands that are separated by a band gap at $q slash k_l = plus.minus 2$.
    Similar to the opening of the band gaps in the monochromatic band structure, the introduction of the long lattice will cause the bands to separate at $q slash k_l = plus.minus 1$.
    If we then reduce the range of the quasi-momentum axis to the first Brillouin-zone of the long lattice, the "outer" parts of the bands are shifted by $plus.minus 2 k_l$ to fit inside the first Brillouin-zone of the long lattice.
    The resulting band structure in the right figure now shows four bands in two pairs of mini bands.
    The gap between the mini bands is much smaller since it is "created" by the peak of the potential inside the double well.
    The gap between the pairs of the mini bands depends on the peak of the potential between the double wells which is much larger for all usual lattice configurations.
  ],
) <fig:theory-super-band-structure>

As determined by Bloch's theorem, the function $u_(n,q) (x)$ in the Bloch waves must have the same periodicity as the potential.
Since the unit cell is given by the long lattice potential, the Bloch waves will also be periodic with respect to the long lattice.
The impact of the short lattice potential on the Bloch waves can be seen inside the unit cells, see @fig:theory-super-bloch-waves.
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
  ],
) <fig:theory-super-bloch-waves>


=== Wannier functions <ssec:theory-super-wannier>

To describe localized particles in the superlattice potential we want to compute the Wannier functions from the Bloch waves as shown in @fig:theory-super-bloch-waves.
If we would just use the definition in @eq:theory-wannier-transformation, the Wannier functions would conserve the symmetry of the Bloch waves inside the unit cell.
In a symmetric superlattice at $phi = 0$ the Wannier functions would then be delocalized over the two sites in the unit cell.
While those are technically valid Wannier functions, we would prefer to have a Wannier basis that describes particles that are localized on either site in the unit cell.
In other words we want to find the _maximally localized_ Wannier functions that describe the smallest/narrowest wave function of a particle inside the potential.
The issue of computing the maximally localized Wannier functions often arises in non-trivial lattice structures, and there has been a lot of research on this #text(red)[refs...].
In one-dimensional potentials there is a fairly straight forward approach to compute the maximally located Wannier functions using the band-projected position operator (BPO) #text(red)[ref Marzari & Vanderbilt (1997)].
This approach does not require any numerical optimization of the spatial variance of the Wannier functions which makes the computation really fast.
The calculation of the matrix elements of the BPO was worked out by #text(red)[ref Bissbort] and the calculation from the band structure and the Bloch waves in the superlattice potential to the computation of the on-site energies and the tunneling amplitudes is shown in detail in #text(red)[ref Görg].
In this section I will not explain any of the details or show any of the equations.
I will only present the qualitative results of the maximally localized Wannier functions, and the resulting tunneling parameters and on-site energies.

If we only look at the lowest two bands with $n = {1, 2}$ in @fig:theory-super-bloch-waves, we will notice that in each unit cell the corresponding Bloch waves look very similar to the wave function of the ground state and the excited state of a single particle in a balanced double well potential.
// We will therefore try to derive the mixing of the Bloch waves to compute the maximally localized Wannier functions based on the eigenstates of a single particle in a balanced double well.
In the two-particle basis where $phy.ket(L)$ and $phy.ket(R)$ describe a particle on the left site and right site respectively, the ground state $phy.ket(g)$ and the excited state $phy.ket(e)$ are

$
  phy.ket(g) = 1 / sqrt(2) (phy.ket(L) + phy.ket(R)) "and"
  phy.ket(e) = 1 / sqrt(2) (phy.ket(L) - phy.ket(R))
$ <eq:theory-super-wannier-SoD-eigenstates>

In the basis of the eigenstates $phy.ket(g)$ and $phy.ket(e)$ the single-site occupations are therefore

$
  phy.ket(L) = 1 / sqrt(2) (phy.ket(g) - phy.ket(e)) "and"
  phy.ket(R) = 1 / sqrt(2) (phy.ket(g) + phy.ket(e))
  #text(red)[remove this equation?]
$ <eq:theory-super-wannier-SoD-LR-states>

If we now associate the Bloch waves in @fig:theory-super-bloch-waves in the superlattice potential with the eigenstates @eq:theory-super-wannier-SoD-eigenstates of the double well potential, we will expect that a mixing of the Bloch waves will lead to the maximally localized Wannier functions analogous to $phy.ket(L)$ and $phy.ket(R)$.
At the phase $phi = 0$ we will have equal mixtures of the bands with only the signs being different.
If the phase is detuned from $phi = 0$, we would then expect the mixture to change analogous to the eigenstates of a single particle in a doublewell.
The overlap of the maximally localized Wannier functions with the regular Wannier functions computed from @eq:theory-wannier-transformation is shown in figure @fig:theory-super-wannier-mixing.
The illustration shows that we always have to mix the lowest two bands around $phi = 0$ and any other band pairs around avoided crossings.
If the superlattice configuration is far away from any avoided crossings (compared to their gaps), using the regular Wannier functions is sufficient to describe (maximally) localized particles.

#figure(
  image("../../figures/superlattice-wannier-mixing.png", width: 80%),
  caption: [
    Mixing of the Bloch bands to form maximally located Wannier functions in the superlattice potential.
    The y-axis shows the overlap of the maximally located Wannier function $phy.ket(w_R)$ on the right sublattice site with the regular Wannier functions $phy.ket(w_n)$ where $n$ is the index of the corresponding Bloch bands.
    For the Wannier function $phy.ket(w_L)$ on the left sublattice site (the absolute of) the overlaps look the same for the transformation $phi -> -phi$, discussing the sign between the regular Wannier functions $phy.ket(w_n)$ is not necessary to illustrate the mixing.
    Near the symmetry point the overlaps change rapidly since the relevant energy scale is the width of the respective bands (which is also the tunneling amplitude $t$).
    The changes are therefore slower around the second avoided crossing at $phi approx 0.16 pi$ since the second band and the third band are much wider.

    - #text(red)[Add band structure plot with $E(phi)$ that shows the avoided crossings!]
    - #text(red)[Add doublewell eigenvector plot (at least for $phi = 0$?)]
  ],
) <fig:theory-super-wannier-mixing>


=== Hubbard parameters / SSH model <ssec:theory-super-hubbard>

#text(red)[In this subsection we will only discuss the dynamics in the maximally localized Wannier functions based on the lowest two bands!]
If the superlattice potential is sufficiently deep, it makes sense to use the second quantization formalism again to describe the behavior of atoms inside the superlattice.
The required parameters are the tunneling amplitude @eq:theory-wannier-tunneling-amplitude and the interaction strength @eq:theory-wannier-interaction-strength that were already introduced in @sec:theory-wannier.
In general the tunneling amplitudes $t_"in"$ inside a doublewell will be greater than the tunneling amplitudes $t_"out"$ between separate doublewells due to the large potential barrier (mention the SSH model here?).
We could actually use the integral in @eq:theory-wannier-tunneling-amplitude to compute the tunneling amplitudes $t_"in"$ and $t_"out"$ in the superlattice potential with the Wannier functions $phy.ket(w_L)$ and $phy.ket(w_R)$ from the same doublewell and from a neighbouring doublewell respectively.
However, the computation of the maximally localized Wannier functions using the BPO matrix (#text(red)[what is the actual name here?] will already reveal the tunneling amplitudes between _all_ pairs of lattice sites in the system.
In addition to the tunneling amplitudes, the BPO matrix will also reveal the (absolute) on-site energies of the sublattice sites.
The relative detuning $2 Delta$ between neighbouring lattice sites is the last relevant parameter to describe the dynamics in doublewells (and extended SSH models?).
The factor of $2$ is chosen by convention to assign the energies $plus.minus Delta$ to the left/right localized state if $E = 0$ is set to the mean energy of the two states/sites.
The benefit behind choosing this convention for the detuning will become (more) obvious in #text(red)[the next section about the doublewell theory].

==== Missing stuff:
- Include the full/extended 1D Hubbard model for the superlattice here? This should be the extension of the SSH model (which does not include the interaction and the detuning $Delta$ "natively")
- Add some plots here to illustrate the Hubbard parameters for the relevant parameter space?
