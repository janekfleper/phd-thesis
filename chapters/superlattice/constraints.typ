#import "../../header.typ": *

== Experimental constraints <sec:superlattice-constraints>

#[
  #set text(red)
  - Measure (or look up) the angle of the x-lattices to the glass cell again
  - Is this section really necessary? Move something to the "introduction" and the rest to the later sections?
]

#text(red)[already put this first section in the setup chapter?]
The beams that set/build up the $x$-superlattice are subject to a few experimental constraints since they share an optical path with the horizontal dipole beam/trap #text(red)[ref section?] and the $x$-imaging.
In addition, the Ioffe bars #text(red)[ref section] and the mu-metal enclosure #text(red)[same ref?] define a minimum distance between the glass cell and the last optical element and they restrict the solid angle for incoming beams and outgoing beams of the x-lattices through the glass cell.
The horizontal dipole beam/trap and the $x$-imaging beam have/show normal incidence on the glass cell surfaces
The x-lattice beams on the other hand require a non-normal/orthogonal angle of incidence to avoid (self?) interference between the actual beams and their reflections off the glass cell surfaces #text(red)[mention lack of coating again?].
The spatial constraints limit this angle to #text(red)[$2-3degree$] relative to the $x z$-plane and #text(red)[more?] relative to the $x y$-plane.
In practice we are using an equal angle of #text(red)[$~2degree$] relative to both planes since this results in a sufficient spatial separation of the reflections off the glass cell.

To achieve a vertical waist of #qty[10][μm] for the horizontal dipole beam, the optical elements up to the glass cell must have a size of #qty[2][in].
The large optical elements that are also relevant for the x-lattice beams are the #qty[250][mm] lens just in front of the atoms, two dichroic mirrors and a PBS to overlap the horizontal dipole beam and the x1064-lattice beam #text(red)[ref figure here?].
Due to the size of the optical elements the setup takes up quite a bit of space and the closest positions for an optical element to the #qty[250][mm] that do not affect another beam are at a distance of #text(red)[#qty[25][cm] and #qty[35][cm]] to the #qty[250][mm] lens.
For regular collimated beams such a propagation distance is not an issue.
The collimated x-lattice beams are however quite small with waists from #qty[250][μm] to #qty[500][μm], and the minimum propagation distance has a relevant impact on the beam shaping.
How we handled this for the individual x-lattice beams is described in the respective sections #text(red)[ref x1064-lattice] and #text(red)[ref x532-lattice].

The forward-propagating beams of the x-lattices are only overlapped on/with a dichroic mirror $~#qty[15][cm]$ in front of the #qty[250][mm] lens.
The last (electronically) moveable mirror for the x-lattice beams is located at $~#qty[20][cm]$ before the dichroic mirror in the respective optical paths.
We can therefore adjust the positions (and angles) of the two forward-propagating x-lattice beams individually.
Ideally we want the beams to be perfectly overlapped since there are no optical elements to adjust the beams individually after the dichroic mirror.
There are no transmissive optical elements apart from the two #qty[250][mm] lenses and the glass cell.
The only tunable/moveable optical element is the retro-reflecting mirror behind the glass cell.
With this mirror we have to optimize the alignment of both x-lattices at the same time.
Achieving an optimal overlap for both $x$-lattices requires a specific alignment sequence/protocol.
This is explained in detail in #text(red)[ref modulation/alignment].
Even if the x-lattices are optimized individually, the wavefronts are not necessarily parallel.
Since this is essential for the phase control of the superlattice potential, we use an additional alignment step to optimize the wavefront overlap #text(red)[ref superlattice/alignment].
