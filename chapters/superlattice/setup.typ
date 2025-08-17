#import "/header.typ": *

== Experimental setup <sec:super-setup>

#notes[
  - Call the section "Optical setup" instead?
  - Where to first mention the photonic crystal fiber?
  - What is the #x532 beam diameter/waist after the collimation lens?
  - Just skip the Ioffe bars here since they are not really relevant for the actual beam paths?
  - What to mention as the reference for the #x532\-lattice setup?
  - Just mention the material UVFS for all spherical lenses and polarizing beam splitters?
  - Explain the 4f-condition for the retro-propagating beams in detail?
  - Use depth-of-focus instead of Rayleigh lengths?
]

During the upgrade of the optical setup to #tr[eliminate/reduce] the thermal lensing, we have replaced many optical elements.
However, we did not change the beam positions of the #x1064 lattice and the #x532 lattice.
The overall geometry of the optical setup is therefore unchanged compared to @cocchi_analogue_2016 @miller_ultracold_2016.
In @fig:super-setup, the current version of the optical setup on the experimental table is shown in detail.
I will mention the specific replacements of optical elements to reduce the thermal lensing at the end of this section.

The #x1064 lattice uses a polarization-maintaining fiber to #tr[transport] the light from the optical table to the experimental table.
Behind the collimator, the #x1064\-lattice beam has a waist of $w_0 approx #qty[900][μm]$.
We use a $2:1$ telescope to #tr[further] reduce the size of the beam to $w_0 approx #qty[450][μm]$.
Even though the beam is supposed to be collimated, the small size results in a significant divergence of the beam up to the forward lens.
This required some additional optical engineering to achieve the correct beam shape at the position of the atoms.
Behind the telescope, the beam passes through an optical isolator#footnote[
  Conoptics M714 #tr[(TGG?)]
] to stop the retro-propagating beam from being reflected off the fiber tip #tr[cite anything for the optical lattices?].
This could result in an additional interference pattern at the position of the atoms on top of the regular optical lattice.
The polarization of the light transmitted by the optical isolator is rotated by $#num[45]degree$ compared to both #tr[s] and #tr[p] polarization.
With a #hwp and a PBS, we rotate and clean the beam polarization which is essential for the interference of the optical lattice.
The photodiode for the power monitoring (#tr[see @sec:setup-lattices?]) measures a reflection #tr[from/off] an #tr[AR]-coated wedge.
The last mirror in the isolated #x1064\-lattice setup has always been used for the fine tuning of the lattice alignment.
During the upgrade of the optical setup, we replaced the mechanical mirror mount with a piezo mirror mount#footnote[
  Newport Agilis#sym.trademark AG-M100N
] to enable an automatiation of the #x1064\-lattice alignment (see @ssec:mod-align-x1064).
Behind the alignment mirror, we use a _relay_ lens with the focal length $f = #qty[750][mm]$ to compensate the divergence of the beam #tr[since/behind] the telescope.
We determined the ideal position of the relay lens and the closest available focal length with a simulation of the propagation of a Gaussian beam in the optical setup.
With the relay lens, we can continuously shift the focus around the position of the atoms by changing the length of the telescope.
This allowed us to match the focus of the forward-propagating beam to the focus of the horizontal dipole trap.
If we adjust the telescope without the relay lens, we can only tune the focus of the #x1064\-lattice beam in the range from #qty[5][cm] to #qty[10][cm] behind the expected focal plane of the forward lens.
This is a direct consequence of the significant divergence due to the small size of the #x1064\-lattice beam.

#tr[What is the initial beam size?]
The #x532 lattice uses a polarization-maintaining photonic crystal fiber#footnote[
  NKT Photonics LMA-PM-15
] to #tr[transport] the light from the optical table to the experimental table.
Compared to a regular optical fiber, the photonic crystal fiber is more suitable for high-power applications #tr[cite anything? Maybe an NKT white paper?].
For the optical isolation, we are using the Faraday medium from a commercially available optical isolator#footnote[
  #tr[Newport ISO-04-532-MP (TGG)]
] and two separate PBSs.
The built-in PBSs of the optical isolator showed a significant contribution to the thermal lensing, most likely due to the optical material and a lack of optical contacting.
To avoid a third PBS for the polarization cleaning, we rotate the input PBS by $#num[45]degree$ while the output PBS is parallel to the optical table.
The #hwp before the input PBS is used to rotate the polarization for a maximum transmission.
Behind the last PBS, we are using the transmission of a backside-polished mirror for the power regulation.
The subsequent telescopes prepare the correct beam shape for the #x532 lattice.
The first telescope uses cylindrical lenses for a verical expansion of the beam by a factor $3$.
At the position of the atoms, this will translate to an aspect ratio of $1:3$ between the vertical waist and the horizontal waist.
In the second telescope, the overall beam size is reduced by a factor $2.5$.
The resulting horizontal beam waist is approximately #qty[350][μm], which is required to achieve a waist of #qty[120][μm] at the position of the atoms.
Similar to the #x1064 lattice, the horizontal axis shows a strong divergence up to the forward lens.
However, we decided against a relay lens since the intensity of the #x532 lattice mainly depends on the position of the vertical focus.
The details about the positioning of the separate foci are discussed in #tr[ref @sec:super-stability].
Behind the second telescope are two mirrors in motorized mirror mounts#footnote[
  Newport NewFocus 8821
] for the alignment of the forward-propagating #x532\-lattice beam onto the atoms.
Due to the proximity of the mirror mounts compared to the distance to the forward lens, they are not suitable to shift the #x532\-lattice beam perpendicular to #tr[the/its] optical axis.
This is relevant to match the wavefronts of the #x532 lattice and the #x1064 lattice at the position of the atoms.
To apply a horizontal and vertical shift to the #x532\-lattice beam, we are therefore using two #qty[10][mm] thick windows#footnote[
  EKSMA Optics UVFS window 220-1293E + AR532 coating
].
One window uses a static mirror mount, while the other window uses a piezo mirror mount#footnote[
  Newport Agilis#sym.trademark AG-M100L #tr[with limit switches for an absolute positioning]
] to allow an automated control of the wavefront angle.
Matching the wavefronts of the two lattices is part of the phase-sensitive measurements presented in @sec:phase-measure.

#tr[After/When] the #x1064\-lattice beam and the #x532\-lattice beam are superimposed with the dichroic mirror, any optical element always affects both beams equally.
We can no longer affect the alignment or the position of the individual beams.
The lattice beams are focused onto the atoms by the forward lens#footnote[
  #tr[LENS-Optics achromatic doublet with AR coating for #qty[532][nm], #qty[766.7][nm] and #qty[1064][nm]]
] with the focal length $f = #qty[250][mm]$.
To avoid a normal incidence on the glass cell, the lattice beams are off center with respect to the optical axis of the forward lens.
The angle of indicence is approximately $#num[2]degree$ in the $x y$ plane and in the $x z$ plane relative to the normal #tr[vector?] of the glass cell.
This avoids an overlap of the lattice beams with the reflections off the glass cell, which would lead to additional interference patterns @cocchi_analogue_2016 @miller_ultracold_2016.
The distance from the forward lens to the atoms is determined by the horizontal dipole trap.
With a vertical waist of $w_z approx #qty[12][μm]$, it has a much shorter Rayleigh length than the optical lattices.
We can therefore use the focus of the horizontal dipole trap to infer the position of the atoms relative to the forward-propagating lattice beams.
With the retro-propagating lattice beams this is not possible, and we have to use an additional imaging system to find the correct retro-lens position.
For an optimal overlap of the forward-propagating and retro-propagating lattice beams, the retro lens and the retro#tr[-reflecting] mirror have to be in a $4f$-configuration.
Otherwise, the divergence of the lattice beams will cause focal shifts compared to the forward-propagating beams.
Due to the small sizes of the collimated lattice beams, it is not sufficient to only set the correct distance between the atoms and the retro lens.
For the fine tuning of the retro-lens position, we are using two imaging systems that measure the transmission of the lattice beams behind the dichroic mirrors around the glass cell.
The imaging systems are also set up in a $4f$-configuration using another lens with the focal length $f = #qty[250][mm]$ and a camera at the virtual atom position.
We can infer the center of the glass cell by looking for the outer surfaces of the glass cell.
This measurement has an uncertainty of $sigma approx #qty[1][mm]$, which is negligible compared to the Rayleigh lengths of the lattice beams.

#tr[Move this to the @sec:super-stability?]
Besides the optimization of the foci, we also use the additional imaging systems to continuously track the lattice-beam profiles during the experimental sequence.
With an RGB camera#footnote[
  #tr[Basler acA2040-35gc]
], we can capture the #x1064\-lattice beam and the #x532\-lattice beam in the same image and #tr[compute/extract] the individual beam profiles during the evaluation.
In addition to the in-situ lattice modulation spectroscopy, the beam profiling at the #tr[virtual] atom position was an essential tool for the investigation of the thermal lensing.

#floating-figure(
  image("figures/superlattice_setup.png"),
  caption: [
    Experimental setup of the in-plane superlattice.
    The setup shows all relevant optics on the experimental table.
    To improve the visibility, the beam diameters are scaled up by the factor #tr[$3$], and the distances are not #tr[all] to scale.
    Around the glass cell, the optical elements are shared with the imaging setup along the $x$ axis (see @ssec:setup-sequence-detect) and the horizontal dipole trap (see @sec:setup-prepare-dipole).
    The imaging light with the wavelength $lambda_"D2" = #qty[766.7][nm]$ is transmitted by the dichroic mirrors around the glass cell.
    The forward lens and the retro lens have an #tr[AR]-coating designed for the wavelengths #qty[532][nm], #qty[766.7][nm] and #qty[1064][nm], just like the outer surfaces of the glass cell.
    The inner surfaces of the glass cell are uncoated, which leads to a loss of $approx #qty[4][%]$ at each #tr[surface/wall].
    Between the relay lens and the following dichroic mirror, the horizontal dipole trap is overlapped with the #x1064 lattice using a polarizing beam splitter.

    #notes[
      - Make sure the beams are off-center in the forward and retro lens
      - Make sure the angle of the beams relative to the glass cell is obvious...
      - Indicate x-imaging path and horizontal dipole trap path?
      - Mention optical paths for the forward and retro cameras and ref @fig:mod-align-x1064-walking
      - Add a legend for the lens properties?
      - Add the PBS to overlap the #x1064 lattice and the horizontal dipole trap?
      - Assign numbers/labels to the mirrors and lenses?
      - Reduce details in the caption?
      - Add focal length of relay lens! (or all missing lenses in general...)
    ]
  ],
  label: <fig:super-setup>,
)


=== Replaced optics <ssec:super-setup-replace>

#notes[
  - Really create a new subsection for the replacement stuff?
  - Mention any details about the identification of the "bad" optical elements with the camera?
]

The optical setup of the #x1064 lattice initially used two telescopes with focal-length ratios of $1.75:1$ and $1.25:1$.
The total demagnification was therefore close to the ratio $2:1$ in the current setup.
One telescope was located directly behind the collimator, and the other telescope was located just before the alignment mirror @cocchi_analogue_2016 @miller_ultracold_2016.
The second telescope could have been used for a similar purpose as the relay lens in the current optical setup.
All four telescope lenses were made from N-BK7 and showed significant thermal lensing.
