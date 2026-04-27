---
name: fd-load
description: Load saved context and continue prior work. Use when the user says load, continue, resume, pick up where we left off, or references prior work without restating context. Read docs/handover.md first when present, then relevant Markdown before changing files.
---

# FD Load

Load context, then continue.

## Target

- Start with `docs/handover.md` when present.
- If user names another file, start there.
- Then read relevant Markdown only: `README.md`, `AGENTS.md`, `docs/findings.md`, `docs/roadmap.md`, architecture notes, or package docs.
- Prefer nearby project docs before source files.

## Context Rules

- Identify repo/workspace path before acting.
- Treat saved notes as context, not proof.
- Verify facts cheaply when they affect next action.
- Preserve constraints, stop conditions, and traps.
- Do not replay old work blindly. Check current file state before editing.
- If notes are stale, missing, or contradictory, stop and summarize mismatch.

## Workflow

1. Read saved note or named file.
2. Read relevant Markdown.
3. Inspect current status and named files.
4. Summarize continuation point only when useful.
5. Continue the task using the appropriate posture:
   - use an existing plan when notes leave one clear
   - ask a concise clarification when the next step is unclear
   - implement directly when the target and scope are clear
6. Run meaningful verification when changes are made.
7. Report what context was used, what was done, and any remaining blocker.

## Stop Conditions

Stop and ask before editing when:

- no saved note or relevant Markdown context exists
- multiple incompatible next actions are plausible
- saved next action conflicts with current repo state
- the task would require guessing scope, behavior, credentials, production paths, or destructive operations
- the user appears to mean "continue the current visible plan" instead of resuming from old notes

## Relationship To Other Skills

- Use this for new-chat or stale-context continuation.
- Use `fd-proceed` when the plan is visible in the current chat.
- Use `fd-save` to create a checkpoint.
- Use `fd-save-update` to amend the latest checkpoint.

## Report Shape

For resumed work:

```markdown
Loaded `docs/handover.md`.

Continued by ...

Verified with ...
```

For unclear continuation:

```markdown
I found saved context, but next step is ambiguous: ...

Need your call on ...
```

For missing context:

```markdown
No saved continuation context found.
```
