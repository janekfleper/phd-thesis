#import "/header.typ": *
#import "figures/radial.typ": figure as figure-radial
#import "figures/radial_result/figure.typ": figure as figure-result

== Radial potential of a bichromatic superlattice <sec:mod-radial>

The local lattice depth #V0 determines the band structure along the lattice axis, which in turn governs the tunneling amplitude of the atoms in an optical lattice.
On the other hand, the radial potential describes the potential perpendicular to the lattice axis due to the Gaussian envelope of the underlying lattice beams.
While the radial potential does not affect the dynamics along the lattice axis, it is significant for the confinement of the atoms in an optical lattice.

The radial potential depends on the local intensity and the zero-point energy @greiner_ultracold_2003.
The two contributions can be expressed in terms of the Gaussian lattice profile $v(rho) = v0 dot exp(-2 rho^2 slash w_0^2)$ perpendicular to the lattice axis.
In a red-detuned optical lattice, the radial potential is

$
  vrad(rho) = Vrad(rho) slash #unit[Erec] = underbrace(- (1 + R) dot v(rho), "local intensity") + underbrace(sqrt(v(rho)), "zero point")
$ <eq:mod-radial-potential-red>

where $R$ is the running-wave coefficient due to the intensity imbalance between the interfering lattice beams @miller_ultracold_2016.
In the in-plane lattices, we find the intensity of the #retro beam to be reduced to $I_"retro" = gamma dot I_"forward"$.
The running-wave coefficient is defined as

$
  R = (1 - sqrt(gamma))^2 / (4 sqrt(gamma)) med ,
$ <eq:mod-radial-running-wave>

which becomes $R = 0$ in an optical lattice without a power imbalance ($gamma = 1$).
Just like the standing-wave component of the optical lattice, the running-wave component is proportional to the lattice depth $v(rho)$.
In a blue-detuned optical lattice, the first term in @eq:mod-radial-potential-red reduces to $+ R dot v(rho)$.
The standing-wave component does not contribute to the local intensity since the atoms are trapped in the minima of the intensity (compare @fig:theory-lattice-detuning), and the running-wave component is repulsive due to the blue detuning.

Regardless of the detuning, the zero-point energy results in a repulsive contribution to the radial potential.
This term can be understood by approximating the lattice sites as a harmonic oscillator potential.
The energy of the ground state in the harmonic oscillator is $1 / 2 phy.hbar omega prop sqrt(v(rho))$, which is always reduced with the radius $rho$ in an optical lattice with a Gaussian beam profile.

In a bichromatic superlattice, the radial potential is composed of the local-intensity terms for each lattice and a shared term for the zero-point energy.
Since the superlattice phase affects the local intensity of the individual lattices at the positions of the atoms, the radial potential of an optical superlattice is, generally, not equal to the sum of the radial potentials of the individual lattices.
Instead, we compute the positions of the atoms using the maximally-localized Wannier functions (see @ssec:theory-super-wannier).
Additionally, the on-site energy computed with the BPO formalism directly shows the variation of the zero-point energy#footnote[
  The zero-point energy and the atom positions can also be computed by approximating the two sites in each double well with harmonic oscillator potentials.
  However, the BPO formalism allows states that are delocalized over the double wells.
  The harmonic approximation of the individual lattice sites, on the other hand, only yields states that are localized to the corresponding lattice sites.
].
From the dimensionless superlattice potential @eq:theory-super-potential-dimensionless[] we derive the local-intensity term of the radial potential

$
  v(x, rho) = 4 vs (rho) [Rs + cos^2(2x)] - vl (rho) [Rl + cos^2(x - phase)]
$ <eq:mod-radial-potential-local>

with the running-wave coefficients $R_s$ and $R_l$ of the short and long lattice, respectively.
In general, the position $x$ of the atoms along the lattice axis is determined by the short lattice, while the long lattice potential applies a small correction of the position depending on the superlattice phase.
In the antisymmetric configuration ($phase = plus.minus pi slash 4$) the atom position#footnote[
  The dimensionless lattice periods used in @eq:mod-radial-potential-local are $ashort = 2 pi$ and $along = pi$, respectively.
] is $x mod 1 = pi slash 4$, which simplifies @eq:mod-radial-potential-local to

$
  v^plus.minus (rho) = 4 vs (rho) Rs - vl (rho) [Rl + cos^2(pi slash 4 plus.minus pi slash 4)] med ,
$ <eq:mod-radial-potential-local-antisymmetric>

where only the running-wave component of the short lattice contributes.
The standing-wave component of the long lattice is either $0$ or $1$, depending on the specific antisymmetric phase.
In the configuration $v^plus (rho)$, the potentials of the individual lattices are effectively added such that their minima coincide at the position $x = 0$.
As a result, the intensity of the long lattice is maximal and we find the strongest confinement along the lattice axis.
On the other hand, the configuration $v^minus (rho)$ shows the lattice site where the long lattice potential is subtracted from the short lattice potential, leaving the intensity of the long lattice and the confinement along the lattice axis minimal.
Both configurations $v^plus.minus (rho)$ are illustrated in @fig:mod-radial-vplus-vminus.

To determine the zero-point energy in the antisymmetric superlattice potential, we expand the potential @eq:mod-radial-potential-local[] around $x = pi slash 4$ up to the order $x^2$.
The harmonic approximation is valid unless $vl (rho) >> vs (rho)$ where the lattice site corresponding to the potential $v^minus (rho)$ does not show a minimum anymore.
In units of the recoil energy #unit[Erec], the zero-point energy amounts to

$
  epsilon_0^plus.minus = sqrt(16 vs (rho) plus.minus vl (rho)) med .
$ <eq:mod-radial-zero-point>

The prefactor $4 dot 4 = 16$ of the lattice depths is composed of the ratios between the recoil energies and the squared lattice periods of the short and long lattice, respectively.
Combining @eq:mod-radial-potential-local-antisymmetric and @eq:mod-radial-zero-point, the radial potential of the antisymmetric superlattice is

$
  vrad^plus.minus (rho) =
  4 vs (rho) Rs
  - vl (rho) [Rl + (1 plus.minus 1) slash 2]
  + sqrt(16 vs (rho) plus.minus vl (rho)) med ,
$ <eq:mod-radial-potential-antisymmetric>

where the contributions by the first and last term are deconfining.
Only the local intensity of the long lattice results in a confining radial potential.
Therefore, the radial potential $vrad^plus (rho)$ is typically confining, whereas the radial potential $vrad^minus (rho)$ is anticonfining.
For any superlattice phase $-pi slash 4 < phase < pi slash 4$, we need to determine the atom position $phy.expval(x)$ and the radial potential numerically through the BPO formalism for the maximally-localized Wannier fucntions.

#floating-figure(
  figure-radial(),
  caption: [
    Radial potential in an antisymmetric superlattice configuration.
    *a*, Superlattice potential $v^+$ of the lower lattice site in the double well where the intensity of the long lattice is maximal.
    *b*, Superlattice potential $v^-$ of the upper lattice site where the intensity of both lattices is minimal.

    // TODO: Merge this into one figure? And then reference the "lower" and "upper" well?
    // TODO: Add an atom to the lattice site? Just like in fig:theory-lattice-detuning?
  ],
  label: <fig:mod-radial-vplus-vminus>,
  // placement: bottom,
)

=== Measuring the radial trap frequency <ssec:mod-radial-measure>

We measure the radial potential of the in-plane superlattice by exciting a dipole oscillation of the atom cloud along the #y-axis.
The #y1064 lattice is used as an optical dipole trap by blocking the #retro beam, and the dipole oscillation is induced with a magnetic field gradient $phy.pdv(B_z, y, style: "horizontal")$ that applies a kick to the atom cloud @wurz_quantum_2021.
We load the atom cloud into the optical lattices according to the experimental sequence in @fig:setup-sequence, and we prepare a spin-polarized atom cloud as introduced in @sec:mod-intro.
The #z532 lattice is frozen#footnote[
  We can neglect the contribution by the #z532 lattice to the radial potential along the #y-axis.
  This is not the case for the #x-axis where the deconfinement by the #z532 lattice has to be taken into account when calibrating the radial potential of the #y1064 lattice.
] and the in-plane lattices are set to the target configuration we want to study.
This measurement technique can only be used for the calibration of confining radial potentials.
In the case of a bichromatic superlattice this is a significant limitation since we expect the radial potential to become deconfining between the two configurations $phase = -pi slash 4$ and $phase = +pi slash 4$.

#floating-figure(
  figure-result(),
  caption: [
    The radial potential of a bichromatic superlattice.
    *a*, Measured radial trap frequencies in the lowest band as a function of the superlattice phase #phase (legend).
    The #x1064\-lattice depth is set to $Vx1064 = #qty[15][Erec]$.
    The inset shows the positions of the atom cloud during the oscillation time $tau$, and the solid line indicates the fit to extract the frequency $f$.
    At $phase = 0$ and $Vx532 = #qty[6][Erec]$, the signal is already too weak for an evaluation of the oscillation frequency.
    The shaded areas show the theoretical trap frequencies computed from the fitted waists #wx1064 and #wx532.
    *b*, Radial trap frequency in the lowest band of the symmetric configuration $phase = 0$.
    The real trap frequencies (red) indicate a radial potential that is confining, while the imaginary trap frequencies (trap) indicate an anticonfining potential.
  ],
  label: <fig:mod-radial-result>,
)

In #subref(<fig:mod-radial-result>, "a"), we measure the radial trap frequency in the bichromatic superlattice while varying the #x532\-lattice depth #Vx532 and the superlattice phase #phase.
For each oscillation time $tau$, we determine the center-of-mass of the atom cloud to obtain the signal $y(tau)$.
We extract the oscillation frequency $f$ from the signals by fitting an oscillation function with an exponential decay.
Then, we fit the oscillation frequencies $f$ by computing the radial potential as a function of the parameters #Vx1064, #Vx532, #wx1064 and #wx532.
With this fit, we find the beam waists

$
  wx1064 = #qty[138.4(7)][μm] quad "and" quad wx532 = #qty[119.0(11)][μm] med ,
$ <eq:mod-radial-result>

which are in agreement with the results obtained using the in-situ #lms (compare @tab:mod-super-result).
In general, measuring the beam waists through the radial trap frequencies has a higher precision compared to the in-situ #lms.
However, the trap-frequency measurement takes significantly longer since it requires a resolution of the oscillation signal $y(tau)$ for several lattice configurations.
Additionally, the trap frequencies depend on the power ratios $gamma_x1064 approx 0.84$ and $gamma_x532 approx 0.74$ that have to be measured separately to obtain the correct beam waists.

Understanding the individual contributions to the radial potential of a bichromatic superlattice is essential for working in a two-dimensional system where the atoms can tunnel perpendicular to the superlattice potential.
While the sensitivity of the radial potential to the lattice depths #Vx1064 and #Vx532 is similar to the radial potential of monochromatic optical lattices, the strong sensitivity around the symmetric superlattice phase ($phase = 0$) restricts possible measurements in two-dimensional systems.
As will be shown in @ch:phase, the superlattice phase is commonly tuned from the antisymmetric configuration ($phase = - pi slash 4$) to the symmetric one when preparing and detecting states in the superlattice.
If the tunneling of the atoms perpendicular to the superlattice is not frozen, each change of the superlattice phase affects the confinement of the atoms which, in turn, results in heating of the atoms.
Depending on the superlattice parameters #Vx1064 and #Vx532, the radial potential around the symmetric configuration is deconfining and the atoms are lost from the optical lattices.
This is illustrated in #subref(<fig:mod-radial-result>, "b") for the typical regime of superlattice parameters used in this thesis.
An imaginary trap frequency indicates a deconfining potential since $Vrad prop f^2 y^2$.
In conclusion, using a bichromatic superlattice in a two-dimensional system requires extra attention to avoid heating and loss of atoms due to the radial potential.
If the confinement needs to be conserved throughout the measurements, using additional dipole potentials to compensate the variation due to the superlattice potential is imperative.
