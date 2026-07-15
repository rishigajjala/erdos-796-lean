# Release audit

This document records the reproducibility and trust audit for version 1.0.0,
performed on 15 July 2026.

## Audited target

The build target is `Erdos796.FullProof`. Its recursive local import closure
contains all 75 modules under `Erdos796/`.
The principal declarations are:

- `Erdos796.erdosProblem796`;
- `Erdos796.hasSecondOrderConstant`;
- `Erdos796.Gamma_bounds`;
- `Erdos796.mertensM_lt_933_div_1000`;
- `Erdos796.secondOrderConstant_lt_fifteen`.

## Reproduce the audit

```bash
lake exe cache get
./scripts/audit.sh
```

The script performs three checks:

1. It rejects `sorry`, `admit`, custom `axiom`, `unsafe`, `native_decide`, and
   `interval_decide` in the project source.
2. It builds the full theorem closure with `lake build Erdos796.FullProof`.
3. It runs `lake env lean --trust=0 Audit.lean` and checks all seven printed
   axiom reports.

For each theorem listed in `Audit.lean`, the expected and observed report is

```text
[propext, Classical.choice, Quot.sound]
```

In particular, none depends on `sorryAx` or a native-computation axiom.

## Explicit numerical certificates

The lower bound $\Gamma\geq4/15$ is established by the finite compatible
cofactor certificate in `Erdos796/Certificate.lean` and
`Erdos796/GammaCertificate.lean`.

The bound $M<933/1000$ uses:

- exact rational checks for the primes through 100 in
  `Erdos796/MertensCutoffCertificate.lean`;
- the Abel-summation identity in `Erdos796/MeisselMertensProof.lean`; and
- a Chebyshev-based integral tail estimate in
  `Erdos796/MertensExplicitUpper.lean`.

The resulting certified numerical right-hand side is approximately
$0.9318551633<0.933$. This route does not invoke an Euler-product identity.

## Dependency boundary

The only direct dependencies are:

- Mathlib v4.30.0, locked to commit
  `c5ea00351c28e24afc9f0f84379aa41082b1188f`;
- PrimeNumberTheoremAnd v4.30.0, locked to commit
  `80c12dfd932e99874e004d65537c57ef6421ff2b`.

The axiom report checks the transitive dependency closure of the public
theorems, rather than merely scanning this repository.

Some imported `PrimeNumberTheoremAnd` modules contain unrelated declarations
with `sorry`, so Lake may display upstream warnings while replaying that
package. None of those declarations occurs in the dependency closure of the
seven audited release theorems: if one did, `#print axioms` would report
`sorryAx`. This audit therefore makes a theorem-level claim, not a blanket
claim about every declaration in an upstream package.

## Frozen statement hashes

The three files that were frozen before the final numerical-bound work were
preserved byte for byte in this release:

```text
a03ef69d3f9e2c5242ed6080dd43eb5676c9a651ffd5290056383c6bd7ce12c9  Erdos796/Core.lean
0a2ef4780b3e2d9e31b1f4b1cca365c40f22ff0d1670cf77803e45402ce79bcf  Erdos796/Statement.lean
3d978ab36360b86f801ea3f9e149e9ec359213c192b283f0ad2b3b11955b2624  Erdos796.lean
```
