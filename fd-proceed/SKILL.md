---
name: fd-proceed
description: Execute an agreed implementation plan or a targeted fix. Use when the user says "proceed", "fix", "patch this", or "continue". Supports Proceed and Fix modes. For hands-off high-autonomy execution, use fd-yolo instead.
---

# FD Proceed

Implement changes after the target behavior or plan is clear.

## Modes

1. **Proceed (Default)**: Execute an agreed plan. Stop on surprise or out-of-scope discoveries.
2. **Fix**: Surgical focus on a specific issue. Stop if target behavior is ambiguous or conflicts with repo evidence.

## Guardrails

- **Confirm**: Verify failure, intended behavior, and likely file list before editing.
- **Dirty Worktree**: Warn before overwriting unstaged work.
- **Logic Failure**: Stop if plan assumptions are wrong or multiple paths emerge.
- **Style**: Respect active persona (e.g. caveman).

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
