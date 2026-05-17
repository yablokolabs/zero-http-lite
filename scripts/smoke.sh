#!/usr/bin/env bash
set -euo pipefail

ZERO_BIN="${ZERO_BIN:-zero}"
OUT_DIR=".zero/out"
mkdir -p "$OUT_DIR/examples"

echo "== zero version =="
"$ZERO_BIN" --version

echo "== check package =="
"$ZERO_BIN" check --json . > "$OUT_DIR/check.json"

echo "== check usage examples =="
TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

cp -R src examples "$TMP_DIR"/

for example in examples/*.0; do
  name="$(basename "$example" .0)"
  cat > "$TMP_DIR/zero.json" <<EOF
{
  "package": {
    "name": "zero-http-lite-example-$name",
    "version": "0.1.0",
    "license": "Apache-2.0"
  },
  "targets": {
    "cli": {
      "kind": "exe",
      "main": "examples/$name.0"
    }
  }
}
EOF
  "$ZERO_BIN" check --json "$TMP_DIR" > "$OUT_DIR/examples/$name.check.json"
done

echo "== inspect graph and size =="
"$ZERO_BIN" graph --json . > "$OUT_DIR/graph.json"
"$ZERO_BIN" size --json . > "$OUT_DIR/size.json"

echo "smoke ok; artifacts written to $OUT_DIR"
