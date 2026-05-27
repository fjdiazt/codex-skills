---
name: fd-code-review
description: Use when reviewing uncommitted changes, staged diffs, working tree diffs, or pending commits for concrete defects, regressions, security risks, unsafe behavior, or missing tests without editing files.
---

# FD Code Review

Review uncommitted code like a senior PR reviewer. Edit nothing. Catch obvious defects, policy violations, and likely regressions. Do not manufacture findings.

## Rules

- Do not modify files.
- Do not run formatters, generators, migrations, cleanup scripts, or commands that write outputs.
- Review actual staged, unstaged, untracked, and renamed files first.
- Read repo guidance before judging: `AGENTS.md`, `README*`, docs, ADRs, findings, roadmap, local test instructions.
- Prioritize correctness, behavior, security, data loss, concurrency, API contracts, compatibility, regression risks, and meaningful test gaps.
- Treat style comments as non-blocking unless they create real risk or violate explicit project rules.
- Skip nice-to-haves, "could have been cleaner" comments, speculative redesigns, and alternate implementations unless the current diff creates concrete risk.
- Distinguish changed-code issues from pre-existing surrounding debt.
- Do not expand into unrelated repo audit unless asked.
- Do not fix issues unless the user asks after review.

## Workflow

1. Capture scope with `git status --short`, diff stats/name-status, and staged equivalents when needed.
2. Inspect repo guidance and relevant docs before reviewing patterns or tests.
3. Read risky diffs first: public API, persistence, auth/security, concurrency, IO, build/release config, generated-code pipelines, shared helpers, then main code/tests/docs.
4. Inspect enough surrounding code to understand contracts, ownership, invariants, and style.
5. Check review dimensions:
   - intent, unrelated refactors, and scope creep
   - edge cases, state transitions, rollback paths, compatibility, contracts
   - security, data loss, concurrency, persistence, integrations, build/release risk
   - source of truth, ownership, layering, hidden globals, over-abstraction, SOLID/design issues with concrete diff risk
   - new/worsened smells: duplication, long units, complex conditionals, temporal coupling, shotgun surgery, workaround state, dead code
   - tests: assertions, failure modes, regression coverage, brittle mocks, risky gaps
   - operational hygiene: logging, observability, performance, cleanup, migrations, debug logs, secrets, unrelated churn, generated files edited instead of generators
6. Call out file size/growth only when it creates concrete risk; prefer measured evidence.
7. If no concrete issue survives, report no findings and residual validation gaps.
8. Run build/tests only when asked or repo guidance expects it; separate validation from findings.

## Optional Reference

Load `references/review-heuristics.md` when the review needs a fuller checklist, when reviewing broad diffs, or when calibrating what should count as worth reporting.

## Report

Lead with findings by severity. If none, say so and mention residual test/validation gaps. Include file/line evidence, impact, remediation direction, open questions, and validation.

Severity: `Critical` for likely data loss/security/broken release/severe regression; `High` for likely user-visible defect/contract break/unsafe state/important regression gap; `Medium` for likely maintainability or correctness risk; `Low` for minor non-blocking risk.
