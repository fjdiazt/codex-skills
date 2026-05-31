---
name: estimate
description: Use when estimating engineering effort, delivery time, prior investment, feature size, or future scope from repo evidence, git history, and explicit assumptions.
---

# FD Estimate

Estimate effort from evidence, not false precision. Use git history when available, then combine it with scope decomposition and explicit assumptions.

## Rules

- If the current directory or user-provided path is a git repository, inspect git history before estimating unless the user explicitly says not to.
- Prefer `scripts/git-effort-stats.ps1` for repository stats instead of rebuilding ad hoc commands.
- Ask for clarification when scope boundaries, date ranges, path filters, or active-day assumptions materially change the answer.
- If enough information is already present, proceed with reasonable defaults and label them clearly.
- If git data is missing, sparse, squashed, unrelated to the requested scope, or outside the current workspace, say so and switch to a scope-based estimate.
- Separate historical effort estimates from future implementation estimates.
- Use ranges and confidence notes. Do not present active git days as literal time worked.

## Workflow

1. Classify the request: past investment, future feature, comparison against previous work, or delivery projection.
2. Resolve scope: repo root, relevant paths, date range, renamed predecessor projects, and hours per active day.
3. Run `scripts/git-effort-stats.ps1` when possible. Use `-RepoPath`, optional `-Paths`, `-Since`, and `-HoursPerActiveDay`.
4. Interpret the stats:
   - `distinctActiveDays * hoursPerActiveDay` is a rough lower-bound proxy only when that assumption is requested or justified.
   - Commit count, first date, last date, and path filters describe the evidence used.
   - Squash commits, rebases, private prototypes, generated code, merges, and uncommitted work can distort the estimate.
5. For future work, compare against local analogues: subsystem size, architecture reuse, UI/runtime integration, tests, reverse engineering, docs, packaging, and unknowns.

## Output Shape

Lead with the numeric estimate or tiers. Then give basis, git stats used, caveats, and confidence. Put clarification questions last with recommended defaults.
