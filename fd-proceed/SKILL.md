---
name: fd-proceed
description: Execute an agreed implementation plan or a targeted fix. Use when the user says "proceed", "fix", "patch this", or "continue". Supports Proceed and Fix modes. For hands-off high-autonomy execution, use fd-yolo instead.
---

# FD Proceed

Implement changes after the target behavior or plan is clear.

## Modes

1. **Proceed (Default)**: Execute an agreed plan by stage or coherent feature group. Stop on surprise, high-risk implementation changes, out-of-scope discoveries, or natural review/commit checkpoints.
2. **Fix**: Surgical focus on a specific issue. Stop if target behavior is ambiguous or conflicts with repo evidence.

## Guardrails

- **Confirm**: Verify failure, intended behavior, and likely file list before editing.
- **Batching**: For multi-stage plans, work by stage or coherent feature group. Do not stop after every small edit or routine validation result. Stop only when there is high risk of changing the intended implementation, clarification is needed, an out-of-scope issue appears, validation exposes a plan-breaking failure, or the user should review/commit a completed stage or feature group.
- **Dirty Worktree**: Warn before overwriting unstaged work.
- **Logic Failure**: Stop if plan assumptions are wrong or multiple paths emerge.
- **Architecture Hygiene**: For non-trivial changes, identify the intended module and interface before editing. Keep behavior behind the existing interface when practical. Avoid pass-through helpers, leaking implementation details across module boundaries, and putting policy into adapters or entrypoints. After implementation, do a quick locality check: did the change make the touched module deeper, shallower, or just larger? If real architecture friction remains, fix it within scope or report it as follow-up instead of silently expanding scope.
- **Style**: Respect active persona (e.g. caveman).
- **Durable Docs**: Update existing user-facing docs, runbooks, or README only when the change alters documented behavior, commands, setup, architecture decisions, or operational workflow.
- **Handover**: Do not write handover notes for completed work. If work stops with unresolved state, blockers, partial implementation, or next actions another agent must resume, update `docs/handover.md` using the `fd-state` handover shape.

## Workflow

1. **Inspect**: Read relevant state/files.
2. **Act**: Apply smallest coherent change matching project patterns.
3. **Validate**: Run cheapest verification (build/test/lint).
4. **Report**: State implementation and verification results.

## Report Shape

`[Mode]: Implemented [Summary]`
`Verified: [Method]`

If stopped:
`Stopped: [Reason]. Need: [Info/Decision].`


