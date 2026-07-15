import Lake

open Lake DSL

package «erdos-796» where
  version := v!"1.0.0"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @
    "c5ea00351c28e24afc9f0f84379aa41082b1188f"

require PrimeNumberTheoremAnd from git
  "https://github.com/AlexKontorovich/PrimeNumberTheoremAnd.git" @
    "80c12dfd932e99874e004d65537c57ef6421ff2b"

@[default_target]
lean_lib Erdos796
