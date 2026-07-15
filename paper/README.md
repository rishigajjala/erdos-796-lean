# Manuscript

`main.tex` is the authoritative streamlined manuscript accompanying the Lean
formalization. `references.bib` contains its bibliography, and
`On_Erdos_Multiplicative_Representation_Problem.pdf` is the compiled release
snapshot.

`arxiv_abstract.txt` is a copy-ready version of the abstract using dollar-sign
math delimiters for the arXiv submission page.

Build it with:

```bash
latexmk -pdf main.tex
```

Generated TeX intermediates are ignored by Git.
