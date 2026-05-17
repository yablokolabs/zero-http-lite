# Agent Notes

This repo is about testing Zero as an agent-friendly language. Keep changes small, explicit, and backed by tool output.

## Rules

- Do not invent Zero syntax. Check upstream docs or ask the compiler.
- Prefer `zero check --json`, `zero graph --json`, `zero size --json`, and `zero fix --plan --json` over guessing from text diagnostics.
- Keep examples tiny and copyable.
- Use explicit public signatures.
- Treat effects as capabilities, not globals.
- If a fixture is supposed to fail, document the expected diagnostic code.

## Useful commands

```sh
./scripts/smoke.sh
zero skills list
zero skills get zero --full
zero check --json examples/hello.0
zero graph --json examples/math.0
zero fix --plan --json experiments/01-diagnostics/missing-binding.0
```

## Validation before commit

Run:

```sh
./scripts/smoke.sh
```

If Zero is not installed locally, at least run shellcheck-style review of scripts and document the blocker.
