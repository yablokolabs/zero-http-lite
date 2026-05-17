# Agent Notes

This is a real mini project using Zero: a tiny HTTP layer library.

## Rules

- Do not copy upstream Zero into this repo.
- Keep the project small and concrete.
- Use `ZERO_BIN=/path/to/zero ./scripts/smoke.sh` before committing.
- Prefer compiler JSON (`check`, `graph`, `size`) over guessing.
- If Zero lacks a runtime feature, model it explicitly instead of pretending it exists.

## Useful commands

```sh
zero check --json .
zero graph --json .
zero size --json .
```
