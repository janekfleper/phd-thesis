#import "/header.typ": *

== Experimental sequence <sec:setup-sequence>

#notes[
  - Really mention the temperatur stability here?
  - Move the preparation times to the introduction of @sec:setup-prepare?
  - Go into depth about attractive interactions -> doubly-occupied sites here?
  - Where to mention the mapping $mF(9) = phy.ket(arrow.b)$ and $mF(7) = phy.ket(arrow.t)$?
]

The experimental setup is controlled by an experimental sequence that typically lasts #qty[60][s].
To keep the experiment table at a constant temperature, the sequence is running $24 slash 7$.
A short interruption of the sequence can already require several hours of thermalization on the experiment table.
The most critical components for the temperature stability are the magnetic field coils of the Ioffe-Pritchard trap and the slow Feshbach coils.
Despite their water cooling, these coils are the largest thermal loads on the experiment table.
We therefore aim to set up the experimental sequence with a constant runtime for the individual coils.
Even then, a true thermal equilibrium is not possible since the coils are only running for a fraction of the sequence.
We can however achieve a periodic temperature cycle with minimal variations from sequence to sequence.
This is relevant for the stability of the in-plane superlattice phase, which I will discuss in #tr[ref @ssec:phase-sensors-stability].

Every experimental sequence starts with the magneto-optical trap which takes approximately #qty[4][s], followed by the magnetic transport to the glass cell in less than #qty[1][s].
The evaporation in the Ioffe-Pritchard trap lasts almost #qty[35][s], #tr[anything else to mention?]
The loading into the optical dipole traps and the subsequent evaporation takes #qty[8][s].
The preparation of the degenerate fermi gas therefore takes up #qty[80][%] of the sequence time.
After this preparation, the atoms are loaded into the optical lattices where we actually conduct the experiments.
Since the preparation of the atoms is unchanged compared to the previous generations of PhD students, I will only briefly explain the different steps to create a degenerate fermi gas.


#floating-figure(
  image("figures/setup_sequence.png"),
  caption: [
    Illustration of a typical experimental sequence in the optical lattices.
    The sketch starts just after the evaporation in the optical dipole trap where the atoms occupy the mixture #mix(9, 7).
    During the _loading_ segment, the optical lattices are turned on successively until the atoms are trapped in the in-plane superlattice.
    The insets indicate the structure of the atom cloud in the $x y$ plane with an exaggerated lattice spacing.
    The details about the loading into the optical lattices are explained in @ssec:setup-sequence-loading.
    After the optical lattices are turned on, we can conduct the actual measurements in the _experiment_ segment.
    Usually, the superlattice phase is close to $phi = 0$ where the potential is an array of double wells.
    The actual superlattice phase, the lattice depths and the interaction strength will depend on the specific measurement (see @ch:mod and @ch:phase).
    After the experiment is done, the rest of the sequence is spent on the _detection_ segment.
    We start by freezing the #x1064 lattice to completely disable the tunneling of the atoms.
    The #x532 lattice is not required anymore since the atoms are #tr[(already)] frozen on the lattice sites.
    This allows us to manipulate the $m_F$ states of the atoms in preparation for the imaging.
    With a singles-doubles separation pulse (see #tr[ref SD/HS subsection]), the _singles_ $phy.ket(S)$ are separated from the _doubles_ $phy.ket(D)$.
    The _reference_ state $phy.ket(R)$ is transferred to the $m_F$ state #mF(5) with radio-frequency sweeps (see #tr[ref RF sweep subsection]).
    In each sequence we can capture three images of which two show atoms and the third one is an "empty" image that just shows the imaging pulse (see #tr[ref imaging subsection]).

    #notes[
      - Add any timing information? Maybe just the length of the intervals?
      - Number/abc the different rows? The labels of the rows can be removed alltogether?
      - Merge the "dipole" and "z532" rows?
      - Really just quickly reference the measurements in the later chapters here?
      - Where should I explain _singles_ and _doubles_?
      - Add one more atom cloud for the frozen system!
    ]
  ],
  label: <fig:setup-sequence>,
)


=== Loading the optical lattices <ssec:setup-sequence-loading>

#notes[
  - Mention change of confinement when freezing the #y1064 lattice?
  - How/Where to reference the _loading_ segment in @sec:setup-sequence?
]

After the evaporation, the optical dipole trap is still required to provide a confinement for the atoms.
The atoms occupy the #mix(9, 7) with attractive interactions and we want as many doubly-occupied sites as possible in the optical lattices.
At first, only the #z532 lattice is turned on to split the atom cloud into several two-dimensional #tr[layers/pancakes].
While the #z532 lattice provides a strong confinement along the $z$ axis, it cannot trap the atoms alone due to the small deconfinement in the $x y$ plane.
The dipole beams are only turned off when the infrared in-plane lattices are turned on to a depth of #qty[6][Erec].
By matching the dipole-trap potential and the radial potential of the in-plane lattices, we can conserve the confinement during the adiabatic transfer into the optical lattices.
This is essential to minimize the heating of the atoms due to the redistribution of the density #tr[cite Marcell + Nicola].
A higher temperature of the atoms in the optical lattices would reduce the number of doubly-occupied sites.

When we work with the in-plane superlattice, we want to freeze the tunneling along the $y$ axis by increasing the #y1064\-lattice depth to $Vy1064 >= #qty[20][Erec]$.
The resulting potential will be an array of uncoupled one-dimensional lattices in each vertical layer.
We also increase the depth of the #x1064 lattice to #Vx1064 in preparation for the superlattice potential.
This will temporarily freeze the atoms until the #x532 lattice is turned on.
The initial superlattice phase is strongly detuned from $Delta = 0$, in most cases we are even using the antisymmetric phase $phi = plus.minus pi slash 4$.
Any further changes to the lattice depths or the superlattice phase $phi$ depend on the specific measurement (#tr[ref later chapters?]).
