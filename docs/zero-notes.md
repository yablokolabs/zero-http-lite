# Zero Notes

Initial read of `vercel-labs/zero` suggests the interesting part is not that agents magically understand a new syntax. The interesting part is the contract between compiler and agent.

## Agent-friendly surfaces worth testing

- `zero check --json` for versioned diagnostics
- `zero graph --json` for symbol/capability inspection
- `zero size --json` for artifact-size reasoning
- `zero fix --plan --json` for typed repair planning
- `zero skills get zero --full` for compiler-version-matched agent instructions

## Language ideas that look useful

- `World` capability instead of ambient process globals
- explicit `raises` and `check`
- explicit primitive widths
- public API shape requires explicit types
- target capability checks report stable diagnostics

## Caution

Zero is young. Treat it as a lab subject, not infrastructure. Prefer tiny experiments and artifacts over big claims.
