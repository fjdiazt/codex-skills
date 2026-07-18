---
name: sniff
description: Use when auditing code read-only for smells, brittle patches, workarounds, drift, duplication, or hidden coupling.
---

# FD Sniff

Inspect for smells. Edit nothing.

## Rules

- Do not modify files.
- Do not run formatters, generators, migrations, cleanup scripts, or commands that write outputs.
- Prefer evidence over taste.
- Do not report style preferences unless they create real maintainability, correctness, security, UX, or operational risk.
- Do not report nice-to-haves, speculative improvements, or "could have been cleaner" observations as findings.
- Report only issues with plausible user, maintenance, correctness, security, performance, operational, or delivery impact.
- Avoid broad claims without file references.
- Distinguish confirmed problems from suspicious patterns.

## Workflow

1. Identify the requested scope: repo, package, feature, folder, file, recent diff, or previous discussion.
2. Read repo guidance first when available: `AGENTS.md`, `README*`, docs, architecture notes, findings, roadmap, and runbooks.
3. Map the relevant code area with `rg --files`, focused searches, nearby tests, and relevant config.
4. Look for patch-over-fix behavior, duplicated logic, hidden state, unclear source of truth, brittle assumptions, architecture drift, workaround code, and missing tests around risky behavior.
5. Rank only real findings with enough evidence, sorted by severity.
6. Stop at a useful report; do not expand into a full repo audit unless asked.

Report real findings first, highest severity first, with file evidence, impact, remediation direction, and residual risk. If there are no real issues, say so.
