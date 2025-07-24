#import "/header.typ": *

== Optical superlattices <sec:theory-super>

#notes[
  - Discuss the other superlattice types somewhere else? E.g. @sec:super-setup or @sec:phase-setup?
  - Introduce the detuning without mentioning the relevant wavelengths?
  - Use "sublattice" or "lattice" site for the doublewell sites?
]

An optical superlattice is created by superimporsing (at least) two optical lattices to create a potential with a non-trivial unit cell #tr[cite Föling or who?].
// Compared to a monochromatic lattice, the superlattice allows advanced
The superlattice configuration in this thesis uses two optical lattices with the same intersection angle $alpha$ and the commensurate wavelengths $lambda_"l" = 2 lambda_"s"$.
The indices $"l"$ and $"s"$ refer to the _long_ lattice and the _short_ lattice respectively.
These labels will be used throughout this section to refer to the individual lattices.
The optical superlattice potential according to the convention in this thesis is

$
  V(x) = V_s dot cos^2(k_s x) - V_l dot cos^2 (k_l x + phi)
$ <eq:theory-super-potential>

where $V_s$ and $V_l$ are the depths and $k_s$ and $k_l$ are the vectors $k = pi / a$ of the short lattice and the long lattice.
The potential of the long lattice is subtracted from the potential of the short lattice to take the respective detunings into account.
While the short lattice uses a blue-detuned wavelength, the long lattice is red detuned.
In addition to the lattice depths, the superlattice potential also features a phase $phi$ that can introduce a relative shift between the individual lattice potentials.
The phase only affects the long lattice, to correctly represent the superlattice potential in the experimental setup.
In @fig:theory-super-potential-phase, the superlattice potential is shown for different phases $phi$.
Since the phase of the short lattice is fixed, the positions of the individual lattice sites are nearly constant.
The phase of the long lattice primarily affects the energy offset between neighbouring sites.
At the _symmetric_ phase $phi = 0$, this energy offset is zero, while it is maximal at the _antisymmetric_ phase $phi = pi slash 4$.
The _asymmetric_ regime $0 < phi < pi slash 4$ connects these two cases with a monotonously increasing energy offset.
According to @eq:theory-super-potential, the potential is $pi$-periodic.
However, an equivalent superlattice potential is already found with a period of $pi slash 2$.
Throughout this thesis, the latter period of $pi slash 2$ is used since it is #tr[a/the] better representation of the observable superlattice potential.

While the short lattice is the reference for the positions of the individual lattice sites, the spatial period of the potential follows the long lattice.
The potential @eq:theory-super-potential[] is invariant under the translation $x -> x + a_l$, and the unit cell contains two lattice sites that are spaced by $Delta x approx a_s$.
Therefore, the vector $k_l$ and the corresponding recoil energy are used to express the superlattice potential in dimensionless units.
Analogous to the monochromatic lattice potential in @eq:theory-bloch-hamiltonian-dimensionless, the potential will be

$
  V(x) slash #unit[Erec]
  = 4 v_s dot cos^2(2x) - v_l dot cos^2(x + phi)
$ <eq:theory-super-potential-dimensionless>

where the relation $k_s = 2 k_l$ is used for the lattice vectors, and the scaling $#unit[Erec] prop k^2$ is used for the recoil energies.
The dimensionless lattice depths $v_s$ and $v_l$ are related to $V_s$ and $V_l$ by their corresponding recoil energies.
With an additional factor of $4$, the short lattice depth can be expressed in units of the recoil energy of the long lattice.
This convention is used throughout the thesis #tr[and is also the common one in the literature?]

#floating-figure(
  image("figures/theory_superlattice_phase.png"),
  caption: [
    Illustration of the superlattice phase $phi$.
    The individual lattice depths are $V_l = #qty[16][Erec]$ and $V_s = #qty[5][Erec]$, and the phase $phi$ is changed from $0$ to $pi slash 4$.
    The colored lines indicate the potentials of the long lattice (red) and the short lattice (green), while the black line shows the total superlattice potential.
    In the _symmetric_ configuration $phi = 0$ in *a*, the extrema of the long lattice coincide with the maxima of the short lattice.
    The resulting potential has a balanced doublewell structure.
    The _antisymmetric_ configuration $phi = pi slash 4$ in *c* results in the maximum energy offset equal to the lattice depth $V_l$.
    Intermediate phases such as $phi = pi slash 10$ in *b* are referred to as _asymmetric_.
    The dotted red line shows the long potential with $phi = 0$ to highlight the shift of the long lattice.

    #notes[
      - Mark a unit cell with faint vertical lines?
      - Anything else to mention here?
      - Explain why the green potential has a depth of $4 dot #qty[5][Erec]$?
    ]
  ],
  label: <fig:theory-super-potential-phase>,
)


=== Bloch theorem <ssec:theory-super-bloch>

#notes[
  - Really mention the term "mini bands"?
  - Explain the relation between the band widths, the band gaps and the tunneling parameters?
]

The ansatz for the Bloch waves in @eq:theory-bloch-waves only requires that the functions $u_q (x)$ have the same periodicity as the potential $V(x)$.
As concluded in the previous section, the superlattice potential @eq:theory-super-potential-dimensionless[] inherits the periodicity from the long lattice.
Therefore, the Bloch theorem can be applied directly to the superlattice potential.
To set up the Schrödinger equation for the Fourier-series coefficients $u_q^m$, the superlattice potential itself is rewritten as a Fourier series.
Analogous to the potential @eq:theory-bloch-potential-fourier-series[], the long lattice contributes to the coefficients $c_(plus.minus 1)$.
The short-lattice potential has twice the spatial frequency, which corresponds to the coefficients $c_(plus.minus 2)$ in the Fourier series.
The resulting Schrödinger equation in the superlattice potential is

$
  epsilon_n (q) u_q^m = ((q + 2 m)^2 + c_0) u_q^m
  + c_(+1) u_q^(m-1) + c_(-1) u_q^(m+1)
  + c_(plus.minus 2) (u_q^(m-2) + u_q^(m+2))
$ <eq:theory-super-bloch-uq-schroedinger>

with the coefficients $c_0 = 2 v_s - 1/2 v_l$, $c_(plus.minus 1) = -1/4 v_l upright(e)^(minus.plus upright(i) 2 phi)$ and $c_(plus.minus 2) = v_s$.
To solve the Schrödinger equation for each quasimomentum $q$, it is written as a matrix with the coupling terms as the off-diagonal elements.
The diagonalization of the matrix will yield the energy bands $epsilon_n (q)$ and the coefficients $u_q^m$ to compute the Bloch waves.
In @fig:theory-super-band-structure, the resulting band structure is shown for a symmetric configuration.
The energy bands in *a* appear in pairs as a consequence of the two different lattice periods.
In the first Brillouin zone of the short lattice, the pairs $n = (1, 2)$ and $n = (3, 4)$ correspond to the individual bands $tilde(n) = 1$ and $tilde(n) = 2$ as in #subref(<fig:theory-bloch-energy-bands>, "b").
The long lattice will then open up a gap at $q = plus.minus k_s slash 2 = plus.minus k_l$.
In the first Brillouin zone of the long lattice, the bands $tilde(n)$ are then split into two _mini bands_ with the indices $n$.
For the lowest two bands in #subref(<fig:theory-super-band-structure>, "b"), the pair structure is still visible as the gap between the bands is significantly smaller than the gap to the third band.
This is not as obvious for the two upper bands, but their Bloch waves still show the origin from the band $tilde(n) = 2$.

#floating-figure(
  image("figures/theory_superlattice_band_structure.png"),
  caption: [
    Band structure of an optical superlattice with $V_l = #qty[16][Erec]$, $V_s = #qty[5][Erec]$ and $phi = 0$.
    In *a*, the four lowest energy bands $epsilon_n (q)$ are shown in the first Brillouin zone of the long lattice.
    The lowest two bands already appear to be flat, whereas the upper two bands show a strong dispersion.
    In *b*, the energy bands and the Bloch waves $psi_(q=0)^n (x)$ are shown in the superlattice potential @eq:theory-super-potential[].
    Within each pair of bands, the Bloch waves only show a different symmetry in the unit cell.
    On each lattice site, the Bloch waves have the same number of nodes.

    #notes[
      - Really mention the lattice configuration in the title of the caption?
      - Show an additional phase here where the Bloch waves are already "maximally localized"?
      - Use $x slash a_"long"$ for the x-label of the figure...
    ]
  ],
  label: <fig:theory-super-band-structure>,
)


=== Wannier functions <ssec:theory-super-wannier>

#notes[
  - Even mention the gauge freedom?
]

#tr[Figure out some introductory sentence...]
With the definition @eq:theory-wannier-transformation[], the Wannier functions would conserve the symmetry of the Bloch waves inside the unit cell.
In a symmetric superlattice, the Wannier functions for each band $n$ would then be delocalized over the two sides of the unit cell.
While these are valid Wannier functions, they are not maximally localized in the superlattice potential.
In general, finding the maximally localized Wannier functions requires a minimization of the spatial variance $sigma_x^2 = phy.expval(x^2) - phy.expval(x)^2$ using numerical methods #tr[cite Marzari 1997 (paper) + 2012 (review)].
However, in one-dimensional systems these Wannier functions can be derived with the band-projected position operator #tr[cite Kivelson (1982)].
The application to optical lattices was worked out in #tr[cite Bissport (2012)], and the calculation for the specific case of the superlattice potential is shown in #tr[cite Görg (2014)].
In this section, I will only present an intuitive derivation for the symmetric superlattice configuration and show the qualitative results as a function of the superlattice phase.

If we only consider the Bloch waves from one mini band with index $n$, the Wannier functions spanning the entire unit cell are already the maximally localized ones.
It is not possible for a superosition of the Bloch waves from a single band to have a smaller spatial variance $sigma_x^2$.
Therefore, the approach to find the maximally localized Wannier functions takes multiple bands into account #tr[cite Bissbort].
The number of bands has to be equal to the number of separate Wannier functions inside the unit cell.
In the case of the superlattice potential @eq:theory-super-potential-dimensionless[], we are therefore using two bands at a time.
For the Bloch waves in the symmetric superlattice shown in #subref(<fig:theory-super-band-structure>, "b"), we can expect an equal mixture of the lowest two bands to localize the Wannier functions to the left or the right sublattice site.
If the Wannier functions $w_1 (x)$ and $w_2 (x)$ are computed with @eq:theory-wannier-transformation, the maximally localized Wannier functions will be

$
  w_L (x) = 1 / sqrt(2) (w_1 (x) + w_2 (x)) "and" w_R (x) = 1 / sqrt(2) (w_1 (x) - w_2 (x)) thin .
$ <eq:theory-super-wannier-superposition>

This mixture of the Wannier functions is illustrated in the insets in @fig:theory-super-wannier-mixing.
Since the underlying bands $epsilon_1 (q)$ and $epsilon_2 (q)$ have a different energy, the time evolution of the superposition will alternate between the Wannier functions $w_L (x)$ and $w_R (x)$.
In the Wannier picture, this can be interpreted as the tunneling event inside the unit cell where the tunneling amplitude is proportional to the energy gap $Delta epsilon = epsilon_2 (q) - epsilon_1 (q)$.
However, the tunneling amplitude can also be computed with the integral @eq:theory-wannier-tunneling-amplitude[] based on the spatial overlap of the Wannier functions.
Despite the maximal localization, the Wannier functions $w_L (x)$ and $w_R (x)$ will have a finite amplitude on the neighbouring sublattice sites.
Compared to the regular lattice, there are two different tunneling amplitudes between neighbouring sublattice sites in the superlattice potential.
The particle can either tunnel _inside_ of the unit cell or _outside_ of the unit cell.
Due to the smaller potential barrier inside the unit cell, the amplitude $t_"in"$ is always greater than the amplitude $t_"out"$.
To compute the amplitude of the outer tunneling, the Wannier functions $w_L (x - x_i)$ and $w_R (x - x_(i-1))$ are used, where $i$ is the index of the unit cell.

In an asymmetric superlattice, the degeneracy of the sublattice sites inside the unit cell is lifted.
This causes the Wannier functions of the individual bands to become more localized until they are equal to the maximally localized Wannier functions $w_L (x)$ and $w_R (x)$.
To visualize this change, the composition of the Wannier function $w_L (x)$ is shown in #subref(<fig:theory-super-wannier-mixing>, "b") as a function of the superlattice phase $phi$.
The Wannier function $w_L (x)$ approaches either the Wannier function $w_1 (x)$ or the Wannier function $w_2 (x)$, depending on the sign of the superlattice phase.
At the phase $phi = pi slash 10$ in @fig:theory-super-wannier-mixing, the insets only show subtle differences between $w_L (x)$ and $w_1 (x)$ as well as $w_R (x)$ and $w_2 (x)$.
In the opposite configuration $phi = -pi slash 10$, the association of the Wannier functions will switch.
While $w_L (x)$ and $w_R (x)$ are always localized on the left and right sublattices sites, the Wannier functions $w_1 (x)$ and $w_2 (x)$ will be localized on the lower and upper sublattice sites respectively.
This is a consequence of the different bases.
The band-projected position operator orders the Wannier functions by their position from left to right, whereas the Wannier functions computed directly from the Bloch waves are ordered by their corresponding energy bands.

// Besides the maximally localized Wannier functions, the band-projected position operator can also yield the tunneling amplitudes and the on-site energies corresponding to those Wannier functions.
// In the eigenbasis of the band-projected position operator, the hamiltonian

#floating-figure(
  image("figures/theory_superlattice_wannier_composition.png", width: 80%),
  caption: [
    Composition of the maximally localized Wannier functions.
    The depths of the individual lattices are $V_l = #qty[16][Erec]$ and $V_s = #qty[5][Erec]$.
    *a* shows the three lowest energy bands as a function of the superlattice phase $phi$.
    The gap between the lowest two bands is minimal in the symmetric configuration at $phi = 0$, and maximal in the antisymmetric configuration at $phi = pi slash 4$.
    Conversely, the gap between the bands $n = 2$ and $n = 3$ is maximal at $phi = 0$ and minimal at $phi = pi slash 4$.
    The insets show the Wannier functions $w_1 (x)$ and $w_2 (x)$ at $phi = 0$ and $phi = pi slash 10$.
    As indicated by the energy offsets, they are computed from the Bloch waves of the individual bands $n = 1$ and $n = 2$.
    In *b*, the composition of the maximally localized Wannier function $w_L (x)$ in terms of the Wannier functions $w_1 (x)$ and $w_2 (x)$ is shown.
    At the symmetric phase $phi = 0$, the individual Wannier functions contribute equally, as already mentioned in @eq:theory-super-wannier-superposition.
    With an increasing superlattice phase $phi > 0$, the contribution of the second decreases until $w_L (x) approx w_1 (x)$.
    The insets show the Wannier functions $w_L (x)$ (solid) and $w_R (x)$ (dashed) at $phi = 0$ and $phi = pi slash 10$.
    The respective energy offsets are computed from the weighted mean of the individual bands $epsilon_1 (q)$ and $epsilon_2 (q)$.

    #notes[
      - How to label the phases for the insets? Just use an arrow or use a "cone" from the nearby corners to the entire vertical line?
      - Add the coupling/mixing of the bands $n = 2$ and $n = 3$? Or just remove band $n = 3$ instead?
      - Improve the y-label of axes *b*? Maybe just "Composition $|<...>|$"
      - Explain why the data in *b* stops at $phi slash pi = 0.2$?
    ]
  ],
  label: <fig:theory-super-wannier-mixing>,
)


=== Hubbard parameters / SSH model <ssec:theory-super-hubbard>

#text(
  red,
)[In this subsection we will only discuss the dynamics in the maximally localized Wannier functions based on the lowest two bands!]
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
