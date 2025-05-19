#import "/header.typ": *

#let fdds = $f_"DDS"$
#let fbeat = $f_"beat"$

== Experimental setup <sec:phase-setup>

#[
  #set text(red)
  - Compare to the theory and setup sections that stuff is not mentioned twice...
  - Use a different letter for the _optical_ phase and the _superlattice_ phase?
  - Only introduces the lasers for the x-superlattice here?
  - Explain relock of the superlattice? And temperature feed-forward?
  - Where should I introduce the seed laser?
  - Also mention absolute frequency difference
]

This section builds upon @sec:setup-xy, @sec:super-setup and @sec:super-thermal where I already discussed the optical setup of the x1064-lattice and the x532-lattice in detail.
The superlattice along the x-axis uses a standing wave configuration where the retro-reflecting mirror is the reference point for the superlattice phase.
Compared to shallow-angle superlattices #text(red)[or other configurations] the optical phase of the forward-propagating lattice beams does not affect the phase $phi$ of the superlattice potential.
Instead we have to/can use the frequency of the lattice beams to modify the phase $phi$.
The propagation in the retro path with length $L$ will "convert" a frequency difference $Delta nu$ into the difference

$
  Delta phi = Delta k dot L = 2 pi (Delta nu) / c dot L
$ <eq:phase-setup-delta-phi>

This equation works for both the frequency/phase of the x1064-lattice as well as the x532-lattice.
The actual superlattice phase $phi$ will (always) be the difference of the phases of the two lattices at the position of the atoms.
As already discussed in #text(red)[ref some earlier section(s)], we are primarily interested in modifying the phase of the infrared/x1064-lattice.
If we would change/modify the phase of the green/x532-lattice, this would always move the atoms in space since the x532-lattice provides the positional reference for the superlattice potential.
The x1064-lattice phase on the other hand _only_ adjusts the balance? in the double well potentials with only minor changes to the atom positions.
At the position of the atom cloud the x532-lattice will therefore be the "reference" and the x1064-lattice is always moved relatively.
This hierarchy also translates to the laser system where we are using the pump laser (at #qty[1064][nm]) of the SHG cavity (that produces the green light for the x532-lattice) as the frequency reference.
The pump laser frequency $nu_"pump"$ itself is not actively stabilized since the passive stability of #qty[1][MHz/h] (#text(red)[check this!]) is sufficient for this application.
The frequency of the light for the x1064-lattice $nu_"x1064"$ is then changed/stabilized relative to the frequency of the pump laser.
If we would not have access to the pump laser of the x532-laser, the frequency stabilization would require a frequency-doubling of the laser for the x1064-lattice.
This implementation was used for the superlattice along the $z$-axis where the source for the green/z532-lattice is a Coherent Verdi V18 that only/directly emits light at #qty[532][nm] #text(red)[ref Nicola + Marcell].

#figure(
  image("/figures/phase-setup.png"),
  caption: [
    Flow diagram of the control of the superlattice phase $phi$.
    The optical frequencies are denoted by the character $nu$, where radio frequencies (and lower) are denoted by the character $f$.
    Both $nu_"pump"$ and $nu_1064$ are in the regime around #qty[1064][nm] #text(red)[use frequency here instead?], only detuned by a few #qty[100][MHz].
    The frequency $nu_"pump"$ is doubled in the SHG cavity (#text(red)[ref what?]) to obain the actual optical frequency $nu_532$.
    Both (optical) frequencies $nu_532$ and $nu_1064$ are shifted by AOMs with a center frequency of #qty[80][MHz].
    For the x532-lattice this is a single-pass AOM that is driven/powered by a static frequency source.
    For the x1064-lattice this is a double-pass AOM that is driven/powered by an arbitrary waveform generator#footnote[#text(red)[Spectrum Instrumentation]]

    #show list: set text(red)
    - Use different line types for optical and radio frequencies? Or use red, green (both optical) and black (RF) for the different line colors?
    - Find the proper blocks here for comparison, x2, addition etc...
    - Use #fbeat instead of $Delta nu$?
    - Add AOM in x532-lattice path.
    - How/where should I mention the DDS?
    - Where to mention double-pass for x1064-lattice?
    - Mention fiber amplifier for the x1064-lattice here?
  ],
) <fig:phase-setup>

The control of the frequency $nu_1064$ is based on two "stages", see @fig:phase-setup.
In the first stage a DDS board#footnote[#text(red)[Analog Devices AD9914?]] is used as the reference frequency #fdds for a phase lock between the seed laser of the x1064-lattice and the pump laser of the x532-lattice.
Note that an (optical) phase lock is not required for the superlattice phase stability, a (simple) frequency (offset) lock would be sufficient for this purpose.
We also used an offset lock in the beginning #text(red)[ref Nick Master thesis] before deciding to upgrade to the phase lock.
The primary reason was the "precision" of the control of the phase.
Since we are using the lock to directly change the superlattice phase while the atoms are loaded in the superlattice, we need the applied frequency changes to follow the reference frequency #fdds as close(ly) as possible.
#text(red)[When the offset lock is used for some frequency that is changed for a detection pulse (e.g. the cooler laser) later in the sequence, this lag/delay is not an issue.]
With the offset lock there was always a #text(red)[significant] delay where the error signal (of the lock) would "lag" behind the frequency #fdds.
We could therefore not reliably quantify the actual superlattice phase $phi$ relative to the setpoing given by #fdds.
With the phase lock we were able to overcome this issue since the maximum lag is limited to an #text(red)[electronic] phase of $pi slash 2$ between #fdds and $Delta nu = nu_1064 - nu_"pump"$.
The downsides of the phase lock (compared to the offset lock) are discussed in #text(red)[ref subsection relock?].

#text(red)[Add a figure for the lock schema?]
#text(red)[What are the actual band widths of the _slow_ and the _fast_ branch?]
The phase lock (error) signal is obtained by mixing the beat frequency #fbeat and the reference frequency #fdds on a photodiode.
The mixed/resulting signal is split up into a _fast_ branch and a _slow_ branch.
In the _slow_ branch the signal passes through a regular lock box before being applied to the piezo that determines the length of the external reference cavity of the x1064-lattice seed laser.
The _fast_ branch uses a Toptica FALC module (#text(red)[what is the actual name here?]) with a much higher (regulation) bandwidth than the lock box.
The output of the _fast_ branch is applied to the diode current of the x1064-lattice seed laser for a fast feedback to the frequency $nu_1064$ with small amplitudes $Delta nu = cal(O)(#qty[1][MHz])$.
The _slow_ signal is applied to the piezo that controls the length of the external cavity of the seed laser.
This allows us to change the seed laser frequency by $Delta nu = cal(O)(#qty[100][MHz])$
If the changes to the frequency #fdds are greater than #qty[1][MHz] and a rate of change faster than the band width of the piezo, we are required to apply the signal equivalent to $fdds(t)$ to the piezo in addition to the _slow_ error signal.
We have initially calibrated the factor #text(red)[$alpha = #qty[52][mV / MHz]$] and are creating/providing the appropriate voltage signal with an arbitrary waveform generator#footnote[#text(red)[Keysight 33622A?]].
