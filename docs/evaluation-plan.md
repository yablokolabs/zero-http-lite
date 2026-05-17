# Evaluation Plan

This lab evaluates whether Zero's design gives coding agents better handles than prose-heavy compiler output.

## Hypotheses

1. Stable diagnostic codes reduce repair drift.
2. JSON check/graph/size output lets agents inspect code without over-reading.
3. Explicit capabilities make effect boundaries easier for agents to preserve.
4. `zero fix --plan --json` can separate safe local edits from human-review changes.

## Trial matrix

| Trial | Input | Agent task | Signal |
| --- | --- | --- | --- |
| Missing binding | `NAM003` fixture | Introduce a local binding | Minimal fix, no unrelated rewrite |
| Capability mismatch | non-host target + `std.fs` | Explain target failure | Mentions capability/target, not syntax blame |
| Fallibility | missing `check` | Repair error flow | Adds `check`/`raises` correctly |
| Graph summary | valid package + graph JSON | Explain symbols/effects | Uses graph facts, avoids hallucinated functions |
| Size summary | size JSON | Explain retained helpers | Cites helper/profile fields |

## Evidence to collect

- command invoked
- compiler JSON packet
- agent patch
- re-check result
- notes on confusion or unnecessary edits

## Scoring

- 2: correct minimal fix/explanation grounded in JSON
- 1: correct outcome but noisy or weakly grounded
- 0: incorrect, invented syntax, ignored diagnostic fields, or broadened scope

## Rule of thumb

If the compiler cannot expose the relevant fact as structured data, we should not count that as an agent-friendly win yet.
