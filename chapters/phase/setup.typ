#import "/header.typ": *
#import "figures/figures.typ": control-diagram

== Experimental setup <sec:phase-setup>

The standing-wave configuration of the #x1064 lattice and the #x532 lattice limits the sensitivity of the superlattice phase #phase to the retro path in @fig:super-setup.
The retro mirror is the reference point for the accumulation of the superlattice phase along the optical path up to the atom position.
Therefore, the optical phase of the forward-propagating beams does not affect the individual lattice potentials.
Instead, we use the optical frequency of the individual lattices to tune the superlattice phase.
A frequency difference $Delta nu$ changes the superlattice phase by

$
  Delta phase = Delta k dot d = 2 pi (Delta nu) / c dot d eqc
$ <eq:phase-setup-delta-phi>

where $d$ is the distance from the retro mirror to the atom position.
While the phases of both lattices can change the band structure of the superlattice potential, the #x532\-lattice phase also affects the positions of the lattice sites (see @sec:theory-super).
Therefore, we are primarily interested in changing the phase of the #x1064 lattice to tune the superlattice potential.
With the path length $d approx #qty[50][cm]$, the frequency difference of the #x1064\-lattice laser corresponding to the superlattice phase $Delta phase = pi slash 2$ is $Delta nu approx #qty[150][MHz]$.

#floating-figure(
  control-diagram(),
  caption: [
    Control diagram of the superlattice phase.
    The #x532\-lattice pump laser and the amplified #x1064\-lattice seed laser are overlapped on a photodiode.
    The resulting beat signal $Delta nu$ is mixed with the reference signal from the direct digital synthesis (DDS) board to yield the error signal for the fast and slow feedback loops.
    The optical frequencies of the pump and seed laser are approximately #qty[281.6][THz] with a detuning of a few #qty[100][MHz] between each other.
    In the second-harmonic generation (SHG) cavity, the pump laser is frequency doubled to obtain the wavelength $lambda = #qty[532][nm]$ for the #x532 lattice.
    The acousto-optical modulator (AOM) in the #x532\-lattice setup is driven at a constant frequency of #qty[80][MHz].
    In the #x1064\-lattice setup, the AOM frequency is controlled by an arbitrary-waveform generator (AWG).
    The vertical dashed line indicates the separation of the optical tables.
    While the entire frequency control is handled on the laser table, the superlattice phase #phase accumulates on the experimental table.
  ],
  label: <fig:phase-setup>,
)

In the experimental setup, we control the superlattice phase with the frequency difference $Delta nu$ between the #x1064\-lattice seed laser and the #x532\-lattice pump laser (see @ssec:setup-lattices-xy).
The pump laser is not actively stabilized since its passive frequency stability is sufficient for the operation of the superlattice#footnote[
  The frequency drift at constant room temperature is specified to be #iqty[1][MHz/min].
].
An absolute frequency control would only be required to stabilize the phase of the individual lattices.
In @fig:phase-setup, the setup to control the superlattice phase #phase through the frequency difference $Delta nu = nu_"pump" - nu_x1064$ is shown.
We use an optical phase locked loop (OPLL) to stabilize the frequency $nu_x1064$ relative to the frequency $nu_"pump"$ @telle_phase-locking_1990.
The reference signal is provided by a direct digital synthesis (DDS) board#footnote[
  Analog Devices AD9914 Evaluation Board ($fdds <= #qty[1.4][GHz]$)
].
While we do not need the phases of the forward-propagating lattice beams to be locked, we observe a better phase control, in terms of the delay to the reference signal, compared to a frequency offset lock @klemmer_ultracold_2020.
In the fast feedback branch, we use a fast PID regulator#footnote[
  Toptica Fast Analog Linewidth Control (FALC 110)
] to produce the feedback signal for the laser-diode current of the #x1064\-lattice laser.
While the fast feedback has a very high regulation bandwidth of several #qty[10][MHz], it can only address frequency changes $Delta nu < #qty[1][MHz]$.
To cover the entire superlattice period of #qty[150][MHz], we need to use the slow feedback branch with a regulation bandwidth of a few #unit[kHz].
The output signal of the PID regulator in the slow feedback branch is applied to the piezo actuator that controls the external-cavity length of the #x1064\-lattice laser.
On the DDS board, we use the digital ramp generator to drive linear ramps between two frequencies.
For rapid changes of the DDS frequency by more than #qty[1][MHz], we use an arbitrary-waveform generator #footnote[
  Keysight 33622A Waveform Generator
] to apply an auxiliary signal to the piezo actuator that matches the expected output of the slow PID regulator.
This keeps the beat frequency $Delta nu$ within #qty[1][MHz] of the DDS frequency where the fast feedback loop remains active.

In addition to the phase locked loop to stabilize the frequency difference $Delta nu$ between the two infrared lasers, each lattice setup features an acousto-optical modulator (AOM) that changes the optical frequency of the lattice beams.
The AOMs are primarily used for the power regulation of the lattice depths #Vx1064 and #Vx532 according to the experimental sequence (see @sec:setup-lattices).
In the #x532\-lattice setup, the AOM is driven by a radio-frequency (RF) signal at #qty[80][MHz] in a single-pass configuration.
The AOM for the #x1064 lattice is set up in a double-pass configuration to allow a variation of the driving frequency without affecting the fiber-coupling efficiency.
Since the AOM is located behind the photodiode of the optical phase locked loop, we can change the superlattice phase without the restrictions of the two feedback loops.
The center frequency of the #x1064\-lattice AOM is #qty[80][MHz] and we usually operate it in the frequency range between #qty[70][MHz] and #qty[90][MHz].
In the double-pass configuration, this amounts to the frequency difference $Delta nu = plus.minus #qty[20][MHz]$ for the superlattice phase.
We use an arbitrary waveform generator#footnote[
  Spectrum Instrumentation M4i.6631-x8
] to apply linear phase ramps, as well as jumps or periodic modulations (see @sec:phase-floquet) to the superlattice phase.
Compared to the linear ramps of the DDS board in the phase locked loop, we are only limited by the #qty[1][μs] response time of the AOM.
Since the AOM efficiency varies as a function of the driving frequency, the power regulation has to adjust the amplitude of the RF signal accordingly.
If the changes applied to the AOM frequency are faster than the bandwidth of the power regulation, we already include the amplitude correction in the RF signal.
