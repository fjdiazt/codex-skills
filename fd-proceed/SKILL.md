---
name: fd-proceed
description: Execute an implementation or fix. Use when the user says "proceed", "fix", "yolo", "ship it". Supports YOLO, Proceed, and Fix modes.
---

# FD Proceed

Implement changes with variable guardrails.

## Execution Modes

1. **YOLO Mode**: Triggered by "yolo", "ship it", "fast".
   - **Posture**: High autonomy. Make decisions independently.
   - **Stop conditions**: Only stop for unsafe operations or missing credentials.

2. **Proceed Mode (Default)**: Triggered by "proceed", "continue", "do it".
   - **Posture**: Plan-adherent. Execute the agreed plan.
   - **Stop conditions**: Stop on surprises, out-of-scope discoveries, or material architectural decisions.

3. **Fix Mode**: Triggered by "fix", "patch", "implement".
   - **Posture**: Surgical. Focus exclusively on the established bug/issue.
   - **Stop conditions**: Stop if the fix target is ambiguous or conflicts with repo patterns.

## Guardrails & Gates

- **Gate**: Before editing, confirm the failure being fixed, the intended behavior, and the files involved.
- **Clarification Trigger**: Stop if the previous discussion was exploratory/theoretical and no concrete plan was agreed upon.
- **Dirty Worktree**: Preserve user edits; do not overwrite unstaged work without warning.
- **Stop and Ask**: Pause if the plan's assumption is wrong, multiple paths become plausible, or verification reveals a new failure outside the agreed scope.

## Workflow

1. **Identify Mode**: Determine the level of autonomy required.
2. **Inspect**: Read relevant files and current state.
3. **Act**: Apply the smallest coherent change. Adhere to project patterns.
4. **Validate**: Run the cheapest meaningful verification (build/test/lint).
5. **Report**: State what was implemented and verified.

## Report Shape

```markdown
[Mode]: Implemented ...

Verified with ...
```

If stopped:
```markdown
Stopped: [Reason]
Need: [Decision or information]
```
