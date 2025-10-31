#import "/header.typ": *

= Outlook (#tr[under construction]) <ch:outlook>

#notes[
  - Mention optical lattices for atomic clocks!
  - Where to introduce difference between analog and digital quantum simulation?
]

Another approach using the hyperfine states is based on the spin-spiral technique that was used to detect magnetic correlations in the two-dimensional lattice #text(red)[ref setup section? + Nicola].
Instead of aligning the gradient angle along the diagonal of the x1064-lattice and the y1064-lattice, the magnetic field gradient would be/run parallel to the x1064-lattice.
To start the spin-spiral/Ramsey measurement a $pi slash 2$-pulse is used to transfer (the spin of) all the atoms onto the $x y$-plane.
Since the atoms are initially polarized they will all start with the same phase (in the $x y$-plane).
The evolution/precession/measurement time $tau$ is chosen such that the atoms/spins on each sublattice site accumulate the same phase $phi mod 2 pi$.
The atoms on the "other" sublattice will then have a (relative) phase offset by $pi$.
A second $pi slash 2$-pulse will then transfer the atoms/spins back onto the quantization axis where $n_L$ and $n_R$ will occupy different hyperfine states.
The (separate) densities can then be imaged sequentially as shown in @ssec:setup-sequence-detect.
While this technique sounds very tempting, it would have been even more difficult to set up than the spin spiral.
For the measurement of the correlations it was sufficient to imprint a relative spin pattern since the absolute position of the atoms/lattice sites was relevant.
The slope and the angle of the magnetic field gradient had to be carefully calibrated but the absolute value of the magnetic field along the $z$-axis could change from sequence to sequence.
In the case of the measurement in the x-superlattice we would need an absolute stability of the magnetic field and the position of the sublattice sites.
Otherwise the spin spiral/Ramsey technique will randomly/uncontrollably map the sublattice sites to the different hyperfine states.
Trying to set this up for the phase-sensitive measurement introduced in @ssec:phase-measure-sequence would not have been practical.

Besides analog quantum simulators, optical lattices are also useful for digital quantum simulators such as quantum computers using neutral atoms.
While optical tweezers are used to address and rearrange individual atoms, optical lattices can provide an underlying potential to pin/trap the individual atoms/qubits.
Compared to (two-dimensional) arrays of optical tweezers, optical lattices are spatially robust and easy? to maintain.
In the context of quantum computers, the lattices are only/mainly used to confine the atoms without ever allowing tunneling between the lattice sites.
Nevertheless, a calibration of the lattice potential is essential for a long-term operation of the optical lattice.
For this, the same calibration techniques can be used as for the "regular" lattices, which we explore in this thesis.
