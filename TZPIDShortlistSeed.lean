/-
Generated from the TZPID strict shortlist.
This is a Lean-readable manifest seed, not a proof of the physics yet.
The next step is to replace `FrameworkDerivable` assumptions with real TZPID axioms.
-/

structure TZPIDCandidate where
  id : String
  title : String
  canonicalEquation : String
  parsedMath : String
deriving Repr, BEq

axiom FrameworkDerivable : TZPIDCandidate -> Prop

def candidate_id_0 : TZPIDCandidate :=
  {
    id := "0",
    title := "Existence and Uniqueness of the Trawin Zero Point",
    canonicalEquation := "\\lim_{\\tau\\to\\infty}\\gamma(\\tau)=p,",
    parsedMath := "Eq(Limit(gamma(tau), tau, oo, dir='-'), p)"
  }

axiom candidate_id_0_derivable : FrameworkDerivable candidate_id_0

def candidate_id_1 : TZPIDCandidate :=
  {
    id := "1",
    title := "Tzp Trawin Zero Point",
    canonicalEquation := "\\forall \\Gamma \\subset M,\\; \\Gamma \\sim \\Lambda || \\Lambda(0)=\\Lambda(1/2)=p",
    parsedMath := "forall*(Gamma*(M*subset)) || Eq(Eq(Lambda(0), Lambda(1/2)), p)"
  }

axiom candidate_id_1_derivable : FrameworkDerivable candidate_id_1

def candidate_id_2 : TZPIDCandidate :=
  {
    id := "2",
    title := "Dimensional Ambiguity at TZP",
    canonicalEquation := "\\dim_{p}(M) \\in \\{n-1,n,n+1\\} || \\Delta_{\\mathrm{branch}} : \\Lambda \\longrightarrow \\{n-1,n,n+1\\}",
    parsedMath := "in*dim_{p}(M) || Delta_{mathrm*(b*(r*(a*(n*(c*h)))))}/Lambda"
  }

axiom candidate_id_2_derivable : FrameworkDerivable candidate_id_2

def candidate_id_3 : TZPIDCandidate :=
  {
    id := "3",
    title := "TZP Stability Under Symmetry-Preserving Diffeomorphisms",
    canonicalEquation := "\\phi : M \\to M, \\qquad \\phi(p)=p || \\phi(\\Lambda)=\\Lambda",
    parsedMath := "phi/M || Eq(phi(Lambda), Lambda)"
  }

axiom candidate_id_3_derivable : FrameworkDerivable candidate_id_3

def candidate_id_4 : TZPIDCandidate :=
  {
    id := "4",
    title := "Trawin Base Unit",
    canonicalEquation := "u_{T} := \\oint_{\\Gamma} \\sqrt{\\lvert g \\rvert}\\, d\\ell || \\operatorname{Wind}_{p}(\\Gamma)=1",
    parsedMath := "Eq(u_{T}, oint_{Gamma}*(dell*sqrt(lvert*(g*rvert)))) || operatorname*(W*(i*(d*n)))"
  }

axiom candidate_id_4_derivable : FrameworkDerivable candidate_id_4

def candidate_id_5 : TZPIDCandidate :=
  {
    id := "5",
    title := "Temporal Displacement Factor",
    canonicalEquation := "\\alpha_{T} = \\frac{dt'}{dt} || \\alpha_{T}^{\\mathrm{TZP}} = \\lim_{\\gamma \\to p} \\frac{dt'}{dt}",
    parsedMath := "Eq(alpha_{T}, Derivative(t**prime, t)) || Eq(alpha_{T}**(mathrm*(T*(P*Z))), Limit(Derivative(t**prime, t), gamma, p, dir='+-'))"
  }

axiom candidate_id_5_derivable : FrameworkDerivable candidate_id_5

def candidate_id_6 : TZPIDCandidate :=
  {
    id := "6",
    title := "Non-Linearity Constant K_NL",
    canonicalEquation := "K_{\\mathrm{NL}} = \\frac{\\lVert \\nabla^{2}\\Phi \\rVert}{\\lVert \\nabla\\Phi \\rVert^{2}} || K_{\\mathrm{NL}}^{\\mathrm{TZP}} = \\lim_{x \\to p} \\frac{\\lVert \\nabla^{2}\\Phi(x) \\rVert}{\\lVert \\nabla\\Phi(x) \\rVert^{2}}",
    parsedMath := "Eq(K_{mathrm*(L*N)}, (lVert*(nabla**2*(Phi*rVert)))/((lVert*(nabla*(Phi*rVert**2))))) || Eq(K_{mathrm*(L*N)}**(mathrm*(T*(P*Z))), Limit((lVert*(nabla**2*(rVert*Phi(x))))/((lVert*(nabla*(rVert**2*Phi(x))))), x, p, dir='+-'))"
  }

axiom candidate_id_6_derivable : FrameworkDerivable candidate_id_6

def candidate_id_7 : TZPIDCandidate :=
  {
    id := "7",
    title := "Causal Loop Invariant",
    canonicalEquation := "I_{\\mathrm{CL}} = \\oint_{\\Gamma} A \\cdot dx || dA = 0 \\quad \\text{on } M \\setminus \\{p\\}",
    parsedMath := "Eq(I_{mathrm*(C*L)}, dx*(A*oint_{Gamma})) || Eq(dA, 0*(mathrm*((M*(p*setminus))*(n*o))))"
  }

axiom candidate_id_7_derivable : FrameworkDerivable candidate_id_7

def candidate_id_8 : TZPIDCandidate :=
  {
    id := "8",
    title := "Null Space Projection",
    canonicalEquation := "P_{\\mathrm{null}} : T_{p}M \\to T_{p}M || P_{\\mathrm{null}}(v) = \\begin{cases} v, & g(v,w)=0 \\text{ for all } w \\in T_{p}M,\\\\ 0, & \\text{otherwise.} \\end{cases}",
    parsedMath := "P_{mathrm*(n*(u*(l*l)))}/((M*T_{p})) || Eq(P_{mathrm*(n*(u*(l*l)))}(v), begin*(v*(c*(a*(s*(e*s))))))"
  }

axiom candidate_id_8_derivable : FrameworkDerivable candidate_id_8

def candidate_id_9 : TZPIDCandidate :=
  {
    id := "9",
    title := "Inter-Modal Transfer Rate",
    canonicalEquation := "T_{\\mathrm{IM}} = \\frac{1}{u_{T}} \\int_{\\Sigma} \\phi_{m_{1}}^{*}\\, \\mathcal{L}_{T}\\, \\phi_{m_{2}}\\, d\\Sigma || \\Sigma \\cap \\{p\\} = \\varnothing",
    parsedMath := "Eq(T_{mathrm*(I*M)}, 1/u_{T}) || Eq(Sigma*(cap*p), varnothing)"
  }

axiom candidate_id_9_derivable : FrameworkDerivable candidate_id_9

def candidate_id_10 : TZPIDCandidate :=
  {
    id := "10",
    title := "Spectral Density Index (TZP-Weighted)",
    canonicalEquation := "\\eta(\\omega) = \\omega^{-\\beta} e^{-\\omega/\\omega_{0}} || \\omega_{0} = \\omega_{0}(u_{T}), \\qquad \\beta = \\beta(S_{\\mathrm{HD}})",
    parsedMath := "Eq(eta(omega), e**((-omega)/omega_{0})/omega**beta) || Eq(omega_{0}, omega_{0}(u_{T}))"
  }

axiom candidate_id_10_derivable : FrameworkDerivable candidate_id_10

def candidate_id_11 : TZPIDCandidate :=
  {
    id := "11",
    title := "Manifold Curvature (TZP Condition)",
    canonicalEquation := "R_{T} = \\lim_{x \\to p}\\bigl(R(x)+f(x)\\bigr) || R_{T} < \\infty \\quad \\Longleftrightarrow \\quad \\Gamma \\sim \\Lambda",
    parsedMath := "Eq(R_{T}, Limit(R(x) + f(x), x, p, dir='+-')) || R_{T} < oo || Gamma*(Lambda*sim)"
  }

axiom candidate_id_11_derivable : FrameworkDerivable candidate_id_11

def candidate_id_12 : TZPIDCandidate :=
  {
    id := "12",
    title := "Trawinistic Connection",
    canonicalEquation := "\\nabla^{\\mathrm{T}} g = 0 \\qquad \\text{away from } p || T(\\nabla^{\\mathrm{T}})=0 \\qquad \\text{away from } p || \\nabla^{\\mathrm{T}}\\big\\vert_{\\det g \\neq 0} = \\nabla^{\\mathrm{LC}}, \\qquad \\nabla^{\\mathrm{T}} n = 0 \\ \\text{for}\\ n \\in \\operatorname{Null}_{p}(M)",
    parsedMath := "Eq(g*nabla**(T*mathrm), 0*p) || Eq(T(nabla**(T*mathrm)), 0*p) || nabla**(T*mathrm)"
  }

axiom candidate_id_12_derivable : FrameworkDerivable candidate_id_12

def candidate_id_13 : TZPIDCandidate :=
  {
    id := "13",
    title := "Trawinistic Laplacian",
    canonicalEquation := "\\Delta_{\\mathrm{T}}\\phi = \\nabla^{\\mathrm{T}}_{a} \\nabla_{\\mathrm{T}}^{\\,a}\\phi || \\nabla_{\\mathrm{T}}^{\\,a} = g_{\\mathrm{reg}}^{ab}\\nabla^{\\mathrm{T}}_{b}",
    parsedMath := "Eq(Delta_{T*mathrm}*phi, nabla**(T*mathrm)*(nabla_{T*mathrm}**a*phi)) || Eq(nabla_{T*mathrm}**a, g_{mathrm*(r*(e*g))}**(a*b)*nabla**(T*mathrm))"
  }

axiom candidate_id_13_derivable : FrameworkDerivable candidate_id_13

def candidate_id_14 : TZPIDCandidate :=
  {
    id := "14",
    title := "Trawinistic D'Alembertian",
    canonicalEquation := "\\Box_{\\mathrm{T}}\\phi = g_{\\mathrm{reg}}^{ab} \\nabla^{\\mathrm{T}}_{a} \\nabla^{\\mathrm{T}}_{b}\\phi || g_{\\mathrm{reg}}^{ab} = \\left(g^{-1}\\right)_{\\mathrm{reg}}^{ab}",
    parsedMath := "Eq(Box_{T*mathrm}*phi, g_{mathrm*(r*(e*g))}**(a*b)*(nabla**(T*mathrm)*(nabla**(T*mathrm)*phi))) || Eq(g_{mathrm*(r*(e*g))}**(a*b), 1/g)"
  }

axiom candidate_id_14_derivable : FrameworkDerivable candidate_id_14

def candidate_id_15 : TZPIDCandidate :=
  {
    id := "15",
    title := "Trawinistic Winding Number",
    canonicalEquation := "w = \\frac{1}{2\\pi} \\oint_{\\Gamma} \\nabla \\theta \\cdot d\\ell || w \\in \\tfrac{1}{2}\\mathbb{Z}",
    parsedMath := "Eq(w, dell*((oint_{Gamma}*(nabla*theta))/((2*pi)))) || w*(in*(t*((Z*mathbb)/2)))"
  }

axiom candidate_id_15_derivable : FrameworkDerivable candidate_id_15

def candidate_id_16 : TZPIDCandidate :=
  {
    id := "16",
    title := "Trawin Characteristic Class",
    canonicalEquation := "c_{T} = \\left[\\frac{1}{2\\pi}F\\right] \\in H^{2}(M\\setminus\\{p\\},\\mathbb{Z}) || \\operatorname{hol}(\\mathcal{A}) = w",
    parsedMath := "Eq(c_{T}, (F/((2*pi)))*(H**2*in)) || Eq(operatorname*((A*mathcal)*(h*(l*o))), w)"
  }

axiom candidate_id_16_derivable : FrameworkDerivable candidate_id_16

def candidate_id_17 : TZPIDCandidate :=
  {
    id := "17",
    title := "TZP Curvature Singularity",
    canonicalEquation := "\\lim_{x\\to p} R_{T}(x) = \\infty || R_{T}(x)=\\lim_{y\\to x}\\bigl(R(y)+f(y)\\bigr)",
    parsedMath := "Eq(Limit(R_{T}(x), x, p, dir='+-'), oo) || Eq(R_{T}(x), Limit(R(y) + f(y), y, x, dir='+-'))"
  }

axiom candidate_id_17_derivable : FrameworkDerivable candidate_id_17

def candidate_id_18 : TZPIDCandidate :=
  {
    id := "18",
    title := "TZP Potential Term",
    canonicalEquation := "V_{T}(x) = \\lambda \\exp\\!\\left( -\\frac{d(x,p)}{u_{T}} \\right) || V_{T}(p)=\\lambda",
    parsedMath := "Eq(V_{T}(x), lambda*exp(-d(x, p)/u_{T})) || Eq(V_{T}(p), lambda)"
  }

axiom candidate_id_18_derivable : FrameworkDerivable candidate_id_18

def candidate_id_19 : TZPIDCandidate :=
  {
    id := "19",
    title := "TZP Vacuum Energy Density",
    canonicalEquation := "\\rho_{\\mathrm{vac}}^{T} = \\frac{1}{u_{T}^{4}} \\int_{0}^{\\omega_{\\mathrm{cut}}} \\eta(\\omega)\\,\\hbar\\omega\\,d\\omega || \\omega_{\\mathrm{cut}}=\\omega_{\\mathrm{cut}}(S_{\\mathrm{HD}})",
    parsedMath := "Eq(rho_{mathrm*(v*(a*c))}**T, Integral((hbar*omega)*eta(omega), (omega, 0, omega_{mathrm*(c*(t*u))}))/(u_{T}**4)) || Eq(omega_{mathrm*(c*(t*u))}, omega_{mathrm*(c*(t*u))}(S_{mathrm*(D*H)}))"
  }

axiom candidate_id_19_derivable : FrameworkDerivable candidate_id_19

def candidate_id_20 : TZPIDCandidate :=
  {
    id := "20",
    title := "Constraint: Trawinistic Metric Compatibility",
    canonicalEquation := "\\nabla^{\\mathrm{T}} g = 0 \\qquad (x\\neq p) || \\nabla^{\\mathrm{T}} g = C\\,\\delta(x,p) \\qquad (x=p)",
    parsedMath := "Eq(g*nabla**(T*mathrm), 0) || Eq(g*nabla**(T*mathrm), C*delta(x, p))"
  }

axiom candidate_id_20_derivable : FrameworkDerivable candidate_id_20

def candidate_id_21 : TZPIDCandidate :=
  {
    id := "21",
    title := "TZP-Modified Hamiltonian Operator",
    canonicalEquation := "H_{\\mathrm{T}}\\lvert\\Psi\\rangle = \\int_{\\Sigma}\\mathcal{H}_{\\mathrm{T}}\\,d\\Sigma\\;\\lvert\\Psi\\rangle || \\Sigma \\cap \\{p\\} = \\varnothing",
    parsedMath := "H_{T*mathrm}*(Psi*lvert) || Eq(Sigma*(cap*p), varnothing)"
  }

axiom candidate_id_21_derivable : FrameworkDerivable candidate_id_21

def candidate_id_22 : TZPIDCandidate :=
  {
    id := "22",
    title := "Hamilton–Jacobi Equation (Trawinistic Form)",
    canonicalEquation := "\\frac{\\partial S}{\\partial t} \\;+\\; \\mathcal{H}_{\\mathrm{T}} \\!\\left( q,\\frac{\\partial S}{\\partial q},t \\right) =0 || p=\\frac{\\partial S}{\\partial q}",
    parsedMath := "H*mathcal + Derivative(S, t) || Eq(p, Derivative(S, q))"
  }

axiom candidate_id_22_derivable : FrameworkDerivable candidate_id_22

def candidate_id_23 : TZPIDCandidate :=
  {
    id := "23",
    title := "Principle of Least Action (TZP Variant)",
    canonicalEquation := "\\delta S[\\phi] = 0 || \\phi\\big\\vert_{\\partial M} = \\phi_{0}",
    parsedMath := "Eq(delta*(S*phi), 0) || Eq(phi*vert_{M*partial}, phi_{0})"
  }

axiom candidate_id_23_derivable : FrameworkDerivable candidate_id_23

def candidate_id_24 : TZPIDCandidate :=
  {
    id := "24",
    title := "Field Equations on a Trawinistic Manifold",
    canonicalEquation := "\\frac{\\delta S}{\\delta \\phi}=0 || \\nabla^{\\mathrm{T}}_{a}\\nabla^{\\mathrm{T}a}\\phi \\;+\\; \\frac{\\partial V_{T}}{\\partial \\phi} \\;+\\; \\mathcal{C}_{\\mathrm{curv/tors}} =0",
    parsedMath := "Eq((S*delta)/((delta*phi)), 0) || C*mathcal + (nabla**(T*mathrm)*(nabla**(mathrm*(T*a))*phi) + Derivative(V_{T}, phi))"
  }

axiom candidate_id_24_derivable : FrameworkDerivable candidate_id_24

def candidate_id_25 : TZPIDCandidate :=
  {
    id := "25",
    title := "Quantum Field Propagator (TZP Background)",
    canonicalEquation := "\\Box_{\\mathrm{T}}\\,G_{\\mathrm{T}}(x,x') = -\\delta(x,x') || G_{\\mathrm{T}}(x,x') \\sim e^{-V_{T}(x,x')}",
    parsedMath := "Eq(Box_{T*mathrm}*G_{T*mathrm}(x, x**prime), -delta(x, x**prime)) || (sim/e**V_{T}(x, x**prime))*G_{T*mathrm}(x, x**prime)"
  }

axiom candidate_id_25_derivable : FrameworkDerivable candidate_id_25

def candidate_id_26 : TZPIDCandidate :=
  {
    id := "26",
    title := "Vacuum Fluctuation Operator (TZP)",
    canonicalEquation := "\\mathcal{V}_{\\mathrm{T}}\\phi_{\\omega} = \\sqrt{\\frac{\\hbar\\omega}{2}}\\, \\phi_{\\omega}\\, \\coth\\!\\left( \\frac{\\omega}{2\\omega_{0}} \\right) || \\omega_{0}=\\omega_{0}\\bigl(\\eta\\bigr)",
    parsedMath := "V*mathcal || Eq(omega_{0}, omega_{0}(eta))"
  }

axiom candidate_id_26_derivable : FrameworkDerivable candidate_id_26

def candidate_id_27 : TZPIDCandidate :=
  {
    id := "27",
    title := "Elsasser Attractor Manifold",
    canonicalEquation := "\\Lambda = \\frac{B^{2}}{\\rho\\,\\mu\\,\\Omega^{2}} || \\Lambda \\approx 1",
    parsedMath := "Eq(Lambda, B**2/((rho*(Omega**2*mu)))) || Lambda*(approx*1)"
  }

axiom candidate_id_27_derivable : FrameworkDerivable candidate_id_27

def candidate_id_28 : TZPIDCandidate :=
  {
    id := "28",
    title := "Magnetic–Coriolis Energy Equipartition",
    canonicalEquation := "\\frac{B^{2}}{2\\mu} = \\frac{1}{2}\\rho(\\Omega r)^{2} || E_{\\mathrm{mag}} = E_{\\mathrm{rot}}",
    parsedMath := "Eq(B**2/((2*mu)), rho(Omega*r)**2/2) || Eq(E_{mathrm*(m*(a*g))}, E_{mathrm*(r*(o*t))})"
  }

axiom candidate_id_28_derivable : FrameworkDerivable candidate_id_28

def candidate_id_29 : TZPIDCandidate :=
  {
    id := "29",
    title := "Universality of Elsasser Criticality",
    canonicalEquation := "\\Lambda = \\frac{B^{2}}{\\rho\\,\\mu\\,\\Omega^{2}} || \\Lambda_{\\mathrm{crit}} \\approx 1",
    parsedMath := "Eq(Lambda, B**2/((rho*(Omega**2*mu)))) || Lambda_{mathrm*(c*(r*(i*t)))}*(approx*1)"
  }

axiom candidate_id_29_derivable : FrameworkDerivable candidate_id_29

def candidate_id_30 : TZPIDCandidate :=
  {
    id := "30",
    title := "Magnetic Helicity as Scale-Invariant Constraint",
    canonicalEquation := "\\chi_{H} = \\frac{H}{B^{2}L} || \\chi_{H} = \\mathrm{const.}",
    parsedMath := "Eq(chi_{H}, H/((B**2*L))) || Eq(chi_{H}, mathrm)"
  }

axiom candidate_id_30_derivable : FrameworkDerivable candidate_id_30

def candidate_id_31 : TZPIDCandidate :=
  {
    id := "31",
    title := "Helicity Linking Number Universality",
    canonicalEquation := "\\operatorname{Lk}(C_{1},C_{2}) = \\frac{1}{4\\pi} \\oint_{C_{1}}\\oint_{C_{2}} \\frac{(\\mathbf{r}_{1}-\\mathbf{r}_{2})\\cdot \\left(d\\mathbf{r}_{1}\\times d\\mathbf{r}_{2}\\right)} {\\lvert \\mathbf{r}_{1}-\\mathbf{r}_{2} \\rvert^{3}} || \\operatorname{Lk}(C_{1},C_{2}) \\in \\mathbb{Z}",
    parsedMath := "operatorname*(L*k) || operatorname*(L*k)"
  }

axiom candidate_id_31_derivable : FrameworkDerivable candidate_id_31

def candidate_id_32 : TZPIDCandidate :=
  {
    id := "32",
    title := "(μ ∝ M R^2Ω) Universal Scaling Law",
    canonicalEquation := "\\mu = k\\,M R^{2}\\Omega || k \\approx \\mathrm{const.}",
    parsedMath := "Eq(mu, k*(M*(Omega*R**2))) || k*(approx*mathrm)"
  }

axiom candidate_id_32_derivable : FrameworkDerivable candidate_id_32

def candidate_id_33 : TZPIDCandidate :=
  {
    id := "33",
    title := "Dimensionless Gyromagnetic Coupling Constant",
    canonicalEquation := "g_{\\mu} = \\frac{\\mu}{M R^{2}\\Omega} || g_{\\mu} = \\mathcal{O}(1)",
    parsedMath := "Eq(g_{mu}, mu/((M*(Omega*R**2)))) || Eq(g_{mu}, mathcal*(O*1))"
  }

axiom candidate_id_33_derivable : FrameworkDerivable candidate_id_33

def candidate_id_34 : TZPIDCandidate :=
  {
    id := "34",
    title := "Order-Of-Magnitude Invariance Across 47 Orders of Scale",
    canonicalEquation := "\\mathcal{R} = \\frac{Q}{Q'} || \\left|\\log_{10}\\mathcal{R}\\right| \\leq 1",
    parsedMath := "Eq(R*mathcal, Q/(Q**prime)) || Abs(log(R*mathcal, 10)) <= 1"
  }

axiom candidate_id_34_derivable : FrameworkDerivable candidate_id_34

def candidate_id_35 : TZPIDCandidate :=
  {
    id := "35",
    title := "Bayesian Evidence Accumulation Framework",
    canonicalEquation := "\\frac{P(H_{i}\\mid D)}{P(H_{j}\\mid D)} = \\frac{P(D\\mid H_{i})}{P(D\\mid H_{j})} \\frac{P(H_{i})}{P(H_{j})} || B_{ij} = \\frac{P(D\\mid H_{i})}{P(D\\mid H_{j})}",
    parsedMath := "Eq(P(H_{i}*(D*mid))/P(H_{j}*(D*mid)), (P(H_{i})/P(H_{j}))*(P(D*(H_{i}*mid))/P(D*(H_{j}*mid)))) || Eq(B_{i*j}, P(D*(H_{i}*mid))/P(D*(H_{j}*mid)))"
  }

axiom candidate_id_35_derivable : FrameworkDerivable candidate_id_35

def candidate_id_36 : TZPIDCandidate :=
  {
    id := "36",
    title := "Falsifiability as Core Design Constraint",
    canonicalEquation := "\\exists D: \\quad P(D\\mid H) \\neq P(D\\mid \\neg H) || \\left|P(D\\mid H) - P(D\\mid \\neg H)\\right| \\geq \\delta",
    parsedMath := "Ne((D*exists)/P(D*(H*mid)), P(D*(mid*(H*neg)))) || Abs(P(D*(H*mid)) - P(D*(mid*(H*neg)))) >= delta"
  }

axiom candidate_id_36_derivable : FrameworkDerivable candidate_id_36

def candidate_id_37 : TZPIDCandidate :=
  {
    id := "37",
    title := "Quantum Fields on Curved Manifolds",
    canonicalEquation := "\\phi \\in \\Gamma(E \\to M) || \\left(\\nabla^{\\mu}\\nabla_{\\mu} + m^{2} + \\xi R\\right)\\phi = 0",
    parsedMath := "phi*(Gamma*in) || Eq(phi*(R*xi + (m**2 + nabla**mu*nabla_{mu})), 0)"
  }

axiom candidate_id_37_derivable : FrameworkDerivable candidate_id_37

def candidate_id_38 : TZPIDCandidate :=
  {
    id := "38",
    title := "Vacuum Polarization",
    canonicalEquation := "\\Pi_{\\mu\\nu}(x,x') = \\frac{\\delta^{2}W[A]}{\\delta A^{\\mu}(x)\\,\\delta A^{\\nu}(x')} \\biggr\\rvert_{A=0} || \\nabla^{\\mu}\\Pi_{\\mu\\nu}(x,x') = 0",
    parsedMath := "Eq(Pi_{mu*nu}(x, x**prime), (delta**2*(A*W))/((delta*(A**mu*(x*(delta*(A**nu*x**prime))))))) || Eq(nabla**mu*Pi_{mu*nu}(x, x**prime), 0)"
  }

axiom candidate_id_38_derivable : FrameworkDerivable candidate_id_38

def candidate_id_39 : TZPIDCandidate :=
  {
    id := "39",
    title := "Mode Quantization in Confined Geometries",
    canonicalEquation := "-\\Delta_{\\mathrm{T}}\\phi_{n} = \\lambda_{n}\\phi_{n} || \\omega_{n}^{2} = \\lambda_{n} + m^{2}",
    parsedMath := "Eq(-Delta_{T*mathrm}*phi_{n}, lambda_{n}*phi_{n}) || Eq(omega_{n}**2, lambda_{n} + m**2)"
  }

axiom candidate_id_39_derivable : FrameworkDerivable candidate_id_39

def candidate_id_40 : TZPIDCandidate :=
  {
    id := "40",
    title := "Boundary-Induced Quantum Effects",
    canonicalEquation := "\\mathcal{B}_{\\partial\\Omega}\\phi = \\sum_{n} b_{n}(\\partial\\Omega)\\,\\phi_{n} || b_{n} = b_{n}^{\\mathrm{geom}} + b_{n}^{\\mathrm{top}} + b_{n}^{\\mathrm{curv}}",
    parsedMath := "B*mathcal || Eq(b_{n}, b_{n}**(mathrm*(c*(u*(r*v)))) + (b_{n}**(mathrm*(g*(e*(m*o)))) + b_{n}**(mathrm*(t*(o*p)))))"
  }

axiom candidate_id_40_derivable : FrameworkDerivable candidate_id_40

def candidate_id_41 : TZPIDCandidate :=
  {
    id := "41",
    title := "Casimir-Type Phenomena",
    canonicalEquation := "E_{\\mathrm{Cas}}(L) = -\\frac{\\pi^{2}}{720\\,L^{3}}\\left(1+\\varepsilon\\right) || \\varepsilon = \\varepsilon_{\\mathrm{curv}} + \\varepsilon_{\\mathrm{TZP}}",
    parsedMath := "Eq(E_{mathrm*(C*(a*s))}(L), -pi**2/((720*L**3))*(varepsilon + 1)) || Eq(varepsilon, varepsilon_{mathrm*(T*(P*Z))} + varepsilon_{mathrm*(c*(u*(r*v)))})"
  }

axiom candidate_id_41_derivable : FrameworkDerivable candidate_id_41

def candidate_id_42 : TZPIDCandidate :=
  {
    id := "42",
    title := "Quantum Phase Transitions",
    canonicalEquation := "\\Delta(g_{c}) = 0 || \\xi \\sim |g-g_{c}|^{-\\nu}",
    parsedMath := "Eq(Delta(g_{c}), 0) || xi*(sim/Abs(g - g_{c})**nu)"
  }

axiom candidate_id_42_derivable : FrameworkDerivable candidate_id_42

def candidate_id_43 : TZPIDCandidate :=
  {
    id := "43",
    title := "Renormalization Flow as Dimensional Navigation",
    canonicalEquation := "\\mu\\frac{dg}{d\\mu} = \\beta\\!\\left(g,d_{\\mathrm{eff}}\\right) || d_{\\mathrm{eff}} = d_{\\mathrm{eff}}(\\mu)",
    parsedMath := "Eq(mu*Derivative(g, mu), beta(g, d_{mathrm*(e*(f*f))})) || Eq(d_{mathrm*(e*(f*f))}, d_{mathrm*(e*(f*f))}(mu))"
  }

axiom candidate_id_43_derivable : FrameworkDerivable candidate_id_43

def candidate_id_44 : TZPIDCandidate :=
  {
    id := "44",
    title := "Scale Dependence of Physical Constants",
    canonicalEquation := "\\frac{dc_{i}}{d\\ln\\mu} = f_{i}\\!\\left(c_{j},d_{\\mathrm{eff}}\\right) || c_{i} = c_{i}(\\mu,d_{\\mathrm{eff}})",
    parsedMath := "Eq((derivative, log(mu)), f_{i}) || Eq(c_{i}, c_{i}(mu, d_{mathrm*(e*(f*f))}))"
  }

axiom candidate_id_44_derivable : FrameworkDerivable candidate_id_44

def candidate_id_45 : TZPIDCandidate :=
  {
    id := "45",
    title := "Quantum Coherence and Decoherence",
    canonicalEquation := "\\mathcal{C}(\\phi_{1},\\phi_{2}) = \\frac{\\left|\\langle \\phi_{1},\\phi_{2}\\rangle\\right|} \\lVert\\phi_{1}\\rVert\\,\\lVert\\phi_{2}\\rVert || \\mathcal{C}(t) \\to 0",
    parsedMath := "C*mathcal || mathcal*(C*t)"
  }

axiom candidate_id_45_derivable : FrameworkDerivable candidate_id_45

def candidate_id_46 : TZPIDCandidate :=
  {
    id := "46",
    title := "Environment-Induced Superselection",
    canonicalEquation := "\\rho(t) \\to \\sum_{i} p_{i}\\,\\lvert i\\rangle\\langle i\\rvert || \\rho_{ij}(t) \\to 0 \\qquad (i \\neq j)",
    parsedMath := "rho(t) || rho_{i*j}(t)"
  }

axiom candidate_id_46_derivable : FrameworkDerivable candidate_id_46

def candidate_id_47 : TZPIDCandidate :=
  {
    id := "47",
    title := "Quantum Noise Spectra",
    canonicalEquation := "S_{O}(\\omega) = \\int d\\tau\\; e^{i\\omega\\tau} \\langle \\delta O(t)\\,\\delta O(t+\\tau)\\rangle || S_{O}^{(\\eta)}(\\omega) = S_{O}(\\omega)\\,\\eta(\\omega)",
    parsedMath := "Eq(S_{O}(omega), e**(i*(omega*tau))*Integral(1, tau)) || Eq(S_{O}**eta*omega, S_{O}(omega)*eta(omega))"
  }

axiom candidate_id_47_derivable : FrameworkDerivable candidate_id_47

def candidate_id_48 : TZPIDCandidate :=
  {
    id := "48",
    title := "Observer-Dependent Quantum States",
    canonicalEquation := "\\lvert \\psi_{\\mathrm{obs}}\\rangle = U(\\gamma)\\lvert \\psi_{0}\\rangle || U(\\gamma)^{\\dagger}U(\\gamma) = I",
    parsedMath := "lvert*psi_{mathrm*(o*(b*s))} || Eq(U(gamma)*U(gamma)**dagger, I)"
  }

axiom candidate_id_48_derivable : FrameworkDerivable candidate_id_48

def candidate_id_49 : TZPIDCandidate :=
  {
    id := "49",
    title := "Entanglement Structure",
    canonicalEquation := "\\rho_{A} = \\operatorname{Tr}_{B}(\\rho_{AB}) || S(\\rho_{A}) = -\\operatorname{Tr}\\!\\left(\\rho_{A}\\log\\rho_{A}\\right)",
    parsedMath := "Eq(rho_{A}, operatorname*(T*r)) || Eq(S(rho_{A}), -operatorname*(T*r)*(rho_{A}*log(rho_{A}, E)))"
  }

axiom candidate_id_49_derivable : FrameworkDerivable candidate_id_49

def candidate_id_50 : TZPIDCandidate :=
  {
    id := "50",
    title := "Multipartite Entanglement FractalNodes",
    canonicalEquation := "G = (V,E,w) || w_{ij} = \\mathcal{E}_{ij}",
    parsedMath := "Eq(G, (V, E, w)) || Eq(w_{i*j}, E*mathcal)"
  }

axiom candidate_id_50_derivable : FrameworkDerivable candidate_id_50

def candidate_id_51 : TZPIDCandidate :=
  {
    id := "51",
    title := "Topological Quantum States",
    canonicalEquation := "g_{\\mathrm{gs}} > 1 || W(C) = \\left\\langle \\psi \\middle| \\mathcal{P}\\exp\\!\\oint_{C} A \\middle| \\psi \\right\\rangle",
    parsedMath := "g_{mathrm*(g*s)} > 1 || Eq(W(C), <middle*psi|*(mathcal*(P*exp(oint_{C}*(A*(middle*|psi>))))))"
  }

axiom candidate_id_51_derivable : FrameworkDerivable candidate_id_51

def candidate_id_52 : TZPIDCandidate :=
  {
    id := "52",
    title := "Berry Phase and Geometric Phase Effects",
    canonicalEquation := "\\gamma_{\\mathrm{B}} = i\\oint_{\\Gamma}\\langle \\psi \\mid \\nabla_{\\lambda}\\psi\\rangle\\cdot d\\lambda || \\gamma_{\\mathrm{tot}} = \\gamma_{\\mathrm{dyn}} + \\gamma_{\\mathrm{B}} + \\gamma_{\\mathrm{L}}",
    parsedMath := "Eq(gamma_{B*mathrm}, i*oint_{Gamma}) || Eq(gamma_{mathrm*(t*(o*t))}, gamma_{L*mathrm} + (gamma_{B*mathrm} + gamma_{mathrm*(dy*n)}))"
  }

axiom candidate_id_52_derivable : FrameworkDerivable candidate_id_52

def candidate_id_53 : TZPIDCandidate :=
  {
    id := "53",
    title := "Quantum Information Units",
    canonicalEquation := "\\mathcal{H}_{\\mathrm{qunit}} \\cong \\mathbb{C}^{d} || \\dim \\mathcal{H}_{\\mathrm{qunit}} = d",
    parsedMath := "H*mathcal || dim*(H*mathcal)"
  }

axiom candidate_id_53_derivable : FrameworkDerivable candidate_id_53

def candidate_id_54 : TZPIDCandidate :=
  {
    id := "54",
    title := "Qubit Manifold Embedding",
    canonicalEquation := "\\mathcal{H}_{\\mathrm{qubit}} \\cong \\mathbb{C}^{2} || \\mathbb{CP}^{1} \\cong S^{2} \\hookrightarrow M",
    parsedMath := "H*mathcal || mathbb*((C*P)**1*(cong*(S**2*(M*hookrightarrow))))"
  }

axiom candidate_id_54_derivable : FrameworkDerivable candidate_id_54

def candidate_id_55 : TZPIDCandidate :=
  {
    id := "55",
    title := "Quantum Thermodynamics",
    canonicalEquation := "\\Delta S \\geq \\frac{Q}{T_{\\mathrm{eff}}} + \\Sigma_{\\mathrm{TZP}} || \\Delta U = Q + W",
    parsedMath := "Delta*S >= Q/T_{mathrm*(e*(f*f))} + Sigma_{mathrm*(T*(P*Z))} || Eq(Delta*U, Q + W)"
  }

axiom candidate_id_55_derivable : FrameworkDerivable candidate_id_55

def candidate_id_56 : TZPIDCandidate :=
  {
    id := "56",
    title := "Fluctuation–Dissipation Relations",
    canonicalEquation := "S(\\omega) = 2\\hbar\\, \\coth\\!\\left( \\frac{\\hbar\\omega}{2k_{\\mathrm{B}}T_{\\mathrm{eff}}} \\right) \\operatorname{Im}R(\\omega) || T_{\\mathrm{eff}} = T_{\\mathrm{eff}}^{\\mathrm{th}} + T_{\\mathrm{eff}}^{\\mathrm{TZP}}",
    parsedMath := "Eq(S(omega), 2*(hbar*((operatorname*((I*m)*R(omega)))*coth((hbar*omega)/((2*(T_{mathrm*(e*(f*f))}*k_{B*mathrm}))))))) || Eq(T_{mathrm*(e*(f*f))}, T_{mathrm*(e*(f*f))}**(mathrm*(T*(P*Z))) + T_{mathrm*(e*(f*f))}**(mathrm*(h*t)))"
  }

axiom candidate_id_56_derivable : FrameworkDerivable candidate_id_56

def candidate_id_57 : TZPIDCandidate :=
  {
    id := "57",
    title := "Quantum Transport Phenomena",
    canonicalEquation := "\\sigma(\\omega) = \\frac{1}{\\omega}\\operatorname{Im}\\Pi_{JJ}(\\omega) || \\Pi_{JJ}(\\omega) = \\int dt\\; e^{i\\omega t}\\langle J(t)J(0)\\rangle",
    parsedMath := "Eq(sigma(omega), (operatorname*((I*m)*Pi_{J*J}(omega)))/omega) || Eq(Pi_{J*J}(omega), e**(i*(omega*t))*Integral(1, t))"
  }

axiom candidate_id_57_derivable : FrameworkDerivable candidate_id_57

def candidate_id_58 : TZPIDCandidate :=
  {
    id := "58",
    title := "Classical Emergence from Quantum Dynamics",
    canonicalEquation := "\\rho_{ij}(t)=\\rho_{ij}(0)e^{-\\Gamma_{ij} t} || \\dot{x}=\\frac{\\partial H_{\\mathrm{eff}}}{\\partial p}, \\qquad \\dot{p}=-\\frac{\\partial H_{\\mathrm{eff}}}{\\partial x}",
    parsedMath := "Eq(rho_{i*j}(t), rho_{i*j}(0)/e**(Gamma_{i*j}*t)) || Eq(dot*x, Derivative(H_{mathrm*(e*(f*f))}, p))"
  }

axiom candidate_id_58_derivable : FrameworkDerivable candidate_id_58

def candidate_id_59 : TZPIDCandidate :=
  {
    id := "59",
    title := "TZP Constraints at Quantum Scale",
    canonicalEquation := "\\varepsilon_{\\mathrm{TZP}} = \\frac{\\ell_{\\mathrm{TZP}}}{\\ell} || \\mathcal{O}_{\\mathrm{eff}} = \\mathcal{O}_{q} + \\varepsilon_{\\mathrm{TZP}}\\,\\Delta\\mathcal{O}_{\\mathrm{TZP}}",
    parsedMath := "Eq(varepsilon_{mathrm*(T*(P*Z))}, ell_{mathrm*(T*(P*Z))}/ell) || O*mathcal"
  }

axiom candidate_id_59_derivable : FrameworkDerivable candidate_id_59

def candidate_id_60 : TZPIDCandidate :=
  {
    id := "60",
    title := "Quantum Limits of Observability",
    canonicalEquation := "\\Delta x\\,\\Delta p \\ge \\frac{\\hbar_{\\mathrm{eff}}}{2} || \\Delta t\\,\\Delta E \\ge \\frac{\\hbar_{\\mathrm{eff}}}{2}, \\qquad \\hbar_{\\mathrm{eff}}=\\hbar\\left(1+\\chi_{\\mathrm{TZP}}\\right)",
    parsedMath := "Delta*(x*(Delta*p)) >= hbar_{mathrm*(e*(f*f))}/2 || Delta*(t*(Delta*E)) >= hbar_{mathrm*(e*(f*f))}/2"
  }

axiom candidate_id_60_derivable : FrameworkDerivable candidate_id_60

def candidate_id_61 : TZPIDCandidate :=
  {
    id := "61",
    title := "Gyromagnetic Genesis Hypothesis",
    canonicalEquation := "\\tau_{\\mathrm{em}} = \\int \\mathbf{r}\\times\\left(\\mathbf{J}\\times\\mathbf{B}+\\rho_e\\mathbf{E}\\right)\\,dV || \\frac{d\\mathbf{L}}{dt}=\\tau_{\\mathrm{em}}",
    parsedMath := "Eq(tau_{mathrm*(e*m)}, Integral((mathbf*r)*(rho_{e}*(E*mathbf) + (B*mathbf)*(J*mathbf)), V)) || Eq(Derivative(L*mathbf, t), tau_{mathrm*(e*m)})"
  }

axiom candidate_id_61_derivable : FrameworkDerivable candidate_id_61

def candidate_id_62 : TZPIDCandidate :=
  {
    id := "62",
    title := "Rejection of Primordial Angular Momentum Assumption",
    canonicalEquation := "\\mathbf{L}(t)=\\mathbf{L}_0 + \\int_{0}^{t}\\tau_{\\mathrm{em}}(t')\\,dt' || \\mathbf{L}_0 \\approx \\mathbf{0} \\qquad\\text{(default null primordial hypothesis)}",
    parsedMath := "Eq(mathbf*(L*t), L*mathbf) || L*mathbf"
  }

axiom candidate_id_62_derivable : FrameworkDerivable candidate_id_62

def candidate_id_63 : TZPIDCandidate :=
  {
    id := "63",
    title := "Rotation as a Continuously Generated Quantity",
    canonicalEquation := "\\dot{\\omega}(t)=\\frac{\\tau_{\\mathrm{em}}(t)}{I_{\\mathrm{T}}} || \\omega(t)=\\omega(0)+\\frac{1}{I_{\\mathrm{T}}}\\int_{0}^{t}\\tau_{\\mathrm{em}}(t')\\,dt'",
    parsedMath := "Eq(dot*(omega*t), tau_{mathrm*(e*m)}(t)/I_{T*mathrm}) || Eq(omega(t), omega(0) + Integral(tau_{mathrm*(e*m)}(t**prime), (t, 0, t))**prime/I_{T*mathrm})"
  }

axiom candidate_id_63_derivable : FrameworkDerivable candidate_id_63

def candidate_id_64 : TZPIDCandidate :=
  {
    id := "64",
    title := "Local Electromagnetic Field–Driven Rotation",
    canonicalEquation := "\\tau_{\\mathrm{em}} = \\int \\mathbf{r}\\times\\left(\\mathbf{J}\\times\\mathbf{B}+\\rho_e\\mathbf{E}\\right)\\,dV || \\dot{\\omega}=\\frac{\\tau_{\\mathrm{em}}}{I_{\\mathrm{T}}}",
    parsedMath := "Eq(tau_{mathrm*(e*m)}, Integral((mathbf*r)*(rho_{e}*(E*mathbf) + (B*mathbf)*(J*mathbf)), V)) || Eq(dot*omega, tau_{mathrm*(e*m)}/I_{T*mathrm})"
  }

axiom candidate_id_64_derivable : FrameworkDerivable candidate_id_64

def candidate_id_65 : TZPIDCandidate :=
  {
    id := "65",
    title := "FractalNodes Category-Theoretic Isomorphism Across Scales",
    canonicalEquation := "F: \\mathbf{LabGyro} \\longrightarrow \\mathbf{AstroRot} || F(g\\circ f)=F(g)\\circ F(f) \\qquad \\text{and}\\qquad \\eta: F \\Rightarrow G",
    parsedMath := "F/((mathbf*(L*(a*(b*(G*(y*(o*r)))))))) || Eq(F(g*(circ*f)), ((circ*((mathrm*(eta*(a*(d*n))))*F(f)))*F(g))/F) || G"
  }

axiom candidate_id_65_derivable : FrameworkDerivable candidate_id_65

def candidate_id_66 : TZPIDCandidate :=
  {
    id := "66",
    title := "Laboratory ↔ Astrophysical Structural Equivalence",
    canonicalEquation := "\\Pi_{k}^{\\mathrm{lab}} = \\Pi_{k}^{\\mathrm{astro}} || F_{\\mathrm{scale}} : \\mathcal{S}_{\\mathrm{lab}} \\longrightarrow \\mathcal{S}_{\\mathrm{astro}}",
    parsedMath := "Eq(Pi_{k}**(mathrm*(l*(a*b))), Pi_{k}**(mathrm*(a*(s*(t*(o*r)))))) || F_{mathrm*(s*(c*(a*(e*l))))}/((S*mathcal))"
  }

axiom candidate_id_66_derivable : FrameworkDerivable candidate_id_66

def candidate_id_67 : TZPIDCandidate :=
  {
    id := "67",
    title := "SO(3) × U(1) Configuration Bundle",
    canonicalEquation := "P \\longrightarrow M, \\qquad \\mathrm{Struct}(P)=SO(3) \\times U(1) || \\sigma : M \\longrightarrow P",
    parsedMath := "P || sigma/M"
  }

axiom candidate_id_67_derivable : FrameworkDerivable candidate_id_67

def candidate_id_68 : TZPIDCandidate :=
  {
    id := "68",
    title := "Phase Space Topology Preservation",
    canonicalEquation := "\\phi_t^{\\ast}\\omega = \\omega || \\mathcal{L}_{X_H}\\omega = 0",
    parsedMath := "Eq(omega*phi_{t}**ast, omega) || L*mathcal"
  }

axiom candidate_id_68_derivable : FrameworkDerivable candidate_id_68

def candidate_id_69 : TZPIDCandidate :=
  {
    id := "69",
    title := "Natural Transformation Preserving Symplectic Structure",
    canonicalEquation := "\\eta : S \\circ F \\Rightarrow F \\circ S || \\eta_X^{\\ast}\\omega_{F\\circ S(X)} = \\omega_{S\\circ F(X)}",
    parsedMath := "eta/((S*(F*circ))) || F*(S*circ) || Eq(eta_{X}**ast*omega_{F*(circ*S(X))}, omega_{S*(circ*F(X))})"
  }

axiom candidate_id_69_derivable : FrameworkDerivable candidate_id_69

def candidate_id_70 : TZPIDCandidate :=
  {
    id := "70",
    title := "Electrohydrodynamic Resonance Operator",
    canonicalEquation := "\\partial_r(r v_r) + \\partial_z(z v_z) = 0 || \\mathcal{R}_{\\mathrm{EHD}}[\\mathbf{v}] = -\\frac{\\nabla p}{\\rho} + \\frac{q}{m}(\\mathbf{E}+\\mathbf{v}\\times\\mathbf{B})",
    parsedMath := "Eq(partial_{r}(r*v_{r}) + partial_{z}(v_{z}*z), 0) || R*mathcal"
  }

axiom candidate_id_70_derivable : FrameworkDerivable candidate_id_70

def candidate_id_71 : TZPIDCandidate :=
  {
    id := "71",
    title := "Flip–Twist Bridge Transformation",
    canonicalEquation := "f_{\\mathrm{bridge}} = \\frac{32}{27} f_0 || \\Psi_{\\mathrm{bridge}}(t) = G_{\\sigma}(t) \\Bigl[ \\cos(2\\pi f_1 t) - \\cos(2\\pi f_2 t + \\theta) \\Bigr]",
    parsedMath := "Eq(f_{mathrm*(b*(r*(i*(dg*e))))}, (32/27)*f_{0}) || Eq(Psi_{mathrm*(b*(r*(i*(dg*e))))}(t), (cos(2*(pi*(f_{1}*t))) - cos(2*(pi*(f_{2}*t)) + theta))*G_{sigma}(t))"
  }

axiom candidate_id_71_derivable : FrameworkDerivable candidate_id_71

def candidate_id_72 : TZPIDCandidate :=
  {
    id := "72",
    title := "Delta-Function Signal Injection",
    canonicalEquation := "G_{\\sigma}(t) = \\frac{1}{\\sigma\\sqrt{2\\pi}} \\exp\\!\\left(-\\frac{t^2}{2\\sigma^2}\\right) || \\delta_{\\mathrm{inj}} = \\lim_{\\sigma \\to 0} G_{\\sigma}(t)",
    parsedMath := "Eq(G_{sigma}(t), exp(-t**2/(2*sigma**2))/((sigma*sqrt(2*pi)))) || Eq(delta_{mathrm*(i*(j*n))}, Limit(G_{sigma}(t), sigma, 0, dir='+-'))"
  }

axiom candidate_id_72_derivable : FrameworkDerivable candidate_id_72

def candidate_id_73 : TZPIDCandidate :=
  {
    id := "73",
    title := "Cymatic Beat Frequency Topology",
    canonicalEquation := "\\begin{adjustbox}{max width=\\linewidth} $\\displaystyle \\psi_{\\mathrm{beat}}(t)=2\\cos\\!\\bigl(\\pi(f_2-f_1)t\\bigr)\\sin\\!\\bigl(\\pi(f_1+f_2)t\\bigr) $ \\end{adjustbox} || \\begin{adjustbox}{max width=\\linewidth} $\\displaystyle \\Delta f=|f_2-f_1|,\\qquad \\bar f=\\frac{f_1+f_2}{2} $ \\end{adjustbox} || \\begin{adjustbox}{max width=\\linewidth} $\\displaystyle t_n=\\frac{n}{2\\Delta f}\\quad(440/446\\,\\mathrm{Hz}:\\;t_n=\\frac{n}{12}) $ \\end{adjustbox}",
    parsedMath := "Eq(psi_{mathrm*(b*(e*(a*t)))}(t), 2*(sin(t*pi(f_{1} + f_{2}))*cos(t*pi(-f_{1} + f_{2})))) || Eq(Delta*f, Abs(-f_{1} + f_{2})) || Eq(t_{n}, n/((2*(Delta*f))))"
  }

axiom candidate_id_73_derivable : FrameworkDerivable candidate_id_73

def candidate_id_74 : TZPIDCandidate :=
  {
    id := "74",
    title := "Information Synchronization at the TZP",
    canonicalEquation := "\\Phi_{\\mathrm{TZP}} : S^3 \\longrightarrow S^2 || \\mathcal{I}_{\\mathrm{sync}}(t) = \\mathcal{E}_{\\mathrm{TZP}}(t)\\,e^{i\\theta(t)}",
    parsedMath := "Phi_{mathrm*(T*(P*Z))}/(S**3) || I*mathcal"
  }

axiom candidate_id_74_derivable : FrameworkDerivable candidate_id_74

def candidate_id_75 : TZPIDCandidate :=
  {
    id := "75",
    title := "Helical Standing-Wave Amplification",
    canonicalEquation := "A_m(\\theta,t)=A_0 e^{i(m\\theta-\\omega_m t)} || \\omega_m = \\frac{m v_h}{R_h}, \\qquad \\operatorname{Wind}_{\\mathrm{TZP}}(\\Gamma_m)=m",
    parsedMath := "Eq(A_{m}(theta, t), A_{0}*e**i(m*theta - omega_{m}*t)) || Eq(omega_{m}, (m*v_{h})/R_{h})"
  }

axiom candidate_id_75_derivable : FrameworkDerivable candidate_id_75

def candidate_id_76 : TZPIDCandidate :=
  {
    id := "76",
    title := "Topologically Protected Information Channels",
    canonicalEquation := "\\mathcal{I}_{[\\gamma]} = \\oint_{\\gamma} \\mathcal{J}_{\\mathrm{info}}\\cdot d\\ell || S_{\\mathrm{ent}}([\\gamma]) = \\mathrm{const.} \\qquad \\text{under local channel deformations}",
    parsedMath := "I*mathcal || Eq(S_{mathrm*(e*(n*t))}(gamma), mathrm)"
  }

axiom candidate_id_76_derivable : FrameworkDerivable candidate_id_76

def candidate_id_77 : TZPIDCandidate :=
  {
    id := "77",
    title := "Holographic Information Projection",
    canonicalEquation := "S_A = \\frac{\\operatorname{Area}(\\gamma_A)}{4 G_N} || \\mathcal{O}_{\\mathrm{bulk}}(x)=\\int K(x,y)\\,\\mathcal{O}_{\\mathrm{bdy}}(y)\\,dy",
    parsedMath := "Eq(S_{A}, (operatorname*(gamma_{A}*(A*(r*(a*e)))))/((4*G_{N}))) || O*mathcal"
  }

axiom candidate_id_77_derivable : FrameworkDerivable candidate_id_77

def candidate_id_78 : TZPIDCandidate :=
  {
    id := "78",
    title := "Master Synchronization Functional",
    canonicalEquation := "\\mathcal{S}_{\\mathrm{sync}}[\\rho,\\theta,\\Phi] = \\int_{\\mathcal{M}} \\left( \\alpha \\lvert \\nabla \\theta \\rvert^2 + \\beta D(\\rho\\Vert\\sigma) + \\gamma \\lvert \\Phi_{\\mathrm{bulk}}-\\Phi_{\\mathrm{bdy}}\\rvert^2 \\right)\\, d\\mu || \\delta \\mathcal{S}_{\\mathrm{sync}} = 0",
    parsedMath := "S*mathcal || delta*(S*mathcal)"
  }

axiom candidate_id_78_derivable : FrameworkDerivable candidate_id_78

def candidate_id_79 : TZPIDCandidate :=
  {
    id := "79",
    title := "Topological Entanglement Entropy Operator",
    canonicalEquation := "S(A)= \\alpha\\,\\lvert \\partial A\\rvert - \\gamma_{\\mathrm{topo}} || \\widehat{\\Gamma}_{\\mathrm{topo}}\\lvert\\psi\\rangle = \\gamma_{\\mathrm{topo}}\\lvert\\psi\\rangle",
    parsedMath := "Eq(S(A), alpha*(lvert*(partial*(A*rvert))) - gamma_{mathrm*(t*(o*(o*p)))}) || Gamma*widehat"
  }

axiom candidate_id_79_derivable : FrameworkDerivable candidate_id_79

def candidate_id_80 : TZPIDCandidate :=
  {
    id := "80",
    title := "Relative-Entropy Constraint",
    canonicalEquation := "D(\\rho\\Vert\\sigma)= \\operatorname{Tr}\\!\\left[\\rho(\\log\\rho-\\log\\sigma)\\right] || D(\\rho\\Vert\\sigma)\\ge 0",
    parsedMath := "Eq(D(rho*(Vert*sigma)), operatorname*((T*r)*rho(log(rho, E) - log(sigma, E)))) || D(rho*(Vert*sigma)) >= 0"
  }

axiom candidate_id_80_derivable : FrameworkDerivable candidate_id_80

def candidate_id_81 : TZPIDCandidate :=
  {
    id := "81",
    title := "Fibonacci Sequence",
    canonicalEquation := "F_n = F_{n-1}+F_{n-2}, \\qquad F_0=0,\\ F_1=1 || F_n = \\frac{\\phi^n-\\psi^n}{\\sqrt{5}}, \\qquad \\phi=\\frac{1+\\sqrt{5}}{2},\\ \\psi=\\frac{1-\\sqrt{5}}{2}",
    parsedMath := "Eq(F_{n}, F_{n - 1} + F_{n - 2}) || Eq(F_{n}, (phi**n - psi**n)/(sqrt(5)))"
  }

axiom candidate_id_81_derivable : FrameworkDerivable candidate_id_81

def candidate_id_82 : TZPIDCandidate :=
  {
    id := "82",
    title := "Fibonacci Manifold",
    canonicalEquation := "r_n = r_0 \\phi^n || r(\\theta)= r_0 e^{\\kappa \\theta}, \\qquad \\kappa = \\frac{\\log \\phi}{2\\pi/\\phi^2}",
    parsedMath := "Eq(r_{n}, phi**n*r_{0}) || Eq(r(theta), e**(kappa*theta)*r_{0})"
  }

axiom candidate_id_82_derivable : FrameworkDerivable candidate_id_82

def candidate_id_83 : TZPIDCandidate :=
  {
    id := "83",
    title := "Resonant Holographic Spiral",
    canonicalEquation := "r(\\theta)=a e^{\\beta \\theta} || \\beta = \\frac{2\\log \\phi}{\\pi} || z(\\theta)=c\\theta",
    parsedMath := "Eq(r(theta), a*e**(beta*theta)) || Eq(beta, (2*log(phi, E))/pi) || Eq(z(theta), c*theta)"
  }

axiom candidate_id_83_derivable : FrameworkDerivable candidate_id_83

def candidate_id_84 : TZPIDCandidate :=
  {
    id := "84",
    title := "Π–φ Structural Fusion",
    canonicalEquation := "\\beta = \\frac{2\\log \\phi}{\\pi} || \\lambda = \\beta^{-1} = \\frac{\\pi}{2\\log \\phi} || \\mathcal{E}'(\\beta)=0",
    parsedMath := "Eq(beta, (2*log(phi, E))/pi) || False || E*mathcal"
  }

axiom candidate_id_84_derivable : FrameworkDerivable candidate_id_84

def candidate_id_85 : TZPIDCandidate :=
  {
    id := "85",
    title := "Π–φ Coupling Principle",
    canonicalEquation := "\\mathcal{S}(\\beta)=\\int_{\\theta_0}^{\\theta_1}\\mathcal{L}(\\beta,\\theta)\\,d\\theta || \\frac{\\partial \\mathcal{S}}{\\partial \\beta}=0 || \\beta_{\\ast}=\\frac{2\\log \\phi}{\\pi}",
    parsedMath := "Eq(mathcal*(S*beta), Integral(L*mathcal, (x, theta_{0}, theta_{1}))) || Eq(Derivative(S*mathcal, beta), 0) || Eq(beta_{ast}, (2*log(phi, E))/pi)"
  }

axiom candidate_id_85_derivable : FrameworkDerivable candidate_id_85

def candidate_id_86 : TZPIDCandidate :=
  {
    id := "86",
    title := "Kuramoto Planetary Spin Model",
    canonicalEquation := "\\dot{\\theta}_i = \\omega_i \\;+\\; \\frac{K}{N}\\sum_{j=1}^{N}A_{ij}\\sin(\\theta_j-\\theta_i) || A_{ij}=\\frac{\\sqrt{m_i m_j}}{|a_i-a_j|} || N=8",
    parsedMath := "dot*theta || Eq(A_{i*j}, sqrt(m_{i}*m_{j})/Abs(a_{i} - a_{j})) || Eq(N, 8)"
  }

axiom candidate_id_86_derivable : FrameworkDerivable candidate_id_86

def candidate_id_87 : TZPIDCandidate :=
  {
    id := "87",
    title := "Spin-Coherence Order Parameter",
    canonicalEquation := "r e^{i\\psi} = \\frac{1}{N}\\sum_{j=1}^{N} e^{i\\theta_j} || r = \\left|\\frac{1}{N}\\sum_{j=1}^{N} e^{i\\theta_j}\\right| || \\psi = \\arg\\!\\left(\\frac{1}{N}\\sum_{j=1}^{N} e^{i\\theta_j}\\right)",
    parsedMath := "Eq(e**(i*psi)*r, Sum(e**(i*theta_{j}), (j, 1, N))/N) || Eq(r, Abs(Sum(e**(i*theta_{j}), (j, 1, N))/N)) || Eq(psi, arg(Sum(e**(i*theta_{j}), (j, 1, N))/N))"
  }

axiom candidate_id_87_derivable : FrameworkDerivable candidate_id_87

def candidate_id_88 : TZPIDCandidate :=
  {
    id := "88",
    title := "Dominant Planetary Coupling Pairs",
    canonicalEquation := "\\widehat{A}_{ij}=\\frac{A_{ij}}{\\max_{p,q}A_{pq}} || \\widehat{A}_{\\mathrm{Jupiter,Saturn}} = 1 || \\widehat{A}_{\\mathrm{Venus,Earth}} \\approx 0.103",
    parsedMath := "A*widehat || A*widehat || A*widehat"
  }

axiom candidate_id_88_derivable : FrameworkDerivable candidate_id_88

def candidate_id_89 : TZPIDCandidate :=
  {
    id := "89",
    title := "Planetary Spin Synchronization Limitations",
    canonicalEquation := "r \\ll 1 || \\dot{\\theta}_i = \\omega_i \\;+\\; \\frac{K}{N}\\sum_{j=1}^{N}A_{ij}\\sin(\\theta_j-\\theta_i) \\;+\\; \\tau_i^{\\mathrm{ext}} || A_{ij}=A_{ij}(t)",
    parsedMath := "r*(ll*1) || dot*theta || Eq(A_{i*j}, A_{i*j}(t))"
  }

axiom candidate_id_89_derivable : FrameworkDerivable candidate_id_89

def candidate_id_90 : TZPIDCandidate :=
  {
    id := "90",
    title := "Optimal Vortex Inflow Angle",
    canonicalEquation := "\\alpha_{\\ast} \\in [17^{\\circ},20^{\\circ}] || v_r = v\\sin\\alpha || v_\\theta = v\\cos\\alpha",
    parsedMath := "alpha_{ast}*in || Eq(v_{r}, v*sin(alpha)) || Eq(v_{theta}, v*cos(alpha))"
  }

axiom candidate_id_90_derivable : FrameworkDerivable candidate_id_90

def candidate_id_91 : TZPIDCandidate :=
  {
    id := "91",
    title := "Cross Symmetry Vortex Focusing",
    canonicalEquation := "\\frac{1}{r}\\frac{\\partial}{\\partial r}\\bigl(r v_r\\bigr) + \\frac{\\partial v_z}{\\partial z} = 0. || \\frac{1}{r}\\frac{\\partial}{\\partial r}(r v_r) + \\frac{\\partial v_z}{\\partial z} = 0 || v_z \\uparrow \\;\\Longrightarrow\\; v_r \\uparrow || N_{\\mathrm{channels}} = 4",
    parsedMath := "Eq(Derivative(v_{z}, z) + Derivative(r*v_{r}, r)/r, 0) || Eq(Derivative(v_{z}, z) + Derivative(r*v_{r}, r)/r, 0) || uparrow*v_{z} || Eq(N_{mathrm*(c*(h*(a*(n*(n*(e*(l*s)))))))}, 4)"
  }

axiom candidate_id_91_derivable : FrameworkDerivable candidate_id_91

def candidate_id_92 : TZPIDCandidate :=
  {
    id := "92",
    title := "Radial Pressure Gradient and Acceleration Field",
    canonicalEquation := "P + \\frac{1}{2}\\rho v^2 = \\mathrm{constant} || a_r = -\\frac{1}{\\rho}\\frac{\\partial P}{\\partial r} || a_r^{(\\times)} \\approx \\sqrt{2}\\, a_r^{(\\circ)}",
    parsedMath := "Eq(P + (rho*v**2)/2, mathrm*(c*(o*(n*(s*(t*(a*(n*t)))))))) || Eq(a_{r}, -Derivative(P, r)/rho) || a_{r}"
  }

axiom candidate_id_92_derivable : FrameworkDerivable candidate_id_92

def candidate_id_93 : TZPIDCandidate :=
  {
    id := "93",
    title := "Pull Strength Scaling Law",
    canonicalEquation := "\\left(\\frac{A_{\\mathrm{cross}}}{A_{\\mathrm{hole}}}\\right)^{3/2}, || \\Pi_{\\mathrm{pull}} = \\left(\\frac{A_{\\mathrm{cross}}}{A_{\\mathrm{hole}}}\\right)^{3/2} || A_{\\mathrm{ratio}} = \\frac{A_{\\mathrm{cross}}}{A_{\\mathrm{hole}}} || \\Pi_{\\mathrm{pull}} = A_{\\mathrm{ratio}}^{3/2}",
    parsedMath := "(A_{mathrm*(c*(r*(o*(s*s))))}/A_{mathrm*(h*(o*(e*l)))})**(3/2) || Eq(Pi_{mathrm*(p*(u*(l*l)))}, (A_{mathrm*(c*(r*(o*(s*s))))}/A_{mathrm*(h*(o*(e*l)))})**(3/2)) || Eq(A_{mathrm*(r*(a*(t*(i*o))))}, A_{mathrm*(c*(r*(o*(s*s))))}/A_{mathrm*(h*(o*(e*l)))}) || Eq(Pi_{mathrm*(p*(u*(l*l)))}, A_{mathrm*(r*(a*(t*(i*o))))}**(3/2))"
  }

axiom candidate_id_93_derivable : FrameworkDerivable candidate_id_93

def candidate_id_94 : TZPIDCandidate :=
  {
    id := "94",
    title := "Current Concentration Effect",
    canonicalEquation := "J = \\sigma E, || \\sigma_{\\mathrm{centre}} > \\sigma_{\\mathrm{bulk}}. || J = \\sigma E || \\sigma_{\\mathrm{centre}} > \\sigma_{\\mathrm{bulk}} || J_{\\mathrm{centre}} > J_{\\mathrm{bulk}}",
    parsedMath := "Eq(J, E*sigma) || sigma_{mathrm*(c*(e*(n*(t*(e*r)))))} > sigma_{mathrm*(b*(u*(k*l)))} || Eq(J, E*sigma) || sigma_{mathrm*(c*(e*(n*(t*(e*r)))))} > sigma_{mathrm*(b*(u*(k*l)))} || J_{mathrm*(c*(e*(n*(t*(e*r)))))} > J_{mathrm*(b*(u*(k*l)))}"
  }

axiom candidate_id_94_derivable : FrameworkDerivable candidate_id_94

def candidate_id_95 : TZPIDCandidate :=
  {
    id := "95",
    title := "Electrohydrodynamic Resonance Operator",
    canonicalEquation := "\\rho_e(t) = \\rho_0 + \\rho_1\\cos(\\omega t) || a_r^{\\mathrm{tot}}(t) = a_r^{\\mathrm{fluid}} + \\kappa\\rho_e(t) || \\mathcal{R}_{\\mathrm{EHD}}[\\Psi] = a_r^{\\mathrm{tot}}(t)\\,\\Psi",
    parsedMath := "Eq(rho_{e}(t), rho_{0} + rho_{1}*cos(omega*t)) || Eq(a_{r}**(mathrm*(t*(o*t)))*t, a_{r}**(mathrm*(f*(l*(u*(d*i))))) + kappa*rho_{e}(t)) || R*mathcal"
  }

axiom candidate_id_95_derivable : FrameworkDerivable candidate_id_95

def candidate_id_96 : TZPIDCandidate :=
  {
    id := "96",
    title := "Multi-Domain Resonance Cascade",
    canonicalEquation := "\\omega_p \\pm \\omega_e = \\omega_v, || \\omega_p \\pm \\omega_e = \\omega_v || \\Delta \\omega = |\\omega_v - \\omega_p| || \\Delta \\omega = \\omega_e",
    parsedMath := "Eq(omega_{p}*(omega_{e}*pm), omega_{v}) || Eq(omega_{p}*(omega_{e}*pm), omega_{v}) || Eq(Delta*omega, Abs(-omega_{p} + omega_{v})) || Eq(Delta*omega, omega_{e})"
  }

axiom candidate_id_96_derivable : FrameworkDerivable candidate_id_96

def candidate_id_97 : TZPIDCandidate :=
  {
    id := "97",
    title := "Optical Electrostriction Effect",
    canonicalEquation := "\\Delta \\rho = \\rho_0 \\left(\\frac{\\partial \\epsilon}{\\partial \\rho}\\right) E^2 \\left(\\frac{I}{c}\\right), || \\Delta \\rho = \\rho_0\\left(\\frac{\\partial \\epsilon}{\\partial \\rho}\\right)E^2\\left(\\frac{I}{c}\\right) || \\Delta P \\propto \\Delta \\rho || \\Delta P(t) = \\Delta P_0\\cos(\\omega_p t)",
    parsedMath := "Eq(Delta*rho, (E**2*(I/c))*rho_{0}(Derivative(epsilon, rho))) || Eq(Delta*rho, (E**2*(I/c))*rho_{0}(Derivative(epsilon, rho))) || Delta*(P*(propto*(Delta*rho))) || Eq(Delta*P(t), Delta*(P_{0}*cos(omega_{p}*t)))"
  }

axiom candidate_id_97_derivable : FrameworkDerivable candidate_id_97

def candidate_id_98 : TZPIDCandidate :=
  {
    id := "98",
    title := "Chromatic Ion Sorting",
    canonicalEquation := "\\lambda_{\\mathrm{red}} \\rightsquigarrow m_{\\mathrm{large}} || \\lambda_{\\mathrm{blue}} \\rightsquigarrow m_{\\mathrm{small}} || \\frac{\\partial q}{\\partial r} \\neq 0",
    parsedMath := "lambda_{mathrm*(r*(d*e))}*(s*(q*(u*(i*(g*(a*(r*(r*(o*(m_{mathrm*(l*(a*(r*(e*g))))}*w)))))))))) || lambda_{mathrm*(b*(l*(e*u)))}*(s*(q*(u*(i*(g*(a*(r*(r*(o*(m_{mathrm*(s*(m*(a*(l*l))))}*w)))))))))) || Ne(Derivative(q, r), 0)"
  }

axiom candidate_id_98_derivable : FrameworkDerivable candidate_id_98

def candidate_id_99 : TZPIDCandidate :=
  {
    id := "99",
    title := "Bridging Frequency Ratio",
    canonicalEquation := "r = \\frac{32}{27} || S = \\frac{\\Delta}{B}, \\qquad f_A' = \\frac{f_A}{S}, \\qquad f_B' = \\frac{f_B}{S} || f_{\\mathrm{bridge}} = r\\,f_B'",
    parsedMath := "Eq(r, 32/27) || Eq(S, Delta/B) || Eq(f_{mathrm*(b*(r*(i*(dg*e))))}, f_{B}**prime*r)"
  }

axiom candidate_id_99_derivable : FrameworkDerivable candidate_id_99

def strictShortlist : Array TZPIDCandidate := #[
  candidate_id_0,
  candidate_id_1,
  candidate_id_2,
  candidate_id_3,
  candidate_id_4,
  candidate_id_5,
  candidate_id_6,
  candidate_id_7,
  candidate_id_8,
  candidate_id_9,
  candidate_id_10,
  candidate_id_11,
  candidate_id_12,
  candidate_id_13,
  candidate_id_14,
  candidate_id_15,
  candidate_id_16,
  candidate_id_17,
  candidate_id_18,
  candidate_id_19,
  candidate_id_20,
  candidate_id_21,
  candidate_id_22,
  candidate_id_23,
  candidate_id_24,
  candidate_id_25,
  candidate_id_26,
  candidate_id_27,
  candidate_id_28,
  candidate_id_29,
  candidate_id_30,
  candidate_id_31,
  candidate_id_32,
  candidate_id_33,
  candidate_id_34,
  candidate_id_35,
  candidate_id_36,
  candidate_id_37,
  candidate_id_38,
  candidate_id_39,
  candidate_id_40,
  candidate_id_41,
  candidate_id_42,
  candidate_id_43,
  candidate_id_44,
  candidate_id_45,
  candidate_id_46,
  candidate_id_47,
  candidate_id_48,
  candidate_id_49,
  candidate_id_50,
  candidate_id_51,
  candidate_id_52,
  candidate_id_53,
  candidate_id_54,
  candidate_id_55,
  candidate_id_56,
  candidate_id_57,
  candidate_id_58,
  candidate_id_59,
  candidate_id_60,
  candidate_id_61,
  candidate_id_62,
  candidate_id_63,
  candidate_id_64,
  candidate_id_65,
  candidate_id_66,
  candidate_id_67,
  candidate_id_68,
  candidate_id_69,
  candidate_id_70,
  candidate_id_71,
  candidate_id_72,
  candidate_id_73,
  candidate_id_74,
  candidate_id_75,
  candidate_id_76,
  candidate_id_77,
  candidate_id_78,
  candidate_id_79,
  candidate_id_80,
  candidate_id_81,
  candidate_id_82,
  candidate_id_83,
  candidate_id_84,
  candidate_id_85,
  candidate_id_86,
  candidate_id_87,
  candidate_id_88,
  candidate_id_89,
  candidate_id_90,
  candidate_id_91,
  candidate_id_92,
  candidate_id_93,
  candidate_id_94,
  candidate_id_95,
  candidate_id_96,
  candidate_id_97,
  candidate_id_98,
  candidate_id_99,
]

theorem strictShortlist_nonempty : strictShortlist.size > 0 := by
  native_decide

