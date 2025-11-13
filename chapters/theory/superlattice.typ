#import "/header.typ": *
#import "figures/superlattice_phase/figure.typ": figure as figure-superlattice-phase

== Optical superlattices <sec:theory-super>

An optical superlattice is created by superimposing two optical lattices to form a potential with a non-trivial unit cell @windpassinger_engineering_2013.
In the experimental setup presented in this thesis, we use two commensurate wavelengths $lambda_l = 2 lambda_s$ to create the optical superlattice potential

$
  V(x) = V_s dot cos^2(k_s x) - V_l dot cos^2 (k_l x - phi)
$ <eq:theory-super-potential>

with the lattice depths $V_s$ and $V_l$ and the lattice vectors $k_s = pi slash a_s$ and $k_l = pi slash a_l$ of the short lattice and the long lattice respectively.
The short lattice is blue detuned ($lambda_s approx #qty[532][nm]$) and the long lattice is red detuned ($lambda_l approx #qty[1064][nm]$) with respect to the D1 line ($lambda_"D1" approx #qty[770.1][nm]$) and the D2 line ($lambda_"D2" approx #qty[766.7][nm]$) of potassium (see @sec:setup-k40).
In addition to the lattice depths, the superlattice potential also features a phase $phi$ to introduce a relative shift between the individual lattices.
Here, the phase only affects the long lattice to correctly model the in-plane superlattice potential in our experimental setup (see @sec:setup-lattices).
In @fig:theory-super-potential-phase, the superlattice potential is shown for different phases $phi$.
The long lattice primarily affects the energy offset between the lattice sites in the unit cell, while the positions of the individual lattices sites are fixed by the short lattice.
At the symmetric phase $phi = 0$, the energy offset is zero, while it is maximal at the antisymmetric phase $phi = - pi slash 4$.
The asymmetric regime $- pi slash 4 < phi < 0$ connects these two cases with a monotonously decreasing energy offset.
Since the potential @eq:theory-super-potential[] is invariant under the translation $x -> x + a_l$, we use the vector $k_l$ and the corresponding recoil energy to express the superlattice potential in dimensionless units

$
  V(x) slash #unit[Erec]
  = 4 v_s dot cos^2(2x) - v_l dot cos^2(x - phi)
$ <eq:theory-super-potential-dimensionless>

with the relation $k_s = 2 k_l$ for the lattice vectors, and $#unit[Erec] prop k^2$ for the recoil energy of the two lattices.
The factor $4$ is required to express the dimensionless lattice depth $v_s$ in units of the recoil energy at $lambda_s = #qty[532][nm]$.

#floating-figure(
  figure-superlattice-phase(height: 4.4cm),
  caption: [
    Superlattice potential with a tunable phase $phi$.
    The colored lines indicate the potentials of the long lattice (red) and the short lattice (green), while the black line shows the total superlattice potential.
    The shaded area marks the unit cell of the superlattice potential.
    *a*, Symmetric configuration $(phi = 0)$ where the extrema of the long lattice coincide with the maxima of the short lattice.
    *b*, Asymmetric configuration $(phi = -pi slash 10)$ with an energy offset between the lattice sites in the unit cell.
    *c*, Antisymmetric configuration $(phi = -pi slash 4)$ where the extrema of the long lattice coincide with the minima of the short lattice and the energy offset is maximal.
    The dotted red line in (*b*) and (*c*) highlights the shift of the long lattice potential compared to the symmetric configuration in (*a*).
  ],
  label: <fig:theory-super-potential-phase>,
  placement: bottom,
)


=== Bloch's theorem <ssec:theory-super-bloch>

Analogous to the monochromatic lattice potential, we can use the ansatz in @eq:theory-bloch-waves for the Bloch waves in the superlattice potential.
Since the unit cell is defined by the long lattice, the functions $u_q (x)$ in the Bloch waves have to match the periodicity of the long lattice given by the lattice period $a_l$.
To set up the Schrödinger equation for the Fourier-series coefficients $uqm(m)$, we express the superlattice potential as a Fourier series.
The long lattice potential only contributes to the coefficients $c_(plus.minus 1)$, while the short lattice potential has double the spatial frequency and therefore contributes to the coefficients $c_(plus.minus 2)$.
The resulting Schrödinger equation in the superlattice potential is

$
  epsilon_n (q) uqm(m) = ((q + 2 m)^2 + c_0) uqm(m)
  + c_(+1) uqm(m-1) + c_(-1) uqm(m+1)
  + c_(plus.minus 2) (uqm(m-2) + uqm(m+2))
$ <eq:theory-super-bloch-uq-schroedinger>

with the coefficients $c_0 = 2 v_s - 1/2 v_l$, $c_(plus.minus 1) = -1/4 v_l upright(e)^(plus.minus upright(i) 2 phi)$ and $c_(plus.minus 2) = v_s$.
We express the equation as a matrix and diagonalize it to get the energy bands $epsilon_n (q)$ and the coefficients $uqm(m)$ of the Bloch waves.
In @fig:theory-super-band-structure, the resulting band structure is shown for the symmetric configuration.
Compared to the band structure of the monochromatic lattice in @fig:theory-bloch-energy-bands, the energy bands form the pairs $n = (1, 2)$ and $n = (3, 4)$.
This is a consequence of the two different lattice periods $a_s$ and $a_l$ @gorg_ultracold_2014.
In the band structure of the short lattice potential, the bands corresponding to the two pairs are $tilde(n) = 1$ and $tilde(n) = 2$.
With the long lattice potential, new band gaps open up at $q = plus.minus k_l = plus.minus k_s slash 2$.
In the first Brillouin zone of the long lattice, the bands $tilde(n)$ are then split into pairs of bands with the indices $n$.
For the lowest two bands in #subref(<fig:theory-super-band-structure>, "b"), the pair structure is still visible as the gap between the bands is significantly smaller than the gap to the third band.
For both pairs of bands, the Bloch waves show their origin from the bands $tilde(n)$ in the number of nodes per lattice site (c.f. #subref(<fig:theory-bloch-energy-bands>, "b")).

#floating-figure(
  image("figures/theory_superlattice_band_structure.png", width: 85%),
  caption: [
    Band structure of a symmetric optical superlattice potential.
    *a*, Energy bands $epsilon_n (q)$ in an optical superlattice potential with $Vl = #qty[16][Erec]$, $Vs = #qty[5][Erec]$ and $phi = 0$.
    The energy bands show up in pairs $(1, 2)$ and $(3, 4)$ with a reduced band gap.
    *b*, Band energies $epsilon_n (q)$ and Bloch waves $bloch(q=0, n)(x)$ in the superlattice potential $V(x)$.
    The solid (dashed) lines indicate the real (imaginary) component of the Bloch waves.
    In each pair of bands, the Bloch waves only show a different symmetry in the unit cell.
  ],
  label: <fig:theory-super-band-structure>,
  placement: bottom,
)


=== Wannier functions <ssec:theory-super-wannier>

We concluded that the Wannier functions conserve the shape of the corresponding Bloch waves inside of the unit cell in @sec:theory-wannier.
As shown for the monochromatic lattice potential in @fig:theory-wannier, this matched our expectation for a wavefunction that is localized to a single lattice site.
However, in a symmetric superlattice, the Wannier functions computed with @eq:theory-wannier-transformation for each band $n$ are spread across both lattice sites in the unit cell.
While they are valid Wannier functions, they are not localized to a single lattice site in the unit cell.
In general, finding the maximally localized Wannier functions requires minimizing the spatial variance $sigma_x^2 = phy.expval(x^2) - phy.expval(x)^2$ using numerical methods @marzari_maximally_1997 @marzari_maximally_2012.
However, in one-dimensional systems the maximally localized Wannier functions can be derived with the band-projected position operator @kivelson_wannier_1982.
The application to optical lattices was worked out in @bissbort_dynamical_2012, and the calculation for the specific case of the superlattice potential is shown in @gorg_ultracold_2014.
In this section, I will present an intuitive derivation for the symmetric superlattice configuration and show the qualitative results as a function of the superlattice phase.

If we only consider the Bloch waves from one band with index $n$, the Wannier functions spanning the entire unit cell are already the maximally localized ones.
It is not possible for a superposition of the Bloch waves from a single band to have a smaller spatial variance $sigma_x^2$.
The approach to find the maximally localized Wannier functions takes multiple bands into account @bissbort_dynamical_2012.
The number of bands has to be equal to the number of separate Wannier functions inside the unit cell.
In the superlattice potential @eq:theory-super-potential-dimensionless[], we therefore use two bands at a time.
For the Bloch waves in the symmetric configuration shown in #subref(<fig:theory-super-band-structure>, "b"), we can expect an equal mixture of the lowest two bands to localize the Wannier functions to the left or right lattice site of the unit cell.
If the Wannier functions $w_1 (x)$ and $w_2 (x)$ are computed with @eq:theory-wannier-transformation, the maximally localized Wannier functions are

$
  w_L (x) = 1 / sqrt(2) (w_1 (x) + w_2 (x)) quad "and" quad w_R (x) = 1 / sqrt(2) (w_1 (x) - w_2 (x)) thin .
$ <eq:theory-super-wannier-superposition>

This mixture of the Wannier functions is illustrated in @fig:theory-super-wannier-mixing.
Since the underlying bands $epsilon_1 (q)$ and $epsilon_2 (q)$ have a different energy, the time evolution of the superposition oscillates between the Wannier functions $w_L (x)$ and $w_R (x)$.
The oscillation between the left and right lattice site is equivalent to the tunneling process in the Wannier picture.
The frequency $f$ of the oscillation is given by the energy gap $h f = Delta epsilon = epsilon_2 (q) - epsilon_1 (q)$.
Despite the maximal localization, the Wannier functions $w_L (x)$ and $w_R (x)$ have a finite amplitude on the neighboring lattice sites, and the tunneling amplitude can therefore be computed with the integral @eq:theory-wannier-tunneling-amplitude[].
However, compared to the regular lattice, there are two different tunneling amplitudes in the superlattice potential.
The particle can either tunnel inside of the unit cell or outside of the unit cell.
Due to the smaller potential barrier inside the unit cell, the amplitude #tin is always greater than the amplitude #tout.
To compute the amplitude of the outer tunneling, the Wannier functions $w_L (x - x_i)$ and $w_R (x - x_(i-1))$ are used, where $i$ is the index of the unit cell.

#floating-figure(
  image("figures/theory_superlattice_wannier_composition.png", width: 95%),
  caption: [
    Composition of the maximally localized Wannier functions.
    *a*, The lowest three energy bands $epsilon_n (q)$ as a function of the superlattice phase $phi$ in a superlattice potential with $V_l = #qty[16][Erec]$ and $V_s = #qty[5][Erec]$.
    The gap between the lowest two bands is maximal in the antisymmetric configuration ($phi = -pi slash 4$) and minimal in the symmetric configuration ($phi = 0$).
    Conversely, the gap between the bands $n = 2$ and $n = 3$ is minimal at $phi = -pi slash 4$ and maximal at $phi = 0$.
    The insets show the Wannier functions $w_1 (x)$ and $w_2 (x)$ at $phi = -pi slash 10$ and $phi = 0$.
    The Wannier functions $w_n (x)$ are computed from the Bloch waves of the individual bands $n = 1$ and $n = 2$, as indicated by the energy offsets.
    *b*, Composition of the maximally localized Wannier function $w_L (x)$ in terms of the Wannier functions $w_1 (x)$ and $w_2 (x)$.
    In the symmetric configuration ($phi = 0$), the Wannier functions $w_n (x)$ contribute equally, as already stated in @eq:theory-super-wannier-superposition.
    For a superlattice phase $phi < 0$, the contribution of the second band decreases until $w_L (x) approx w_1 (x)$.
    The insets show the Wannier functions $w_L (x)$ (solid) and $w_R (x)$ (dashed) at $phi = -pi slash 10$ and $phi = 0$ respectively.
    The energy offsets are the weighted averages of the bands $epsilon_1 (q)$ and $epsilon_2 (q)$.

    // TODO: Add arrows from the insets to the dashed/dotted lines?
  ],
  label: <fig:theory-super-wannier-mixing>,
)

In an asymmetric superlattice, the degeneracy of the lattice sites inside the unit cell is lifted.
This causes the Wannier functions of the individual bands to become more localized until they are equal to the maximally localized Wannier functions $w_L (x)$ and $w_R (x)$.
To visualize this change, the composition of the Wannier function $w_L (x)$ as a function of the superlattice phase $phi$ is shown in #subref(<fig:theory-super-wannier-mixing>, "b").
Depending on the sign of the superlattice phase, the Wannier function $w_L (x)$ approaches either $w_1 (x)$ or $w_2 (x)$.
At the phase $phi = -pi slash 10$ in @fig:theory-super-wannier-mixing, the insets only show subtle differences between $w_L (x)$ and $w_1 (x)$ as well as $w_R (x)$ and $w_2 (x)$.
In the opposite configuration $phi = pi slash 10$, the association of the Wannier functions switches.
While $w_L (x)$ and $w_R (x)$ are always localized on the left and right lattices sites, the Wannier functions $w_1 (x)$ and $w_2 (x)$ are localized on the lower and upper lattice sites respectively.
This is a consequence of the different bases that are used to compute the Wannier functions.
The Bloch waves and the Wannier functions $w_n (x)$ are sorted by their corresponding energy bands.
With the band-projected position operator, the eigenvalues are the positions $x_(L,R)^i$ and the maximally localized Wannier functions are sorted from left to right in the unit cell.

Besides the computation of the maximally localized Wannier functions, we can also use the eigenvectors of the band-projected position operator to find the associated tunneling amplitudes and the on-site energies @gorg_ultracold_2014.
As an example, we consider a superlattice potential with the system size $N = 2$.
In the eigenbasis of the band-projected position operator, the Hamiltonian of a single particle in the superlattice potential is

$
  hat(H)_"BPO" = mat(
    eL^0, tin, , ;
    tin, eR^0, tout;
    , tout, eL^1, tin;
    , , tin, eR^1;
  )
$ <eq:theory-super-hamiltonian-bpo>

with the on-site energies $epsilon_(L,R)^i$ in each unit cell $i$, and the tunneling amplitudes inside and outside of the unit cells.
The empty off-diagonal elements are higher-order tunneling amplitudes that are exponentially suppressed compared to #tin and #tout.

The composition of the Wannier function $w_L (x)$ in #subref(<fig:theory-super-wannier-mixing>, "b") shows that the mixing of the corresponding bands largely follows the avoided crossing at $phi = 0$ in the band structure.
If the gap between the coupled bands becomes large, we expect the maximally localized Wannier functions to converge towards the individual Wannier functions $w_n (x)$.
However, the mixing changes again if one of the bands is part of another avoided crossing.
This is often the case for the band $n = 2$ when it approaches the band $n = 3$ at an asymmetric phase $phi$.
As a result, the computation of the maximally localized Wannier functions with the individual bands $n = 1$ and $n = 2$ breaks down towards the antisymmetric configuration $phi = -pi slash 4$.
For the maximally localized Wannier function $w_L (x)$, we can directly use the Wannier function $w_1 (x)$ to avoid this issue.
The mixture of the bands $n = 2$ and $n = 3$ then yields the Wannier function $w_R (x)$ and the Wannier function $w'_L (x)$ of the first excited state on the left lattice site.
Handling the changing pairs of bands automatically would require mixing more than two bands in the setup of the band-projected position operator.
This is mentioned in @gorg_ultracold_2014 to generalize the formalism with more than two Wannier functions per unit cell.
The downside of this approach is an additional projection of the Wannier functions depending on their position inside the unit cell.
If the superlattice phase $phi$ changes, this can require a discrete change in the association of the Wannier functions to the left or right lattice site.
Since we only expect continuous changes of the maximally localized Wannier function, this association based on the positions of the Wannier functions is questionable.
We therefore decided to manually select the pairs of bands that are close to each other in the band structure, which is also the approach recommended in @gorg_ultracold_2014.
