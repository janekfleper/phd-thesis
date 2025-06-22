#import "/header.typ": *

== Dipole potential and optical lattices <sec:theory-dipole>

Far off-resonant light can still interact with atoms.
Depending on the detuning of the angular frequency of the light $omega$ and the transition energy $phy.hbar omega_0$, the sign of the interaction changes.
If $omega < omega_0$, the light is referred to as _red-detuned_ and the interaction is attractive.
Conversely if $omega > omega_0$, the light is referred to as _blue-detuned_ and the interaction is repulsive.
See @fig:theory-dipole-detuning-gauss for a sketch of the atom-light interaction for a gaussian beam.

#figure(
  image("figures/optical-potential-detuning.png", width: 80%),
  caption: [
    Illustration of the effect of the detuning $Delta = omega - omega_0$ between a gaussian beam and atoms.
    If the light is red-detuned, the atoms are pulled towards the intensity maximum of the gaussian beam.
  ],
) <fig:theory-dipole-detuning-gauss>

#text(red)[Add something about the scattering rate...]

The electric field of a plane optical wave propagating in the direction of the wavevector $phy.vb(k)$ is given by the expression

$
  phy.vb(E)(phy.vb(r), t) =
  phy.vb(E)_0 cos(phy.vb(k) dot phy.vb(r) - omega t)
$ <eq:theory-dipole-electric-field>

While a laser beam also has a transversal component, it is sufficient to look at the component along the propagation axis to understand the origin of the optical lattice potential.
When two (plane) waves are overlapped, they will interfere if they have electric field components with the same polarization which is encoded in the field amplitude $phy.vb(E)_0$.
If we assume that the two waves have the same field amplitude (absolute and direction) and the same (angular) frequency $omega$, the intensity of the interference pattern is given by

$
  I(phy.vb(r)) =
  abs(phy.vb(E)_0)^2 (1 + cos((phy.vb(k)_2 - phy.vb(k)_1) dot phy.vb(r)))
$ <eq:theory-lattice-intensity>

where $phy.vb(k)_1$ and $phy.vb(k)_2$ are the wavevectors of the respective plane waves.
The time-dependence of the interference term is averaged out since it oscillates at the (angular) frequency of the electric field $omega$ which is not observable for wavelengths in the optical regime.
If the two plane waves had (slightly) different oscillation frequencies, the interference term would (also) oscillate at the frequency $omega_2 - omega_1$ which can not be averaged out in all cases.

According to @eq:theory-lattice-intensity the interference pattern is described by the (vector) difference $Delta phy.vb(k) = phy.vb(k)_2 - phy.vb(k)_1$.
// Due to the scalar product of $Delta phy.vb(k)$ and the position vector $phy.vb(r)$, the interference pattern will evolve in the direction of $Delta phy.vb(k)$.
The (spatial) period $a$ of the interference pattern therefore depends on the angle between the two wavevectors.
If the waves are counter propagating, the wavevectors are related by the equation $phy.vb(k)_2 = - phy.vb(k)_1$ and the absolute of the interference wavevector will be $abs(Delta phy.vb(k)) = 2k$.
In that case the (spatial) period will be $a = pi / k = lambda / 2$ where $lambda$ is the wavelength of the plane waves.
At an intersection angle of $2 alpha$ the period of the interference pattern increases according to

$
  a = lambda / (2 sin alpha)
$ <eq:theory-lattice-period>

In the case of the counterpropagating waves the angle $alpha$ is equal to $90 degree$, and the period simplifies to $a = lambda / 2$ again.
See @fig:theory-lattice-intersection-angle for an illustration of the change of the interference pattern based on the angle of intersection.

#figure(
  image("figures/optical-lattices-interference.png"),
  caption: [
    Interference of plane waves based on the angle of intersection.
    The wavelengths of the plane waves in the two examples are equal, as indicated by the equal lengths of the wavevectors!
    The sketch on the left shows two plane waves that are counterpropagating with $phy.vb(k)_2 = - phy.vb(k)_1$.
    The interference pattern will be parallel to the two wavevectors with the period $a = lambda / 2$.
    The sketch on the right shows two planes waves interfering at the angle $2 alpha$.
    The vector $Delta phy.vb(k)$ will point in the vertical direction since the parallel components of $phy.vb(k)_1$ and $phy.vb(k)_2$ do not contribute to the interference pattern.
    The period of the interference pattern will therefore be significantly larger than in the sketch on the left.
  ],
) <fig:theory-lattice-intersection-angle>


As introduced at the start of this section in @fig:theory-dipole-detuning-gauss, the detuning of the light creating the optical lattice will decide whether the potential is attractive or repulsive.
Due to its periodic nature, a blue-detuned optical lattice is still able to trap atoms in the direction of $Delta phy.vb(k)$.
The atoms will be trapped in the intensity minima.
In a red-detuned optical lattice the atoms will be trapped in the intensity maxima.
Regarding losses of the atoms due to scattering, the blue-detuned optical lattice has a clear advantage since the atoms are only subject to a very small amount of light.
If we disregard the scattering effects, the two possible potentials only differ by an energy offset equal to the lattice depth of the red-detuned lattice, as illustrated in @fig:theory-lattice-detuning.
The global energy offset will not affect the physics of the atoms in the lattices, and we can disregard this when looking at the eigensolutions in an optical lattice potential.

#figure(
  image("figures/optical-lattices-detuning.png"),
  caption: [
    Illustration of the trapping of atoms in optical lattices with different detuning.
    The plot on the left shows the optical dipole potential of a red-detuned optical lattice with the depth $V_0$ and the period $a$.
    The atoms are trapped at the maxima of the intensity.
    For a blue-detuned lattice as shown in the plot on the right, the atoms are trapped at the minima of the intensity.
  ],
) <fig:theory-lattice-detuning>

The common choice for the optical lattice potential is to set the potential minimum to zero such that the amplitude of the potential is always positive.
We are also going to choose the coordinate system such that the vector $Delta phy.vb(k)$ points along the x-axis, turning this into a one-dimensional problem.

$
  V(x) = V_0 dot sin^2(k x)
$ <eq:theory-lattice-potential>

The amplitude $V_0$ is also called _lattice depth_, and the wave vector is $k = (2 pi) / lambda$ where $lambda$ is the wavelength of the light that is used to create the optical lattice.
The Hamiltonian to describe non-interacting particles in the potential @eq:theory-lattice-potential is

$
  accent(H, hat) = -phy.hbar^2 / (2m) phy.dv(, x, 2) + V(x)
$ <eq:theory-lattice-hamiltonian>

To further simplify the Hamiltonian @eq:theory-lattice-hamiltonian we are going to introduce dimensionless coordinates $x -> x slash k$.
Since $1 slash k$ or rather $a = pi slash k$ is the characteristic length scale of the system, it makes sense to compute everything in relative coordinates.

$
  accent(H, hat)
  = -(phy.hbar^2 k^2) / (2m) phy.dv(, x, 2) + V_0 dot sin^2 x
$ <eq:theory-lattice-hamiltonian-dimensionless-x>

There is also a characteristic energy scale that can be used to make the entire Hamiltonian dimensionless.
The prefactor of the kinetic term in @eq:theory-lattice-hamiltonian-dimensionless-x is called _recoil energy_ #unit[Erec] since it is the kinetic energy transferred to an atom during the absorption or emission of a single photon with the wave vector $k$.
Dividing the RHS of @eq:theory-lattice-hamiltonian-dimensionless-x by the recoil energy #unit[Erec] yields the dimensionless Hamiltonian

$
  accent(h, hat)
  = accent(H, hat) / #unit[Erec]
  = - phy.dv(, x, 2) + v_0 dot sin^2 x
$ <eq:theory-lattice-hamiltonian-dimensionless-xy>

with $#unit[Erec] = (phy.hbar^2 k^2) / (2m)$ and $v_0 = V_0 / #unit[Erec]$.
