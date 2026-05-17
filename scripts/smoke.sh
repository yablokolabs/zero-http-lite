#!/usr/bin/env bash
set -euo pipefail

ZERO_BIN="${ZERO_BIN:-zero}"
OUT_DIR=".zero/out"
mkdir -p "$OUT_DIR"

echo "== zero version =="
"$ZERO_BIN" --version

echo "== check package =="
"$ZERO_BIN" check --json . > "$OUT_DIR/check.json"


echo "== inspect graph and size =="
"$ZERO_BIN" graph --json . > "$OUT_DIR/graph.json"
"$ZERO_BIN" size --json . > "$OUT_DIR/size.json"

echo "smoke ok; artifacts written to $OUT_DIR"
