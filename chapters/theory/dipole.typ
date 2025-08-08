#import "/header.typ": *
#import "figures/figures.typ": lattice-configurations, lattice-detuning

== Atom-light interaction and optical lattices <sec:theory-dipole>

#notes[
  - Discuss hyperfine structure for the dipole force?
  - Really only show the electric field of the simplified Gaussian beam?
  - Already introduce the running-wave component in @eq:theory-lattice-intensity?
]

The interaction of atoms with far-detuned light enables the creation of optical dipole traps that play an essential role in quantum gas experiments.
In this section, I will present the essential quantities to describe optical dipole potentials based on the review @grimm_optical_2000.
If an atom is exposed to light with the intensity $I prop abs(phy.vb(E))^2$, the electric field $phy.vb(E)$ induces an oscillating dipole moment $phy.vb(p) = alpha(omega) phy.vb(E)$ in the atom.
The oscillation frequency of the dipole moment is equal to the driving frequency $omega = 2 pi c slash lambda$, where $c$ is the speed of light and $lambda$ is the wavelength of the light.
The amplitude and the phase of the dipole moment relative to the electric field are characterized by the complex polarizability $alpha(omega)$.
Despite being induced by the same electric field, the interaction of the dipole moment $phy.vb(p)$ and the electric field $phy.vb(E)$ is the origin of the dipole potential $U_"dip"$ and the scattering rate $Gamma_"sc"$.

In the Lorentz model, the atom-light interaction is described by a driven harmonic oscillator with the eigenfrequency $omega_0$ and the damping rate $Gamma$.
While this is a classical model, it correctly predicts the polarizability $alpha(omega)$ as long as the scattering rate is small compared to the damping rate $Gamma_"sc" << Gamma$.
The resulting expressions for the dipole potential and the scattering rate are

$
     U_"dip" (phy.vb(r)) & prop Gamma / Delta I(phy.vb(r)) \
  Gamma_"sc" (phy.vb(r)) & prop (Gamma / Delta)^2 I(phy.vb(r))
$ <eq:theory-dipole-terms>

where $Delta = omega - omega_0$ is the detuning of the driving frequency relative to the eigenfrequency of the oscillator.
In the quantum-mechanical model, the eigenfrequency corresponds to the transition frequency between the ground state and the excited state#footnote[
  This is a simplified model that only considers a two-level atom. In general, the total dipole potential is computed as the weighted sum of all available transitions to excited states.
].
The scaling with $Delta$ shows that using a large detuning and a high intensity is optimal for optical dipole potentials with a minimal scattering rate $Gamma_"sc"$.
The sign of the detuning $Delta$ decides whether the dipole potential in @eq:theory-dipole-terms[] is attractive or repulsive.
Light with $Delta < 0$ is called _red detuned_ and attracts the atoms to the maximum of the intensity $I(phy.vb(r))$.
Conversely, light with $Delta > 0$ is called _blue detuned_ and repels the atoms.

The dipole potential $U_"dip" (phy.vb(r))$ can be applied to regular optical dipole traps as well as optical lattices.
In the former case, a red-detuned laser beam is commonly used to create a confining potential for atoms.
If the beam has a Gaussian intensity profile, the atoms will be attracted radially towards the optical axis.
A blue-detuned Gaussian laser beam cannot be used to trap atoms, it can however be used to locally modify existing potentials.
Regardless of the detuning, the dipole potential is proportional to the intensity envelope $I(phy.vb(r)) prop abs(phy.vb(E(phy.vb(r))))^2$.
The electric field of a Gaussian beam close to the focal position can be written as

$
  phy.vb(E)(phy.vb(r), t) =
  phy.vb(E)_0 exp(-rho^2 / w_0^2) exp lr((i (omega t - phy.vb(k) dot phy.vb(r))), size: #150%)
$ <eq:theory-dipole-gaussian>

where $rho$ is the radial distance from the optical axis and $w_0$ is the beam waist @saleh_fundamentals_2019.
The vector $phy.vb(E)_0 = E_0 phy.vu(x)$ characterizes the amplitude $E_0$ of the electric field as well as the polarization $phy.vu(x)$.
If the beam propagates along the $z$ axis, the simplified expression for the electric field assumes $abs(z) << z_R$ with the Rayleigh length $z_R$.
In this approximation, we can use the beam waist $w_0 = w(0)$ instead of the beam radius $w(z)$, and we can omit the radius of curvature $R(z)$ as well as the Gouy phase $psi(z)$ from the complex exponential function.
Only the radial exponential function remains from the additional properties of a Gaussian beam compared to a plane wave.

The spatial periodicity of the electric field $phy.vb(E)$ defined by the wavevector $phy.vb(k)$ cannot be resolved in a running-wave potential.
However, this property is essential for the creation of optical lattice potentials by interfering multiple laser beams.
The interference pattern of two laser beams with equal vectors $phy.vb(E)_0$ and equal frequencies $omega$ is

$
  I(phy.vb(r)) =
  2 abs(phy.vb(E)_0)^2 lr((1 + cos((phy.vb(k)_2 - phy.vb(k)_1) dot phy.vb(r))), size: #150%)
$ <eq:theory-lattice-intensity>

where $phy.vb(k)_1$ and $phy.vb(k)_2$ are the wavevectors of the two beams.
The time-dependence of the electric field @eq:theory-dipole-gaussian[] is averaged out when computing the intensity of the total electric field#footnote[
  If the two beams had slightly different frequencies, the interference term in @eq:theory-lattice-intensity would oscillate at the frequency $omega_2 - omega_1$.
].
If the local intensity of the beams is not equal, a running-wave term is added to @eq:theory-lattice-intensity.
This term does not affect the microscopic properties of the interference pattern, just like the Gaussian envelope of the individual laser beams.
Therefore, both contributions are omitted here for the derivation of the optical-lattice potential.
The interference term in @eq:theory-lattice-intensity describes a spatial oscillation defined by the vector $Delta phy.vb(k) = k2 - k1$.
The corresponding period $a = pi / abs(Delta phy.vb(k))$ depends on the magnitude $k := k_1 = k_2$ of the wavevectors#footnote[
  Since the beams have equal frequencies $omega$, the magnitudes of the wavevectors are also equal.
], as well as the angle between the two interfering beams.
If the two beams are counterpropagating, their wavevectors are related by $phy.vb(k)_2 = -phy.vb(k)_1$ and the magnitude of the interference vector is $abs(Delta phy.vb(k)) = 2k$.
The resulting period is $a = lambda / 2$, where $lambda = (2 pi) / k$ is the wavelength of the interfering beams.
For a general intersection angle $2 dot anglez$ between the wavevectors #k1 and #k2, the expression for the period is

$
  a = lambda / (2 sin anglez) thin .
$ <eq:theory-lattice-period>

At $anglez = 90degree$, the counterpropagating case with $a = lambda / 2$ is recovered, which is also the minimum of the period $a$ for a fixed wavelength $lambda$.
@fig:theory-lattice-intersection-angle illustrates the change of the lattice period in a shallow-angle configuration compared to the counterpropagating configuration where $k2 = -k1$.

#floating-figure(
  lattice-configurations(),
  caption: [
    Interference period based on the angle of intersection.
    The wavelengths $lambda$ of the individual beams in the two examples are equal, as indicated by the equal lengths of the wavevectors $abs(k1) = abs(k2)$.
    The configuration on the left shows the interference of two counterpropagating beams with $k2 = - k1$.
    The resulting interference pattern is parallel to the two wavevectors with the period $a = lambda / 2$.
    With the shallow angle #anglez as shown on the right, the vector $Delta phy.vb(k)$ points in the vertical direction.
    The parallel components of #k1 and #k2 do not contribute to the interference pattern, causing the lattice period $a$ to be larger

    #notes[
      - Add *a* and *b* here to reference the different configurations?
      - Show the vector $Delta phy.vb(k)$ in the two configurations?
      - Use a different letter for the angle, since $alpha$ is also the polarizability?
      - Add a coordinate system $x$ and $y$?
    ]
  ],
  label: <fig:theory-lattice-intersection-angle>,
)

In the context of trapping atoms with light, an interference pattern is referred to as an optical lattice.
The potential of the optical lattice can be computed directly from the dipole potential in @eq:theory-dipole-terms and the interference pattern in @eq:theory-lattice-intensity.
In a coordinate system where $Delta phy.vb(k) || phy.vu(x)$, the optical-lattice potential can be written as

$
  V(x) = V_0 dot sin^2(k x)
$ <eq:theory-lattice-potential>

with the lattice depth $V_0$ and the lattice vector $k = abs(Delta phy.vb(k)) = pi / a$.
The lattice depth takes the intensity $I(0) = abs(phy.vb(E)_0)^2$, the detuning $Delta$ and the other parameters of the atom-light interaction into account.
This expression for the optical-lattice potential can be used for red-detuned light as well as blue-detuned light.
The practical difference between the two detunings is the location where the atoms are trapped (see @fig:theory-lattice-intersection-angle).
In a red-detuned optical lattice, the atoms are attracted by the intensity maxima of the interference pattern.
On the other hand, in a blue-detuned optical lattice, the atoms are trapped in the intensity minima.
In the direction of the lattice vector $Delta phy.vb(k)$, the two potentials therefore only differ by the energy offset $V_0$.
The relevant differences between the two detunings can be found in the scattering rate and the radial potential.
Since the scattering rate in @eq:theory-dipole-terms is proportional to the local intensity $I(phy.vb(r))$, it rate will be maximal (minimal) if the lattice is red (blue) detuned.
If the scattering causes an atom loss or heating of the atoms, a blue-detuned optical lattice can be used to minimize these effects.
The radial potential of an optical lattice depends on the Gaussian envelope introduced in @eq:theory-dipole-gaussian.
In a red-detuned optical lattice, the radial potential is always confining, while it is always deconfining in a blue-detuned optical lattice @greiner_ultracold_2003.
A running-wave component will further enhance the radial potential for both detunings.
The radial potential is relevant for the trapping of atoms in a three-dimensional optical lattice.
I will discuss this further in @sec:super-radial in the context of the in-plane superlattice.

#floating-figure(
  lattice-detuning(xscale: 2.4, depth: 3),
  caption: [
    Trapping atoms in an optical-lattice potential.
    Both optical lattices have the same lattice depth $V_0$ and the same lattice period $a$ according to @eq:theory-lattice-potential.
    The red-detuned optical lattice traps the atoms at the maxima of the intensity, while the blue-detuned lattice traps the atoms at the minima of the intensity.

    #notes[
      - Add two particles on some lattice sites? With or without different colors (spins)?
    ]
  ],
  label: <fig:theory-lattice-detuning>,
)
