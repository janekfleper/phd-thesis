#import "/header.typ": *
#import "figures/figures.typ": lattice-configurations, lattice-detuning

== Atom-light interaction and optical lattices <sec:theory-dipole>

The interaction of atoms with far-detuned light enables the creation of optical dipole traps that play an essential role in quantum gas experiments.
In this section, I will present the essential quantities to describe optical dipole potentials based on the review @grimm_optical_2000.
If an atom is exposed to light with the intensity $I prop abs(phy.vb(E))^2$, the electric field $phy.vb(E)$ induces an oscillating dipole moment $phy.vb(p) = alpha(omega) phy.vb(E)$ in the atom.
The oscillation frequency of the dipole moment is equal to the driving frequency $omega = 2 pi c slash lambda$, where $c$ is the speed of light and $lambda$ is the wavelength of the light.
The amplitude and phase of the dipole moment relative to the electric field are characterized by the complex polarizability $alpha(omega)$.
The in-phase component of the dipole moment $phy.vb(p)$ relative to the electric field $phy.vb(E)$ results in the dipole potential $Udip prop "Re"(alpha)$, while the out-of-phase component results in the scattering rate $Gsc prop "Im"(alpha)$.

In the Lorentz model, the atom-light interaction is described by a driven harmonic oscillator with the eigenfrequency $omega_0$ and the damping rate $Gamma$.
While this is a classical model, it correctly predicts the polarizability $alpha(omega)$ as long as the scattering rate is small compared to the damping rate $Gsc << Gamma$.
The resulting expressions for the dipole potential and the scattering rate are

$
  Udip (phy.vb(r)) prop Gamma / Delta I(phy.vb(r)) quad "and"
  quad Gsc (phy.vb(r)) prop (Gamma / Delta)^2 I(phy.vb(r)) eqc
$ <eq:theory-dipole-terms>

where $Delta = omega - omega_0$ is the detuning of the driving frequency relative to the eigenfrequency of the oscillator.
In the quantum-mechanical model, the eigenfrequency corresponds to the transition frequency between the ground state and the excited state#footnote[
  This is a simplified model that only considers a two-level atom. In general, the total dipole potential is computed as the weighted sum of all available transitions to excited states.
].
The scaling of the dipole potential and the scattering rate in @eq:theory-dipole-terms[] with $Delta$ shows that a large detuning and a high intensity are optimal for optical dipole potentials with a minimal scattering rate #Gsc.
Whether the dipole potential #Udip is attractive or repulsive depends on the sign of the detuning $Delta$.
Light with $Delta < 0$ is called red detuned and attracts the atoms to the maximum of the intensity $I(phy.vb(r))$.
Conversely, light with $Delta > 0$ is called blue detuned and repels the atoms.

The dipole potential $Udip(phy.vb(r))$ can be applied to regular optical dipole traps as well as optical lattices.
In the former case, a red-detuned laser beam is commonly used to create a confining potential.
If the beam has a Gaussian intensity profile, the atoms are attracted radially towards the optical axis.
A blue-detuned Gaussian laser beam cannot be used to trap atoms, it can however be used to locally modify existing potentials.
Regardless of the detuning, the dipole potential is proportional to the intensity envelope $I(phy.vb(r)) prop abs(phy.vb(E(phy.vb(r))))^2$.
The electric field of a Gaussian beam close to the focal position can be written as

$
  phy.vb(E)(phy.vb(r), t) =
  phy.vb(E)_0 exp(-rho^2 / w_0^2) exp lr((i (omega t - phy.vb(k) dot phy.vb(r))), size: #150%) eqc
$ <eq:theory-dipole-gaussian>

where $rho$ is the radial distance from the optical axis and $w_0$ is the beam waist @saleh_fundamentals_2019.
The vector $phy.vb(E)_0 = E_0 phy.vu(x)$ characterizes the amplitude $E_0$ and the polarization $phy.vu(x)$ of the electric field.
In a coordinate system where the beam propagates along the #z-axis, the simplified expression for the electric field assumes $abs(z) << z_R$ with the Rayleigh length $z_R = pi w_0^2 slash lambda$.
In this approximation, we use the beam waist $w_0 = w(0)$ instead of the beam radius $w(z)$, and we omit the radius of curvature $R(z)$ as well as the Gouy phase $psi(z)$ from the complex exponential function.
Then, only the radial exponential function remains from the additional properties of a Gaussian beam compared to a plane wave.

The spatial period of the electric field $phy.vb(E)$ defined by the wavevector $phy.vb(k)$ cannot be resolved in a running-wave potential.
However, this property is essential for the creation of optical lattice potentials by interfering multiple laser beams.
The interference pattern of two laser beams with equal vectors $phy.vb(E)_0$ and equal frequencies $omega$ is

$
  I(phy.vb(r)) =
  2 abs(phy.vb(E)_0)^2 lr((1 + cos((phy.vb(k)_2 - phy.vb(k)_1) dot phy.vb(r))), size: #150%) eqc
$ <eq:theory-lattice-intensity>

where $phy.vb(k)_1$ and $phy.vb(k)_2$ are the wavevectors of the two beams @hecht_optics_2016.
The time-dependence of the electric field @eq:theory-dipole-gaussian[] is averaged out when computing the intensity of the total electric field#footnote[
  If the two beams had different frequencies, the interference term would oscillate at the frequency $omega_2 - omega_1$.
].
If the local intensity of the interfering beams is not equal, a running-wave term is added to @eq:theory-lattice-intensity.
This term does not affect the microscopic properties of the interference pattern, just like the Gaussian envelope of the individual beams.
Therefore, both contributions are omitted here for the derivation of the optical lattice potential.
The interference term in @eq:theory-lattice-intensity describes a spatial oscillation defined by the vector $Delta phy.vb(k) = k2 - k1$.
The corresponding period $a = pi slash abs(Delta phy.vb(k))$ depends on the magnitude $abs(phy.vb(k))$ of the wavevectors#footnote[
  Since the beams have equal frequencies $omega$, the magnitudes of the wavevectors are also equal.
] as well as the angle between the two interfering beams.
If the two beams are counterpropagating, their wavevectors are related by $phy.vb(k)_2 = -phy.vb(k)_1$ and the magnitude of the interference vector is $abs(Delta phy.vb(k)) = 2 abs(phy.vb(k))$.
The resulting period is $a = lambda slash 2$, where $lambda = 2 pi slash abs(phy.vb(k))$ is the wavelength of the interfering beams.
For a general intersection angle $2 dot anglez$ between the wavevectors #k1 and #k2, the expression for the period is

$
  a = lambda / (2 sin anglez) eqp
$ <eq:theory-lattice-period>

At $anglez = 90degree$, the counterpropagating case with $a = lambda slash 2$ is recovered, which is also the minimum of the period $a$ for a fixed wavelength $lambda$.
@fig:theory-lattice-intersection-angle illustrates the change of the lattice period in a shallow-angle configuration compared to the counterpropagating configuration where $k2 = -k1$.

#floating-figure(
  lattice-configurations(),
  caption: [
    Interference period based on the angle of intersection.
    The configuration on the left shows the interference of two counterpropagating beams with $k2 = - k1$.
    The resulting interference pattern is parallel to the two wavevectors with the period $a = lambda slash 2$.
    In the shallow-angle configuration on the right, the vector $Delta phy.vb(k)$ points in the vertical direction.
    The parallel components of #k1 and #k2 do not contribute to the interference pattern, resulting in a larger lattice period $a$.
  ],
  label: <fig:theory-lattice-intersection-angle>,
)

In the context of trapping atoms with light, an interference pattern is referred to as an optical lattice.
The optical lattice potential can be computed directly from the dipole potential in @eq:theory-dipole-terms and the interference pattern in @eq:theory-lattice-intensity.
In a coordinate system where $Delta phy.vb(k) || phy.vu(x)$, the optical lattice potential can be written as

$
  V(x) = V0 dot sin^2(k x)
$ <eq:theory-lattice-potential>

with the lattice depth #V0 and the lattice vector $k = abs(Delta phy.vb(k)) = pi slash a$.
The lattice depth takes the intensity $I(0) = abs(phy.vb(E)_0)^2$, the detuning $Delta$ and the other parameters of the atom-light interaction into account.
This expression for the optical lattice potential can be used for red-detuned light as well as blue-detuned light.
The practical difference between the two detunings is the location where the atoms are trapped (see @fig:theory-lattice-detuning).
In a red-detuned optical lattice, the atoms are attracted by the intensity maxima of the interference pattern.
On the other hand, the atoms are trapped in the intensity minima of a blue-detuned optical lattice.
In the direction of the lattice vector $Delta phy.vb(k)$, the two potentials, therefore, only differ by the energy offset #V0.
The relevant differences between the two detunings can be found in the scattering rate and the radial potential.
The scattering rate in @eq:theory-dipole-terms is maximal (minimal) if the lattice is red (blue) detuned.
A blue-detuned lattice can therefore be used to minimize the loss or heating of the atoms due to the scattering rate.
The radial potential of an optical lattice depends on the Gaussian envelope introduced in @eq:theory-dipole-gaussian.
In a red-detuned optical lattice, the radial potential is always confining, while it is deconfining in a blue-detuned optical lattice @greiner_ultracold_2003.
The radial potential is relevant for the trapping of atoms in a three-dimensional optical lattice.
In @sec:mod-radial, I will discuss this further in the context of the in-plane superlattice.

#floating-figure(
  lattice-detuning(xscale: 2.4, depth: 2.5),
  caption: [
    Trapping atoms in an optical lattice potential.
    Both optical lattices have the same lattice depth #V0 and lattice period $a$ according to @eq:theory-lattice-potential.
    The red-detuned optical lattice traps the atoms at the maxima of the intensity, while the blue-detuned lattice traps the atoms at the minima of the intensity.
  ],
  label: <fig:theory-lattice-detuning>,
  placement: bottom,
)
