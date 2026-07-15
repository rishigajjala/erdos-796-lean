#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

echo "Checking the source tree for prohibited proof shortcuts..."
pattern='(^|[^[:alnum:]_])(sorry|admit)([^[:alnum:]_]|$)|^[[:space:]]*axiom[[:space:]]|(^|[^[:alnum:]_])unsafe([^[:alnum:]_]|$)|native_decide|interval_decide'
if grep -RInE --include='*.lean' "$pattern" Erdos796 Erdos796.lean; then
  echo "The source audit found a prohibited declaration or proof shortcut." >&2
  exit 1
fi

echo "Building the theorem dependency closure..."
lake build Erdos796.FullProof

audit_log="$(mktemp)"
trap 'rm -f "$audit_log"' EXIT

echo "Running Lean with --trust=0 and printing theorem axioms..."
lake env lean --trust=0 Audit.lean 2>&1 | tee "$audit_log"

expected='depends on axioms: [propext, Classical.choice, Quot.sound]'
expected_count=7
actual_count="$(grep -F -c "$expected" "$audit_log" || true)"
all_axiom_lines="$(grep -c 'depends on axioms:' "$audit_log" || true)"

if [[ "$actual_count" -ne "$expected_count" || "$all_axiom_lines" -ne "$expected_count" ]]; then
  echo "Unexpected axiom report. Expected exactly seven standard-axiom lines." >&2
  exit 1
fi

echo "Audit passed: all seven release theorems use only propext,"
echo "Classical.choice, and Quot.sound."
