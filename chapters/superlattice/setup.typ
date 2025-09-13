#import "/header.typ": *

== Experimental setup <sec:super-setup>

For the upgrade of the optical setup to reduce the thermal lensing, we had to replace most optical elements that are used in transmission.
However, we did not change the beam positions of the #x1064 lattice and the #x532 lattice.
The overall geometry is therefore unchanged compared to the initial setup of the #x1064 lattice @cocchi_analogue_2016 @miller_ultracold_2016 and the #x532 lattice @klemmer_ultracold_2020.
The upgraded version of the optical setup on the experimental table is shown in @fig:super-setup.
Unless noted otherwise, the transmissive optical elements are made of #UVFS.
In @ssec:super-setup-replace, I will introduce the specific replacements of the optical elements to reduce the thermal lensing.

The #x1064 lattice uses a polarization-maintaining single mode fiber to guide the light from the optical table to the experimental table.
Behind the collimator, the #x1064\-lattice beam has a waist of $w_0 approx #qty[900][μm]$.
We use a $2:1$ telescope to reduce the beam waist to $w_0 approx #qty[450][μm]$.
Even though the beam is technically collimated behind the telescope, the small waist results in a significant divergence of the beam up to the forward lens.
This requires some additional optical engineering to achieve the correct beam shape at the position of the atoms.
Behind the telescope, the beam passes through an optical isolator#footnote[
  Conoptics M714 (#TGG)
] to prevent the retro-propagating beam from realizing an additional standing-wave potential.
With a #hwp and a PBS, we rotate and clean the beam polarization which is essential for the interference of the lattice beams.
The photodiode measures a fraction of the beam for the power regulation (see @sec:setup-lattices).
The last mirror in the isolated #x1064\-lattice setup has always been used for the fine tuning of the lattice alignment.
During the upgrade of the optical setup, we replaced the mechanical mirror mount with a piezo mirror mount#footnote[
  Newport Agilis#sym.trademark AG-M100N
] to enable an automation of the #x1064\-lattice alignment (see @ssec:mod-align-x1064).
Behind the alignment mirror, we use a relay lens with the focal length $f = #qty[750][mm]$ to compensate the divergence of the beam behind the telescope.
We determined the ideal position of the relay lens and the closest available focal length with a simulation of the propagation of a Gaussian beam in the optical setup.
With the relay lens, we can continuously shift the focus around the atom position by changing the length of the telescope.
This allows us to match the focus of the forward-propagating beam to the focus of the horizontal dipole trap.
Without the relay lens, we can not move the focus to the atom position regardless of the telescope length.

The #x532 lattice uses a polarization-maintaining photonic crystal fiber#footnote[
  NKT Photonics LMA-PM-15
] to guide the light from the optical table to the experimental table.
Compared to a regular fiber, the photonic crystal fiber is more suitable for high-power applications due to the larger mode volume.
The initial waist of the collimated beam is $w_0 approx #qty[700][μm]$.
For the optical isolation, we are using the Faraday medium from a commercially available optical isolator#footnote[
  Newport ISO-04-532-MP (#TGG)
] and two separate PBSs.
The built-in PBSs of the optical isolator showed a significant contribution to the thermal lensing, most likely due to the optical material and a lack of optical contacting.
The input PBS is rotated by $#num[45]degree$, which allows the output PBS to be parallel to the optical table.
Behind the output PBS, we use the transmission of a backside-polished mirror for the power regulation.
The subsequent telescopes prepare the correct beam shape for the #x532 lattice.
The first telescope uses cylindrical lenses for a vertical expansion of the beam by a factor $3$.
At the position of the atoms, this will translate to an aspect ratio of $1:3$ between the vertical waist and the horizontal waist.
In the second telescope, the overall beam size is reduced by a factor $2.5$.
The resulting horizontal beam waist is approximately #qty[350][μm], which is required to achieve a waist of #qty[120][μm] at the position of the atoms.
Similar to the #x1064 lattice, the horizontal axis shows a strong divergence up to the forward lens.
However, we decided against a relay lens since the intensity of the #x532 lattice mainly depends on the position of the vertical focus.
The details about the positioning of the separate foci are discussed in @ssec:super-stability-x532.
Behind the second telescope are two mirrors in motorized mirror mounts#footnote[
  Newport NewFocus 8821
] for the alignment of the forward-propagating #x532\-lattice beam onto the atoms.
Due to the proximity of the mirror mounts compared to the distance to the forward lens, they are not suitable to shift the #x532\-lattice beam perpendicular to its optical axis.
This is relevant to match the wavefronts of the #x532 lattice and the #x1064 lattice at the position of the atoms.
To apply a horizontal and vertical shift to the #x532\-lattice beam, we are therefore using two #qty[10][mm] thick windows.
One window uses a static mirror mount, while the other window uses a piezo mirror mount#footnote[
  Newport Agilis#sym.trademark AG-M100L
] to allow an automated control of the relative wavefront angle.
Matching the wavefronts of the two lattices is essential for the phase-sensitive measurements presented in @sec:phase-measure.

The #x1064\-lattice beam and the #x532\-lattice beam are superimposed at the first dichroic mirror and focused onto the atoms by the forward lens#footnote[
  LENS-Optics achromatic doublet (#CAF2 + #NBALF4)
] with the focal length $f = #qty[250][mm]$.
To avoid a normal incidence on the glass cell, the lattice beams are off-center with respect to the optical axis of the forward lens.
The angle of incidence is approximately $#num[2]degree$ in the $x y$ plane and in the $x z$ plane relative to the normal vector of the glass cell.
This avoids an overlap of the lattice beams with the reflections off the glass cell, which would lead to additional interference patterns @cocchi_analogue_2016 @miller_ultracold_2016.
The distance from the forward lens to the atoms is determined by the horizontal dipole trap.
With a vertical waist of $w_z approx #qty[12][μm]$, it has a much shorter Rayleigh length than the optical lattices.
We can therefore use the focus of the horizontal dipole trap to infer the position of the atoms relative to the forward-propagating lattice beams.
With the retro-propagating lattice beams this is not possible, and we have to use an additional imaging system to find the correct retro-lens position.
For an optimal overlap of the forward-propagating and retro-propagating lattice beams, the retro lens and the retro mirror have to be in a $4f$-configuration.
Otherwise, the divergence of the collimated lattice beams behind the retro lens causes focal shifts compared to the forward-propagating beams.
For the fine tuning of the retro-lens position, we are using two imaging systems that measure the transmission of the lattice beams behind the dichroic mirrors around the glass cell.
The beam-profiling imaging systems are also set up in a $4f$-configuration using another lens with the focal length $f = #qty[250][mm]$ and a camera at the virtual atom position.
We can infer the center of the glass cell by looking for the outer surfaces of the glass cell.
This measurement has an uncertainty of $sigma approx #qty[1][mm]$, which is negligible compared to the Rayleigh lengths of the lattice beams.

#floating-figure(
  image("figures/superlattice_setup.png"),
  caption: [
    Experimental setup of the in-plane superlattice.
    The setup shows all relevant optics on the experimental table.
    To improve the visibility, the beam diameters are scaled up, and the distances are not to scale.
    Around the glass cell, the optical elements are shared with the imaging setup along the $x$ axis (see @ssec:setup-sequence-detect) and the horizontal dipole trap (see @sec:setup-prepare-dipole).
    The imaging light with the wavelength $lambda_"D2" = #qty[766.7][nm]$ is transmitted by the dichroic mirrors around the glass cell.
    The forward lens and the retro lens have an anti-reflection coating designed for the wavelengths #qty[532][nm], #qty[766.7][nm] and #qty[1064][nm], just like the outer surfaces of the glass cell.
    The inner surfaces of the glass cell are uncoated, which results in a reflectivity of approximately #qty[4][%] at each inner surface.
    Between the relay lens and the following dichroic mirror, the horizontal dipole trap is overlapped with the #x1064 lattice using a PBS.

    #notes[
      // - Make sure the beams are off-center in the forward and retro lens
      // - Make sure the angle of the beams relative to the glass cell is obvious...
      - Indicate x-imaging path and horizontal dipole trap path?
      - Mention optical paths for the forward and retro beam-profiling cameras?
      - Add a legend for the lens properties?
      - Add the PBS to overlap the #x1064 lattice and the horizontal dipole trap?
      - Assign numbers/labels to the mirrors and lenses?
      - Reduce details in the caption?
      // - Add focal length of relay lens! (or all missing lenses in general...)
    ]
  ],
  label: <fig:super-setup>,
)


=== Replacement of optical elements  <ssec:super-setup-replace>

The optical setup of the #x1064 lattice initially used two telescopes with focal-length ratios of $1.75:1$ and $1.25:1$.
The total demagnification was therefore close to the ratio $2:1$ in the current setup.
One telescope was located directly behind the collimator, and the other telescope was located just before the alignment mirror @cocchi_analogue_2016 @miller_ultracold_2016.
The second telescope might have been used for a similar purpose as the relay lens in the current optical setup.
All four of the telescope lenses were made of #NBK7 and showed significant thermal lensing.
We therefore removed both telescopes and replaced them with the single telescope and the relay lens shown in @fig:super-setup.
All three lenses are made of #UVFS and do not show any measurable contribution to the thermal lensing.
The only remaining optical element that causes thermal lensing is the optical isolator.
Since the optical isolator already uses #TGG as the Faraday medium, there is no readily available replacement with a better Faraday medium.
The only option for a reduction of the thermal lensing would have been a shorter optical isolator with a stronger magnetic field.
Since the thermal lensing in the #x1064\-lattice setup was already sufficiently small, we decided against pursuing any further improvements.

In the #x532\-lattice setup, we initially replaced the collimated lens to increase the collimated beam size by the factor $2$ in an attempt to reduce the thermal lensing.
Correspondingly, we replaced the second lens of the spherical telescope by the equivalent achromatic doublet with the focal length $f = #qty[50][mm]$.
We only understood the lack of improvement after the thermal-lensing simulation presented in @ssec:super-thermal-simulation.
Nevertheless, we kept the larger collimated beam for the lower divergence up to the telescopes.
After identifying the individual thermal-lensing contribution of the optical elements in the #x532\-lattice setup, we replaced the four telescope lenses, the optical isolator and the PBS.
The cylindrical telescope was composed of two #NBK7 lenses, which we replaced by their equivalent #UVFS lenses.
The spherical telescope used two cemented achromatic doublets made of #NBK7 + #NSF5 and #NBAF10 + #NSF6HT and respectively.
Neither achromatic doublet was actually required given the small beam diameter, and we replaced both doublets with singlet lenses made of #UVFS.
The original optical isolator#footnote[
  Conoptics M712A (Kigre M-18 glass)
] showed the greatest individual contribution to the thermal lensing of all optical elements in the #x532\-lattice setup.
We decided to replace it with a shorter optical isolator using a Faraday medium made of #TGG#footnote[
  We do not know the absorption coefficient at #qty[532][nm] and the thermal conductivity $k_T$ of Kigre M-18 glass and can therefore not estimate the strength of the thermal lensing compared to #TGG.
].
With the new optical isolator, the Faraday medium and each PBS contributed equally to the thermal lensing.
We therefore removed the built-in PBSs and replaced them by optically-contacted PBSs made of #UVFS.
This leaves the Faraday medium as the last optical element that causes a small thermal lensing in the #x532\-lattice setup.
As presented in @ssec:super-stability-x532, we are able to find a beam configuration where the thermal lensing in the #x532 lattice is effectively zero.

After upgrading the individual optical setups of the #x532 lattice and the #x1064 lattice, we could still observe a substantial thermal lensing contribution from the retro lens#footnote[
  CVI Melles Griot YAP-250.0-50.0 (#NBK7 + #NSF11)
] in the shared optical path.
The original retro lens was an achromatic triplet optimized for the wavelengths #qty[532][nm] and #qty[1064][nm].
While the triplet was air-spaced, the material composition was bad according to the thermal-lensing properties discussed in @sec:super-thermal.
Compared to the optical elements in the individual paths, we could observe a crosstalk between the two lattices since the beams are superimposed at the retro lens.
This prompted us to replace the retro lens by the same model as the forward lens, where we could not observe any thermal lensing.
Compared to #NBK7 and #NSF11, the optical materials #CAF2 and #NBALF4 have better thermal-lensing properties.
Besides the focal shift of the lattice beams, the replacement of the retro lens also significantly improved the stability of the superlattice phase (see @ssec:phase-stability-result).
