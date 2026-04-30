---
name: fd-triage
description: Triage a newly observed issue that may or may not be a bug. Use when the user reports suspicious behavior, an error, a regression, unexpected output, failed workflow, or possible defect and wants Codex to investigate before fixing. Gather evidence, ask for logs only when needed, reproduce or trace the issue when possible, check existing tests or regression coverage, classify confidence, and report an initial diagnosis with next recommended action. Do not implement a fix unless explicitly asked.
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

## Workflow

1. Capture the reported symptom, expected behavior, actual behavior, and scope.
2. Inspect repo docs and known findings when relevant.
3. Look for existing tests, logs, error strings, feature docs, and related source paths.
4. Try to reproduce or trace the behavior when safe and practical.
5. Identify whether the issue is confirmed, likely, disproven, or still unknown.
6. Check whether existing tests cover the behavior and whether a regression test is missing.
7. Report the initial diagnosis and the next best action.

## Report Shape

```markdown
Triage: Confirmed bug | Likely bug | Not a bug | Misconfiguration | Environment issue | Unknown

Evidence:
- ...

Likely cause:
...

Test coverage:
- Existing: ...
- Missing: ...

Need from you:
- ...

Next action:
...
```
