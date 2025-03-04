#import "../../header.typ": *

== Vertical lattices <sec:setup-z-lattices>

#[
  #set text(red)
  - Really use _long_ and _short_? It feels more natural to use #text(green)[green] and red...
  - Add Erec as a function of a to the theory?
  - Mention any temperature details of the loading scheme?
  - Mention typical atom numbers per plane?
]

There are two lattices available with a lattice vector along the $z$-axis.
Since they can also be used in a superlattice configuration, I will refer to them as _short_ and _long_ according to the convention introduced in @sec:theory-superlattice.
The two lattices are created in a shallow-angle configuration with the beams intersecting at an angle of around $2 dot 15^degree$, see #text(red)[figure lattices].
The _short_ lattice uses a wavelength of $lambda_s = #qty[532][nm]$ and is therefore blue-detuned, while the _long_ lattice uses a wavelength of $lambda_l = #qty[1064][nm]$ and is therefore red-detuned.
Based on @eq:theory-dipole-potential-lattice-period the lattice periods are
$
  a_(z,s) approx #qty[1.06][μm] #h(1em) "and" #h(1em)
  a_(z,l) approx #qty[2.12][μm]
$ <eq:setup-z-lattices-periods>

Since the optical setup was optimized for the _short_ lattice (#text(red)[ref Eugenio + Luke]), the power ratio between the upper beam and the lower beam is $#num(uncertainty-mode: "conserve")[1.00(0)]$.
A Verdi V10 laser is used for the _short_ lattice and we can reach lattice depths of $tilde #qty[110][_E_#sub[rec,s]]$.
The _long_ lattice was built into the setup retrospectively (#text(red)[ref Jeffrey, Marcell + Nicola]) and the power ratio between the upper and the lower beam is $tilde 4$?
The power imbalance between the _long_ lattice beams will cause a large running wave component leading to an increased confinement along the $x$-axis, #text(red)[ref sec:mu-map].
A Mephisto MOPA (20W) is used for the _long_ lattice and we can typically reach lattice depths of $> #qty[100][_E_#sub[rec,l]]$.

For the measurements covered in this thesis, the _short_ vertical lattice is always used during the actual measurements.
Due to the blue detuning and the (perfectly) balanced beam powers, the atoms are trapped in the potential minimum as envisioned in @dipole-potential-detuning-gauss and there is only a small deconfining potential due to the finite size of the lattice beams #text(red)[ref sec:mu-map].
The _long_ vertical lattice is only used for the transfer of the atoms from the dipole trap to the _short_ vertical lattice.
When the atoms are transferred from the dipole trap to the _long_ vertical lattice, the atom pancakes will be distanced by $~#qty[2][μm]$ in the $z$-direction.
By then transfering the atoms to the _short_ vertical lattice, only every other plane will be occupied which makes the single-plane tomography significantly easier #text(red)[ref sec:slicing].
For the ideal transfer the phase of the vertical superlattice is set to be antisymmetric, see @superlattice-potential-phase.
After the atoms are loaded into the _short_ vertical lattice, the depth of the lattice stays constant in all the relevant sequences for this thesis.
