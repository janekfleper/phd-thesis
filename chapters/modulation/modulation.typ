#import "../../header.typ": *

= In-situ lattice modulation spectroscopy <ch:modulation>

When we work with our optical lattices, we program the sequence to run the lattice at a certain depth in #unit[_E_#sub[rec]].
The lattice power is measured with a photodiode on the experimental table and we use this in a PID loop to regulate the lattice power and therefore also the lattice depth.
Knowing the lattice depth as a function of the optical power requires careful prior calibration of the lattice potentials.
In our setup we use lattice modulation spectroscopy to (locally) measure the depth of our lattices.
Lattice modulation spectroscopy employs the (resonant) transfer of atoms between the energy bands as introduced in @sec:theory-bloch-theorem and shown in @bloch-theorem-energy-bands.
This technique has been used to characterize lattice depths since the dawn of optical lattices #text(red)[what to cite here as the og paper?].

Since the eigenfunctions of the optical lattice are Bloch waves, lattice modulation spectroscopy has been studied extensively as a function of the quasimomentum $q$ #text(red)[cite PhD/paper Jannes Heinze].
If the energy bands are not "flat" compared to the modulation frequency, one can nicely resolve the transition energy as a function of the quasimomentum $q$.
These measurements are done with a time-of-flight detection scheme that maps the quasimomentum $q$ to a position in the atom image.
When lattice modulation spectroscopy is used to characterize an optical lattice, measuring the lattice depth as a function of the position is a lot more useful than probing the band structure as a function of the quasimomentum $q$.
Since optical lattices are (almost?) always created from gaussian beams, the lattice depth will change based on the (perpendicular) distance from the optical axis of the lattice beams.
Measuring the lattice depth as a function of the position can therefore reveal the lattice depth in the center (on the optical axis), the width of the lattice and the position of the lattice.
Without the spatial resolution, the inhomogeneity of the lattice depth will actually broaden the measured transition/resonance.
But with the in-situ lattice modulation spectroscopy we can turn the (necessary) inhomogeneity of the lattices into a powerful calibration tool.

At the beginning of this chapter I will show the measured results for all the (monochromatic) lattices introduced in @sec:setup-z-lattices and @sec:setup-xy-lattices.
The next sections will then introduce the theoretical and technical details of the in-situ lattice modulation spectroscopy step by step.
Towards the end of the chapter I will showcase how we use the measurement for the optimization of the alignment of the lattices, and I will present the results of the in-situ lattice modulation spectroscopy in the x-superlattice that was introduced in #text(red)[ref chapter 3].

#include "results.typ"
#include "evaluation.typ"
