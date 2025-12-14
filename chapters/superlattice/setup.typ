#import "/header.typ": *
#import "figures/setup.typ": figure as figure-setup

== Experimental setup <sec:super-setup>

For the upgrade of the optical setup to reduce the thermal lensing, we replaced most optical elements that are used in transmission.
However, we did not change the beam positions of the #x1064 and #x532 lattice.
The overall geometry is, therefore, unchanged compared to the initial setup of the #x1064 lattice @cocchi_analogue_2016 @miller_ultracold_2016 and the #x532 lattice @klemmer_ultracold_2020.
The upgraded version of the optical setup on the experimental table is shown in @fig:super-setup.
Unless noted otherwise, all optical elements used in transmission are made of #UVFS.

The #x1064 lattice uses a polarization-maintaining single-mode fiber to guide the light from the optical table to the experimental table.
Behind the fiber collimator, the #x1064\-lattice beam waist is $w_0 approx #qty[900][μm]$ and we use a $2:1$ telescope to reduce the beam waist to $w_0 approx #qty[450][μm]$.
The optical isolator#footnote[
  Conoptics M714 (#TGG)
] behind the telescope prevents the #retro beam from realizing an additional standing-wave potential.
With a #hwp and a polarizing beam splitter (PBS) we rotate and clean the beam polarization, which is essential to maximize the interference of the lattice beams.
A photodiode monitors a fraction of the beam for the power regulation.
The last mirror in the #x1064\-lattice setup is used for the lattice alignment#footnote[
  Newport Agilis#sym.trademark AG-M100N (see @ssec:mod-align-x1064 for the automation of the #x1064\-lattice alignment)
].
Behind the alignment mirror, we use a relay lens with the focal length $f = #qty[750][mm]$ to compensate the divergence of the beam due to the small beam waist $w_0 approx #qty[450][μm]$ behind the telescope.
With the relay lens, we can continuously shift the focus around the atom position by adjusting the length of the telescope.
This allows us to match the foci of the #forward lattice beams and the horizontal dipole trap through the forward lens.

#floating-figure(
  figure-setup(),
  caption: [
    Experimental setup of the in-plane superlattice.
    The setup shows all relevant optic elements on the experimental table.
    Around the glass cell, the optical elements are shared with the horizontal dipole trap (see @sec:setup-prepare-dipole).
    The forward and retro lens have an anti-reflection coating designed for the wavelengths #qty[532][nm], #qty[766.7][nm] (imaging) and #qty[1064][nm], just like the outer surfaces of the glass cell.
    The inner surfaces of the glass cell are uncoated, resulting in a reflectivity of approximately #qty[4][%] at each inner surface.
    Behind the relay lens, the #x1064 lattice is overlapped with the horizontal dipole trap using a PBS.
    The cylindrical telescope in the optical path of the #x532 lattice expands the beam along the #z-axis, leaving the beam shape in the #xy-plane unaffected.
    The transmissions through the dichroic mirrors around the glass cell are used to monitor the beam positions in the virtual atom plane.
    To improve the visibility, neither the beam diameters nor the distances are drawn to scale.
  ],
  label: <fig:super-setup>,
)

The #x532 lattice uses a polarization-maintaining photonic-crystal fiber#footnote[
  NKT Photonics LMA-PM-15
] to guide the light from the optical table to the experimental table.
Compared to a regular single-mode fiber, the photonic-crystal fiber is more suitable for high-power applications due to a larger mode volume.
The initial waist of the collimated beam is $w_0 approx #qty[700][μm]$.
For the optical isolation, we use the Faraday medium and permanent magnet from an optical isolator#footnote[
  Newport ISO-04-532-MP (#TGG)
] and two individual PBSs#footnote[
  The built-in PBSs show a significant contribution to the thermal lensing.
].
The input PBS is rotated by #deg[45], which allows the output PBS to be parallel to the optical table.
Behind the output PBS, we use the transmission of a backside-polished mirror for the power regulation.
The subsequent telescopes prepare the correct beam shape for the #x532 lattice.
The first telescope uses cylindrical lenses for a vertical expansion of the beam by the factor $3$.
At the position of the atoms, this translates to an aspect ratio of $1:3$ between the vertical and horizontal waist.
In the second telescope, the overall beam size is reduced by the factor $2.5$.
The resulting horizontal waist of the collimated beam is approximately #qty[350][μm], which is required to realize the horizontal beam waist of #qty[120][μm] at the position of the atoms.
With the two telescopes, we can adjust the horizontal and vertical focus individually.
The details about the positioning of the separate foci are discussed in @ssec:super-stability-x532.
Behind the second telescope are two mirrors in motorized mirror mounts#footnote[
  Newport NewFocus 8821
] for aligning the #forward #x532\-lattice beam onto the atoms.
Due to the proximity of the mirror mounts, they are not suitable to shift the #x532\-lattice beam perpendicular to its optical axis.
This is relevant to match the wavefront angles of the #x532 and #x1064 lattice at the position of the atoms.
Instead, we use two #qty[10][mm] thick glass plates to apply a horizontal and vertical shift to the collimated #x532\-lattice beam.
The forward lens converts this shift to the angle of the #x532 lattice at the position of the atoms.
One glass plate uses a static mirror mount, while the other glass plate uses a motorized mirror mount#footnote[
  Newport Agilis#sym.trademark AG-M100L
] to allow an automated control of the relative wavefront angle.
Matching the wavefronts of the two lattices is essential for the phase-sensitive measurements presented in @sec:phase-measure.

The #x1064\-lattice beam and the #x532\-lattice beam are superimposed at the first dichroic mirror and focused onto the atoms by the forward lens#footnote[
  LENS-Optics achromatic doublet (#CAF2 + #NBALF4)
] with the focal length $f = #qty[250][mm]$.
To avoid a normal incidence on the glass cell, the lattice beams are off-center with respect to the optical axis of the forward lens.
The angle of incidence is approximately #deg[2] relative to the normal vector of the glass cell in the #xy-plane and in the #xz-plane.
This prevents an overlap of the lattice beams with the reflections off the glass cell, which can lead to additional interference patterns @cocchi_analogue_2016 @miller_ultracold_2016.
We use the focus of the horizontal dipole trap to infer the position of the atoms along the propagation axis of the #forward lattice beams.
Behind the glass cell the lattice beams are collimated by the retro lens, which uses the same model as the forward lens.
The retro lens and the retro mirror are in a $4f$-configuration for an optimal overlap of the foci of the #forward and #retro lattice beams.
For the optimization of the retro-lens position, we use the two imaging systems that measure the transmission of the lattice beams through the dichroic mirrors around the glass cell.
