---
name: fd-fix
description: Proceed to implement a discussed fix only after the issue, target behavior, and intended change are clear. Use when Codex is asked to fix, patch, implement the fix, proceed, make the change, or apply a discussed solution. If no issue has been discussed, or the issue/fix is ambiguous, stop and ask clarifying questions before editing.
---

# Fix

Implement only the clear fix.

## Gate

Before editing, confirm these are known from the current conversation or local evidence:

- the issue or failure being fixed
- the intended behavior after the fix
- the files or subsystem likely involved
- the acceptable scope of change
- any user constraints, such as "do not edit", "diagnose only", or "preserve behavior"

If any item is unclear, do not edit. Ask the smallest number of questions needed.

If no issue was discussed, say that no fix target is established and ask what issue to fix.

## Workflow

1. Restate the fix target briefly when useful.
2. Inspect the relevant files before editing.
3. Keep changes scoped to the discussed issue.
4. Avoid unrelated refactors, style churn, generated output changes, and business-rule changes.
5. Preserve user edits in a dirty worktree.
6. Add or update focused tests only when they fit the repo and risk.
7. Run the cheapest meaningful verification available.
8. Report what changed, what was verified, and any remaining risk.

## Clarification Triggers

Ask before editing when:

- multiple fixes are plausible
- the requested behavior conflicts with existing code or docs
- the change could delete or rewrite user data
- the fix depends on production paths, backups, or destructive commands
- the user is asking from stale context and the current repo state differs
- the request says "fix it" but the previous discussion was only exploratory

## Report Shape

For small fixes:

```markdown
Fixed ...

Verified with ...
```

For blocked fixes:

```markdown
I do not have a clear fix target yet.

Need: ...
```

For risky fixes:

```markdown
The issue is clear, but this fix can affect ...

Before I edit, confirm ...
```
