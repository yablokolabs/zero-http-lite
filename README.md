# Zero Agent Lab

A small public lab for testing [Zero](https://github.com/vercel-labs/zero), Vercel Labs' experimental “programming language for agents”.

The goal is not to ship production Zero yet. The goal is to answer a sharper question:

> Do agent-oriented compiler surfaces actually make agents faster, safer, and less confused when writing systems code?

## Why this exists

Zero has a few ideas that are especially interesting for coding agents:

- explicit capabilities instead of ambient globals (`World`, `std.fs`, `std.env`)
- explicit fallibility (`raises`, `check`, `rescue`)
- stable diagnostic codes and machine-readable JSON output
- command surfaces for graph, size, doctor, fix plans, and bundled skills
- a small native-tool-oriented systems language surface

This repo is a sandbox to poke at those claims with tiny, repeatable examples.

## Current status

- Upstream Zero is experimental and changing quickly.
- This repo intentionally keeps examples small and boring.
- Any “agent friendliness” claim here should be backed by compiler JSON, repair plans, or repeatable transcripts.

## Quick start

Install Zero from upstream:

```sh
curl -fsSL https://zerolang.ai/install.sh | bash
export PATH="$HOME/.zero/bin:$PATH"
zero --version
```

Run the local smoke checks:

```sh
./scripts/smoke.sh
```

Or point at a specific compiler binary:

```sh
ZERO_BIN=/path/to/zero ./scripts/smoke.sh
```

## Repo layout

```text
examples/                 tiny valid Zero programs
experiments/              intentionally focused tests/fixtures
prompts/                  prompts for agent repair/comprehension trials
scripts/smoke.sh          local validation using Zero JSON surfaces
docs/evaluation-plan.md   how we judge whether the agent-friendly claim holds
docs/zero-notes.md        observations from early repo review
```

## First experiments

1. **Diagnostics repair loop** — give an agent a broken `.0` file plus `zero check --json` output and measure whether it applies the minimal fix.
2. **Capability awareness** — ask an agent to add file/env/network behavior and see whether it respects target capabilities.
3. **Graph comprehension** — use `zero graph --json` to ask an agent to explain symbols and effects without reading every file.
4. **Size awareness** — use `zero size --json` to see whether agents can reason about helper retention and profile budgets.

## Non-goals

- replacing Rust/Zig/C today
- claiming Zero is stable
- hiding compiler failures behind prose
- benchmarking vibes instead of artifacts

## Upstream

- Repository: <https://github.com/vercel-labs/zero>
- Website: <https://zerolang.ai>
- License: upstream Zero is Apache-2.0

This lab is independent and exploratory.
