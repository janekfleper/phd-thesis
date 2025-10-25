#import "/header.typ": *

== Characterizing the lattice depths <sec:super-stability>

To quantify the effects of the thermal lensing on the lattice depths #Vx1064 and #Vx532 at the position of the atoms, we use the beam-profiling cameras shown in @fig:super-setup and the in-situ #lms introduced in @ch:mod.
The cameras enable a measurement of the beam profile around the position of the atoms with a sub-millisecond time resolution.
By moving the camera around the virtual position of the atoms, we can directly measure the focal shift $delta(tau)$ due to the thermal lensing.
Furthermore, the cameras resolve the full beam profiles perpendicular to the propagation axis.
On the other hand, the in-situ #lms measures the lattice depths $Vx1064(x, y)$ and $Vx532(x, y)$ at the position of the atoms.
The time resolution is limited to #qty[100][ms] by the duration of the lattice modulation to achieve the required atom loss for the in-situ signals (see @sec:mod-intro).


=== Stability of the infrared lattice <ssec:super-stability-x1064>

To characterize the lattice depth $Vx1064(tau)$, we introduce a holding time $tau$ after the #x1064 lattice is frozen (see @fig:setup-sequence).
After the holding time $tau$, the lattice depth is modulated for #qty[100][ms] as part of the in-situ #lms (see @sec:mod-intro).
We scan the modulation frequency across the atom cloud for each holding time $tau$ to capture the required data for the lattice-depth calibration (see @sec:mod-eval).
In addition to the lattice depth $Vx1064(tau)$, we also measure the waist $wx1064(tau)$ and the lattice position $fity0(tau)$ with the in-situ #lms.
Instead of the lattice depth, we use the calibration factor $fita0(tau)$ to quantify the measured lattice depth relative to the setpoint of the lattice depth.
The corresponding results for the setpoint $Vx1064 = #qty[54][Erec]$ up to the holding time $tau = #qty[5][s]$ are shown in @fig:super-stability-x1064.
According to the calibration factor $fita0(tau)$, the lattice depth $Vx1064(tau)$ decreases exponentially by #qty[5][%] up to a holding time of $tau = #qty[1][s]$.
During the remainder of the holding time up to $tau = #qty[5][s]$, the lattice depth decreases linearly at the rate #iqty[0.25][%/s].
We find the relative decrease of the lattice depth to be proportional to the setpoint #Vx1064, which is in turn proportional to the beam power.
Therefore, we are in a regime where the decrease of the lattice depth is linear in the focal shift due to the thermal lensing.
The waist $wx1064(tau)$ in #subref(<fig:super-stability-x1064>, "b") shows the complementary signal to the lattice depth $Vx1064(tau)$ with an exponential increase by approximately #qty[20][μm].
From these two lattice parameters, we conclude that the foci of the #forward and #retro beams are too close to their respective lenses.
The thermal lensing shifts the foci even further towards their lenses (see @fig:super-thermal-simulation-setup), resulting in a shallower and wider optical lattice at the position of the atoms.
The lattice position $fity0(tau)$ increases linearly during the holding time.
With $Delta fity0 < #qty[1][μm]$ after #qty[5][s], the change of the position is too small to affect the lattice depth.

#floating-figure(
  image("figures/superlattice_stability_x1064.png"),
  caption: [
    Reduction of the thermal lensing in the #x1064\-lattice setup.
    *a*, Calibration factor $fita0(tau)$ to quantify the measured lattice depth $Vx1064(tau) = alpha(tau) Vx1064$ relative to the setpoint in the experimental sequence.
    In the initial optical setup, we observe a strong exponential decrease of the lattice depth, followed by a small linear decrease.
    After the upgrade of the optical setup, the lattice depth only shows a tiny increase during the holding time.
    *b*, Lattice waist $wx1064(tau)$ in the initial and final optical setup.
    In both versions of the optical, the waist $wx1064(tau)$ shows the complementary signal to the lattice depth $Vx1064(tau)$ in *a*.
    *c*, Lattice position $fity0(tau)$ with an equal linear drift in both optical setups.
    The setpoints of the lattice depths in the initial and final optical setup are #qty[54][Erec] and #qty[60][Erec] respectively, and the modulation time is $tmod = #qty[100][ms]$.
    The uncertainties of the lattice parameters are computed with the procedure introduced in @ssec:mod-eval-error.

    // TODO: Rename y-label to calibration factor...
    // TODO: Move the *abc* indices outside of the axes? Just above the y-labels?
  ],
  label: <fig:super-stability-x1064>,
)

To reduce the thermal lensing in the #x1064\-lattice setup, we remove all singlet lenses made of #NBK7 and exclusively use lenses made of #UVFS for the telescope lenses and the relay lens.
Additionally, we replace the retro lens by the same model as the forward lens.
In the upgraded optical setup, we measure a focal shift $delta < #qty[1][mm]$ after the holding time $tau = #qty[5][s]$ at the lattice depth $Vx1064 = #qty[60][Erec]$.
Based on the Rayleigh length $z_R approx #qty[60][mm]$, we expect a stability of the lattice depth better than #qty[0.5][%] if the foci are initially located at the atom position.
With the beam-profiling cameras, we optimize the focal position of the #forward beam and the distance between the atoms and the retro lens to achieve a minimal variation of the lattice depth.
Then, we use the in-situ #lms to characterize the lattice parameters as a function of the holding time $tau$.
In #subref(<fig:super-stability-x1064>, "a"), the lattice depth $Vx1064(tau)$ increases by less than #qty[0.2][%] in #qty[5][s].
Compared to the initial setup, we reduce the variation of the lattice depth by a factor of approximately #num[30].
Correspondingly, the waist $wx1064(tau)$ in #subref(<fig:super-stability-x1064>, "b") does not show a drift in either direction#footnote[
  We reduce the waist #wx1064 in the upgraded optical setup to achieve lattice depths greater than #qty[60][Erec].
].
While we significantly improve the stability of the lattice depth and the lattice waist, the position #fity0 still drifts by up to #qty[1][μm] in #qty[5][s].
We attribute this to the thermal cycle during the experimental sequence due to the magnetic field coils (see @sec:setup-sequence and @ssec:phase-stability-result).
In any case, this drift is negligible compared to the size of the atom cloud and the waist of the #x1064 lattice.


=== Stability of the green lattice <ssec:super-stability-x532>

For the characterization of the lattice depth $Vx532(tau)$, we use the superlattice potential in the antisymmetric configuration ($phi = -pi slash 4$).
The lattice depth $Vx532 <= #qty[30][Erec]$ is not sufficient for the in-situ #lms.
Using the superlattice potential for the lattice-depth calibration ensures a suitable band structure.
The details about the in-situ #slms are introduced in @sec:mod-super.
Compared to the #x1064\-lattice setup, we find the thermal lensing to be significantly stronger in the #x532\-lattice setup.
We attribute this to the higher absorption in the optical materials at the wavelength #qty[532][nm] as shown in @tab:super-thermal-materials.
Analogous to the #x1064 lattice in @fig:super-stability-x1064, we observe an exponential decrease of the lattice depth in the first second of the holding time.
After this initial decrease, the thermal lensing reaches a nearly steady state where the lattice depth $Vx532(tau)$ only shows minor changes.
Compared to the #x1064 lattice, the reduction of the steady-state lattice depth $Vx532(tau)$ due to the focal shift is not linear in the setpoint #Vx532.
This is shown for the holding time $tau = #qty[3][s]$ in @fig:super-stability-x532.
At the maximal lattice depth $Vx532 = #qty[24][Erec]$, the calibration factor is $fita0 approx #num[0.7]$.
With a linear scaling of the thermal lensing with the setpoint #Vx532, the expected calibration factor at $Vx532 = #qty[14][Erec]$ is $fita0 approx #num[0.825]$.
Instead, we measure the calibration factor $fita0 approx #num[0.925]$ in the steady state at the lattice depth $Vx532 = #qty[14][Erec]$.

The change of the horizontal waist as a function of the lattice depth in #subref(<fig:super-stability-x532>, "b") is not complementary to the calibration factor #fita0.
Starting at $wx532^y = #qty[141(7)][μm]$ for $Vx532 = #qty[14][Erec]$, the waist decreases to #qty[114+-12][μm] before it increases to #qty[160+-8][μm] again.
We interpret this as a shift of the horizontal foci of the #forward and #retro beams through the position of the atoms.
The initial foci are too far away from their respective lenses and they are shifted to the opposite side of the atom cloud by the thermal lensing.
At $Vx532 approx #qty[17][Erec]$, the foci are closest to the atom position in the steady state of the thermal lensing after a #qty[3][s] holding time.
In total, the decrease of the lattice depth depends on the combined changes in the horizontal and vertical direction.
Due to the elliptical shape of the #x532\-lattice beams, the thermal lensing causes a significant astigmatism according to the simulation in @ssec:super-thermal-simulation.
With the horizontal and vertical waists of $wx532^y approx #qty[120][μm]$ and $wx532^z approx #qty[50][μm]$, the corresponding Rayleigh lengths are approximately #qty[85][mm] and #qty[15][mm].
At the lattice depth $Vx532 = #qty[24][Erec]$, we estimate that the focal shifts of the horizontal and vertical axis must be comparable to the respective Rayleigh lengths to reduce the lattice depth by #qty[30][%].

#floating-figure(
  image("figures/superlattice_stability_x532_insets.png", width: 100%),
  caption: [
    Reduction of the thermal lensing in the #x532\-lattice setup.
    *a*, Calibration factor #fita0 as a function of the setpoint #Vx532 after the holding time $tau = #qty[3][s]$ to measure the steady state of the thermal lensing.
    The measured lattice depth settles at a significantly lower value compared to the setpoint.
    The reference value for $fita0 = #num[1.0]$ is taken from a calibration measurement at $tau = #qty[0][s]$.
    *b*, Horizontal waist $wx532^y$ after the holding time $tau = #qty[3][s]$.
    We cannot resolve the vertical waist $wx532^z$ with the in-situ #lms.
    The insets show the calibration factor $fita0(tau)$ and the horizontal waist $wx532^y (tau)$, after the upgrade of the optical setup, at the lattice depth $Vx532 = #qty[18][Erec]$.
    We use the superlattice parameters $Vx1064 = #qty[60][Erec]$ and $phi = - pi slash 4$, and the modulation time $tmod = #qty[500][ms]$ for both measurements.
    The uncertainties of the parameters #fita0 and $wx532^y$ in the initial and final configuration are computed with the procedure introduced in @ssec:mod-eval-error.

    // TODO: Really use the width 90%?
    // TOOD: Add labels or legend for "initial" and "final"?
    // TODO: Move the inset in *b* to the lower right corner? This would move it close to #qty[115][μm] ...
  ],
  label: <fig:super-stability-x532>,
)

Analogous to the setup of the #x1064 lattice, we replace all lenses in the telescopes with singlet lenses made of #UVFS.
Additionally, we replace the optical isolator with a model that experiences less thermal lensing.
After the replacement of the retro lens, the new optical isolator is the only remaining optical element where we can detect thermal lensing.
In the final optical setup after the upgrade, the calibration factor #fita0 and the horizontal waist $wx532^y$ are nearly constant in time (see insets in @fig:super-stability-x532).
The residual variation of both parameters is on par with the uncertainties of the in-situ #slms in @tab:mod-super-result.
Even though the #x532\-lattice depth is constant at the atom position, the focal shift due to the thermal lensing is not zero.
We quantify the focal shifts of the horizontal and vertical axis around the atom position with the beam-profiling cameras.
At $Vx532 = #qty[18][Erec]$, the vertical focus is shifted by $delta_y approx #qty[0.7][mm]$ and the horizontal focus is shifted by $delta_z approx #qty[6][mm]$ after a #qty[5][s] holding time.
The focal shift of the horizontal axis is significantly greater due to the beam shaping by the cylindrical telescope in @fig:super-setup.
The ratio of the focal shifts agrees with the expected value $delta_z slash delta_y = 9$ from the simulation of the thermal lensing in @ssec:super-thermal-simulation.
To minimize the change of the lattice depth at the atom position, we set the vertical and horizontal focus at the distances #qty[2.5][mm] and #qty[20][mm] from the atom position respectively.
This beam configuration is the result of an empirical optimization with the beam-profiling cameras.
Compared to the beam configuration both foci or located at the atom position, the maximum lattice depth is reduced by approximately #qty[3][%].
We accept this compromise since the time dependence of the lattice depth due to the thermal lensing is more detrimental for the operation of the optical lattices than an overall reduction of the lattice depth.


=== Conclusion <ssec:super-stability-conclusion>

We upgrade the optical setups of the in-plane superlattice to minimize the variation of the lattice depths $Vx1064(tau)$ and $Vx532(tau)$ due to thermal lensing in the optical elements.
With intermediate beam powers of a few watts, the primary contribution to thermal lensing is the absorption of light in the bulk material of the optical elements.
Therefore, selecting optical materials with a minimal absorption such as #UVFS, #CAF2, and #SiO2 is sufficient to reduce the thermal lensing.
In the upgraded #x532\-lattice setup, the optical isolator is the primary contribution to the remaining focal shift due to the thermal lensing.
To minimize the variation of the lattice depth $Vx532(tau)$ due to the focal shift, we find a beam configuration where the horizontal and vertical foci of the #x532\-lattice beams are shifted away from the position of the atoms.
In this configuration, we achieve a stability of the #x532\-lattice depth better than #qty[0.3][%] during a holding time of #qty[5][s] at $Vx532 = #qty[18][Erec]$ (see @fig:super-stability-x532).
This is on par with the estimated uncertainty of the #x532\-lattice calibration in the superlattice potential (see @tab:mod-super-result).
For the #x1064 lattice, we achieve a stability better than #qty[0.2][%] in #qty[5][s] at the lattice depth $Vx1064 = #qty[60][Erec]$.
We cannot associate the residual variation of the lattice depth $Vx1064(tau)$ to a specific optical element.
The most likely candidate for the thermal lensing in the #x1064\-lattice setup is the optical isolator made of terbium gallium garnet (TGG).
Additionally, we expect a finite contribution from the forward and retro lens due to the flint glass #NBALF4 (see @tab:super-thermal-materials).

Before the upgrade of the optical setups, the thermal lensing reduced the lattice depths $Vx1064(tau)$ and $Vx532(tau)$ on a timescale from #qty[100][ms] to several seconds.
Measurements up to a few #qty[10][ms] in the frozen lattices were, therefore, not directly affected by the thermal lensing.
However, the thermal lensing resulted in a systematic error of the lattice-depth calibration in both the #1064 lattice and the #x532 lattice.
At $Vx1064 = #qty[54][Erec]$, the lattice depth was already reduced by approximately #qty[1][%] after #qty[100][ms].
The reduction of the lattice depth during the lattice calibration was even greater in the #x532 lattice.
In conclusion, the upgrade of the optical setups of the in-plane superlattice was essential for a reproducible operation of the optical lattices.
In the context of the superlattice potential, we also find a significant improvement of the stability of the superlattice phase $phi(tau)$ during the experimental sequence in @ssec:phase-stability-result.
