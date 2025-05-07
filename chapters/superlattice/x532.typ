#import "/header.typ": *

== x532-lattice beam shaping <sec:superlattice-x532>

#[
  #set text(red)
  - Don't mention the same stuff as in ch:setup again!
  - Mention off-center transmission through #qty[250][mm] lenses?
  - Compute effect of defocused horizontal axis on wave front?
]

The x532-lattice is designed to be used together (in conjuction?) with the x1064-lattice.
We would therefore like to have a similar waist to not be limited by the inhomogeneity of either lattice for the x-superlattice potential.
With an isotropic/spherical beam we could however only reach a lattice depth of $v_s slash #unit[Erec^x532] approx 10$ which is not sufficient for our plans with the superlattice.
#text(red)[(Note that $#unit[Erec^x532] = 4 dot #unit[Erec^x1064]$. It therefore requires much power[] to make deep lattices with an #qty[532][nm])]
As a compromise of beam size and maximally achievable lattice depth, we are using an elliptic beam.
The horizontal waist is $~#qty[130][μm]$ and therefore very close to the waist of the x1064-lattice.
The vertical waist on the other hand is only $~#qty[50][μm]$.
We directly gain this factor of $~#num[2.5]$ as an increase of the lattice depth.
The increased inhomogeneity along the $z$-axis is not an issue since we only occupy lattice planes over a "height" of $~#qty[10][μm]$.

Using different waists for the horizontal axis and the vertical axis requires a cylindrical telescope, and the beam becomes prone to astigmatism.
In addition, the Rayleigh lengths are different by a factor of $2.5^2 approx 6$ #text(red)[check this!].
The "focussing" issue already described for the x1064-lattice in @sec:superlattice-x1064 therefore affects the two axes/waists differently.
The Rayleigh of the vertical axis/waist is $z_R^z approx #qty[20][mm]$, whereas the Rayleigh length of the horizontal axis/waist is $z_R^x approx #qty[100][mm]$.
#text(red)[Check both values!!]
The "situation" for the horizontal axis/waist is therefore even worse than for the x1064-lattice.
To achieve a waist of #qty[130][μm] at the position of the atoms, the waist before the lens would have to be #qty[200][μm] #text(red)[check this value!].
While such a configuration should also be achievable/possible with a relay lens, we ultimately decided on an astigmatic configuration since this gave the best suppression of the intensity changes caused by thermal lensing #text(red)[ref section].
The horizontal focus is too close to the #qty[250][mm] lens on purpose and the actual waist at the focus is smaller than #qty[130][μm].
But the "effective" beam parameters at the position of the atoms match our requirements.
The vertical focus is located exactly (#text(red)[give an uncertainty?]) at the position of the atoms.
We used the same procedure with the focus of the horizontal dipole beam as reference for the atom position @sec:superlattice-x1064.

Since the retro-path can only be adjusted together for the x1064-lattice and the x532-lattice, we can not move the foci of the two lattices separately.
In the end we decided to prioritize the vertical axis/waist/focus of the x532-lattice since it has a shorter Rayleigh length than the x1064-lattice.
We also have less "power budget" for the x532-lattice and the intensity is a lot more sensitive to a shifted (vertical) focus compared to the x1064-lattice.
The horizontal waist of the retro-propagating beam is equally shifted relative to the position of the atoms.
This is a fundamental property of a "perfect" $4f$-system.
The suppression of the thermal lensing will therefore also translate to the retro-propagating beam.
