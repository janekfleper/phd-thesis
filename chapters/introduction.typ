#import "/header.typ": *

#show heading.where(level: 2): set heading(numbering: none)


= Introduction <ch:intro>

// TODO: Mention K40 anywhere in the actual introduction?
// TODO: Add a few more citations for bichromatic superlattices
// TODO: Add citation for Valentins PhD thesis
// TODO: Add a comparison of optical lattices to tweezers?

The first experimental realization of degenerate Fermi gases using ultracold atoms @demarco_onset_1999 @truscott_observation_2001 was the spark that ignited an entirely new research area.
Many years after the development of the quantum-statistical description of fermionic particles @fermi_zur_1926 @dirac_theory_1926 and shortly after the prediction that neutral-atom Fermi gases would be a suitable platform for studying many-body phenomena such as superfluidity @stoof_superfluidity_1996 @baranov_critical_1998 or suppression of collisions @ferrari_collisional_1999, the necessary phase-space densities were achieved through significant advancements in trapping and cooling techniques.
The development of laser cooling @hansch_cooling_1975 @ashkin_cooling_1979 laid the foundation for the Zeeman slower @phillips_laser_1982 and the magneto-optical trap @raab_trapping_1987 that cool atoms down to sub-millikelvin temperatures.
To reach quantum degeneracy, a further reduction of the temperature was achieved using evaporative cooling @hess_evaporative_1986 in a magnetic trap @pritchard_cooling_1983 @mewes_bose-einstein_1996.
At very low temperatures, thermalization of the atoms is hindered by Pauli blocking, which prevents s-wave scattering of atoms in the same hyperfine state.
This limitation was overcome using a two-component Fermi gas @demarco_measurement_1999 or via sympathetic cooling with a Bose-Einstein condensate @timmermans_superfluidity_1998.
Since their initial realization, degenerate Fermi gases have been used to study many-body phenomena, such as the BEC-BCS crossover @link_machine_2023 and the excitation of collective modes @behrle_higgs_2018.

One major area of interest in ultracold fermionic atoms is analog quantum simulation of the Fermi-Hubbard model, which describes the behavior of electrons in solid-state crystals @hubbard_electron_1963.
Optical lattices, formed by multiple interfering laser beams, create a periodic potential that replaces the crystal lattice, and the atoms in the optical lattice take on the role of the valence electrons in the solid-state crystal @hofstetter_high-temperature_2002.
Due to their fermionic nature, the atoms obey the same quantum statistics as electrons.
This makes fermionic atoms in optical lattices a suitable platform for studying many-body phenomena, such as d-wave superconductivity @anderson_resonating_1987, which has been proposed to be related to high-temperature superconductivity observed in cuprates @bednorz_possible_1986.
According to the Fermi-Hubbard model, atoms can tunnel between lattice sites, experiencing an interaction energy when they occupy the same lattice site.
Despite its simple expression, numerical solutions to the Fermi-Hubbard model are generally limited to small systems due to the exponential growth of the Hilbert space with respect to the number of particles @feynman_simulating_1982.
This is where analog quantum simulation of the Fermi-Hubbard model using ultracold atoms shines.
The tunneling amplitude can be adjusted by changing the depth of the optical lattices, and the interaction between the atoms can be modified using magnetic Feshbach resonances @inouye_observation_1998.
This tunability is the key to explore different phases of the Fermi-Hubbard model, such as the Mott insulator @jordens_mott_2008 with antiferromagnetic correlations @mazurenko_cold-atom_2017 or molecules of fermionic atoms @stoferle_molecules_2006.

The most common type of optical lattice uses a laser beam reflected onto itself to create a standing-wave potential @greiner_exploring_2001.
In this configuration, the phase of the optical lattice is fixed by the retro-reflecting mirror and accumulates along the optical path from the mirror to the atoms.
Using two counterpropagating laser beams with different frequencies allows the optical lattice to act as a conveyor belt, transporting atoms over macroscopic distances @schrader_optical_2001 @matthies_long-distance_2024.
Another type of dynamic optical lattice is the accordion lattice, which is based on the shallow-angle interference of two laser beams @fallani_bose-einstein_2005.
By varying the angle of intersection, the spatial period of the optical lattice can be adjusted.
This technique has been used to improve the loading of atoms into a single plane of an optical lattice @ville_loading_2017 and the single-site detection of atoms in a two-dimensional optical lattice @su_fast_2025.

Advanced optical lattice geometries can be created with more than two interfering lattice beams @windpassinger_engineering_2013.
For example, three laser beams intersecting at #deg[120] angles in one plane form a hexagonal lattice structure resembling the geometry of graphene @becker_ultracold_2010.
Interfering perpendicular optical lattices can create adjustable lattice geometries tunable from a checkerboard pattern to an array of double wells and finally a regular two-dimensional lattice @tarruell_creating_2012.
This tunability was recently employed to significantly improve the temperature of an antiferromagnetic Mott insulator @xu_neutral-atom_2025.

Superimposing commensurate optical lattices forms a superlattice potential @folling_direct_2007.
The most common superlattice configuration uses two optical lattices with periods that differ by a factor of two.
While such an optical superlattice is typically implemented in a bichromatic configuration with equal beam paths and wavelengths differing by a factor of two @folling_direct_2007 @gall_competing_2021 @impertro_local_2024, it can also be realized with equal wavelengths and different intersection angles @wili_accordion_2023.
In addition to the two lattice depths, the superlattice potential depends on the relative phase of the two lattices.
By tuning the superlattice phase, the potential can be adjusted from coupled double wells to a staggered potential.
This enables control of superexchange interactions @trotzky_time-resolved_2008 and the implementation of a topological pump @lohse_thouless_2016 @nakajima_topological_2016.
Additionally, periodically modulating the superlattice phase enables the study of effective systems through Floquet engineering @weitenberg_tailoring_2021.
Floquet driving can be used for the dynamic localization of atoms @lignier_dynamical_2007 and the modification of magnetic correlations in double wells with strongly-repulsive interactions @gorg_enhancement_2018.

In bichromatic superlattices, an easily tunable phase is inevitably sensitive to environmental fluctuations.
Therefore, building an optical superlattice with a stable yet tunable phase requires significant technical effort.
Current approaches range from lattice setups with equal path lengths for intrinsic phase stability @li_high-powered_2021 to optical paths in an evacuated box to suppress environmental phase sensitivity @chalopin_optical_2024.
In this thesis, we present an active stabilization of the superlattice phase using environmental sensors.

All optical lattices, regardless of their geometry, require calibration of the lattice potential.
The most widespread technique involves modulating the lattice depth to probe the band structure of the optical lattice @friebel_co_1998.
The detection associated with the #lms is typically performed in momentum space using the band-mapping technique @kohl_fermionic_2005.
In a time-of-flight image, atoms excited to higher bands by the lattice modulation appear in a higher Brillouin zone.
While this allows for the measurement of the momentum-resolved band structure @heinze_multiband_2011, it is not beneficial for calibrating the lattice depth.
Rather than resolving the momentum of the atoms in the lattice potential, it would be more useful to resolve the lattice depth as a function of position.
In this thesis, we explore a lattice modulation technique that provides local resolution of the lattice potential, and we discuss suitable parameter regimes.


#pagebreak()

== Thesis structure

#set list(spacing: 1.3em)

In this thesis, I will present our work on ultracold fermions in a three-dimensional optical lattice.
The focus will be on calibrating and operating the optical lattices, which form the technical foundation of the experimental setup.
Specifically, I will report on the in-plane superlattice, which as been the focus of our experimental efforts in recent years.
#v(0.9em)

- In @ch:theory, I will introduce the atom-light interaction as the foundation of optical lattices with ultracold atoms.
  Using Bloch's theorem, I will show the band structure and the Bloch waves of atoms within regular and superlattice potentials.
  Within the unit cells of the superlattice potential, the dynamic behavior of the atoms can be described by a double-well potential.
  The reduced system size enables an exact numerical solution for interacting particles in a double well.

- In @ch:setup, I will present the experimental setup used to cool the fermionic isotope #K40 from room temperature to a degenerate Fermi gas.
  For reference in later chapters of this thesis, I will introduce the parameters and geometry of the three-dimensional optical lattice.
  Starting with loading the atoms into the optical lattice, I will briefly describe the experimental sequence.
  Available detection techniques for resolving the atomic densities in the experimental sequence are presented at the end of the chapter.

- In @ch:super, I will provide a detailed introduction to the optical setup of the in-plane superlattice.
  Due to thermally induced focal shifts by the optical elements, we observed significant instability in the optical lattices forming the in-plane superlattice.
  I will briefly introduce thermal lensing and discuss the possible modifications to the optical setup that could reduce the focal shifts.
  To conclude the chapter, I will show the improved stability of the lattice parameters in the upgraded optical setups.

- In @ch:mod, I will introduce the in-situ #lms that we developed to calibrate the lattice depths with spatial resolution.
  I will show the data analysis in detail as a benchmark for the calibration technique and discuss the atom-loss mechanism to devise parameter regimes for the in-situ #lms.
  At the end of the chapter, I will introduce the in-situ #lms in the superlattice potential, and I will investigate the radial potential of the superlattice.

- In @ch:phase, I will introduce the experimental control of the superlattice phase, followed by the in-situ detection of the superlattice phase.
  To ensure the reliable operation of the superlattice potential, we set up an active phase stabilization using environmental sensors.
  With the stabilized superlattice phase, we calibrate the double-well parameters and investigate Floquet driving of the superlattice potential to enhance pair tunneling.

- In @ch:outlook, I will reflect on the results of this thesis and discuss the applicability of the developed techniques to other experimental setups.
  Additionally, I will summarize possible improvements to the in-situ #lms and the active stabilization of the superlattice phase.
  Finally, I will discuss the next possible steps for the in-plane superlattice potential in the experimental setup.


== Individual contributions

The results presented in this thesis are the conclusion of four and a half years of working together with Nick Klemmer @klemmer_ultracold_2024 and Valentin Jonas on an experimental setup previously constructed and maintained by three generations of doctoral students @frohlich_strongly_2011 @feld_low_2011 @vogt_collective_2013 @miller_ultracold_2016 @cocchi_analogue_2016 @chan_quantum_2019 @gall_quantum_2020 @drewes_thermodynamics_2020 @wurz_quantum_2021.
We primarily focused on setting up and characterizing the in-plane superlattice, which we ultimately used to enhance the pair tunneling in Floquet-driven double wells.
Below, I will present detailed insights into the contributions of each team member.

Valentin Jonas and I contributed equally to the experimental work in @ch:super.
We conducted the initial characterization of the thermal lensing, identified the responsible optical elements, and upgraded the optical setups to achieve excellent stability of the optical lattices forming the in-plane superlattice.

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
I assisted with the software for the experimental control and the data analysis.


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

#show table: set text(10pt)
#show figure: set block(spacing: 0.9em)

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
    `0.9.6`,
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
