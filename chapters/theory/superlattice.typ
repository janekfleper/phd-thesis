#import "/header.typ": *

== Optical superlattices <sec:theory-super>

#notes[
  - Discuss other superlattice types somewhere else? @sec:super-setup or @sec:phase-setup?
  - Change the sign in @eq:theory-super-potential to use the correct convention for the superlattice phase.
]

An optical superlattice is created by superimposing (at least) two optical lattices to form a potential with a non-trivial unit cell @windpassinger_engineering_2013.
In the experimental setup presented in this thesis, we are using two commensurate wavelengths $lambda_l = 2 lambda_s$ to create the optical-superlattice potential

$
  V(x) = V_s dot cos^2(k_s x) - V_l dot cos^2 (k_l x + phi)
$ <eq:theory-super-potential>

with the lattice depths $V_s$ and $V_l$ and the lattice vectors $k_s = pi slash a_s$ and $k_l = pi slash a_l$ of the two lattices.
The indices $l$ and $s$ refer to the _long_ lattice and the _short_ lattice respectively.
With the wavelengths $lambda_l approx #qty[1064][nm]$ and $lambda_s approx #qty[532][nm]$, the long lattice is red detuned and the short lattice is blue detuned relative to the D1 line and D2 line of potassium at $lambda_"D1" approx #qty[770.1][nm]$ and $lambda_"D2" approx #qty[766.7][nm]$ (see @sec:setup-k40).
Therefore, the potential of the long lattice is subtracted from the potential of the short lattice in @eq:theory-super-potential.
In addition to the lattice depths, the superlattice potential also features a phase $phi$ that can introduce a relative shift between the individual lattice potentials.
The phase only affects the long lattice to correctly model the in-plane superlattice potential in our experimental setup (see @sec:setup-lattices).
In @fig:theory-super-potential-phase, the superlattice potential is shown for different phases $phi$.
Since the phase of the short lattice is fixed, the positions of the individual lattice sites are nearly constant.
The phase of the long lattice primarily affects the energy offset between neighboring sites.
At the _symmetric_ phase $phi = 0$, this energy offset is zero, while it is maximal at the _antisymmetric_ phase $phi = pi slash 4$.
The _asymmetric_ regime $0 < phi < pi slash 4$ connects these two cases with a monotonously increasing energy offset.
According to @eq:theory-super-potential, we expect the potential to be $pi$-periodic.
However, an equivalent superlattice potential is already found with a period of $pi slash 2$ if we shift the unit cell by $a_l slash 2$.
The lattice period of $pi slash 2$ is therefore a better representation of the observable superlattice potential.

While the short lattice is the reference for the positions of the individual lattice sites, the spatial period of the potential follows the long lattice.
As highlighted in @fig:theory-super-potential-phase, the unit cell contains two lattice sites that are spaced by $Delta x approx a_s$, and the potential @eq:theory-super-potential[] is invariant under the translation $x -> x + a_l$.
We are therefore using the vector $k_l$ and the corresponding recoil energy to express the superlattice potential in dimensionless units.
Analogous to the monochromatic lattice potential in @eq:theory-bloch-hamiltonian-dimensionless, the potential is

$
  V(x) slash #unit[Erec]
  = 4 v_s dot cos^2(2x) - v_l dot cos^2(x + phi)
$ <eq:theory-super-potential-dimensionless>

where we used the relation $k_s = 2 k_l$ for the lattice vectors, and $#unit[Erec] prop k^2$ for the recoil energy of the two lattices.
With the factor of $4$ in front of the short-lattice depth, we can express the entire potential in units of the long recoil energy.
I am using this convention throughout the thesis when referring to the lattice depths in the superlattice potential.

#floating-figure(
  image("figures/theory_superlattice_phase.png"),
  caption: [
    Illustration of the superlattice potential for different phases $phi$.
    The individual lattice depths are $V_l = #qty[16][Erec]$ and $V_s = #qty[5][Erec]$, and the phase $phi$ is changed from $0$ to $pi slash 4$.
    The colored lines indicate the potentials of the long lattice (red) and the short lattice (green), while the black line shows the total superlattice potential.
    The shaded area marks the unit cell according to the convention used in this thesis.
    In the _symmetric_ configuration $phi = 0$ in *a*, the extrema of the long lattice coincide with the maxima of the short lattice.
    The resulting potential has a balanced double-well structure.
    The _antisymmetric_ configuration $phi = pi slash 4$ in *c* results in the maximum energy offset equal to the lattice depth $V_l$.
    Intermediate phases such as $phi = pi slash 10$ in *b* are referred to as _asymmetric_.
    The dotted red line highlights the shift of the long lattice compared to the phase $phi = 0$.

    #notes[
      - Use the xticks $[-1, -0.75, -0.25, 0]$ to match the shift of the long lattice in *c*.
    ]
  ],
  label: <fig:theory-super-potential-phase>,
)


=== Bloch theorem <ssec:theory-super-bloch>

The statement of the Bloch theorem to derive the Bloch waves in @eq:theory-bloch-waves can also be applied to the superlattice potential.
Since the unit cell is defined by the long lattice, the functions $u_q (x)$ in the Bloch waves have to match the periodicity of the long lattice given by the lattice period $a_l$.
To set up the Schrödinger equation for the Fourier-series coefficients $u_q^m$, the superlattice potential itself is expressed as a Fourier series.
Analogous to the potential @eq:theory-bloch-potential-fourier-series[], the long lattice only contributes to the coefficients $c_(plus.minus 1)$.
The short-lattice potential has double the spatial frequency, which corresponds to the coefficients $c_(plus.minus 2)$ in the Fourier series.
The resulting Schrödinger equation in the superlattice potential is

$
  epsilon_n (q) uqm(m) = ((q + 2 m)^2 + c_0) uqm(m)
  + c_(+1) uqm(m-1) + c_(-1) uqm(m+1)
  + c_(plus.minus 2) (uqm(m-2) + uqm(m+2))
$ <eq:theory-super-bloch-uq-schroedinger>

with the coefficients $c_0 = 2 v_s - 1/2 v_l$, $c_(plus.minus 1) = -1/4 v_l upright(e)^(minus.plus upright(i) 2 phi)$ and $c_(plus.minus 2) = v_s$.
We can solve this equation for each quasimomentum $q$ again by writing it as a matrix with the coupling terms as the off-diagonal elements.
The diagonalization of the matrix yields the energy bands $epsilon_n (q)$ and the coefficients $u_q^m$ to compute the Bloch waves.
In @fig:theory-super-band-structure, the resulting band structure is shown for a symmetric configuration.
As a consequence of the two different lattice periods, the energy bands in *a* appear in pairs.
In the first Brillouin zone of the short lattice, the pairs $n = (1, 2)$ and $n = (3, 4)$ correspond to the individual bands $tilde(n) = 1$ and $tilde(n) = 2$ in #subref(<fig:theory-bloch-energy-bands>, "b").
The long lattice opens up a band gap at $q = plus.minus k_s slash 2 = plus.minus k_l$ to split the bands $tilde(n)$ into two _mini bands_ with the indices $n$.
For the lowest two bands in #subref(<fig:theory-super-band-structure>, "b"), the pair structure is still visible as the gap between the bands is significantly smaller than the gap to the third band.
This becomes less obvious for the higher bands since the impact of the superlattice potential becomes smaller.
However, the Bloch waves still show their origin from the band $tilde(n) = 2$ with a single node per lattice site.

#floating-figure(
  image("figures/theory_superlattice_band_structure.png"),
  caption: [
    Band structure of a symmetric optical superlattice.
    The lattice depths are $V_l = #qty[16][Erec]$ and $V_s = #qty[5][Erec]$, just like in @fig:theory-super-potential-phase.
    In *a*, the four lowest energy bands $epsilon_n (q)$ are shown in the first Brillouin zone of the long lattice.
    The lowest two bands already appear to be flat, whereas the upper two bands show a strong dispersion.
    In *b*, the energy bands and the Bloch waves $psi_(q=0)^n (x)$ are shown in the superlattice potential @eq:theory-super-potential[].
    Within each pair of bands, the Bloch waves only show a different symmetry in the unit cell (shaded area).
    The number of nodes per lattice site only increases in the upper pair of bands.
  ],
  label: <fig:theory-super-band-structure>,
)


=== Wannier functions <ssec:theory-super-wannier>

In @sec:theory-wannier, we concluded that the Wannier functions conserve the shape of the corresponding Bloch waves inside of the unit cell.
As shown for a regular lattice potential in @fig:theory-wannier, this matched our expectation for a wavefunction that is localized to a single lattice site.
However, in a symmetric superlattice, the Wannier functions computed with @eq:theory-wannier-transformation for each band $n$ are spread across both lattice sites in the unit cell.
While these are valid Wannier functions, they are not localized to a single lattice site.
In general, finding the maximally localized Wannier functions requires a minimization of the spatial variance $sigma_x^2 = phy.expval(x^2) - phy.expval(x)^2$ using numerical methods @marzari_maximally_1997 @marzari_maximally_2012.
However, in one-dimensional systems the maximally localized Wannier functions can be derived with the band-projected position operator @kivelson_wannier_1982.
The application to optical lattices was worked out in @bissbort_dynamical_2012, and the calculation for the specific case of the superlattice potential is shown in @gorg_ultracold_2014.
In this section, I will only present an intuitive derivation for the symmetric superlattice configuration, and I will show the qualitative results as a function of the superlattice phase.

If we only consider the Bloch waves from one mini band with index $n$, the Wannier functions spanning the entire unit cell are already the maximally localized ones.
It is not possible for a superposition of the Bloch waves from a single band to have a smaller spatial variance $sigma_x^2$.
Therefore, the approach to find the maximally localized Wannier functions takes multiple bands into account @bissbort_dynamical_2012.
The number of bands has to be equal to the number of separate Wannier functions inside the unit cell.
In the superlattice potential @eq:theory-super-potential-dimensionless[], we are therefore using two bands at a time.
For the Bloch waves in the symmetric superlattice shown in #subref(<fig:theory-super-band-structure>, "b"), we can expect an equal mixture of the lowest two bands to localize the Wannier functions to the left or the right lattice site of the unit cell.
If the Wannier functions $w_1 (x)$ and $w_2 (x)$ are computed with @eq:theory-wannier-transformation, the maximally localized Wannier functions are

$
  w_L (x) = 1 / sqrt(2) (w_1 (x) + w_2 (x)) quad "and" quad w_R (x) = 1 / sqrt(2) (w_1 (x) - w_2 (x)) thin .
$ <eq:theory-super-wannier-superposition>

This mixture of the Wannier functions is illustrated in the insets in @fig:theory-super-wannier-mixing.
Since the underlying bands $epsilon_1 (q)$ and $epsilon_2 (q)$ have a different energy, the time evolution of the superposition will alternate between the Wannier functions $w_L (x)$ and $w_R (x)$.
The frequency of the time evolution is given by the energy gap $f dot h = Delta epsilon = epsilon_2 (q) - epsilon_1 (q)$.
This oscillation between the left and right lattice site is equivalent to the tunneling event in the Wannier picture.
Despite the maximal localization, the Wannier functions $w_L (x)$ and $w_R (x)$ have a finite amplitude on the neighboring lattice sites, and the tunneling amplitude can also be computed with the integral @eq:theory-wannier-tunneling-amplitude[].
However, compared to the regular lattice, there are two different tunneling amplitudes in the superlattice potential.
The particle can either tunnel _inside_ of the unit cell or _outside_ of the unit cell.
Due to the smaller potential barrier inside the unit cell, the amplitude #tin is always greater than the amplitude #tout.
To compute the amplitude of the outer tunneling, the Wannier functions $w_L (x - x_i)$ and $w_R (x - x_(i-1))$ are used, where $i$ is the index of the unit cell.

#floating-figure(
  image("figures/theory_superlattice_wannier_composition.png", width: 85%),
  caption: [
    Composition of the maximally localized Wannier functions.
    The depths of the individual lattices are $V_l = #qty[16][Erec]$ and $V_s = #qty[5][Erec]$, matching the system in @fig:theory-super-band-structure.
    *a* shows the three lowest energy bands as a function of the superlattice phase $phi$.
    The gap between the lowest two bands is minimal in the symmetric configuration $phi = 0$, and maximal in the antisymmetric configuration $phi = pi slash 4$.
    Conversely, the gap between the bands $n = 2$ and $n = 3$ is maximal at $phi = 0$ and minimal at $phi = pi slash 4$.
    The insets show the Wannier functions $w_1 (x)$ and $w_2 (x)$ at $phi = 0$ and $phi = pi slash 10$.
    As indicated by the energy offsets, the Wannier functions $w_n (x)$ are computed from the Bloch waves of the individual bands $n = 1$ and $n = 2$.
    In *b*, the composition of the maximally localized Wannier function $w_L (x)$ in terms of the Wannier functions $w_1 (x)$ and $w_2 (x)$ is shown.
    At the symmetric phase $phi = 0$, the Wannier functions $w_n (x)$ contribute equally, as already stated in @eq:theory-super-wannier-superposition.
    With an increasing superlattice phase $phi > 0$, the contribution of the second band decreases until $w_L (x) approx w_1 (x)$.
    The insets show the Wannier functions $w_L (x)$ (solid) and $w_R (x)$ (dashed) at $phi = 0$ and $phi = pi slash 10$.
    The respective energy offsets are computed from the weighted mean of the individual bands $epsilon_1 (q)$ and $epsilon_2 (q)$.

    #notes[
      - Add the coupling/mixing of the bands $n = 2$ and $n = 3$? Or just remove band $n = 3$ instead?
      - Explain why the data in *b* stops at $phi slash pi = 0.2$?
      - Show the Wannier functions $w_3 (x)$ in the insets in *a*?
    ]
  ],
  label: <fig:theory-super-wannier-mixing>,
)

In an asymmetric superlattice, the degeneracy of the lattice sites inside the unit cell is lifted.
This causes the Wannier functions of the individual bands to become more localized until they are equal to the maximally localized Wannier functions $w_L (x)$ and $w_R (x)$.
To visualize this change, the composition of the Wannier function $w_L (x)$ as a function of the superlattice phase $phi$ is shown in #subref(<fig:theory-super-wannier-mixing>, "b").
Depending on the sign of the superlattice phase, the Wannier function $w_L (x)$ approaches either $w_1 (x)$ or $w_2 (x)$.
At the phase $phi = pi slash 10$ in @fig:theory-super-wannier-mixing, the insets only show subtle differences between $w_L (x)$ and $w_1 (x)$ as well as $w_R (x)$ and $w_2 (x)$.
In the opposite configuration $phi = -pi slash 10$, the association of the Wannier functions switches.
While $w_L (x)$ and $w_R (x)$ are always localized on the left and right lattices sites, the Wannier functions $w_1 (x)$ and $w_2 (x)$ are localized on the lower and upper lattice sites respectively.
This is a consequence of the different bases that are used to compute the Wannier functions.
The Bloch waves and the Wannier functions $w_n (x)$ are sorted by their corresponding energy bands.
On the other hand, the eigenvalues of the band-projected position operator are the positions $x_(L,R)^i$ of the maximally localized Wannier functions.
The Wannier functions $w_(L,R) (x)$ are therefore sorted from left to right in the unit cell.

Besides the computation of the maximally localized Wannier functions, we can also use the eigenvectors of the band-projected position operator to find the associated tunneling amplitudes and the on-site energies @gorg_ultracold_2014.
If we transform the superlattice Hamiltonian to the eigenbasis of the band-projected position operator, the matrix elements reveal the properties of the Wannier functions.
As an example, we are going to consider a superlattice potential with the system size $N = 2$.
The resulting Hamiltonian is

$
  hat(H)_"BPO" = mat(
    eL^0, tin, , ;
    tin, eR^0, tout;
    , tout, eL^1, tin;
    , , tin, eR^1;
  )
$ <eq:theory-super-hamiltonian-bpo>

with the on-site energies $epsilon_(L,R)^i$ in each unit cell $i$ and the tunneling amplitudes inside and outside of the unit cells.
The empty off-diagonal elements are higher-order tunneling amplitudes that are exponentially suppressed compared to #tin and #tout due to the distance between the corresponding Wannier functions.
In terms of the runtime, the computation of the band-projected position operator is the most costly step.
Since this is required for the maximally localized Wannier functions anyway, using the Hamiltonian $hat(h)_"BPO"$ to get the tunneling amplitudes and on-site energies is the most efficient approach.

The composition of the Wannier function $w_L (x)$ in #subref(<fig:theory-super-wannier-mixing>, "b") shows that the mixing of the corresponding bands follows the avoided crossing in the band structure.
If the gap between the coupled bands becomes large, we expect the mixing ratio to converge.
However, the mixing changes again if one of the bands is part of another avoided crossing.
In the superlattice potential, this is often the case for the band $n = 2$ which approaches the band $n = 3$ with an increasing phase $phi$.
Therefore, computing the maximally localized Wannier functions with the bands $n = 1$ and $n = 2$ breaks down close to the antisymmetric phase $phi = pi slash 4$.
For the Wannier function $w_L (x)$, we should only use the band $n = 1$ to avoid this issue.
The mixture of the bands $n = 2$ and $n = 3$ yields the Wannier function $w_R (x)$ and the Wannier function $w'_L (x)$ of the first excited state on the left lattice site.
Handling the changing pairs of bands automatically would require more than two bands in the setup of the band-projected position operator.
This is mentioned in @gorg_ultracold_2014 to generalize the formalism with more than two Wannier functions per unit cell.
The downside of this approach is an additional projection of the Wannier functions depending on their position inside the unit cell.
If the superlattice phase $phi$ changes, this can require a discrete change in the association of the Wannier functions with the left or the right lattice site.
Since we only expect continuous changes of the maximally localized Wannier function, this association based on the positions of the Wannier functions is questionable.
Therefore, we decided to manually select the pairs of bands that are close to each other in the band structure, which is also the approach recommended in @gorg_ultracold_2014.
