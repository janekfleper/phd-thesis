#import "/header.typ": *

== x1064-lattice beam shaping <sec:super-x1064>

#[
  #set text(red)
  - The beam waists should only be mentioned here, not in ch:setup yet!
  - Mention wavelength here again?
  - Where should I discuss the waist + confinement of the y1064-lattice?
  - Discuss the inhomogeneity together with the x532-lattice?
  - What is the "focal" shift for the x1064-lattice? How much (relative) lattice depth would that cost?
  - Mention the typical beam power somewhere?
  - Show gaussian beam simulations here w/ and w/o relay lens
  - Where should the setup figure go? Already in the "setup" chapter?
  - Really go into so much detail for the beam shaping?
  - Add reference to modulation chapter?
  - Add actual results measured with the camera?
  - Mention second focus measurement of forward-propagating beams with glass cell walls?
]

The x1064-lattice is the principal lattice along the x-axis.
As (already) mentioned in @ssec:setup-lattices-xy the x1064-lattice was used conjunction with the y1064-lattice to simulate the two-dimensional Hubbard model.
Since the x1064-lattice beams are red-detuned with respect to the D2 transition, the optical potential can "solo" confine the atoms in the $y z$-plane (even with just the forward-propagating beam).
There is no significant confinement along the optical axis of the x1064-lattice since the Rayleigh length of the beam is #text(red)[$approx #qty[5][cm]$].
The waist of the x1064-lattice beam is chosen as a compromise of the maximally achievable lattice depth in #unit[Erec] and the inhomogeneity of the lattice depth across the atom cloud.
At $approx #qty[140][μm]$ the $1 slash e^2$ waist is significantly larger than the usual atom cloud with a radius of $#qty[30][μm] "to" #qty[40][μm]$ along the x-axis.
Compared to the optical axis, the lattice depth is already decreased by #text(red)[??#unit[%]] at the edge of the atom cloud.

At the wavelength $lambda = #qty[1064.5][nm]$ a waist of #qty[140][μm] corresponds to a Rayleigh length of $z_R approx #qty[50][mm]$.
While this is convenient for the homogeneity along the optical axis, it requires extra care when planning the beam propagation/optical setup.
The "focussing" lens has a focal length of #qty[250][mm] which is only greater than the Rayleigh length by a factor of $approx 5$.
If the collimated beam had zero curvature at the position of the lens, the focus would be too close to the lens.
This correction/shift amounts to #text(red)[??#unit[mm]] for the given focal length and Rayleigh range.
While this correction/shift is still much smaller than the Rayleigh length, we would lose #text(red)[??%] of the maximally achievable lattice depth.
Furthermore, the lattice depth would become a lot more sensitive to thermally-induced focal shifts, #text(red)[see @sec:super-thermal].

To correctly position the focus of the forward-propagating beam of the x1064-lattice on the atoms, the beam has to be slightly diverging with a waist of #text(red)[?? #qty[500][μm]] coming into the #qty[250][mm] lens.
At the same time we want the position of the focus to be tunable around the position of the atoms for the final optimization.
If the beam was larger before the lens, we could achieve the tunability by slightly adjusting the curvature with a telescope (doesn't matter if (de)magnifying or 1:1).
Due to the (small) size of the beam, we would need to place the/that telescope just in front of the #qty[250][mm] lens.
This is not possible due to the optical path required to overlap the horizontal dipole trap, the x1064-lattice, the x532-lattice and the x-imaging beam as mentioned in @sec:super-setup.
If we set up the telescope at a distance of #qty[350][mm] from the #qty[250][mm] lens, we can no longer control the position of the focus independently of/from the beam waist.
By simulating the optical path with gaussian beams we found that we can achieve the desired tunability of the focus position by placing a single _relay_ lens as close to the #qty[250][mm] lens as possible.
The task of the relay lens is to effectively "shorten" the distance between the telescope and the #qty[250][mm] lens.
The simulation showed that the optimal (and easily-available) focal length for the relay lens is #qty[750][mm].
We can now place the telescope to tune the focal position at a distance of $approx #qty[1][m]$ from the #qty[250][mm] lens.
In this specific case we are using a 2:1 telescope to reduce the beam waist from $approx #qty[900][μm]$ after the fiber collimator to $approx #qty[450][μm]$.
The relay lens would however work for any telescope with this specific output waist.
Only the sensitivity to the length of the telescope depends on the (de)magnification.
#text(red)[ref figure of gaussian simulation results]

We confirmed the simulated tunability of the focal position with the relay lens by measuring the beam profile around the position of the atoms.
By placing a mirror behind the #qty[250][mm] lens we could access/capture the beams propagating along the x-axis with a camera on a mechanical transition stage.
We used the focus of the horizontal dipole trap as a reference for the atom position.
#text(red)[Show measurements here with dipole trap focus as reference line]
#text(red)[Mention slightly displaced focus to reduce the impact of the thermal lensing?].
If the focus of the forward-propagating beam is at the position of the atoms, the focus of the retro-propagating beam will automatically be correct if the retro-path is a "perfect" $4f$ system.
We cannot use the horizontal dipole beam/trap as a reference for the retro-propagating beams.
Instead we have to "image" the (dirt on the) outer walls of the glass cell by illuminating the glass cell with an LED in transmission.
We can then compute the position of the atoms since we know that they in the center of the glass cell.
This procedure has an uncertainty of $approx #qty[1][mm]$ from the measured positions of the glass cell walls.
With a Rayleigh length of $z_R approx #qty[50][mm]$ such an uncertainty does not have a relevant effect on the resulting lattice depth.
