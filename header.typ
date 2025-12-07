#import "@local/fancy-thesis:0.1.0": floating-figure, optional-refs, subref
#import "@local/fancy-units:0.2.0": (
  add-macros, configure, format-qty, format-unit-fraction, format-unit-power, format-unit-symbol, num, qty,
  relative-uncertainties, unit,
)
#import "@preview/physica:0.9.7" as phy
#import "@preview/mannot:0.3.0": markrect

#let fancy-units(body) = {
  configure(
    num-transform: relative-uncertainties,
    unit-format: format-unit-fraction,
    qty-format: format-qty.with(separator: sym.wj + h(0.2em) + sym.wj),
  )

  add-macros(
    Ohm: sym.Omega,
    Erec: [_E_#sub[rec]],
    Erecl: [_E_#sub[rec,l]],
    Erecs: [_E_#sub[rec,s]],
  )

  body
}

// some custom fancy-units functions
#let deg(..args, body) = $#num(..args, body)degree$
#let degC(..args, body) = $#num(..args, body)#h(0.2em)degree "C"$
#let iqty = qty.with(unit-format: format-unit-symbol)
#let pqty = qty.with(unit-format: format-unit-power)
#let iunit = unit.with(format: format-unit-symbol)
#let punit = unit.with(format: format-unit-power)

#let cexp(body) = $upright(e)^(upright(i) #body)$
#let ncexp(body) = $upright(e)^(- upright(i) #body)$

#let eqp = $med .$
#let eqc = $med comma$

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
#let fitr = $rho$
#let fita0 = $alpha$
#let fitw0 = $w_0$
#let fitx0 = $x_0$
#let fity0 = $y_0$
#let fitang = $theta.alt$
#let fitaR = $a_R$
#let fitsR = $sigma_R$

#let Gsc = $Gamma_"sc"$
#let Udip = $U_"dip"$
#let k1 = $phy.vb(k)_1$
#let k2 = $phy.vb(k)_2$
#let anglez = $alpha$
#let uqm(m) = $u_q^#m$
#let bloch(q, n) = $psi_#q^#n$

#let x-axis = [$x$-axis]
#let y-axis = [$y$-axis]
#let z-axis = [$z$-axis]
#let xy-plane = [$x y$-plane]
#let xz-plane = [$x z$-plane]
#let yz-plane = [$y z$-plane]

#let along = $a_"long"$
#let ashort = $a_"short"$
#let klong = $k_"long"$
#let kshort = $k_"short"$

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

#let Vl = $V_l$
#let Vs = $V_s$
#let vl = $v_l$
#let vs = $v_s$
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

#let color-left = blue
#let color-right = red
#let color-singlet = green.darken(20%)
#let color-triplet = fuchsia
#let color-double-plus = red
#let color-double-minus = blue

// lattice beam names
#let forward = "forward-propagating"
#let retro = "retro-reflected"
#let zret = $z_"ret"$
#let zfwd = $z_"fwd"$

// thermal lensing parameters
#let ftherm = $f_"thermal"$
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
#let SiO2 = $"SiO"_2$
#let TGG = "TGG"

// waveplate names...
#let hwp = [$lambda slash 2$ waveplate]
#let qwp = [$lambda slash 4$ waveplate]

// lattice-modulation variables
#let lms = [lattice-modulation spectroscopy]
#let Lms = [Lattice-modulation spectroscopy]
#let slms = [superlattice-modulation spectroscopy]
#let Slms = [Superlattice-modulation spectroscopy]
#let V0 = $V_0$
#let v0 = $v_0$
#let dV = $delta V$
#let fmod = $f_"mod"$
#let fmod2 = $f_"mod"^((2))$
#let tmod = $tau_"mod"$
#let Dn = $Delta n$
#let fnm(n, m) = $f_(#n -> #m)$

#let vr = $phy.vb(r)$
#let vq = $phy.vb(q)$
#let vn = $phy.vb(n)$
#let a1 = $phy.vb(a)_1$
#let a2 = $phy.vb(a)_2$
#let a3 = $phy.vb(a)_3$
#let b1 = $phy.vb(b)_1$
#let b2 = $phy.vb(b)_2$
#let m1 = $m_1$
#let m2 = $m_2$
#let uq2 = $u_vq$
#let uqm2(m1, m2) = $u_vq^(#m1 #m2)$
#let nx = $n_x$
#let ny = $n_y$
#let cn = $eta$ // coupled band index
#let band = $epsilon$
#let cband = $tilde(epsilon)$

// radial potential
#let Vrad = $V_"rad"$
#let vrad = $v_"rad"$
#let Rl = $R_l$
#let Rs = $R_s$

// superlattice phase parameters
#let phase = $phi$
#let fdds = $f_"DDS"$
#let faom = $f_"AOM"$
#let fbeat = $f_"beat"$
#let tau0 = $tau_0$
#let f0 = $f_0$
#let Df = $Delta f$
#let ghor = $gamma_"hor"$
#let gver = $gamma_"ver"$

// superlattice stability parameters
#let RH = $R H$
#let CO2 = $"CO"_2$
#let xCO2 = $x_"C"$
#let I2C = $"I"^2"C"$
#let phix1064 = $phi_x1064$
#let phix532 = $phi_x532$
#let nx1064 = $n_x1064$
#let nx532 = $n_x532$
#let kx1064 = $k_x1064$
#let kx532 = $k_x532$
#let kpump = $k_"pump"$
#let mu-metal = [μ-metal]

// Floquet stuff...
#let H0 = $hat(H)_0$
#let Heff = $hat(H)_"eff"$
#let Vmod = $hat(V)$
#let kick = $hat(K)$
#let K0 = $K_0$
#let teff = $t_"eff"$
#let Ueff = $U_"eff"$
#let Jeff = $J_"eff"$
#let VNN = $V^"NN"$
#let VDE = $V^"DE"$
#let VCT = $V^"CT"$
#let VCTeff = $V^"CT"_"eff"$
#let calC = $cal(C)$
#let Fpair = $cal(F)_"pair"$
#let tcorr = $t_"corr"$
#let DEmin = $Delta E_"min"$
#let Jn(n) = $J_#n$
#let teffn(n) = $teff^((#n))$
#let ateffn(n) = $lr(abs(teff^((#n))), size: #50%)$

#let marks(body, color: black, fill: none, stroke: 1.2pt, radius: 1mm, outset: 0.5em) = markrect(
  body,
  color: color,
  fill: fill,
  stroke: stroke,
  radius: radius,
  outset: outset,
)

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
