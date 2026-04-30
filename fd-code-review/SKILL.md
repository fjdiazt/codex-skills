---
name: fd-code-review
description: Read-only review of uncommitted local code changes before commit or PR. Use when Codex is asked to review, PR-review, self-review, inspect, or audit unstaged/staged changes, a working tree diff, or a pending commit for blatant violations, low-hanging defects, likely regressions, security risks, unsafe behavior changes, or meaningful missing tests. Avoid nice-to-haves, speculative improvements, and forced findings. Report findings first with file/line evidence; do not edit files.
---

# FD Code Review

Review uncommitted code like a senior reviewer preparing a PR. Edit nothing. The primary job is to catch obvious defects and policy violations, then protect against likely regressions. Do not manufacture findings to satisfy the review format.

## Rules

- Do not modify files.
- Do not run formatters, generators, migrations, cleanup scripts, or commands that write outputs.
- Review the actual diff first: staged, unstaged, untracked, and renamed files.
- Include repo guidance before judging: `AGENTS.md`, `README*`, docs, architecture notes, ADRs, findings, roadmap, and local test instructions.
- Prioritize blatant violations, low-hanging defects, correctness, behavior, security, data loss, concurrency, API contracts, compatibility, regression risks, and meaningful test gaps.
- Treat style comments as non-blocking unless they create real risk or violate explicit project rules.
- Skip nice-to-haves, "could have been cleaner" comments, speculative redesigns, and alternate implementations unless the current diff creates concrete risk.
- Distinguish changed-code issues from pre-existing surrounding debt.
- Do not expand into unrelated repo audit unless asked.
- Do not fix issues unless the user asks after review.

## Workflow

1. Capture change scope:
   - `git status --short`
   - `git diff --stat`
   - `git diff --name-status`
   - `git diff --cached --stat` and `git diff --cached --name-status` when staged changes exist.
2. Inspect repo guidance and relevant docs before reviewing patterns or tests.
3. Read diffs by risk:
   - public API, persistence, auth/security, concurrency, file/network IO, build/release config, generated-code pipeline, shared helpers
   - main implementation files
   - tests
   - docs and metadata
4. For each changed file, inspect enough surrounding code to understand contracts, ownership, invariants, and existing style.
5. Check review dimensions:
   - intent: change makes sense for stated goal and is not mixed with unrelated refactor
   - behavior: edge cases, null/empty/error paths, state transitions, rollback paths, compatibility
   - regression: changed contracts, default behavior, migrations, persistence shape, external integrations, build/release config, and compatibility assumptions
   - design: source of truth, layering, ownership, hidden globals, over-abstraction, speculative generality, and SOLID fit only when they create concrete risk in this diff
   - code smells: duplication, long functions/classes/files, complex conditionals, temporal coupling, shotgun surgery, workaround state, and dead code only when they are new or materially worsened by the diff
   - tests: meaningful assertions, failure mode coverage, regression coverage, brittle mocks, and missing service/repository coverage for risky changed behavior
   - operational risk: logging, observability, performance, resource cleanup, migrations, deployment/build changes
   - review hygiene: accidental debug logs, secrets, unrelated churn, generated files edited instead of generators
6. If a changed file is unusually long or grew materially, call out only when size creates concrete review or maintenance risk. Prefer measured evidence such as line count and changed-region complexity.
7. If no concrete issue survives the evidence threshold, report no findings. Mention residual validation gaps rather than stretching weak concerns into findings.
8. Run read-only commands freely. Run build/tests only when the user asked or repo guidance clearly expects validation for review; report commands and results separately from findings.

## Optional Reference

Load `references/review-heuristics.md` when the review needs a fuller checklist, when reviewing broad diffs, or when calibrating what should count as worth reporting.

## Report Shape

Lead with findings. Sort by severity. If no issues, say so and mention residual test/validation gaps.

```markdown
Findings:
- High: ...
  Evidence: `path/file.ext:123`
  Why it matters: ...
  Remediation direction: ...

Open questions:
- ...

Validation:
- Not run: review was read-only.
```

Severity guide:

- `Critical`: likely data loss, security vulnerability, broken build/release, or severe production regression.
- `High`: likely user-visible defect, contract break, missing required migration, unsafe state handling, or important regression gap.
- `Medium`: maintainability or correctness risk likely to become a defect, including meaningful SOLID/design violations.
- `Low`: minor risk worth fixing but not merge-blocking.
