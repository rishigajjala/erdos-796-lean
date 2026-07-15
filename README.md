# On Erdős's Multiplicative Representation Problem

[![Lean verification](https://github.com/rishigajjala/erdos-796-lean/actions/workflows/lean.yml/badge.svg)](https://github.com/rishigajjala/erdos-796-lean/actions/workflows/lean.yml)
[![Lean 4.30.0](https://img.shields.io/badge/Lean-4.30.0-blue.svg)](https://lean-lang.org/)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-green.svg)](LICENSE)

This repository contains Rishikesh Gajjala's Lean 4 formalization of the
corrected second-order form of [Erdős Problem 796](https://www.erdosproblems.com/796).

For a finite set $A\subseteq [n]$, let every representation be counted in the
form $m=ab$ with $a,b\in A$ and $a<b$, and let $g_3(n)$ be the largest size of
an $A$ for which every integer has at most two such representations. The main
formal theorem proves

$$
g_3(n)=\frac{n\log\log n}{\log n}
 +\left(1+M+\Gamma+o(1)\right)\frac{n}{\log n},
$$

where $M$ is the Meissel--Mertens constant and $\Gamma$ is the variational
constant defined by the compatible-cofactor problem in
[`Erdos796/Core.lean`](Erdos796/Core.lean).

The formal development also proves

$$
\frac4{15}\leq\Gamma<13,
\qquad
M<\frac{933}{1000},
\qquad
1+M+\Gamma<15.
$$

## Verify the proof

The versions are pinned to Lean 4.30.0, Mathlib v4.30.0, and
PrimeNumberTheoremAnd v4.30.0. With `elan` installed, run:

```bash
lake exe cache get
lake build Erdos796.FullProof
./scripts/audit.sh
```

The first build may take some time while Lake downloads dependencies. The
audit rebuilds the complete dependency closure, invokes Lean with `--trust=0`,
and checks the axioms of all public release theorems.

## Main declarations

| Declaration | Meaning |
|---|---|
| `Erdos796.erdosProblem796` | The corrected existential form of Problem 796 |
| `Erdos796.hasSecondOrderConstant` | The constant is $1+M+\Gamma$ |
| `Erdos796.Gamma_bounds` | $4/15\leq\Gamma<13$ |
| `Erdos796.mertensM_lt_933_div_1000` | Kernel-checked bound $M<933/1000$ |
| `Erdos796.secondOrderConstant_lt_fifteen` | $1+M+\Gamma<15$ |

All five are assembled in
[`Erdos796/FullProof.lean`](Erdos796/FullProof.lean). The exact Lean
formulation of the asymptotic is in
[`Erdos796/Statement.lean`](Erdos796/Statement.lean): it is convergence of
the normalized second-order error.

## Repository guide

- [`Erdos796/`](Erdos796/) contains the 75 Lean modules in the proof closure.
- [`docs/PROOF_MAP.md`](docs/PROOF_MAP.md) explains how the modules fit together.
- [`AUDIT.md`](AUDIT.md) records the trust boundary, hashes, and release audit.
- [`Audit.lean`](Audit.lean) prints the axioms of the final declarations.
- [`paper/main.tex`](paper/main.tex) and the
  [compiled manuscript](paper/On_Erdos_Multiplicative_Representation_Problem.pdf)
  give the accompanying human-readable proof.
- [`docs/REFERENCES.md`](docs/REFERENCES.md) records mathematical provenance
  and links to the sources that inspired specific parts of the argument.

The Lean modules remain in their verified flat namespace. The thematic map in
`docs/PROOF_MAP.md` provides navigation without rewriting the audited import
graph.

## Trust and reproducibility

There are no `sorry`, `admit`, custom `axiom`, `unsafe`, `native_decide`, or
`interval_decide` declarations in the project source. Each audited final
theorem depends only on Lean's standard
`propext`, `Classical.choice`, and `Quot.sound` axioms. See
[`AUDIT.md`](AUDIT.md) for the exact scope and commands.

The estimate $M<933/1000$ is proved by a finite cutoff at 100 and a
Chebyshev-based tail bound. It does not assume an Euler-product identity.

## Provenance and disclosure

The mathematical strategy refines Erdős's factor-size decomposition for the
leading-order problem and uses standard Kővári--Sós--Turán, semiprime, and
Abel-summation/Mertens arguments. The imported Mertens development explicitly
credits Leo Goldmakher's *A quick proof of Mertens' theorem*. Full citations
and links are in [`docs/REFERENCES.md`](docs/REFERENCES.md).

The initial proofs were generated and formalized in Lean using OpenAI's
GPT 5.6 Sol; the authors then verified and rewrote the proofs to improve
readability and provide additional context. The formal claims are checked by
Lean's kernel and by the reproducible audit above.

## Author and license

Rishikesh Gajjala, NYU Abu Dhabi.

The repository is released under the [Apache License 2.0](LICENSE). Citation
metadata is available in [`CITATION.cff`](CITATION.cff).
