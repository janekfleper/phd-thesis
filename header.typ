#import "@local/fancy-thesis:0.1.0": floating-figure
#import "@preview/physica:0.9.5" as phy
#import "@preview/mannot:0.3.0": markrect
#import "@preview/fancy-units:0.1.1": num, qty, unit

#let subref(label, index) = {
  show ref: it => link(it.element.location(), it + index)
  ref(label)
}

// some custom fancy-units functions
#let deg(..args, body) = $#num(..args, body)degree$
#let degC(..args, body) = $#num(..args, body)degree "C"$

#let cexp(body) = $upright(e)^(upright(i) #body)$
#let ncexp(body) = $upright(e)^(- upright(i) #body)$

#let sn(L, J) = {
  show math.frac: it => $it.num slash it.denom$
  $attach(#L, tl: 2, br: #J)$
}

#let FmF(F, mF, prime: false) = {
  show math.frac: it => $it.num slash it.denom$
  let label = if prime { $F'$ } else { $F$ }
  $phy.ket(#label = #F\, m_F = #mF)$
}

#let mF(N) = $phy.ket(#N)$
#let mix(N1, N2) = $mF(N1) \& mF(N2)$

#let K40 = $phy.isotope("K", a: 40)$
#let asc = $a_(upright("sc"))$
#let fita0 = sym.alpha

#let k1 = $phy.vb(k)_1$
#let k2 = $phy.vb(k)_2$
#let anglez = $alpha$

#let x-axis = [$x$ axis]
#let y-axis = [$y$ axis]
#let z-axis = [$z$ axis]
#let xy-plane = [$x y$ plane]

#let x1064 = $x 1064$
#let ax1064 = $a_x1064$
#let wx1064 = $w_x1064$
#let vx1064 = $v_x1064$
#let Vx1064 = $V_x1064$

#let x532 = $x 532$
#let ax532 = $a_x532$
#let wx532 = $w_x532$
#let vx532 = $v_x532$
#let Vx532 = $V_x532$

#let y1064 = $y 1064$
#let ay1064 = $a_y1064$
#let wy1064 = $w_y1064$
#let vy1064 = $v_y1064$
#let Vy1064 = $V_y1064$

#let z532 = $z 532$
#let az532 = $a_z532$
#let wz532 = $w_z532$
#let vz532 = $v_z532$
#let Vz532 = $V_z532$

#let z1064 = $z 1064$
#let az1064 = $a_z1064$
#let wz1064 = $w_z1064$
#let vz1064 = $v_z1064$
#let Vz1064 = $V_z1064$

#let band = $epsilon$
#let cband = $tilde(epsilon)$

#let Vl = $V_l$
#let Vs = $V_s$
#let eL = $epsilon_L$
#let eR = $epsilon_R$
#let tin = $t_"in"$
#let tout = $t_"out"$

#let ketg = $phy.ket(g)$
#let kete = $phy.ket(e)$
#let ketup = $phy.ket(arrow.t)$
#let ketdown = $phy.ket(arrow.b)$
#let ketL = $phy.ket(L)$
#let ketR = $phy.ket(R)$
#let ketLL = $phy.ket(L L)$
#let ketLR = $phy.ket(L R)$
#let ketRL = $phy.ket(R L)$
#let ketRR = $phy.ket(R R)$
#let kets = $phy.ket(s)$
#let kett = $phy.ket(t)$
#let ketdp = $phy.ket(d_+)$
#let ketdm = $phy.ket(d_-)$

// thermal lensing parameters
#let tpower = $p$
#let tmag = sym.gamma

// optical materials
#let UVFS = "UVFS"
#let CAF2 = $"CaF"_2$
#let NBK7 = "N-BK7"
#let NSF5 = "N-SF5"
#let NSF6HT = "N-SF6HT"
#let NSF11 = "N-SF11"
#let NBAF10 = "N-BAF10"
#let NBALF4 = "N-BALF4"
#let SiO2 = "SiO2"
#let TGG = "TGG"

// waveplate names...
#let hwp = [$lambda slash 2$ waveplate]
#let qwp = [$lambda slash 4$ waveplate]

// lattice-modulation variables
#let lms = [lattice-modulation spectroscopy]
#let slms = [superlattice-modulation spectroscopy]
#let fmod = $f_"mod"$
#let tmod = $tau_"mod"$

// superlattice phase parameters
#let fdds = $f_"DDS"$
#let faom = $f_"AOM"$
#let fbeat = $f_"beat"$

// superlattice stability parameters
#let RH = $R H$
#let CO2 = "CO2"
#let xCO2 = $x_"C"$
#let phix1064 = $phi_x1064$
#let phix532 = $phi_x532$
#let nx1064 = $n_x1064$
#let nx532 = $n_x532$
#let kx1064 = $k_x1064$
#let kx532 = $k_x532$
#let kpump = $k_"pump"$

// a dummy function to mark stuff I still want to fix...
#let fix(comment, body) = body

// a shortcut for red text to be used as an annotation
#let tr = text.with(red)

#let notes(body) = {
  show list: set text(red)
  body
}

// make this a global function in header.typ?
#let table-stroke(x, y, stroke: none) = {
  if (y == 0) { (bottom: stroke) }
  if (x == 0) { (right: stroke) }
}
