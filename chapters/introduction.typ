#import "/header.typ": *

#show heading.where(level: 2): set heading(numbering: none)


= Introduction <ch:intro>

#notes[
  - Mention strength of _many_ atoms in optical lattices (compared to tweezers)
  - Already mention the Feshbach resonances before the lattices? E.g. for the cooling?
  - Mention optical lattice with Photon BEC?
  - Quickly mention high-temperature superconductivity?
  - Mention detection of ultracold atoms in the optical lattices? Single-site resolution?
  - Mention #K40 earlier than the thesis structure?
]

The first experimental realization of degenerate Fermi gases using ultracold atoms @demarco_onset_1999 @truscott_observation_2001 #tr[provided the spark for a new research area/field].
Many years after the #tr[quantum-statistical] description of fermionic particles was developed @fermi_zur_1926 @dirac_theory_1926 and shortly after the prediction of neutral atoms as a suitable platform to study #tr[quantum-statistical phenomena] @stoof_superfluidity_1996 @baranov_critical_1998, the required phase-space densities were achieved after significant advancements #tr[in/of] trapping and cooling techniques.
The development of laser cooling was the foundation for the Zeeman slower @phillips_laser_1982 and the magneto-optical trap @raab_trapping_1987 to cool atoms down to #tr[sub-millikelvin] temperatures.
To reach quantum degeneracy, the temperature of the atoms need to be reduced further using evaporative cooling @hess_evaporative_1986 in a magnetic trap #tr[cite Ioffe (1962)] @pritchard_cooling_1983 @mewes_bose-einstein_1996.
Towards very low temperatures, the necessary thermalization of the atoms #tr[is/was] hindered by the Pauli blocking that prevents s-wave scattering of atoms in the same hyperfine state #tr[cite something?].
This limitation was overcome by using a two-component Fermi gas @demarco_measurement_1999 or via sympathetic cooling with a Bose-Einstein condensate @timmermans_superfluidity_1998.
Since its initial realization, the platform of degenerate Fermi gases has been used #tr[in/for] many interesting fields such as the BEC-BCS crossover #tr[cite what?] and #tr[mention something else...]

A major #tr[point of interest] for ultracold fermionic atoms is the analog quantum simulation of the Fermi-Hubbard #tr[Hamiltonian/model] that models the behavior of electrons in solid-state crystals @hubbard_electron_1963.
Optical lattices created by interfering multiple laser beams form a periodic potential in place of the crystal lattice, and the atoms in the optical lattice take on the role of the valence electrons in the solid-state crystal @jaksch_cold_1998 #tr[really cite the bosonic paper here? maybe use Hofstetter (2002) instead?].
Due to their fermionic nature, the atoms obey the same quantum statistics as the electrons and #tr[add some "connection" here...].
According to the Fermi-Hubbard model, the atoms can tunnel between lattice sites and they experience an interaction energy if they occupy the same lattice site.
If the system is in the tight-binding regime where the atoms are strongly localized to the lattice sites @slater_simplified_1954, the second quantization is used to specify many-body states by the occupation number #tr[of/on] each lattice site.
In this approximation, the Fermi-Hubbard model #tr[can be expressed] by a simple Hamiltonian using the fermionic creation and annihilation operators #tr[cite what?].
Nevertheless, numerical solutions of the Fermi-Hubbard model are generally limited to small systems due to the exponential growth of the Hilbert space #tr[cite what?].
This is where the analog quantum simulation of the Fermi-Hubbard model using ultracold atoms #tr[shines/comes in] #tr[cite Feynman (1982)?].
The tunneling amplitude can be tuned with the depth of the optical lattices, and the interaction between the atoms can be changed using magnetic Feshbach resonances @inouye_observation_1998 #tr[cite something with lattices].
This tunability is the key to explore different #tr[phases] of the Fermi-Hubbard model such as the Mott insulator @jordens_mott_2008 with antiferromagnetic correlations @mazurenko_cold-atom_2017 or bound pairs that undergo Bose-Einstein condensation #tr[cite what?].

The most common type of optical lattice uses a #tr[cat eye configuration/setup] where a laser beam is reflected onto itself to create a standing-wave potential #tr[cite anything?] from the interference of the counterpropagating beams.
In this configuration, the phase of the optical lattice is fixed #tr[at/to] the retro-reflecting mirror and accumulates #tr[along/in] the optical path from the retro-reflecting mirror to the atoms.
If two counterpropagating laser beams with different frequencies are used, the optical lattice can be used as a conveyor belt for the transport of atoms over macroscopic distances @schrader_optical_2001 @matthies_long-distance_2024.
The accordion lattice based on the shallow-angle interference of two laser beams is another type of dynamic optical lattice @fallani_bose-einstein_2005.
By varying the angle of intersection, the spatial period of the optical lattice can be tuned.
This technique has been applied to improve the loading of atoms into a single plane of an optical lattice @ville_loading_2017 and the single-site detection of atoms in a two-dimensional optical lattice @su_fast_2025.

// Really use the BEC + monochromatic lattice reference as an example for dynamic localization?
Advanced optical lattice geometries can be created with more than two interfering lattice beams @windpassinger_engineering_2013.
Three laser beams intersecting in one plane under an angle of #deg[120] form a hexagonal lattice structure that resembles the geometry of graphene @becker_ultracold_2010.
The interference of perpendicular optical lattices can be used to create adjustable lattice geometries that can be tuned from a checkerboard pattern to an array of double wells and, finally, a regular two-dimensional lattice @tarruell_creating_2012.
This tunability was recently used for significant improvements of the temperature in an antiferromagnetic Mott insulator @xu_neutral-atom_2025.

By superimposing commensurate optical lattices, a superlattice potential can be formed @folling_direct_2007.
The most widespread superlattice configuration uses two optical lattices with periods differing by the factor two.
While such an optical superlattice is typically implemented in a bichromatic configuration with equal beams paths and wavelengths differing by the factor two @gall_competing_2021 @impertro_local_2024 #tr[cite a few others here], it can also be realized with equal wavelengths and different intersection angles @wili_accordion_2023.
Besides the two lattice depths, the superlattice potential also depends on the relative phase of the two lattices.
With the superlattice phase the potential can be tuned from coupled double wells to a staggered potential,
which enables control of superexchange interactions @trotzky_time-resolved_2008 or the implementation of topological pump @lohse_thouless_2016 @nakajima_topological_2016.
Additionally, the superlattice phase can be periodically modulated to enable the study effective systems through Floquet engineering which are not accessible in a static superlattice @weitenberg_tailoring_2021.
Among other things, Floquet driving enables the dynamic localization of atoms @lignier_dynamical_2007 and the modification of magnetic correlations in double wells with strongly-repulsive interactions @gorg_enhancement_2018.

In bichromatic superlattices, an easily tunable phase is inevitably sensitive to environmental fluctuations.
Building an optical superlattice with a stable and tunable phase, therefore, requires a lot of technical effort.
Current approaches range from lattice setups with equal path lengths for an intrinsic phase stability @li_high-powered_2021 to optical paths in an evacuated box to suppress the environmental phase sensitivity @chalopin_optical_2024.
In this thesis, we explore an active stabilization of the superlattice phase based on environmental sensors.
#tr[something else to finish the paragraph?]

Something all optical lattices have in common, regardless of their geometry, is the requirement for a calibration measurement to quantify the lattice potential.
The most common technique uses a modulation of the lattice depth to probe the band structure in the optical lattice @friebel_co_1998.
The signal detection associated with the #lms is typically done in momentum space using the band-mapping technique @kohl_fermionic_2005.
In a time-of-flight image, the atoms that were excited to higher bands by the lattice modulation show up in a higher Brillouin zone.
While this allows a measurement of the momentum-resolved band structure @heinze_multiband_2011, it is not #tr[required] for the calibration of the lattice depth.
Instead of resolving the momentum of the atoms in the lattice potential, it would be more useful to resolve the lattice depth as a function of the position.
Due to the intensity profile of the underlying laser beams, optical lattices are generally inhomogeneous.
However, resolving the spatial profile of the lattice depth is not directly possible with the #lms since the atoms in the higher bands are still trapped in the lattice potential.
To overcome this limitation, we developed an atom-loss mechanism that enables a calibration of the lattice depth with a spatial resolution and we investigate the limitations of this in-situ calibration technique.


#pagebreak()

== Thesis structure

#set list(spacing: 1.3em)

In this thesis, I will present our work on ultracold fermions in a three-dimensional optical lattice.
The focus will be on the calibration and operation of the optical lattices as the technical foundation of the experimental setup.
In particular, I will report on the in-plane superlattice that was the center of attention of our experimental efforts in recent years.
#v(0.9em)

- In @ch:theory, I will introduce the atom-light interaction as the foundation of optical lattices for ultracold atoms.
  Using Bloch's theorem, I will show the band structure and the Bloch waves of atoms in regular lattice potentials as well as superlattice potentials.
  Within the unit cells of the superlattice potential, the dynamic behavior of the atoms can be described by a double-well potential.
  The reduced system size allows an exact numerical solution for interacting particles in a double well.

- In @ch:setup, I will present the experimental setup to cool the fermionic isotope #K40 from room temperature down to a degenerate Fermi gas.
  As a reference for the later chapters in this thesis, I will introduce the parameters and the geometry of three-dimensional optical lattice.
  Starting with the loading of the atoms into the optical lattices, I will briefly show the experimental sequence.
  The available detection techniques to resolve the atomic densities in the experimental sequence are presented at the end of the chapter.

- In @ch:super, I will provide a detailed introduction to the optical setup of the in-plane superlattice.
  Due to thermally-induced focal shifts by the optical elements, we found a significant instability of the optical lattices that form the in-plane superlattice.
  I will give a brief introduction to thermal lensing and I will discuss the possible modifications to the optical setup to reduce the focal shifts.
  To finish the chapter, I will show the improved stability of the lattice parameters in the upgraded optical setups.

- In @ch:mod, I will introduce the in-situ #lms that we developed for the calibration of the lattice depths with a spatial resolution.
  The data analysis is shown in detail as a benchmark for the calibration technique, and the atom-loss mechanism is discussed to devise parameter regimes for the in-situ #lms.
  At the end of the chapter, I will introduce the in-situ #lms in the superlattice potential and I will investigate the radial potential of the superlattice.

- In @ch:phase, I will introduce the experimental control of the superlattice phase, followed by in-situ detection of the superlattice phase.
  For a reliable operation of the superlattice potential we set up an active phase stabilization using environmental sensors.
  With the stabilized superlattice phase, we calibrate the double-well parameters, and we investigate the Floquet driving of the superlattice potential to enhance the pair tunneling.

- In @ch:outlook, I will reflect on the results of this thesis and the applicability of the developed techniques to other experimental setups.
  Additionally, I will summarize the possible improvements of the in-situ #lms and the active stabilization of the superlattice phase.
  To finish this thesis, I will discuss the next possible steps for the in-plane superlattice potential in the experimental setup.


== Individual contributions

The results presented in this thesis are the conclusion of four and a half years of working together with Nick Klemmer @klemmer_ultracold_2024 and Valentin Jonas #tr[already cite PhD thesis?] with an experimental setup that was previously built and maintained by three generations of doctoral students.
Our primary focus was the setup and characterization of the in-plane superlattice, which we ultimately used to enhance the pair tunneling in Floquet-driven double wells.
In the following, I will present detailed insights about the contributions by the individual team members.

Valentin Jonas and I contributed equally to the work in @ch:super.
We conducted the initial characterization of the thermal lensing, ran the investigation to find the responsible optical elements and, subsequently, upgraded the optical setups to achieve an excellent stability of the optical lattices that form the in-plane superlattice.

The in-situ #lms presented in @ch:mod is my own work.
I pushed for the initial experimental investigation as a calibration technique, I developed the data analysis for a robust calibration of the lattice depths, and I figured out the theory behind the atom-loss mechanism and the coupled band structure.
The improvements to the lattice alignment were developed by me in search for a robust and deterministic alignment procedure.
In the superlattice potential, I applied the in-situ technique to the existing calibration measurement, and I lead the investigation of the radial potential.

The experimental setup to control the superlattice phase in @ch:phase was a collective effort by Nick Klemmer, Valentin Jonas and me.
Nick Klemmer was responsible for the maintenance and upgrades of the laser setup, Valentin Jonas implemented the arbitrary waveform generator of the double-pass AOM for the infrared lattice, and I developed the software for the overall phase control.
I devised the initial phase-sensitive measurement and later developed the in-situ detection of the superlattice phase with Valentin Jonas.
The hardware and software for the active phase stabilization was set up by me.

For the Floquet driving of the superlattice potential, Valentin Jonas set up the modulation of the superlattice phase with the arbitrary waveform generator, and he implemented the Floquet theory that was essential for the evaluation of the experimental data.
Nick Klemmer was responsible for running the data analysis and the Monte-Carlo simulations for the error estimation.
I assisted with the software for the experimental control and the data analysis.


== Publications

We published the following journal article the course of this thesis:
#block(inset: (left: 0.9em), spacing: 0.9em)[
  #set par(justify: false)

  #text(
    stroke: black + 0.3pt,
  )[Flouqet-Driven Crossover from Density-Assisted Tunneling to Enhanced Pair Tunneling]\
  N. Klemmer#super[\*], J. Fleper#super[\*], V. Jonas, A. Sheihkan, C. Kollath, M. Köhl and A. Bergschneider\
  #link("https://doi.org/10.1103/PhysRevLett.133.253402", text(blue)[Phys. Rev. Lett. *133*, 253402 (2024)])

]

#super[\*]These authors contributed equally to this work.


#pagebreak()

== Software

Beyond the scope of this thesis, I initiated moving the data analysis from Matlab to Python, and I developed a package to streamline the evaluation pipeline from the initial loading of the images to the creation of figures.
This package implements, among other things, flexible grouping of experimental sequences, flagging of results based on monitoring data, and caching of intermediate results.
I continuously developed and improved the package throughout the years.

As an extension of the experimental control software, I developed a network-based microservice architecture.
The core element of this architecture is a server that replicates the experimental control software.
This control server provides software triggers for clients that need to be controlled based on the current experimental sequence.
Additionally, the control server makes the experimental sequence data, such as timings, variables and channel events, easily accessible.
This allows an easy extension of the experimental control by clients that control standalone devices or by clients that run automated data analysis processes.

This thesis is written in Typst #tr[cite GitHub repo] which is a modern typesetting language developed by a startup in Berlin.
The founders and original developers are Martin Haug and Laurenz Mädje who started working on Typst during their master's theses #tr[cite the theses here].
For inline styling, it relies on a syntax similar to Markdown #tr[cite something?].
Most features such as figures, captions, citations, equations, and many more are directly built into the Typst compiler.
Packages implementing advanced features and templates to streamline the creation of new documents can be found in the Typst Universe #tr[ref universe].
For this thesis, I used the packages `physica`, `mannot`, `headcount`, `CeTZ` and `fletcher`, as well as the VS code extension `tinymist`.
Additionally, I developed the package `fancy-units` and the template `fancy-thesis`, both of which are tailored to the requirements for this thesis.
The source code for this thesis will be publicly available at #tr[https://github.com/janekfleper/phd-thesis].
