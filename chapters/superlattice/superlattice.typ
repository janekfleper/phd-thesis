#import "/header.typ": *

= Upgrading the in-plane superlattice setup <ch:super>

The in-plane superlattice is formed by an infrared (#qty[1064][nm]) lattice and a green (#qty[532][nm]) lattice that are superimposed along the #x-axis (see @fig:setup-lattices).
According to the naming convention for the lattices introduced in @sec:setup-lattices, I will refer to them as #x1064 lattice and #x532 lattice respectively.
Both lattices feature an optical setup for the shaping of the lattice beams and the positioning of the foci around the atom cloud.
The lattice depths #Vx1064 and #Vx532 depend on the beam power and the shape of the lattice beams at the position of the atom cloud.
The beam powers of the respective lattice are regulated with feedback loops to realize the lattice depths as programmed in the experimental sequence.
For constant beam powers, we expect the lattice depths #Vx1064 and #Vx532 to be static.
However, we observe a significant decrease of the lattice depths by up to #qty[30][%] compared to the setpoint in the experimental sequence.
Either the shape or the overlap of the lattice beams at the position of the atom cloud have to change to observe such a behavior of the lattice depths.
We find that the optical setups of both lattices are subject to thermal lensing due to the absorption of the lattice beams in the optical elements.
The thermally-induced focal shifts change the shapes of the lattice beams and, therefore, the lattice depths at the position of the atoms.
To improve the stability of the lattice depths, we completely rebuilt the optical setups of both lattices.

At the beginning of this chapter, I will introduce a theoretical description of thermal lensing to motivate the selection of optical materials for the upgrade of the optical setups.
As a reference for the upgrades, I will show the complete optical setup of the #x1064 lattice and the #x532 lattice on the experimental table.
The details of the optical setup are also essential to understand the alignment of the lattices in @sec:mod-align and the control of the superlattice phase in @sec:phase-setup.
At the end of this chapter, I will present the time-dependent lattice depths $Vx1064(tau)$ and $Vx532(tau)$, before and after the upgrade, to highlight the improved stability of the two lattices.

For the calibration of the lattice depths, we use the in-situ #lms that will be introduced in @ch:mod.
This calibration technique uses the inhomogeneity of the lattice beams to resolve the local lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$.
Besides calibrating the lattice depth, this technique is also capable of measuring the horizontal waist and the position of the lattice beams in the #xy-plane.
In addition to the in-situ #lms, we use beam-profiling cameras to characterize the residual focal shifts due to the thermal lensing in the upgraded optical setups.

#include "thermal.typ"
#include "setup.typ"
#include "stability.typ"
