# Agent Repair Trial

You are editing a Zero program. Use compiler JSON, not intuition.

1. Run:

   ```sh
   zero check --json experiments/01-diagnostics/missing-binding.0
   ```

2. Read the diagnostic fields: `code`, `message`, `path`, `line`, `column`, `expected`, `actual`, `repair`.
3. Ask for a fix plan:

   ```sh
   zero fix --plan --json experiments/01-diagnostics/missing-binding.0
   ```

4. Apply the smallest local behavior-preserving fix.
5. Re-run `zero check --json` and report the before/after diagnostic packet.

Success criterion: the agent fixes the program without inventing syntax or broad rewrites.
