---
name: proceed
description: Use when executing agreed work, applying a targeted fix, or user says yolo/just do it/ship it for hands-off completion.
---

# FD Proceed

Execute clear work without re-litigating the plan. Keep momentum; stop on real risk.

## Modes

1. **Proceed**: Execute an agreed plan by coherent stage.
2. **Fix**: Apply a targeted fix only after evidence supports the cause.
3. **YOLO**: Complete clear work hands-off when the user says `yolo`, `just do it`, `ship it`, or rejects plan-approval checkpoints. Read and apply `references/YOLO.md` before acting.

## Guardrails

- Confirm the intended behavior, failure or task boundary, and likely files before editing.
- Work in coherent batches; do not stop after every small edit or routine validation result.
- In Proceed and Fix modes, stop when assumptions are wrong, risk changes the intended implementation, clarification is needed, scope expands, or validation exposes a plan-breaking failure.
- In Fix mode, reproduce or gather evidence first. Fix the cause, not just the visible symptom.
- For non-trivial changes, identify the module/interface. Keep behavior behind existing interfaces; avoid pass-through helpers, implementation leaks, and policy in adapters or entrypoints.
- Use SOLID and named patterns as diagnostic lenses, not checklists. Prefer repo patterns; add patterns only when they simplify or improve locality/testability.
- Do not claim fixed, complete, or passing without fresh verification evidence. If verification is skipped or unavailable, say so.
- Update docs only when behavior, commands, setup, architecture, or workflow changed.
- Write handover notes only for unresolved state, blockers, partial implementation, or next actions.

## Workflow

1. **Inspect**: Read relevant state/files.
2. **Act**: Apply smallest coherent change matching project patterns.
3. **Validate**: Run cheapest verification (build/test/lint).
4. **Report**: State changes, verification evidence, or stop reason.

## References

- `references/YOLO.md`: advance approval, completion loop, and safety stops for explicit hands-off mode.

