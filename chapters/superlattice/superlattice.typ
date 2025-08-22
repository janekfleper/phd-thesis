#import "/header.typ": *

= Upgrading the in-plane superlattice setup <ch:super>

At the start of my thesis, the optical setups for the #x1064 lattice and the #x532 lattice were already in place.
The #x1064 lattice was used in many former projects @cocchi_equation_2016 @drewes_antiferromagnetic_2017 @wurz_coherent_2018 @gall_competing_2021 in the original configuration.
For the operation of the x1064 lattice as part of the in-plane superlattice, we only modified the optical setup on the laser table.
This was required for the control of the superlattice phase, which I will discuss in detail in @sec:phase-setup.
The #x532 lattice was put into operation again shortly before my thesis @klemmer_ultracold_2020.
On the experimental table, the optical setup was unchanged compared to the initial purpose of studying a Fermi gas in an optical superlattice @pertot_relaxation_2014.

After already working with the in-plane superlattice for more than three years, we noticed that the lattice depths #Vx1064 and #Vx532 are strongly time-dependent.
While the intensity regulation with the photodiode on the experimental table showed a constant power, the lattice depth at the position of the atoms was dropping significantly in a few #qty[100][ms].
If the power is constant, the lattice beams could either change their positions or shapes to reduce the lattice depth at the position of the atoms.
With the in-situ lattice modulation spectroscopy (see @ch:mod), we could quantify the change of the lattice depth $V(x, y)$.
In the #x1064 lattice, we saw an increase of the Gaussian waist #wx1064 that matched the decreasing lattice depth.
We could confirm this behavior by imaging the forward-propagating lattice beam with a camera.
For the #x532 lattice, the measured reduction of the lattice depth was even stronger.
Based on these observations, we concluded that the optical setups of the #x1064 lattice and the #x532 lattice are subject to severe thermal lensing.
Initially, we made different attempts to compensate the changes of the lattice depths.
However, due to the severity of the thermal lensing, we had to completely rebuild the optical setups of the two lattices on the experimental table.

In this chapter, I will introduce a theoretical description of thermal lensing to justify the choices of the optical materials that we used for the upgrade of the optical setup.
As a reference for the upgrades and the other chapters in this thesis, I will show the complete optical setup of the #x1064 lattice and the #x532 lattice on the experimental table.
This is also relevant for the alignment of the lattices in @sec:mod-align and the control of the superlattice phase in @sec:phase-setup.
At the end of the chapter, I will present the measured lattice depths $Vx1064(tau)$ and $Vx532(tau)$, and compare them to the initial measurements to highlight the improvement of the optical setups.

#include "thermal.typ"
#include "setup.typ"
#include "stability.typ"
#include "radial.typ"
