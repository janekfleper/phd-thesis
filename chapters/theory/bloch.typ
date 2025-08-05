#import "/header.typ": *

== Bloch theorem <sec:theory-bloch>

#notes[
  - Really skip all of the dimensionless stuff here?
  - Write eigenfunctions or eigen functions?
  - Use a different character for the mass to avoid confusion with the Fourier series index?
  - Explain the dimensionless units in more detail? E.g. $a = pi$...
  - Explain the origin of the name "recoil energy"?
  - Explain the "mapping" between the free-particle momentum $p$ and the quasimomentum $q$?
]

The Hamiltonian associated with a single particle in the optical lattice potential @eq:theory-lattice-potential[] is

$
  hat(H) = -phy.hbar^2 / (2m) phy.dv(, x, 2) + V_0 dot sin^2(k x) thin .
$ <eq:theory-bloch-hamiltonian>

To make the Hamiltonian dimensionless, we will rescale the position $x -> x slash k$ and express the energy in units of the recoil energy $#unit[Erec] = (phy.hbar^2 k^2) / (2 m)$, where $m$ is the mass of the particle.
I am using this convention throughout this chapter and in the appendix #tr[ref appendix].
The resulting dimensionless Hamiltonian is

$
  hat(h) = -phy.dv(, x, 2) + v_0 dot sin^2 x thin .
$ <eq:theory-bloch-hamiltonian-dimensionless>

In the Bloch theorem, the Hamiltonian is solved with an ansatz where the eigenfunctions have the same periodicity as the potential $V(x)$.
The so-called Bloch waves are completely delocalized over the potential and they have the form

$
  psi_q (x) = u_q (x) dot cexp(q x)
$ <eq:theory-bloch-waves>

with the quasimomentum $q$ and the periodic functions $u_q (x)$.
Due to the discrete translation symmetry of the potential, the quasimomentum is only uniquely defined in the Brillouin zone $q in [-pi / a, pi / a)$.
Conversely, the functions $u_q (x)$ are invariant under a spatial translation by the lattice period $a$.
This property can be used to write the functions as the Fourier series

$
  u_q (x) = sum_m u_q^m thin cexp(2 m x)
$ <eq:theory-bloch-uq-fourier-series>

with the integer index $m$ counting from $-infinity$ to $+infinity$.
With $k dot a = pi$, the translation $x -> x + a$ will only shift the phase of each term in the Fourier series by $2 pi m$, leaving the functions $u_q (x)$ invariant.
In the next step, we will also express the potential $V(x)$ as a Fourier series.
The coefficients $c_m$ are revealed by rewriting $sin^2 x$ in terms of complex exponential functions.

$
  V(x) slash #unit[Erec] & = v_0 dot sin^2x \
  & = v_0 dot (1 / 2 - 1 / 2 cos(2 x)) \
  & = underbrace(1 / 2 v_0, c_0) med underbrace(- 1 / 4 v_0, c_(plus.minus 1)) (cexp(2 x) + ncexp(2 x))
$ <eq:theory-bloch-potential-fourier-series>

Instead of the sum of all $m in ZZ$, the Fourier series of the potential only requires the terms with $m = (-1, 0, 1)$.
While the coefficient $c_0$ is just a global energy offset, the coefficients $c_(plus.minus 1)$ result in a coupling of the coefficients $u_q^m$ in the Schrödinger equation.
With the Bloch waves @eq:theory-bloch-waves[] and the potential @eq:theory-bloch-potential-fourier-series[], the Schrödinger equation for each index $m$ is

$
  epsilon_n (q) u_q^m = ((q + 2 m)^2 + 1 / 2 v_0) u_q^m - 1 / 4 v_0 (u_q^(m-1) + u_q^(m+1))
$ <eq:theory-bloch-uq-schroedinger>

where $epsilon_n (q)$ are the eigenenergies with the band index $n$.
The sum over $m$ is eliminated by using the orthogonality of the complex exponential functions $cexp(2 m x)$.
To find the eigenenergies $epsilon_n (q)$ for a fixed quasimomentum $q$, we express @eq:theory-bloch-uq-schroedinger as a matrix where the rows and columns correspond to the index $m$.
The dimension of the matrix depends on the cutoff $abs(m) <= m_max$.
If the diagonal term $prop m_max^2$ is greater than the prefactor $1/4 v_0$ of the coupling term, the result will not be affected by a further increase of $m_max$.
The diagonalization of the matrix will reveal the eigenenergies $epsilon_n (q)$ and the eigenvector coefficients $u_q^m$ to compute the Bloch waves.
As a function of the quasimomentum $q$, the eigenenergies $epsilon_n (q)$ form energy bands with the band index starting from $n = 1$.
The Bloch waves $psi_q^n (x)$ are the corresponding eigenvectors of the Hamiltonian @eq:theory-bloch-hamiltonian.

In @fig:theory-bloch-energy-bands, the four lowest energy bands are shown with the corresponding Bloch waves at $q = 0$.
The lowest band with index $n = 1$ is deeply trapped in the optical lattice potential.
Therefore, the dispersion $epsilon_1 (q)$ is nearly constant and the Bloch wave shows maxima on the lattice sites and has a minimal amplitude inside the potential $V(x)$.
Both aspects show a similarity to the ground state of the harmonic oscillator.
In deeper lattices, this behavior is extended to excited bands and the corresponding excited states of the harmonic oscillator #tr[ref @fig:mod-intro-theory?].
For the lattice depth $V_0 = #qty[15][Erec]$, the band with index $n = 4$ is no longer trapped according to the condition $epsilon_n (q) > V_0$.
As a result, the dispersion $epsilon_n (q)$ and the Bloch wave $psi_(q=0)^n (x)$ resemble a free particle with momentum $p$.
At $q = 0$, the band gap to the fifth band is already closed, and the Bloch wave only changes slightly at the positions of the potential maxima.
This behavior can be found in all energy bands that are not trapped inside the potential anymore.
In the intermediate regime, the bands with indices $n = 2$ and $n = 3$ have a finite band width $Delta epsilon_n (q)$ and Bloch waves that still follow the shape of the potential $V(x)$.
#tr[Anything else to add?]

#floating-figure(
  image("figures/theory_band_structure.png"),
  caption: [
    Band structure of an optical lattice with a depth of $V_0 = #qty[15][Erec]$.
    In *a*, the four lowest energy bands $epsilon_n (q)$ are shown in the first Brillouin zone $q slash k = [-1, 1)$.
    The band with index $n = 1$ has a width of only $Delta epsilon_1 approx #qty[0.026][Erec]$ and therefore appears to be flat.
    The higher bands show finite band widths that are increasing with the index $n$.
    In *b*, the band energies and the Bloch waves $psi_(q=0)^n (x)$ are shown in relation to the potential $V(x)$.
    The offsets for the Bloch waves are the corresponding energies $epsilon_n (q = 0)$, and the solid (dashed) lines indicate the real (imaginary) parts.
    The parity of the Bloch waves alternates with the band index $n$ according to $cal(P) = (-1)^(n-1)$.
    For the lowest band $n = 1$, the Bloch wave on a single site looks like the ground state of the harmonic- oscillator potential.
    With an increasing band index $n$, the Bloch waves are further delocalized until they approach plane waves $phi.alt(x) prop cexp(p x slash phy.hbar)$ describing a free particle with the momentum $p$.
    Correspondingly, the band gaps are getting smaller until the energy bands show the dispersion $epsilon = p^2 / (2 m)$ of a free particle mapped onto the first Brillouin zone.

    #notes[
      - Add harmonic oscillator ground state here for $n = 1$?
      - Add free-particle wave for $n = 4$?
      - Plot the bottom of the band $n = 5$ in *a* to show the closed band gap?
      - Mention that the amplitude/scale of the Bloch waves is "arbitrary"?
    ]
  ],
  label: <fig:theory-bloch-energy-bands>,
)
