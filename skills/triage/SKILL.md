---
name: triage
description: Use when investigating errors, regressions, failed workflows, unexpected output, or possible defects before fixing.
---

# FD Triage

Triage first. Do not assume it is a bug.

## Rules

- Do not edit files unless the user explicitly asks for a fix.
- Treat the report as an observed issue, not a confirmed bug.
- Ask for logs, screenshots, reproduction steps, inputs, or environment details only when local evidence is insufficient.
- Prefer local evidence over speculation: docs, tests, logs, source, config, generated output, and recent diffs.
- Check whether a test already covers the behavior before recommending a regression test.
- Distinguish bug, expected behavior, misconfiguration, stale build/output, environment issue, missing requirement, and unknown.
- Stop at triage unless the user asks to fix.
- If triage confirms a hard, flaky, or performance defect, report that root-cause diagnosis is the next step.

## Workflow

1. Capture the reported symptom, expected behavior, actual behavior, and scope.
2. Inspect repo docs and known findings when relevant.
3. Look for existing tests, logs, error strings, feature docs, and related source paths.
4. Try to reproduce or trace the behavior when safe and practical.
5. Identify whether the issue is confirmed, likely, disproven, or still unknown.
6. Check whether existing tests cover the behavior and whether a regression test is missing.
7. Report the initial diagnosis and the next best action.

Report classification, evidence, likely cause, test coverage, missing inputs, and next action. Do not implement a fix unless explicitly asked.
