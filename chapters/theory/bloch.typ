#import "/header.typ": *
#import "figures/band_structure/figure.typ": figure as figure-band-structure

== Bloch's theorem <sec:theory-bloch>

We want to find the eigenfunctions in the potential @eq:theory-lattice-potential[] to describe the behavior of a particle in the optical lattice.
The corresponding Hamiltonian of a single particle is
$
  hat(H) = -phy.hbar^2 / (2m) phy.dv(, x, 2) + V_0 dot sin^2(k x) thin .
$ <eq:theory-bloch-hamiltonian>

To make the Hamiltonian dimensionless, we express the energy in units of the recoil energy $#unit[Erec] = (phy.hbar^2 k^2) / (2 m)$, where $phy.hbar k$ is the momentum of a single photon and $m$ is the mass of the particle.
Additionally, we rescale the position $k x -> x$ such that $x$ is dimensionless, the lattice vector is $k = 1$ and the lattice period is $a = pi$.
The resulting Hamiltonian is

$
  hat(H) slash #unit[Erec] = hat(h) = -phy.dv(, x, 2) + v_0 dot sin^2(x) thin .
$ <eq:theory-bloch-hamiltonian-dimensionless>

Bloch's theorem states that the eigenfunctions of the Hamiltonian are plane waves multiplied by a function with the same periodicity as the lattice potential @ashcroft_solid_1976.
The so-called Bloch waves are completely delocalized over the lattice potential and they have the form

$
  bloch(q, "")(x) = u_q (x) dot cexp(q x)
$ <eq:theory-bloch-waves>

with the quasimomentum $q$ and the periodic functions $u_q (x)$.
Due to the discrete translation symmetry of the potential, the quasimomentum is only uniquely defined in the first Brillouin zone $q slash k in [-1, 1)$.
Conversely, the functions $u_q (x)$ are invariant under a spatial translation by the lattice period $a = pi$.
This property can be used to write the functions as the Fourier series

$
  u_q (x) = sum_m uqm(m) thin cexp(2 m x)
$ <eq:theory-bloch-uq-fourier-series>

with the integer index $m$ counting from $-infinity$ to $+infinity$.
A translation $x -> x + a$ by the lattice period only shifts the phase of each term in the Fourier series by $2 pi m$, leaving the functions $u_q (x)$ invariant.
In the next step, we also express the potential $V(x)$ as a Fourier series.
The coefficients $c_m$ are revealed by rewriting $sin^2(x)$ in terms of complex exponential functions.

$
  V(x) slash #unit[Erec] & = v_0 dot sin^2(x)
  = v_0 dot (1 / 2 - 1 / 2 cos(2 x))
  = underbrace(1 / 2 v_0, c_0) med underbrace(- 1 / 4 v_0, c_(plus.minus 1)) (cexp(2 x) + ncexp(2 x))
$ <eq:theory-bloch-potential-fourier-series>

Instead of the sum of all $m in ZZ$, the Fourier series of the potential only requires the terms with $m = (-1, 0, 1)$.
While the coefficient $c_0$ is just a global energy offset, the coefficients $c_(plus.minus 1)$ result in a coupling of the coefficients $uqm(m)$ in the Schrödinger equation.
With the Bloch waves @eq:theory-bloch-waves[] and the potential @eq:theory-bloch-potential-fourier-series[], the Schrödinger equation for each index $m$ is

$
  epsilon_n (q) uqm(m) = ((q + 2 m)^2 + 1 / 2 v_0) uqm(m) - 1 / 4 v_0 (uqm(m-1) + uqm(m+1))
$ <eq:theory-bloch-uq-schroedinger>

where $epsilon_n (q)$ are the eigenenergies with the band index $n$.
The sum over $m$ is eliminated by using the orthogonality of the complex exponential functions $cexp(2 m x)$.
We express @eq:theory-bloch-uq-schroedinger as a matrix where the rows and columns correspond to the index $m$.
The diagonalization of the matrix reveals the eigenenergies $epsilon_n (q)$ and the eigenvector coefficients $uqm(m)$.
The eigenenergies $epsilon_n (q)$ form energy bands with the band index $n >= 1$, and the Bloch waves $bloch(q, n)(x)$ computed from the coefficients $uqm(m)$ are the corresponding eigenfunctions of the Hamiltonian @eq:theory-bloch-hamiltonian[].
In @fig:theory-bloch-energy-bands, the five lowest energy bands $epsilon_n (q)$ are shown with the corresponding Bloch waves $bloch(q=0, n)(x)$.
The lowest band with index $n = 1$ is deeply trapped in the optical lattice potential.
Therefore, the dispersion $epsilon_1 (q)$ is nearly constant and the Bloch wave is maximal on the lattice sites and minimal inside the potential $V(x)$.
Both aspects show a similarity to the ground state of the harmonic oscillator#footnote[
  In deeper lattices, this behavior is also found for higher bands and the corresponding excited states of the harmonic oscillator (see @fig:mod-intro-theory).
].
For the lattice depth $V_0 = #qty[15][Erec]$, the band with index $n = 4$ is no longer trapped according to the condition $epsilon_n (q) > V_0$.
As a result, the Bloch waves $bloch(q, n)(x)$ approach the plane waves $phi.alt(x) prop cexp(p x slash phy.hbar)$ describing a free particle with the momentum $p$.
Correspondingly, the energy band $epsilon_n (q)$ converges to the dispersion $epsilon = p^2 slash (2 m)$ of a free particle mapped onto the first Brillouin zone.
At $q = 0$, the band gap to the fifth band is already closed, and the Bloch wave only changes slightly at the positions of the maxima of the potential $V(x)$.
This behavior can be found in all energy bands that are not trapped anymore.
In the intermediate regime, the bands with indices $n = 2$ and $n = 3$ have a finite bandwidth $Delta epsilon_n$ and the Bloch waves $bloch(q, n)(x)$ still follow the shape of the potential $V(x)$.

#floating-figure(
  figure-band-structure(),
  // TODO: Reduce x-axis limits to remove the left and right gaps?
  caption: [
    Band structure of an optical lattice potential.
    *a*, Energy bands $epsilon_n (q)$ in the first Brillouin zone $q slash k = [-1, 1)$ of an optical lattice potential with the depth $V_0 = #qty[15][Erec]$.
    The bandwidth $Delta epsilon_n = max(epsilon_n (q)) - min(epsilon_n (q))$ increases with the index $n$, while the gaps between the bands get smaller.
    *b*, Band energies $epsilon_n (q)$ and Bloch waves $bloch(q=0, n)(x)$ in the lattice potential $V(x)$.
    The offsets of the Bloch waves are the corresponding energies $epsilon_n (q = 0)$, and the solid (dashed) lines indicate the real (imaginary) component of the Bloch waves.
    The parity $cal(P) = (-1)^(n-1)$ of the Bloch waves alternates with the index $n$.
  ],
  label: <fig:theory-bloch-energy-bands>,
  placement: bottom,
)
