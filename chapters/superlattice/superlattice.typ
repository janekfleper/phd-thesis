#import "../../header.typ": *

= Everything about the in-plane superlattice <ch:superlattice>

While the $x$-superlattice was already mentioned in @sec:setup-xy-lattices, I will introduce the optical setup here in detail.
The goal of/behind this bichromatic superlattice is/was to study complex one-dimensional Hubbard models/systems, especially using modulated/time-dependent potentials.
By tuning the (relative) phase of the two individual lattices, we can adjust the tunneling amplitudes and the energy difference/offset between the individual (sub)lattice sites.
The phases of the individual lattices accumulate over an optical path length of $tilde #qty[50][cm]$.
This gives us an excellent tunability of the phase by adjusting the frequency of the individual lattices.
But it also makes the superlattice phase very sensitive to changes of the refractive index along the optical path.
At the wavelengths $lambda_l = #qty[1064][nm]$ and $lambda_s = #qty[532][nm]$, the refractive index of air and of all/most glasses shows a (slightly) different dependency on (the) environmental parameters.
This requires a lot of effort to keep the phase of the superlattice stable from sequence to sequence.

Since both the sensitivity and the tunability are just inversely "related" to the optical path difference between the forward-propagating beam and the retro-propagating beam, there is no easy way/path to build a superlattice that is both very stable but also easily/quickly tunable.
There are setups that try to achieve this by putting the optical path in a simple/low vacuum #text(red)[ref Bloch group].
If the "optical path" is not subject(ed) to changes of the refractive index, the sensitivity to the temperature, the pressure and the humidity is just gone.
We also thought about a tube-like/tube-shaped enclosure for the optical path between the atoms and the retro-reflecting mirror.
Due to spatial constraints this is/was however not possible.
Our approach therefore uses environmental sensors to "predict" the changes of the phase as good as possible.
The so-called feed-forward is introduced in detail in #text(red)[ref section feedforward].

#include "constraints.typ"
#include "x1064.typ"
#include "x532.typ"
