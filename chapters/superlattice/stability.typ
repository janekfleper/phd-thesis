#import "/header.typ": *

== Characterizing the optical lattices <sec:super-stability>

#notes[
  - Mention the typical beam powers (at the atom position)?
  - Already mention the superlattice phase $phi$ here somewhere?
]

As already mentioned in the introduction of this chapter, we used the in-situ lattice modulation spectroscopy as well as beam-profiling cameras to characterize the thermal lensing.
The modulation spectroscopy directly measures the spatial profile of the optical lattices, which reveals the lattice depth in the center, the Gaussian waist and the position.
In terms of the measurement accuracy, this is the best characterization method available in the experimental setup.
On the other hand, the beam-profiling cameras have a great time resolution and they can measure the beam profile around the atom position.
This allows us to actually quantify the focal shift due to the thermal lensing, whereas the lattice modulation spectroscopy is restricted to the position of the atoms.
Furthermore, the cameras can also resolve the vertical beam profile.
The in-situ lattice modulation spectroscopy only shows the average horizontal lattice profiles in the occupied layers of the #z532 lattice.


=== #x1064 lattice <ssec:super-stability-x1064>

For the initial characterization of the thermal lensing in the #x1064\-lattice setup, we used the in-situ lattice modulation spectroscopy.
In the experimental sequence, we introduced a holding time $tau$ just after the #x1064 lattice is frozen at the lattice depth #Vx1064 (see @sec:setup-sequence).
For the characterization of the thermal lensing, we are neglecting the slow ramp up to #qty[6][Erec] earlier in the sequence.
The lattice-depth modulation begins right after the holding time $tau$ and lasts #qty[100][ms].
In #subref(<fig:super-stability-x1064>, "a") we can see an exponential decay of the lattice depth $Vx1064 = #qty[54][Erec]$ by #qty[5][%] up to a holding time of #qty[1][s].
During the rest of the holding time up to $tau = #qty[5][s]$, the lattice depth decreases at the rate #qty[0.25][%/s].
Overall, we observed an approximately linear strength of the thermal lensing.
At $Vx1064 = #qty[45][Erec]$, the lattice depth only dropped by around #qty[4][%] in the first second.
Running the in-situ lattice modulation spectroscopy down to lattice depths of #qty[6][Erec] is not possible.
We only could have measured the thermal lensing across the full range of the lattice depth with the beam-profiling cameras.
The waist #wx1064 in #subref(<fig:super-stability-x1064>, "b") shows the complementary signal to the lattice depth with an exponential increase by approximately #qty[20][μm].
From these two lattice parameters, we can conclude that the foci of the forward-propagating and retro-propagating beams were initially too close to their respective lenses.
The thermal lensing then shifted the foci further towards their lenses to create a shallower but wider optical lattice at the position of the atoms.
The other two lattice parameters did not show any relevant thermal lensing.
At $Delta y_0 < #qty[1][μm]$, the change of the lattice position is negligible compared to the waist #wx1064.
The angle $theta.alt$ was constant at $#num[-5.50]degree plus.minus #num[0.21]degree$ during the #qty[5][s] holding time, which matches the expected result in @tab:mod-eval-results.

For the initial thermal lensing, we do not have usable data available from the beam-profiling cameras.
At the time, the imaging setup to measure the forward-propagating and retro-propagating lattice beams was not in a $4f$-configuration.
Due to the divergence of the collimated Gaussian beams, the cameras were therefore measuring the lattice beams at a significant distance from the atom position.
Furthermore, we did not conduct measurements of the actual focal shift caused by the thermal lensing.
This requires a beam-profiling as a function of the holding time $tau$ and the camera position $x$.
We only developed the corresponding measurement routine after the upgrade of the #x1064\-lattice setup.

After replacing all telescope lenses made of #NBK7 and the retro lens, we measured a focal shift $delta < #qty[1][mm]$ after #qty[5][s] at the lattice depth $Vx1064 = #qty[60][Erec]$.
Relative to the Rayleigh length of $z_R approx #qty[60][mm]$, this is a tiny shift that should result in a stability of the lattice depth better than #qty[0.5][%] if the foci are initially located at the atom position.
After optimizing the focal position of the forward-propagating beam and the distance between the atoms and the retro lens with the cameras, we use the in-situ lattice modulation spectroscopy for the final characterization.
In #subref(<fig:super-stability-x1064>, "a") the lattice depth increases by less than #qty[0.2][%] in #qty[5][s].
Compared to the initial setup, we were able to reduce the variation of the lattice depth by a factor of approximately #num[30].
Correspondingly, the waist #wx1064 in #subref(<fig:super-stability-x1064>, "b") does not show a drift in either direction.
Besides being constant, the waist #wx1064 is also significantly smaller in the final configuration.
This allows us to achieve lattice depths beyond #qty[60][Erec], while maintaining a waist that is still sufficiently large compared to the atom cloud.
The stronger confinement along the $y$ axis is not an issue since the #y1064 lattice is always frozen when we are working with the in-plane superlattice.
While we could significantly improve the stability of the lattice depth and the lattice waist, the position still drifts by up to #qty[1][μm] in #qty[5][s].
We can attribute this to the thermal cycle during the experimental sequence, which is mainly determined by the magnetic field coils (see @sec:setup-sequence and @ssec:phase-stability-result).
In any case, the drift is negligible compared to the size of the atom cloud and the waist of the #x1064 lattice.

#floating-figure(
  image("figures/superlattice_stability_x1064.png"),
  caption: [
    Improvement of the thermal lensing in the #x1064\-lattice setup.
    The data shows the calibration of the lattice depth with the in-situ lattice modulation spectroscopy (see @ch:mod).
    For the initial and final data, the lattice depth in the experimental sequence was set to #qty[54][Erec] and #qty[60][Erec] respectively.
    The modulation time was #qty[100][ms], and we selected the modulation amplitude to obtain a good signal strength.
    The correction factor $alpha$ quantifies the actual lattice depth relative to the setpoint in the experimental sequence.
    From the other lattice parameters (see @fig:mod-eval-x1064-result), only the waist #wx1064 and the position $y_0$ changed during the holding time, while the angle $theta.alt$ was constant in both setup configurations.
    The uncertainties of the lattice parameters are computed with the procedure introduced in @ssec:mod-eval-error.

    #notes[
      - Move the *abc* indices outside of the axes? Just above the y-labels?
    ]
  ],
  label: <fig:super-stability-x1064>,
)


=== #x532 lattice <ssec:super-stability-x532>

#notes[
  - Go into more detail about the "weird" horizontal focal shift? Also discuss the curvature then?
]

For the characterization of the #x532 lattice, we used the in-situ lattice modulation spectroscopy in the superlattice potential (see @sec:mod-super).
The maximum #x532\-lattice depth is not sufficient to run the measurement in the standalone lattice.
In the superlattice potential, we can measure the combined depth of the #x1064 lattice and the #x532 lattice.
Consequently, the #x1064\-lattice depth should be constant during the measurement.
Since we had not upgraded the optical setup yet, this required a compensation of the thermal lensing by applying the inverted signal in #subref(<fig:super-stability-x1064>, "a") to the setpoint in the experimental sequence.
With the standalone calibration of the #x1064 lattice, we could achieve a stability of the lattice depth better than #qty[0.6][%], which is already a $10 times$ improvement compared to the initial configuration.
In conjunction with the #x532 lattice, we used the beam-profiling cameras to optimize the residual variation of the #x1064 lattice.
With an RGB camera#footnote[
  Basler acA2040-35gc
] we can capture #x1064\-lattice beam and the #x532\-lattice beam in the same image and extract the individual beam profiles during the evaluation.
Due to the crosstalk of the lattice beams in the initial retro lens, we had to adjust the compensation of the #x1064 lattice according to the #x532\-lattice depth #Vx532.

Before using the in-situ lattice modulation spectroscopy, we already measured the thermal lensing of the forward-propagating beam with the beam-profiling camera.
However, as with the characterization of the #x1064 lattice, the camera was not set up correctly to measure the beam profile at the position of the atoms.
Nevertheless, we could already observe that the thermal lensing is even more severe for the #x532 lattice compared to the #x1064 lattice.
The drop of the beam intensity was not linear as a function of the lattice depth #Vx532 anymore.
Instead, the intensity appeared to saturate regardless of the setpoint #Vx532.
After a #qty[1][s] holding time at $Vx532 = #qty[24][Erec]$, the beam intensity was already reduced by #qty[25][%], compared to a reduction by approximately #qty[5][%] at $Vx532 approx #qty[14.5][Erec]$.
The extrapolation of the beam intensity after a #qty[3][s] holding time suggests that the steady-state lattice depth is capped at #qty[17][Erec].
Instead of measuring the lattice depth as a function of the holding time $tau$, we therefore decided to run the in-situ lattice modulation spectroscopy as a function of #Vx532 after a #qty[3][s] holding time.
This also allowed us to use a sufficiently long modulation time of #qty[500][ms], which is the minimum recommended value to obtain a good signal with the superlattice modulation.

#floating-figure(
  image("figures/superlattice_stability_x532_insets.png"),
  caption: [
    Improvement of the thermal lensing in the #x532\-lattice setup.
    The initial data shows the results of the in-situ superlattice modulation spectroscopy at $Vx1064 = #qty[54][Erec]$ and $phi = pi slash 4$ with a #qty[500][ms] modulation time (see @sec:mod-super).
    We used a #qty[3][s] holding time approach the steady state of the thermal lensing.
    In *a*, we use the reference value $alpha = #num[1.0]$ from a measurement at $Vx532 = #qty[20][Erec]$ with a #qty[100][ms] modulation time after zero holding time.
    Due to the thermal lensing, this value is already slightly lower than the instantaneous lattice depth at $tau = 0$.
    *b* only shows the horizontal waist $wx532^y$ since the in-situ lattice modulation spectroscopy is not able to resolve the vertical waist.
    Due to the ellipticity of the #x532\-lattice beams, the two waists will evolve differently with the thermal lensing.
    The insets show the correction factor $alpha$ and the horizontal waist $wx532^y$ in the final configuration as a function of the holding time $tau$ with a #qty[500][ms] modulation time.
    The corresponding superlattice parameters are $Vx1064 = #qty[60][Erec]$, $Vx532 = #qty[18][Erec]$ and $phi = pi slash 4$.
    The uncertainties of $alpha$ and $wx532^y$ in the initial and final configuration are computed with the procedure introduced in @ssec:mod-eval-error.

    #notes[
      - Add labels or legend for "initial" and "final"?
      - Move the inset in *b* to the lower right corner? This would move it close to #qty[115][μm] ...
    ]
  ],
  label: <fig:super-stability-x532>,
)

In @fig:super-stability-x532 we can see the thermal lensing in the initial optical setup.
At the maximal lattice depth $Vx532 = #qty[24][Erec]$, the correction factor is $alpha approx #num[0.7]$.
From an interpolation of the data points in #subref(<fig:super-stability-x532>, "a"), we would expect the correction factor #num[0.85] at the lattice depth $Vx532 approx #qty[18][Erec]$.
This highlights the non-linearity of the thermal lensing in the #x532 lattice.
The horizontal waist in #subref(<fig:super-stability-x532>, "b") also changes as a function of #Vx532, but not as expected from the correction factor $alpha$.
Initially, the waist decreases to #qty[114+-12][μm] before it increases to #qty[160+-8][μm] again.
We interpret this as shift of the horizontal foci of the forward-propagating and retro-propagating beams.
The initial foci are too far away from their respective lenses, and the thermal lensing pulls the foci towards their lenses.
At $Vx532 approx #qty[17][Erec]$, the foci are closest to the atom position after a #qty[3][s] holding time.
The drop of the lattice depth is a result of the combined changes in the horizontal direction and in the vertical direction.
Based on the simulation of the thermal lensing in @ssec:super-thermal-simulation, the horizontal focus will be shifted approximately $9 times$ further than the vertical focus.
On the other hand, the vertical focus has a greater impact due to the shorter Rayleigh length.
While we can not retrospectively quantify the actual focal shifts, we can estimate that they must be comparable to the Rayleigh lengths in order to reduce the lattice depth $Vx532 = #qty[24][Erec]$ by #qty[30][%].
With the horizontal and vertical waists of #qty[120][μm] and #qty[50][μm], the corresponding Rayleigh lengths are approximately #qty[85][mm] and #qty[15][mm].

In the final optical setup, neither the correction factor $alpha$ nor the horizontal waist $wx532^y$ in @fig:super-stability-x532 show a change due to the thermal lensing.
The variations of both parameters agree with the expected uncertainties of the in-situ superlattice modulation spectroscopy in @tab:mod-super-result.
While the #x532 lattice appears to be constant at the atom position, the thermal lensing is not actually zero.
With the beam-profiling cameras, we can quantify the focal shifts around the atom position.
At $Vx532 = #qty[18][Erec]$, the vertical focus is shifted by $delta_y approx #qty[0.7][mm]$ and the horizontal focus is shifted by $delta_z approx #qty[6][mm]$ after a #qty[5][s] holding time.
If we look at the beam intensity, the focal shift amounts to $delta approx #qty[0.9][mm]$.
Realizing a constant lattice depth under these circumstances required an elaborate positioning of the foci.
To minimize the change of the lattice depth, the vertical focus is located #qty[2.5][mm] away from the atom position while the horizontal focus is located #qty[20][mm] away from the atoms.
We found this position empirically by looking at the beam intensity in the beam-profiling data.
The maximum lattice depth is reduced by #qty[3][%] compared to the optimal focus position in exchange for a better stability of the #x532 lattice.
