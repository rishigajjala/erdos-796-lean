# Mathematical provenance and references

The formalization combines several classical ingredients. The following
references identify both the problem's provenance and the proofs that
influenced the development.

## The problem

- Paul Erdős, “On the multiplicative representation of integers,” *Israel
  Journal of Mathematics* **2** (1964), 251–261.
  [DOI](https://doi.org/10.1007/BF02759742). The factor-size decomposition
  and multipartite-box strategy in the structural part refine ideas from
  this paper.
- Paul Erdős, “Problems and results in chromatic graph theory,” in *Proof
  Techniques in Graph Theory* (Proceedings of the Second Ann Arbor Graph
  Theory Conference, 1968), Academic Press, 1969, 27–35. MR 0252273. This is
  the original reference attached to the problem.
- Thomas F. Bloom, [Erdős Problem 796](https://www.erdosproblems.com/796),
  including the corrected modern formulation.
- Quanyu Tang, [“On Erdős Problem
  796”](https://github.com/QuanyuTang/erdos-problem-796-note) (2026), for the
  corrected scale and the baseline lower-bound context discussed in the
  manuscript.

## Combinatorial and analytic inputs

- Tamás Kővári, Vera T. Sós, and Pál Turán, “On a problem of K. Zarankiewicz,”
  *Colloquium Mathematicum* **3** (1954), 50–57.
  [DOI](https://doi.org/10.4064/cm-3-1-50-57).
- Hong Liu and Péter Pál Pach, “The number of multiplicative Sidon sets of
  integers,” *Journal of Combinatorial Theory, Series A* **165** (2019),
  152–175. [DOI](https://doi.org/10.1016/j.jcta.2019.02.002).
- Dragoș Crișan and Radek Erban, “On the counting function of semiprimes,”
  *Integers* **21** (2021), Paper A122.
  [arXiv:2006.16491](https://arxiv.org/abs/2006.16491).
- Leo Goldmakher, [“A quick proof of Mertens'
  theorem”](https://web.williams.edu/Mathematics/lg5/mertens.pdf). The
  Abel-summation treatment of Mertens' estimates in the imported
  `PrimeNumberTheoremAnd` development explicitly credits this note; the
  clean transported identity and explicit $M$ bound in this repository build
  on that formalized route.

## Formal libraries

- [Mathlib](https://github.com/leanprover-community/mathlib4), v4.30.0.
- [PrimeNumberTheoremAnd](https://github.com/AlexKontorovich/PrimeNumberTheoremAnd),
  v4.30.0. Its Mertens and prime-number-theorem modules provide the imported
  analytic foundations used here.

The BibTeX records used by the manuscript are in
[`paper/references.bib`](../paper/references.bib).
