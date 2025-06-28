#import "/header.typ": *

= In-situ lattice modulation spectroscopy <ch:mod>

#[
  #set text(red)
  - Actually mention anything about the PID loops? E.g. their bandwidth?
  - Is "in-situ" actually a good name here? Maybe use "local" instead?
]

In an experimental sequence we would like to program the depths of the optical lattices in units of #unit[Erec].
The quantity for the power stabilization of the lattices is however the #tr[(photo)] current measured by photodiodes on the experimental table.
We therefore need to calibrate the lattice depths in #unit[Erec] as a function of the optical power on the photodiodes.
Lattice modulation spectroscopy has proven to be a reliable technique for this calibration #tr[what are the OG papers here?]
By modulating the lattice depth the atoms are transferred to higher bands when the modulation frequency is equal to the #tr[energy/frequency] difference relative to the initial band.
The lattice depth in #unit[Erec] can then be inferred directly from the band structure theory in @sec:theory-bloch.

Since the #tr[eigenfunctions/eigenstates] of the optical lattice are Bloch waves, lattice modulation spectroscopy has been studied extensively as a function of the quasimomentum $q$ #tr[cite PhD/paper Jannes Heinze and something else?].
If the widths of the energy bands are comparable to the energy difference between the bands, one can nicely resolve the band structure as a function of the quasimomentum $q$.
These measurements are usually done with a time-of-flight detection scheme that maps the quasimomentum $q$ to a position in the atom image.
When lattice modulation spectroscopy is used to calibrate the lattice depth, we would however like to avoid the resolution of the quasimomentum $q$.
This is done by using deep lattices where the band widths are negligible relative to the energy difference between the bands.
#tr[In this chapter] we will go one step further and measure the lattice depth as a function of the position $(x, y)$.
Since optical lattices are usually created by overlapping two gaussian beams, the lattice depth will decrease based on the radius $rho$ from the optical axis of the lattice beams.
Calibrating the lattice depth $v(x, y)$ will therefore reveal the maximal lattice depth in the center, as well as the #tr[(radial)] width and the position of the optical lattice.
This allowed us to turn the inherent inhomogeneity of the lattice potentials into a powerful calibration technique.

#tr[Really link every section here?]
At the beginning of this chapter I will introduce the general concept of the lattice modulation spectroscopy, followed by additional considerations for the in-situ technique.
I will then show the detailed evaluation of a measurement of the x1064-lattice depth in @sec:mod-eval.
This includes the introduction of the fit model and the error estimation of the calibrated lattice parameters.
In @sec:mod-loss I will explain the atom-loss mechanism that is required for the in-situ signal and the resulting limitations for the possible lattice depths.
As already discussed in #tr[@sec:setup-xy] the x1064 lattice and the y1064 lattice are not perfectly orthogonal.
I will compare the relevant implications on the lattice modulation spectroscopy to the two-dimensional compled band structure in @sec:mod-coupled.
In @sec:mod-align I will explain how we were able to improve the alignment procedure of the lattices thanks to the in-situ spectroscopy signals.
At the end of the chapter I will showcase the in-situ lattice modulation in the x-superlattice potential.

#include "introduction.typ"
#include "evaluation.typ"
#include "loss.typ"
#include "coupled.typ"
#include "alignment.typ"
#include "superlattice.typ"
