#!/usr/bin/env bash
set -euo pipefail

ZERO_BIN="${ZERO_BIN:-zero}"
OUT_DIR=".zero/out"
mkdir -p "$OUT_DIR"

echo "== zero version =="
"$ZERO_BIN" --version

echo "== valid examples =="
"$ZERO_BIN" check --json examples/hello.0 > "$OUT_DIR/hello.check.json"
"$ZERO_BIN" check --json examples/math.0 > "$OUT_DIR/math.check.json"
"$ZERO_BIN" check --json examples/point.0 > "$OUT_DIR/point.check.json"

echo "== graph and size surfaces =="
"$ZERO_BIN" graph --json examples/math.0 > "$OUT_DIR/math.graph.json"
"$ZERO_BIN" size --json examples/point.0 > "$OUT_DIR/point.size.json"

echo "== expected diagnostic fixture =="
if "$ZERO_BIN" check --json experiments/01-diagnostics/missing-binding.0 > "$OUT_DIR/missing-binding.check.json"; then
  echo "expected missing-binding fixture to fail, but it passed" >&2
  exit 1
fi

if ! grep -q 'NAM003' "$OUT_DIR/missing-binding.check.json"; then
  echo "expected NAM003 in missing-binding diagnostic" >&2
  cat "$OUT_DIR/missing-binding.check.json" >&2
  exit 1
fi

"$ZERO_BIN" fix --plan --json experiments/01-diagnostics/missing-binding.0 > "$OUT_DIR/missing-binding.fix-plan.json" || true

echo "smoke ok; artifacts written to $OUT_DIR"
