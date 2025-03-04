#import "../../header.typ": *

== Evaporative cooling in Ioffe-Pritchard trap <sec:setup-ioffe>

#[
  #set text(red)
  - Actually mention the transport in detail?
  - Something about atom number and states after transport?
  - Make the Ioffe explanation even shorter?
  - What is actually done at the end of the Ioffe sequence? Loading to elliptical FB coils and pumping to $m_F = 9 slash 2$ should only be done in a regular sequence?
]

After the cooling in the MOT, the atoms are optically pumped to the low-field seeking states of the ground state manifold $#phy.ket[F = 9]$.
As seen in @fig:setup-k40-hfs these are the states with the magnetic quantum number $m_F > 0$, starting with $m_F = 9 slash 2$.
The optical pumping is required to prepare the atoms for a transport inside a magnetic quadrupole field.
The transport is required to move the atoms to the science cell with an ultrahigh vacuum at a pressure $#qty[1e-11][mbar]$.
The MOT region of the vacuum system and the science cell are connected by a differential pumping/pressure tube.
The (relatively high) background pressure in the MOT region can therefore be decoupled from the UHV in the science cell.
For the transport we are using a pair of magnetic field coils in AHH configuration mounted to a mechanical (ball-bearing) stage.
After the optical pumping to the high-field seeking states the transport field is turned on (rapidly) and the mechanical stage moves the atoms over a distance of #qty[700][mm] to the science cell.
The maximum possible acceleration of the atoms due to the mechanical transport is very small compared to the acceleration during laser cooling.
The main loss process for atoms are Majorana flips in the trap center where the magnetic field is zero?
A short transport time is therefore desirable to minimize the atom losses.

In the science cell, the atoms are handed over from the transport coils to a Ioffe-Pritchard (type) trap consisting of three principal pairs of coils.
Compared to the quadrupole field of a anti-Helmholtz pair, the Ioffe-Pritchard trap has an offset magnetic field in the center to prevent Majorana losses.
We are using forced evaporative cooling in the Ioffe-Pritchard trap to repeatedly remove the atoms with the highest temperature, which will effectively cool the atom cloud.
The atoms are removed from the trap via a MW transition or an RF transition to a high-field seeking state.
During the cooling it is important to keep a balanced mixture of the available low-field seeking HFS states for an efficient (re-)thermalization.
When only the MW transition would be used for the forced evaporation, an imbalance of the states would occur towards the end of the evaporative cooling.
After the forced evaporative cooling, the atoms are pumped to the state #phy.ket($F = 9 slash 2, m_F = 9 slash 2$) where we end up with $tilde #num[5e6]$ atoms at a temperature of $tilde #qty[2.5][μK]$.
