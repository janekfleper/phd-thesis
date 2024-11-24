#import "@preview/physica:0.9.3" as phy
#import "../../stuff.typ": num, unit, qty

#let cexp(body) = [
  $upright(e)^(upright(i) #body)$
]

#let ncexp(body) = [
  $upright(e)^(- upright(i) #body)$
]

== Bloch theorem

The solutions of the Hamiltonian @optical-lattice-hamiltonian-dimensionless-xy can be derived using Bloch's theorem that takes the periodicity of the potential @optical-lattice-potential into account.
The theorem states that the eigenfunctions of the Hamiltonian $accent(H, hat)$ have the form

$
  psi_q (x) = u_q (x) dot cexp(q x)
$ <bloch-theorem-eigenfunctions>

where $q$ is the (dimensionless) quasi-momentum and the function $u_q (x)$ has the same periodicity as the potential $V(x)$ in @optical-lattice-potential.
Since the position $x$ is dimensionless, the quasi-momentum $q$ must be dimensionless as well.
Analogous to the transformation $x -> x slash k$, the quasi-momentum is transformed as $q -> q dot k$.

Due to its periodicity, the function $u_q (x)$ can be written as the Fourier series

$
  u_q (x) = sum_m u_(q,m) cexp(2 m x)
$ <bloch-theorem-uq-fourier-series>

with the integer index $m$ counting from $-infinity$ to $+infinity$.
Since the potential $V(x)$ is $pi$-periodic (in dimensionless coordinates), the periodicity of $u_q (x)$ can be directly seen in @bloch-theorem-uq-fourier-series.
Shifting the position $x -> x + pi$ will reveal the additional factor $upright(e)^(upright(i) 2 m pi)$ in the sum which is always equal to $1$ for integer values of $m$.
With the Fourier series of $u_q (x)$ the eigenfunctions @bloch-theorem-eigenfunctions can now be written as 

$
  psi_q (x) = sum_m u_(q,m) cexp((q + 2m)x) .
$ <bloch-theorem-psiq-fourier-series>

The potential $V(x)$ can directly be rewritten as a Fourier series by writing $sin^2 x$ as complex exponential functions.
The Fourier series coefficients can then be read directly from the different terms.

$
  v(x)
    &= v_0 dot sin^2 x \
    &= v_0 dot (1/2 - 1/2 cos(2x)) \
    &= underbrace(1/2 v_0, c_0) #h(0.3em) underbrace(- 1/4 v_0, c_(plus.minus 1)) (cexp(2x) + ncexp(2x)) \
$ <bloch-theorem-potential-fourier-series>

Instead of the sum over $m$ from $-infinity$ to $+infinity$, the Fourier series for the potential only requires the terms $m = (-1, 0, 1)$ since all other coefficients $c_m$ are zero.

We will now use the Fourier series of the eigenfunctions @bloch-theorem-psiq-fourier-series and the Fourier series of the potential @bloch-theorem-potential-fourier-series to find the solutions of the Hamiltonian @optical-lattice-hamiltonian-dimensionless-xy.

$
  epsilon_n (q) psi_q (x)
    &= epsilon_n (q) sum_m u_(q,m) cexp((q+2m)x) \
  epsilon_n (q) psi_q (x)
    &= accent(h, hat) psi_q (x) \
    &= - phy.dv(,x,2) sum_m u_(q,m) cexp((q+2m)x)
      + sum_m u_(q,m) cexp((q+2m)x) sum_m' c_m' cexp((q + 2m')x) \
    &= sum_m u_(q,m) (q + 2m)^2 cexp((q+2m)x)
      + sum_m sum_m' u_(q,m) c_m' cexp((q+2(m+m'))x) \
    &= sum_m u_(q,m) (q + 2m)^2 cexp((q+2m)x)
      + sum_m sum_m' u_(q,m-m') c_m' cexp((q+2m)x)
$ <bloch-theorem-psiq-schroedinger>

In the last step I replaced $m -> m - m'$ to get the same complex exponential function as in all the other terms.
Since the sum over $m$ goes from $-infinity$ to $+infinity$, it is fine to just shift the index.
Each term in @bloch-theorem-psiq-schroedinger features a sum over $m$ and the exponential function $cexp((q+2m)x)$.
We can therefore discard the sums over $m$ to only look at the coupled equations for the Fourier series coefficients $u_(q,m)$ of the eigenfunctions in @bloch-theorem-psiq-fourier-series.

$
  epsilon_n (q) u_(q,m)
    &= (q + 2m)^2 u_(q,m) + sum_(m=-1)^1 c_m' u_(q,m-m') \
    &= ((q + 2m)^2 + 1/2 v_0) u_(q,m) - 1/4 v_0 (u_(q,m-1) + u_(q,m+1))
$ <bloch-theorem-uq-schroedinger>

The coefficients $u_(q,m)$ are coupled by the Fourier series coefficients $c_(m eq.not 0)$ of the optical lattice potential.
@bloch-theorem-uq-schroedinger can be written as a matrix and solved numerically for each quasi-momentum $q$.
The size of the matrix depends on the values that are chosen for the index $m$.
Since the diagonal matrix element scales with $m^2$, the off-diagonal coupling term $-1/4 v_0$ becomes weak relative to the diagonal term for large values of $m$.
A reasonable range for the index is therefore $m = [-10, ..., 10]$.
In that case the size of the matrix @bloch-theorem-uq-schroedinger will be $21 times 21$ and there will be $21$ eigenvalues $epsilon_n (q)$ for each quasi-momentum $q$.

When looking at the eigenvalues $epsilon_n (q)$ as a function of the quasi-momentum $q$, we can see that the eigensolutions for so-called _energy bands_ in quasi-momentum space.
The _band index_ $n$ starts at $1$ for the lowest band and increases in integer steps to the dimension of the matrix.
For each value of $n$ the eigenvalues $epsilon_n (q)$ form a continuous function of the quasi-momentum $q$, and if $v_0 > 0$ there are _band gaps_ visible between the lowest bands.
