#import "/header.typ": *

// these rules are only applied in this file
#show heading.where(level: 2): set heading(numbering: none, outlined: false)
#set list(spacing: 0.9em)
#show table: set text(10pt)
#show figure: set block(spacing: 0.9em)

= Introduction <ch:intro>

// TODO: Add citation for Valentins PhD thesis
// TODO: Find a better citation for the radial trap frequencies...

One major area of interest in ultracold fermionic atoms is the analog quantum simulation of many-body physics.
In solid-state crystals, the behavior of electrons can be described by the Fermi-Hubbard model @hubbard_electron_1963.
The valence electrons can tunnel between the lattice sites that are formed by the ions in the crystal, and the electrons experience an interaction energy when they occupy the same lattice site.
For strongly-repulsive interactions, the Fermi-Hubbard model predicts the Mott-insulating phase where electrons are localized in the lattice and the occupation of a lattice site by multiple electrons is suppressed @mott_metal-insulator_1968.
In the context of high-temperature superconductivity @lee_doping_2006, the prediction of a d-wave superconducting phase @anderson_resonating_1987 is still debated.
Numerical solutions to the Fermi-Hubbard model are generally limited to small systems due to the exponential growth of the Hilbert space with respect to the number of particles @feynman_simulating_1982.
This is where analog quantum simulation of the Fermi-Hubbard model using optical lattices and ultracold atoms shines.
Due to their fermionic properties, the neutral atoms obey the same quantum-statistical behavior as electrons.
The corresponding energy scales for neutral atoms are realized at very low temperatures, which required significant advancements in trapping and cooling techniques.
The development of laser cooling @hansch_cooling_1975 @ashkin_cooling_1979 @phillips_laser_1982 @raab_trapping_1987 and evaporative cooling @hess_evaporative_1986 @pritchard_cooling_1983 @mewes_bose-einstein_1996 led to the first experimental realization of degenerate Fermi gases using ultracold atoms @demarco_onset_1999 @truscott_observation_2001.

Optical lattices, formed by multiple interfering laser beams, create a periodic potential in place of the solid-state crystal, and the atoms in the optical lattice take on the role of the valence electrons @jessen_optical_1996.
In contrast to solid-state crystals, optical lattices provide defect-free potentials with tunable parameters @bloch_ultracold_2005.
The tunneling amplitude can be adjusted through the depth of the optical lattices, and the interaction strength between the atoms can be modified using magnetic Feshbach resonances @inouye_observation_1998.
This tunability is the key to explore different phases of the Fermi-Hubbard model, such as the Mott insulator @jordens_mott_2008 with antiferromagnetic correlations @mazurenko_cold-atom_2017 or pairing of atoms in a system with strongly-attractive interactions @hartke_direct_2023.
The most common type of optical lattice uses two counterpropagating laser beams with equal frequencies to form a standing-wave potential @greiner_exploring_2001.
Using laser beams with different frequencies or phases results in a dynamic optical lattice such as an optical conveyor belt to transport atoms over macroscopic distances @schrader_optical_2001 @matthies_long-distance_2024.
Another type of dynamic optical lattice is the accordion lattice, which is based on the shallow-angle interference of two laser beams @fallani_bose-einstein_2005.
By varying the angle of intersection, the spatial period of the optical lattice can be adjusted.
This lattice configuration has been used to enable the loading of atoms into a single plane of an optical lattice @ville_loading_2017 and it provides the basis for a single-site detection technique in a two-dimensional optical lattice @su_fast_2025.

Advanced lattice geometries can be realized by interfering more than two laser beams @windpassinger_engineering_2013.
For example, three laser beams intersecting at #deg[120] angles in one plane form a triangular lattice resembling the geometry of graphene @becker_ultracold_2010.
The triangular geometry enables studying phenomena such as frustrated magnetism @eckardt_frustrated_2010.
A two-dimensional optical lattice that is tunable to a checkerboard, square, triangular, dimer and honeycomb geometry can be formed by three retro-reflected optical lattices with the same wavelengths @tarruell_creating_2012.
Two lattices are perpendicular with the same polarization such that they interfere to create a checkerboard lattice.
The third lattice is collinear with one of the other lattices with the opposite polarization and a small frequency detuning.
The different lattice geometries are realized by changing the lattice depths and the frequency detuning.
A honeycomb lattice can be used to engineer advanced band structures featuring Dirac points @hasan_topological_2010, and tuning the lattice geometry from a checkerboard pattern to a dimerized lattice enables an adiabatic splitting of a band insulator into a Mott insulator @lubasch_adiabatic_2011.
Recently, this technique was employed to achieve a significant improvement in the temperature of an antiferromagnetic Mott insulator @xu_neutral-atom_2025.

Overlapping two commensurate optical lattices forms a superlattice potential that can be adjusted from an array of coupled double wells to a staggered potential by varying the relative phase of the two lattices @windpassinger_engineering_2013.
The superlattice phase allows precise control over the energy offset in the double wells, which has been used for studying pair and density-assisted tunneling @folling_direct_2007, superexchange interactions @trotzky_time-resolved_2008, and the bilayer Hubbard model @gall_competing_2021.
Tuning the superlattice phase over multiple periods enables topological charge pumping where the atoms experience a quantized deflection in each pump cycle @lohse_thouless_2016 @nakajima_topological_2016.

While optical superlattices can be realized by two lattices with equal wavelengths and different intersection angles @wili_accordion_2023, they are typically implemented in a bichromatic configuration with equal beam paths and wavelengths differing by a factor of two @folling_direct_2007 @gall_competing_2021 @impertro_local_2024.
In a bichromatic superlattice with different path lengths for the interfering lattice beams, the superlattice phase can be tuned through the optical frequency of either lattice.
This enables a fast and precise control of the superlattice phase and, thereby, the energy offset in the double wells.
Precisely controlling the energy offset is essential in a superlattice configuration with balanced double wells, especially for attractively-interacting fermionic pairs that experience a high sensitivity to the energy offset.
Furthermore, a high-frequency modulation of the energy offset enables Floquet engineering for studying effective systems @weitenberg_tailoring_2021.
Floquet-driven optical lattices have been used to realize the dynamic localization of atoms @lignier_dynamical_2007 and to modify magnetic correlations in double wells with strongly-repulsive interactions @gorg_enhancement_2018.

In bichromatic superlattices, the tunability and environmental sensitivity of the superlattice phase are inevitably linked.
The optical path lengths of the individual lattices are sensitive to changes of the refractive indices in air and the optical elements.
Therefore, constructing a bichromatic superlattice with a stable yet tunable phase requires significant technical effort.
Current experimental setups range from equal path lengths for an intrinsic phase stability @li_high-powered_2021 to optical paths in an evacuated box to suppress environmental phase sensitivity @chalopin_optical_2024.

All optical lattices, regardless of their geometry, require calibration of the lattice depth and the inhomogeneity due to the intensity profiles of the underlying Gaussian laser beams.
The Hubbard parameters depend on the depth of the optical lattice, and the inhomogeneity determines the confinement of the atoms in the lattice potential.
The most commonly used technique to calibrate the lattice depth involves modulating the optical lattice to probe the band structure @friebel_co_1998, followed by detecting the occupation of the energy bands in momentum space using the band-mapping technique @kohl_fermionic_2005.
The inhomogeneity of the lattice potential is typically calibrated through the radial trap frequencies analogous to optical dipole traps @grimm_optical_2000.

In this thesis, I will present our work on ultracold fermions in a three-dimensional optical lattice, focusing on the stability of the in-plane, bichromatic superlattice to study pair-tunneling dynamics.
For the precise calibration of the optical lattices, we develop a modulation technique that spatially resolves the lattice depths.
This enables a reliable alignment of the lattice beams and a precise calibration of the lattice parameters, which we use to investigate and minimize thermally-induced drifts of the lattice depths.
For the phase of the in-plane superlattice, we implement an active stabilization technique based on environmental sensors along the optical path.
We achieve an excellent phase stability that provides the foundation for studying the enhancement of pair tunneling in Floquet-driven double wells.

#v(0.9em)

- In @ch:theory, I will introduce the experimental principles of ultracold atoms in optical lattices with a focus on superlattice potentials and the dynamics of interacting particles in a double well as the unit cell of the superlattice potential.

- In @ch:setup, I will present the experimental setup used to cool the fermionic isotope #K40 from room temperature to a degenerate Fermi gas.
  Starting with loading the atoms into the optical lattice, I will briefly describe the experimental sequence and the available detection techniques for resolving the atomic densities.

- In @ch:super, I will present the optical setup of the in-plane superlattice and discuss the thermally-induced focal shifts of the optical lattices.
  We observed significant drifts in the optical lattices forming the in-plane superlattice and upgraded the optical setup to improve the stability of the lattice potentials.

- In @ch:mod, I will introduce the in-situ #lms that we developed to calibrate the lattice depths with spatial resolution.
  This technique is essential for the operation of the optical lattices from aligning the lattice beams to calibrating the Hubbard parameters and the confinement in the optical lattices.

- In @ch:phase, I will introduce the control and in-situ detection of the superlattice phase.
  To ensure the reliable operation of the superlattice potential, we set up an active phase stabilization using environmental sensors.
  Using the superlattice phase, we calibrate the lattice parameters and implement Floquet driving to enhance pair tunneling.

- In @ch:outlook, I will summarize the main results of thesis and discuss the applicability of the developed techniques to other experimental setups.
  Besides improvements to the in-situ #lms and the active stabilization of the superlattice phase, I will discuss possible projects using the in-plane superlattice potential.


== Individual contributions

The results presented in this thesis are the conclusion of four and a half years of working together with Nick Klemmer @klemmer_ultracold_2024 and Valentin Jonas on an experimental setup previously constructed and maintained by three generations of doctoral students @frohlich_strongly_2011 @feld_low_2011 @vogt_collective_2013 @miller_ultracold_2016 @cocchi_analogue_2016 @chan_quantum_2019 @gall_quantum_2020 @drewes_thermodynamics_2020 @wurz_quantum_2021.
We primarily focused on setting up and characterizing the in-plane superlattice, which we ultimately used to enhance the pair tunneling in Floquet-driven double wells.
Below, I will present detailed insights into the contributions of each team member.

The upgrade of the optical setups of the in-plane superlattice in @ch:super was led by me, while Valentin Jonas and I contributed equally to the experimental work.
We characterized the thermal lensing, identified the responsible optical elements, and upgraded the optical setups to achieve excellent stability of the optical lattices forming the in-plane superlattice.

The in-situ #lms presented in @ch:mod is my own work.
I pushed for the initial experimental investigation as a calibration technique, developed the data analysis for the robust calibration of the lattice depths, and figured out the theory behind the atom-loss mechanism and the coupled band structure.
I developed the improvements to the lattice alignment in search of a robust and deterministic alignment procedure.
Regarding the superlattice potential, I applied the in-situ technique to the existing calibration measurement and led the investigation of the radial potential.

The experimental setup for controlling the superlattice phase described in @ch:phase was a collaborative effort between Nick Klemmer, Valentin Jonas, and me.
Nick Klemmer maintained and upgraded the laser setup, Valentin Jonas implemented the arbitrary waveform generator of the double-pass AOM for the infrared lattice, and I developed the software for the overall phase control.
I devised the initial phase-sensitive measurement and later developed the in-situ superlattice phase detection with Valentin Jonas.
I set up the hardware and software for the active phase stabilization.

For the Floquet driving of the superlattice potential, Valentin Jonas set up the modulation of the superlattice phase with the arbitrary waveform generator and implemented the Floquet theory that was essential for the evaluation of the experimental data.
Nick Klemmer was responsible for running the data analysis and the Monte-Carlo simulations for the error estimation.
My main contribution was the development of the calibration measurements for the parameters of the optical lattices and the stabilization of the superlattice phase.
Additionally, I assisted with the software for the experimental control and the data analysis.


== Publications

We published the following journal article the course of this thesis:
#block(inset: (left: 0.9em), spacing: 0.9em)[
  #set par(justify: false)

  #text(
    stroke: black + 0.3pt,
  )[Floquet-Driven Crossover from Density-Assisted Tunneling to Enhanced Pair Tunneling]\
  N. Klemmer#super[\*], J. Fleper#super[\*], V. Jonas, A. Sheihkan, C. Kollath, M. Köhl and A. Bergschneider\
  #link("https://doi.org/10.1103/PhysRevLett.133.253402", text(blue)[Phys. Rev. Lett. *133*, 253402 (2024)])

]

#super[\*]These authors contributed equally to this work.


#pagebreak()

== Software

Outside the scope of this thesis, I initiated moving the data analysis from Matlab to Python and developed a package to streamline the evaluation pipeline, from the initial image loading to the creation of figures.
This package implements flexible grouping of experimental sequences, flagging of results based on monitoring data, and caching of intermediate results, among other things.
I have continuously developed and improved the package over the years.

As an extension of the experimental control software, I developed a network-based microservice architecture.
The core element of this architecture is a server that replicates the experimental control software.
The control server provides software triggers for clients that need to be controlled based on the current experimental sequence.
Additionally, the control server makes experimental sequence data, such as timings, variables, and channel events, easily accessible.
This allows clients that control standalone devices or run automated data analysis processes to easily extend the experimental control.

This thesis is written in Typst @madje_typst_2023, a modern typesetting language developed by Martin Haug @haug_fast_2022 and Laurenz Mädje @madje_programmable_2022.
Typst uses a markup-based syntax for the simple document styling and integrates a scripting language for complex document modifications and user-defined functions.
Essential features, such as figures, captions, citations, and equations, are built directly into the Typst compiler.
Packages that implement advanced features and templates to streamline the creation of new documents can be found in the Typst Universe.
The following software was used to write this thesis:

// TODO: Make sure all the package versions are up to date!
// TODO: Add mpl2typ here...

#figure(
  table(
    columns: 3,
    stroke: none,
    table.header("Name", "Version", "Description"),
    table.hline(y: 1),
    table.vline(x: 1),
    table.vline(x: 2),

    link("https://github.com/typst/typst")[`typst`],
    `0.14.0`,
    [
      A markup-based typesetting system that is powerful and easy to learn.
    ],

    link("https://github.com/Myriad-Dreamin/tinymist")[`tinymist`],
    `0.13.30`,
    [
      An integrated language service for Typst.
    ],

    link("https://github.com/Automattic/harper")[`harper`],
    `0.70.0`,
    [
      Offline, privacy-first grammar checker. Fast, open-source, Rust-powered.
    ],

    link("https://typst.app/universe/package/physica")[`physica`],
    `0.9.7`,
    [
      Math constructs for science and engineering: derivative, differential, vector field, matrix, tensor, Dirac braket, hbar, transpose, conjugate, many operators, and more.
    ],

    link("https://typst.app/universe/package/mannot")[`mannot`],
    `0.3.0`,
    [
      A package for marking and annotating in math blocks.
    ],

    link("https://typst.app/universe/package/headcount")[`headcount`],
    `0.1.0`,
    [
      Make counters inherit from the heading counter.
    ],

    link("https://typst.app/universe/package/cetz")[`CeTZ`],
    `0.4.2`,
    [
      Drawing with Typst made easy, providing an API inspired by TikZ and Processing. Includes modules for plotting, charts and tree layout.
    ],

    link("https://typst.app/universe/package/fletcher")[`fletcher`],
    `0.5.8`,
    [
      Draw diagrams with nodes and arrows.
    ],

    link("https://github.com/janekfleper/typst-fancy-units")[`fancy-units`] + super[\*],
    `0.2.0`,
    [
      Format numbers and units with style.
    ],

    link("https://github.com/janekfleper/typst-fancy-thesis")[`fancy-thesis`] + super[\*],
    `0.1.0`,
    [
      A simple yet powerful template for your thesis.
    ],
  )
    + align(left)[#super[\*]These packages are developed by myself.],
  numbering: none,
)

After the thesis is published, the source code will be publicly available on GitHub @fleper_ultracold_2025.
