#import "/header.typ": *
#import "figures/figures.typ": control-diagram

== Experimental setup <sec:phase-setup>

#notes[
  - Compare to the theory and setup sections that stuff is not mentioned twice...
  - Use a different letter for the _optical_ phase and the _superlattice_ phase?
  - Explain relock of the superlattice? And temperature feed-forward?
  - Where should I introduce the seed laser?
  - Mention the difference for the phase lock when using the #x1064\-lattice amplifier?
  - Mention the size of the cloud compared to the retro path length...
  - Introduce abbreviation for acousto-optical modulator (AOM)?
  - Where to introduce the abbreviation RF (radio frequency)?
]

The standing-wave configuration of the #x1064 lattice and the #x532 lattice limits the sensitivity of the superlattice phase $phi$ to the retro path shown in @fig:super-setup.
The retro mirror is the reference point from #tr[where/which] the superlattice phase accumulates along the optical path up to the atom position.
The #tr[optical] phase of the forward-propagating beams does therefore not affect the individual lattice potentials.
Instead, we have to use the frequency of the individual lattices to tune the superlattice phase.
#tr[A/The] frequency difference $Delta nu$ results in the phase difference

$
  Delta phi = Delta k dot L = 2 pi (Delta nu) / c dot L
$ <eq:phase-setup-delta-phi>

where $L$ is the distance from the retro mirror to the atom position in @fig:super-setup.
While @eq:phase-setup-delta-phi can be applied to both lattices, we are primarily interested in changing the phase of the #x1064 lattice (see @sec:theory-super).
Changing the phase of either lattice will affect the superlattice potential and the resulting band structure.
However, the phase of the #x532 lattice will also affect the positions of the sublattice sites.
We are therefore only changing the #x1064\-lattice phase to modify the superlattice potential.
If the #x532\-lattice phase is constant, we can directly use @eq:phase-setup-delta-phi to describe changes of the superlattice phase.
With $L approx #qty[50][cm]$, the frequency difference corresponding to the phase $Delta phi = pi slash 2$ is $Delta nu approx #qty[150][MHz]$.
While the formal superlattice period according to @eq:theory-super-potential is $Delta phi = pi$, the band structure already repeats itself every $Delta phi = pi slash 2$.
#tr[Add some "transition" to the reference of the measurement?] The measurement of the superlattice period is discussed in detail in #tr[@sssec:phase-measure-resolve-period].

#floating-figure(
  control-diagram(),
  caption: [
    Control diagram of the superlattice phase $phi$.
    The optical frequency of the pump laser and the #x1064\-lattice seed laser is approximately #qty[281.6][THz].
    For the phase lock, the two lasers are detuned by a few #qty[100][MHz].
    The maximum frequency difference is limited to #qty[1.4][GHz] by the DDS.
    A tiny fraction of the #x532\-lattice pump beam and the amplified #x1064\-lattice beam are overlapped on a photodiode.
    The resulting beat is mixed with the reference signal from the DDS to yield the error signal for the fast and slow feedback loops.

    #notes[
      - Find the proper blocks here for comparison, x2, addition etc...
      - Replace the amplifier by the "buffer" triangle...
      - Use $f_"beat"$ instead of $Delta nu$?
      - Add #fdds to the DDS line...
      - Where to mention double-pass for #x1064\-lattice?
      - Add static frequency #qty[80][MHz] for the #x532\-lattice AOM.
      - Anything to add to the caption?
      - Mention second harmonic generation (SHG) again?
    ]
  ],
  label: <fig:phase-setup>,
)

In the experimental setup, we control the superlattice phase with the frequency difference $Delta nu$ between the seed laser of the #x1064 lattice and the pump laser of the #x532 lattice (see @ssec:setup-lattices-xy).
The pump laser is not actively stabilized since its passive frequency stability is sufficient for the superlattice potential#footnote[
  The frequency drift at constant room temperature is specified to be #qty[1][MHz/min].
].
An absolute frequency control would only be required to stabilize the #tr[phase/position] of the individual lattices.
In @fig:phase-setup, the setup to control the superlattice phase $phi$ with the frequency difference $Delta nu = nu_"pump" - nu_x1064$ is shown.
We use an optical phase locked loop (OPLL) to stabilize the frequency $nu_x1064$ relative to the frequency $nu_"pump"$ #tr[cite Telle (1990)].
While we do not need the phases of the forward-propagating lattice beams to be locked in the standing-wave configuration, we observed a significantly better control compared to a frequency offset lock #tr[cite Nick Master thesis].
We measure the beat frequency $Delta nu$ on a photodiode and mix it with the output of a direct digital synthesis (DDS) board#footnote[
  Analog Devices AD9914 Evaluation Board
].
The mixer output signal is sensitive to the phase between the photodiode signal and the DDS signal and can be used as the error signal for the fast and slow feedback loops.
In the fast feedback branch, we use a PID regulator#footnote[
  Toptica Fast Analog Linewidth Control (FALC) 110
] to apply a feedback signal to the laser-diode current of the #x1064\-lattice laser.
The output signal of the PID regulator in the slow feedback branch is applied to the piezo actuator that controls the length of the external cavity of the #x1064\-lattice laser.
While the fast feedback has a very high regulation bandwidth of several #qty[10][MHz], it can only address frequency changes $Delta nu < #qty[1][MHz]$.
To cover the entire superlattice period of #qty[150][MHz], we therefore need to use the slow feedback with a regulation bandwidth of a few #unit[kHz].
With the DDS board, we can use the digital ramp generator to drive linear ramps between the frequencies $f_"low"$ and $f_"high"$.
For rapid changes of the DDS frequency by more than #qty[1][MHz], we apply an auxiliary signal from an arbitrary waveform generator#footnote[
  Keysight 33622A
] to the piezo actuator that matches the expected output of the slow PID regulator.
This keeps the beat frequency $Delta nu$ within #qty[1][MHz] of the DDS frequency where the fast feedback loop can remain active.

In addition to the phase locked loop to stabilize the frequency difference $Delta nu$ between the two infrared lasers, each lattice setup features an acousto-optical modulator that changes the optical frequency of the lattice beams.
The acousto-optical modulators are primarily used for the power regulation to #tr[follow] the lattice depths #Vx1064 and #Vx532 as programmed in the experimental sequence (see @sec:setup-lattices).
In the #x532\-lattice setup, the AOM is #tr[driven/powered] at the constant radio frequency #qty[80][MHz] in a single-pass configuration.
The AOM in the #x1064 lattice is set up in a double-pass configuration to allow a variation of the driving frequency without affecting the fiber-coupling efficiency.
Since the AOM is located behind the photodiode of the phase locked loop, we can change the superlattice phase without the restrictions of the two feedback loops.
The center frequency of the #x1064\-lattice AOM is also #qty[80][MHz] and we usually operate the AOM in the interval from #qty[75][MHz] to #qty[85][MHz].
Due to the double-pass configuration, this amounts to the frequency difference $Delta nu = plus.minus #qty[10][MHz]$.
We use an arbitrary waveform generator#footnote[
  Spectrum Instrumentation M4i.6631-x8
] to apply changes such as jumps or periodic modulations (see #tr[ref Floquet section(s)]) to the superlattice phase.
Compared to the linear ramps of the DDS board, we are only limited by the #qty[1][μs] response time of the AOM.
Since the AOM efficiency varies as a function of the driving frequency, the power regulation has to adjust the amplitude of the RF signal accordingly.
If the changes applied to the superlattice phase are faster than the bandwidth of the power regulation, we already need to include the amplitude correction in the RF signal (see #tr[ref Floquet section with power feedback]).
