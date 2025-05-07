#import "/header.typ": *

== Radial potential <sec:super-radial>

#[
  #set text(red)
  - Introduce the running-wave component before this section/chapter? Maybe in the setup section in this chapter?
  - Where should the actual values for the running-wave components be mentioned?
  - Find a good letter for the radial potential!
  - Move the long calculation for the general case to the appendix.
  - Just expand around $x_0 = 0$ at the end? Does the "guess" really matter?
  - Do a proper comparison of BPO position and harmonic approximation.
]

While we are only using the x-superlattice for one-dimensional systems with a frozen y1064-lattice in this thesis, it is still interesting to investigate the "radial" properties of the x-superlattice.
This has important implications on the usability of the x-superlattice in a two-dimensional system where the y1064-lattice is no longer frozen.
The "radial" potential is directly caused by the gaussian envelope of the lattice beams.
In monochromatic lattices the different contributions have long been understood #text(red)[ref Luke + Greiner].
We have used this theory in the past to calibrate/measure the confinement for the two-dimensional Hubbard model.
By measuring the trap frequencies along the x-axis and the y-axis (with the corresponding lattice turned off) we could measure the waists of the lattice beams #text(red)[ref Nicola + Marcell or already Luke + Eugenio?].

The (bichromatic) superlattice potential makes the computation of the radial confinement/potential a lot more complex.
There are three parameters $v_l$, $v_s$ and $phi$ to characterize the potential and there are two different detunings since the short lattice is blue-detuned and the long lattice is red-detuned.
This has significant implications on the radial potential compared to monochromatic lattices that are either blue-detuned or red-detuned.
Just using the "naive" sum of the two individual lattices will yield a (completely) wrong result.

The monochromatic theory breaks the radial confinement down into two terms, the local intensity/depth and the zero-point energy.
In a red-detuned lattice the former term will be dominant since the local intensity is the sum of the actual lattice potential and the running-wave component.
In a blue-detuned lattice on the other hand the local intensity will only be caused by the running-wave component.
Because of the detuning the first term will be confining or anticonfining for red-detuned or blue-detuned lattices respectively.
The zero-point energy can be described by the reduction of the trap frequencies of the lattice sites due to the decrease of the intensity/depth.
This term is therefore anticonfining regardless of the detuning of the lattice.

To derive the radial confinement/potential of a (bichromatic) superlattice we will also begin by introducing the running-wave components $R_s$ and $R_l$ into the (dimensionless) potential @eq:theory-super-potential-dimensionless.
The lattice depths $v_s (rho)$ and $v_l (rho)$ are also included as a function of the (horizontal) radius $rho$ in the $x y$-plane.

$
  v(x, rho) = 4 v_s (rho) [R_s + cos^2(2x)] - v_l (rho) [R_l + cos^2(x + phi)]
$ <eq:super-radial-potential>

Since the atoms are only occupying a few vertical lattices planes, the change of the lattice depths along the $z$-axis can be neglected for the radial confinement/potential #text(red)[should this be a footnote?]
The running-wave component depends on the intensity imbalance between the interfering beams.
In a retro-reflected lattice configuration we can express this as $I_"retro" = gamma dot I_"forward"$ where the intensity of the retro-propagating beam is reduced due to losses in the retro-path.

$
  R = (1 - sqrt(gamma))^2 / (4 sqrt(gamma))
$ <eq:super-radial-running-wave>

Without losses the coefficient $gamma$ would be $1$ and the running-wave component would be $R = 0$ since all the intensity of the (interfering) beams contributes to the interference term.
@eq:super-radial-potential will then simplify/reduce to the "theoretical" form @eq:theory-super-potential-dimensionless.

#figure(
  image("../../figures/radial_potential_vplus_vminus.png", width: 70%),
  caption: [
    Simple phase configurations for the radial potential.
    The figure on the left shows the potential $v_+$ where the confinement of the long lattice and the short lattice is effectively "added".
    The figure on the right shows the potential $v_-$ where the confinement of the long lattice is effectively "subtracted" from the confinement of the short lattice.
    - #text(red)[Merge this into one figure? And then reference the "lower" and "upper" well?]
  ],
) <fig:super-radial-vplus-vminus>

#text(red)[
  Directly combine the contributing terms with the expansion @eq:super-radial-plus-taylor? The constant term in that expression is just @eq:super-radial-plus-local...
]
To understand the implications of the superlattice potential on the radial potential we will first look at the two special cases where the local potential is either the sum or the difference of the individual lattices, see @fig:super-radial-vplus-vminus.
Both cases require the antisymmetric superlattice configuration (as introduced in) @fig:theory-super-potential-phase with the phase $phi = +pi \/ 4$.
The "lower" well in that case is located at $x = -pi \/ 4$, simplifying @eq:super-radial-potential to

$
  v(rho) &=
  4 v_s (rho) \[R_s + underbrace(cos^2(pi \/ 2), 0)\]
  - v_l (rho) \[R_l + underbrace(cos^2(pi \/ 4 - pi \/ 4), 1)\] \
  &= underbrace(4 v_s (rho) R_s, "deconfining") - underbrace(v_l (rho) [R_l + 1], "confining")
$ <eq:super-radial-plus-local>

Unless $R_s$ is really large or $v_s (rho) >> v_l (rho)$, the "local" potential term will be confining because the atoms are located at the intensity maxima of the red-detuned (long) lattice.
#text(red)[cite Miller + Greiner here again?]
In addition to the local term we also have to consider the zero-point term which we have to compute from the harmonic oscillator approximation.
At $phi = +pi \/ 4$ we can directly expand the $cos^2$-terms around $x_0 = -pi \/ 4$ in @eq:super-radial-potential up to the quadratic order in the position $x$

$
  v(x, rho) =
  4 v_s (rho) & [R_s + 4(x - x_0)^2 + cal(O)(x - x_0)^4] \
  - v_l (rho) & [R_l + 1 - (x - x_0)^2 + cal(O)(x - x_0)^4]
$ <eq:super-radial-plus-taylor>

Only the quadratic terms are relevant for the comparison to the harmonic oscillator potential.
#text(red)[The constant terms are responsible for the "local" potential term.]
Write the harmonic oscillator potential in #text(red)[our convention] to find an expression for the zero-point energy $E_"ZP" = 1 / 2 phy.hbar omega$.

$
  V_"HO" (x) \/ #unit[Erec] &=
  1/2 m omega^2 x^2 \/ #unit[Erec] space.quad #text(red)[(plug in $(x -> x \/ k)$)] \
  &= 1/2 (m phy.hbar^2) / (k^2 phy.hbar^2) omega^2 x^2 \/ #unit[Erec] \
  &= 1/4 (phy.hbar^2 omega^2) / #unit[Erec^2] x^2
$ <eq:super-radial-harmonic-oscillator>

By comparing @eq:super-radial-harmonic-oscillator to the quadratic term in @eq:super-radial-plus-taylor we can find the relation

$
  1/4 (phy.hbar^2 omega^2) / #unit[Erec^2] &=
  16 v_s (rho) + v_l (rho) \
  <=> space.quad
  E_"ZP" = 1/2 phy.hbar omega &= sqrt(16 v_s (rho) + v_l (rho)) #unit[Erec]
$ <eq:super-radial-plus-zero-point>

Since the lattice depths $v_s (rho)$ and $v_l (rho)$ decrease with $rho$, the zero-point energy term will always be deconfining.
The total radial potential at $x = x_0$ (in the antisymmetric configuration) is then (effectively) the sum of the two invidiual lattices

$
  v_+ (rho) = 4 v_s (rho) R_s - v_l (rho) [R_l + 1] + sqrt(16 v_s (rho) + v_l (rho))
$ <eq:super-radial-plus>

Since the zero-point term only scales with the square root of the lattice depths, the confinement will be dominated by the local term.
The total radial potential $v_+ (rho)$ will therefore be confining unless $R_s$ is really large or $v_s (rho) >> v_l (rho)$, as already mentioned with @eq:super-radial-plus-local.

For the upper well at $x_0 = +phi \/ 4$ in the lattice configuration $phi = +phi \/ 4$ the total radial potential will (effectively) be the difference of the two individual lattices.

$
  v_- (rho) = 4 v_s (rho) R_s - v_l (rho) R_l + sqrt(16 v_s (rho) - v_l (rho))
$ <eq:super-radial-minus>

The local term only depends on the running-wave components now since the atoms are located at the intensity minima of both lattices.
In the zero-point term the sign of $v_l (rho)$ is flipped which will slightly reduce the effect of the term.
#text(red)[Should the next few sentences be a footnote?]
The expression inside the square root can now be negative if $v_l (rho) >> v_s (rho)$.
This would be a case where the upper well is no longer a potential minimum because the curvature of the long lattice is "stronger" than the curvature of the short lattice.
In that case discussing the radial confinement in the upper well is not necessary anymore since there is not even a longitudinal confinement available.
Due to the much larger prefactor of $v_s (rho)$ we never reached/used such a configuration with the superlattice in the work for this thesis.

The radial potential $v_- (rho)$ will be anticonfining in most cases because the short lattice now dominates.
Since both beams share the retro-path, we have similar running-wave components and the local term can already be anticonfining on its own.
The zero-point term will then only make the anticonfinement even stronger.

For all configurations between $v_+ (rho)$ and $v_- (rho)$ we have to compute the radial potential as a function of the phase $phi$.
Compared to the two special configurations the (mean) position of the atoms in/on the sites of the superlattice is slightly shifted from the intensity minima of the short lattice.
This shift has relevant implications on the local term and it will also be the position where we compute/evaluate the zero-point term.
To simplify the (full) Taylor expansion of @eq:super-radial-potential we are going to shift the $x$-axis such that a minimum of the short lattice is located at $x = 0$.
Since the radial potential is a single-well effect, this is just a much nicer frame of reference.
The positional shift $delta x$ will then just "be evaluated" relative to the origin.
Rewrite the potential @eq:super-radial-potential to introduce the shift by $a / 4 = pi / 4$ to the $x$-axis.
The variable $rho$ for the radius in the $x y$-plane is omitted for the sake of readability.

$
  v(x) &=
  4 v_s [R_s + cos^2(2x)] - v_l [R_l + cos^2(x + phi)] \
  &= 4 v_s [R_s + 1 / 2 + 1 / 2 cos(4x)] - v_l [R_l + 1 / 2 + 1 / 2 cos(2x + 2 phi)] \
  &std.text(std.red, attach(=, t: ?)) 4 v_s [R_s + 1 / 2 + 1 / 2 cos(4x - pi)] - v_l [R_l + 1 / 2 + 1 / 2 cos(2x - pi/2 +  2 phi)] \
  &= 4 v_s [R_s + 1 / 2 - 1 / 2 cos(4x)] - v_l [R_l + 1 / 2 + 1 / 2 sin(2x + 2 phi)] \
  &= 4 v_s (R_s + 1 / 2) - v_l (R_l + 1 / 2) - 2v_s cos(4x) - 1 / 2 v_l sin(2x + 2 phi)
$ <eq:super-radial-potential-shifted>

We expand the last/latter two terms around the minimum $x_0$ up to the third order of $(x - x_0)$ to find the potential shift $delta x$ and the quadratic coefficient/term for the harmonic oscillator energy.
For the radial potential $v_+ (rho)$ and $v_- (rho)$ the odd expansion orders vanished for both individual lattices, effectively only leaving the quadratic order.
This is no longer the case for the intermediate phases $phi = (-pi/4, pi/4)$.
Around the symmetric phase $phi = 0$ the odd expansion orders of the long lattice potential will even be the dominant ones since the atoms are located on the "slope" of the potential.

$
  cos(4x)|_(x = x_0) =
  &cos(4 x_0)
  - 4 sin(4 x_0) dot (x - x_0)
  - 8 cos(4 x_0) dot (x - x_0)^2 \
  &+ 32 / 3 sin(4 x_0) dot (x - x_0)^3
  + cal(O)(x - x_0)^4 \
  sin(2x + 2 phi)|_(x = x_0) =
  &sin(2 x_0 + 2 phi)
  + 2 cos(2 x_0 + 2 phi) dot (x - x_0) \
  &- 2 sin(2 x_0 + 2 phi) dot (x - x_0)^2
  - 4 / 3 cos(2 x_0 + 2 phi) dot (x - x_0)^3
  + cal(O)(x - x_0)^4
$ <eq:super-radial-potential-taylor-terms>

If we plug these expansions into the (shifted) potential @eq:super-radial-potential-shifted, we will get the full superlattice potential up to the third expansion order:

$
  v(x) &= a_0 + a_1 dot (x - x_0) + a_2 dot (x - x_0)^2 + a_3 dot (x - x_0)^3 + cal(O)(x - x_0)^4 \
  a_0 &= 4 v_s (R_s + 1 / 2 - 1 / 2 cos(4 x_0)) - v_l (R_l + 1 / 2 + 1 / 2 sin(2 x_0 + 2 phi)) \
  a_1 &= 8 v_s sin(4 x_0) - v_l cos(2 x_0 + 2 phi) \
  a_2 &= 16 v_s cos(4 x_0) + v_l sin(2 x_0 + 2 phi) \
  a_3 &= -64 / 3 v_s sin(4 x_0) + 2 / 3 v_l cos(2 x_0 + 2 phi)
$ <eq:super-radial-potential-taylor>

We can now find the minimum of the potential $v(x)$ to get the position/shift $delta x$ from the origin.
This shift will also be plugged into the polynomial coefficient $a_2$ to compute the harmonic oscillator approximation for the zero-point term.
Note that we recover the expression in @eq:super-radial-plus-zero-point for the coefficient $a_2$ with $delta x = 0$ and $phi = 0$.
Find the minimum of @eq:super-radial-potential-taylor by computing the root(s) of the derivative

$
  phy.pdv(, x) v(x) = a_1 + 2 a_2 dot (x - x_0) + 3 a_3 dot (x - x_0)^2 attach(=, t: !) 0
$ <eq:super-radial-potential-taylor-derivative>

When we select the real/actual/physical root for the possible superlattice configurations/phases, we obtain a piece-wise function for the shift $delta x$:

$
  delta x = cases(
    x_0 - a_2 / (3 a_3) - sqrt((a_2 / (3 a_3))^2 - a_1 / (3 a_3)) quad &"if" 0 <= |phi| < pi/4,
    x_0 &"if" |phi| = pi/4,
    x_0 - a_2 / (3 a_3) + sqrt((a_2 / (3 a_3))^2 - a_1 / (3 a_3)) quad &"if" pi/4 < |phi| < pi/2,
  )
$ <eq:super-radial-delta>

Per our convention for the superlattice potential @eq:theory-super-potential-dimensionless the phase $phi$ is defined $mod pi$.
#text(red)[How does this work here for the "upper" well then?]
