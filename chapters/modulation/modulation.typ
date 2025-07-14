#import "/header.typ": *

= In-situ lattice modulation spectroscopy <ch:mod>

#notes[
  - Actually mention anything about the PID loops? E.g. their bandwidth?
  - Is "in-situ" actually a good name here? Maybe use "local" instead?
]

In an experimental sequence we would like to program the depths of the optical lattices in units of #unit[Erec].
However, the quantity for the power stabilization of the lattices is the photo current measured by photodiodes.
We therefore need to calibrate the lattice depths to relate the analog signal from the photodiodes to a lattice depth $V$ in #unit[Erec].
Lattice-modulation spectroscopy has proven to be a reliable technique for this calibration #tr[cite the OG papers here?]
By modulating the lattice depth, the atoms are transferred to higher bands when the modulation frequency is resonant to the energy gap relative to the initial band.
With the band structure theory in @sec:theory-bloch, the lattice depth in #unit[Erec] can then be inferred directly from the modulation frequencies.

Since the eigenstates of the optical lattice are Bloch waves, lattice-modulation spectroscopy has been studied extensively as a function of the quasimomentum $q$ #tr[cite PhD/paper Jannes Heinze and something else?].
If the widths of the energy bands are comparable to the energy difference between the bands, one can resolve the band structure as a function of the quasimomentum $q$.
These measurements are usually done with a time-of-flight detection scheme that maps the quasimomentum $q$ to a position in the atom image.
However, when lattice modulation spectroscopy is used to calibrate the lattice depth, the resolution of the quasimomentum $q$ is not required.
By using deep lattices where the band widths are negligible compared to the energy difference between the bands, the dispersion $epsilon(q)$ can be suppressed.
In this chapter we will go one step further and measure the local lattice depth as a function of the position $(x, y)$.
When optical lattices are created by interfering two Gaussian beams, the lattice depth will decrease with the radius $rho$ from the optical axis of the lattice beams.
Calibrating the lattice depth $V(x, y)$ will reveal the maximal lattice depth in the center, as well as the waist of the lattice beams and the position of the optical lattice.
This allowed us to turn the inherent inhomogeneity of the lattice potentials into a powerful calibration tool.

At the beginning of this chapter, I will introduce the general concept of the lattice modulation spectroscopy, followed by additional considerations for the in-situ technique.
I will present the evaluation of the x1064-lattice depth in detail to introduce the fit model and the error estimation of the lattice parameters.
The following sections explain the atom-loss mechanism required for the in-situ signal, and the consequences of the coupling between the x1064 lattice and the y1064 lattice on the calibration measurement.
In the last two sections, I will highlight the improvement of the lattice-alignment procedure, and I will show the modulation of the superlattice to calibrate the x532-lattice depth.

#include "introduction.typ"
#include "evaluation.typ"
#include "loss.typ"
#include "coupled.typ"
#include "alignment.typ"
#include "superlattice.typ"
