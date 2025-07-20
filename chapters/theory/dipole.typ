#import "/header.typ": *
#import "figures/figures.typ": *

#let k1 = $phy.vb(k)_1$
#let k2 = $phy.vb(k)_2$

== Atom-light interaction and optical lattices <sec:theory-dipole>

#notes[
  - Discuss hyperfine structure for the dipole force?
  - Really only show the electric field of the simplified Gaussian beam?
  - Already introduce the running-wave component in @eq:theory-lattice-intensity?
  - Mention accordion lattices with a variable period $a$? Or only do this in the setup section for the z532 lattice?
]

The interaction of atoms with far-detuned light plays an essential role in quantum gas experiments #tr[cite Grimm].

If an atom is exposed to light with the intensity $I prop abs(phy.vb(E))^2$, the electric field $phy.vb(E)$ induces an oscillating dipole moment $phy.vb(p)$ in the atom.
The oscillation frequency of the dipole moment is equal to the driving frequency $omega = c slash lambda$, where $c$ is the speed of light and $lambda$ is the wavelength of the light.
The amplitude and the phase of the dipole moment relative to the electric field are characterized by the complex polarizability $alpha(omega)$.

$
  phy.vb(p) = alpha(omega) phy.vb(E)
$ <eq:theory-dipole-moment>

The induced dipole moment $phy.vb(p)$ interacts with the electric field $phy.vb(E)$ #tr[again], resulting in the dipole potential $U_"dip"$ and the scattering rate $Gamma_"sc"$.
In the Lorentz model, this atom-light interaction is described by a driven harmonic oscillator with the eigenfrequency $omega_0$ and a damping rate $Gamma$.
Despite being a classical model, it can correctly predict the polarizability $alpha(omega)$ as long as the scattering rate is small compared to the damping rate $Gamma_"sc" << Gamma$.
The resulting expressions for the dipole potential and the scattering rate are

$
     U_"dip" (phy.vb(r)) & prop Gamma / Delta I(phy.vb(r))     \
  Gamma_"sc" (phy.vb(r)) & prop (Gamma / Delta)^2 I(phy.vb(r))
$ <eq:theory-dipole-terms>

where $Delta = omega - omega_0$ is the detuning of the driving frequency relative to the #tr[eigenfrequency] of the atom.
In the quantum-mechanical model, the eigenfrequency corresponds to the transition frequency between the ground state and the excited state#footnote[This is a simplified model that only considers a two-level atom. In general, the total dipole potential is computed as the weighted sum of all available transitions to excited states.].
The scaling with $Delta$ shows that using a large detuning and a high intensity is optimal for optical dipole potentials while limiting the scattering rate $Gamma_"sc"$.
In the context of far-detuned light, the condition $Gamma_"sc" << Gamma$ is usually fulfilled and the scattering rate can be small relative to the experimental timescales.
The sign of the detuning $Delta$ decides whether the dipole potential in @eq:theory-dipole-terms[] is attractive or repulsive.
Light with $Delta < 0$ is called _red-detuned_ and attracts the atoms to the maximum of the intensity $I(phy.vb(r))$.
Conversely, light with $Delta > 0$ is called _blue-detuned_ and repells the atoms.

The dipole potential $U_"dip" (phy.vb(r))$ can be applied to regular optical dipole traps as well as optical lattices.
In the former case, a red-detuned laser beam is commonly used to create a confining potential for atoms #tr[cite Grimm?].
If the beam has a Gaussian intensity profile, the atoms will be attracted radially towards the optical axis.
A blue-detuned Gaussian laser beam cannot be used to trap atoms, it can however be used to locally modify existing potentials #tr[cite plug beams?].
Regardless of the detuning, the dipole potential is proportional to the intensity envelope $I(phy.vb(r)) prop abs(phy.vb(E(phy.vb(r))))^2$.
The electric field of a Gaussian beam close to the focal position can be written as

$
  phy.vb(E)(phy.vb(r), t) =
  phy.vb(E)_0 exp(-rho^2 / w_0^2) exp lr((i (omega t - phy.vb(k) dot phy.vb(r))), size: #150%)
$ <eq:theory-dipole-gaussian>

where $rho$ is the distance from the optical axis and $w_0$ is the beam waist #tr[cite Saleh & Teich?].
If the beam propagates along the $z$ axis, this simplified electric field assumes $abs(z) << z_R$ with the Rayleigh length $z_R$.
In this approximation, the beam waist $w_0 = w(0)$ is used instead of the beam radius $w(z)$, and the radius of curvature $R(z)$ and the Gouy phase $psi(z)$ are omitted from the complex exponential function.
The vector $phy.vb(E)_0 = E_0 phy.vu(x)$ characterizes the amplitude $E_0$ of the electric field as well as the polarization $phy.vu(x)$.
Both quantities are not exclusive to Gaussian beams and also show up in the electric field of a plane optical wave.
The same is the case for the complex exponential function that characterizes the phase of the wave.
In this simplified form, only the radial exponential function is characteristic for a Gaussian beam.

The spatial periodicity of the electric field $phy.vb(E)$ characterized by the wavevector $phy.vb(k)$ cannot be resolved in a running-wave potential.
However, this property is essential for the creation of optical lattice potentials by interfering multiple laser beams.
The interference pattern of two laser beams with the same #tr[amplitude/vector] $phy.vb(E)_0$ and the same frequency $omega$ is

$
  I(phy.vb(r)) =
  #tr[$2$?] abs(phy.vb(E)_0)^2 lr((1 + cos((phy.vb(k)_2 - phy.vb(k)_1) dot phy.vb(r))), size: #150%)
$ <eq:theory-lattice-intensity>

where $phy.vb(k)_1$ and $phy.vb(k)_2$ are the wavevectors of the two beams.
The time-dependence of the electric field @eq:theory-dipole-gaussian[] is averaged out when computing the intensity of the total electric field#footnote[If the two beams had slightly different frequencies, the interference term in @eq:theory-lattice-intensity would oscillate at the frequency $omega_2 - omega_1$.].
If the local intensity of the beams is not equal, a running-wave term is added to @eq:theory-lattice-intensity.
This term does not affect the microscopic properties of the interference pattern, just like the Gaussian envelope of the individual laser beams.
Both contributions are omitted here for the derivation of the optical lattice potential.
The interference term in @eq:theory-lattice-intensity describes an oscillation in space defined by the vector $Delta phy.vb(k) = k2 - k1$.
Therefore, the period $a = pi / abs(Delta phy.vb(k))$ depends on the #tr[amplitude/absolute/mangitude] $k$ of the wavevectors as well as the angle between the two interfering beams.
If the two beams are counterpropagating, their wavevectors are related by $phy.vb(k)_2 = -phy.vb(k)_1$ and the #tr[amplitude/absolute/magnitude] of the interference vector is $abs(Delta phy.vb(k)) = 2k$.
The resulting period is $a = lambda / 2$ where $lambda = (2 pi) / k$ is the wavelength of the interfering beams.
For a general intersection angle $2 dot alpha$ between the wavevectors #k1 and #k2, the expression for the period is

$
  a = lambda / (2 sin alpha) thin .
$ <eq:theory-lattice-period>

At $alpha = 90degree$, the counterpropagating case with $a = lambda / 2$ is recovered, which is also the minimum of the period $a$ for a fixed wavelength $lambda$.
@fig:theory-lattice-intersection-angle illustrates the change of the lattice period in a shallow-angle configuration compared to the counterpropagating configuration where $k2 = -k1$.

#floating-figure(
  lattice-configurations(),
  caption: [
    Interference period based on the angle of intersection.
    The wavelengths $lambda$ of the individual beams in the two examples are equal, as indicated by the equal lengths of the wavevectors $abs(k1) = abs(k2)$.
    The configuration on the left shows the interference of two counterpropagating beams with $k2 = - k1$.
    The resulting interference pattern is parallel to the two wavevectors with the period $a = lambda / 2$.
    With the shallow angle $alpha$ as shown on the right, the vector $Delta phy.vb(k)$ points in the vertical direction.
    The parallel components of #k1 and #k2 do not contribute to the interference pattern, causing the lattice period $a$ to be larger

    #notes[
      - Add *a* and *b* here to reference the different configurations?
      - Show the vector $Delta phy.vb(k)$ in the two configurations?
      - Use a different angle, since $alpha$ is also the polarizability?
      - Add a coordinate system $x$ and $y$?
    ]
  ],
  label: <fig:theory-lattice-intersection-angle>,
)

The optical lattice potential can be computed directly from the dipole potential in @eq:theory-dipole-terms and the interference pattern in @eq:theory-lattice-intensity.
In a coordinate system where $Delta phy.vb(k) || phy.vu(x)$, the optical lattice potential can be written as

$
  V(x) = V_0 dot sin^2(k x)
$ <eq:theory-lattice-potential>

with the lattice depth $V_0$ and the lattice vector $k = abs(Delta phy.vb(k)) = pi / a$.
The lattice depth takes the intensity $I(0) = abs(phy.vb(E)_0)^2$, the detuning $Delta$ and the other parameters of the atom-light interaction into account.
This expression for the optical lattice potential can be used for red-detuned light and blue-detuned light.
The practical difference between the two detunings is the location where the atoms are trapped.
In a red-detuned optical lattice, the atoms are attracted by the intensity maxima of the interference pattern.
On the other hand, in a blue-detuned optical lattice, the atoms are trapped in the intensity minima.
In the direction of the lattice vector $Delta phy.vb(k)$, the two potentials therefore only differ by a global energy offset as shown in @fig:theory-lattice-detuning.
The relevant differences between the two detunings can be found in the scattering rate and the radial potential.
Since the scattering rate in @eq:theory-dipole-terms is proportional to the local intensity $I(phy.vb(r))$, the scattering rate will be maximal (minimal) if the lattice is red-detuned (blue-detuned).
If the scattering causes an atom loss or a heating of the atoms, a blue-detuned optical lattice can be used to minimize these effects.
The radial potential of an optical lattice depends on the Gaussian envelope introduced in @eq:theory-dipole-gaussian.
In a red-detuned optical lattice the radial potential is always confining, while it is always deconfining in a blue-detuned optical lattice #tr[cite Greiner/Luke?].
This is primarily relevant for the trapping of atoms in a three-dimensional optical lattice, and is discussed further in @sec:super-radial #tr[and ref setup?].

#figure(
  image("figures/optical-lattices-detuning.png"),
  caption: [
    Illustration of the trapping of atoms in optical lattices with different detuning.
    The plot on the left shows the optical dipole potential of a red-detuned optical lattice with the depth $V_0$ and the period $a$.
    The atoms are trapped at the maxima of the intensity.
    For a blue-detuned lattice as shown in the plot on the right, the atoms are trapped at the minima of the intensity.
  ],
) <fig:theory-lattice-detuning>
