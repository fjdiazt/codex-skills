---
name: fd-yolo
description: Implement the user's clear request, idea, or instructions directly with minimal ceremony and keep going until the task is complete. Use when Codex is asked to build, change, patch, prototype, wire up, or execute a concrete request and the user wants hands-off implementation. Also use when the user says yolo, just do it, ship it, send it, or similar after Codex has proposed a concrete change; treat that as approval to implement the immediately preceding concrete proposal. Make implementation decisions independently and do not ask implementation-choice questions unless the request is unsafe, impossible, missing required credentials/files, or would require changing the requested behavior or scope.
---

# FD YOLO

Move directly from clear request to implementation.

## Gate

Before editing or taking irreversible action, confirm these are clear from the request, conversation, or local evidence:

- requested outcome
- intended behavior after the change
- acceptable scope of change
- safety constraints

If the implementation path is unclear, inspect, infer, and choose. Do not ask questions about file choice, architecture shape, library use, test location, naming, or other implementation details when local evidence can support a reasonable decision.

Ask only when proceeding would require guessing the requested outcome, changing scope or user-visible behavior, deleting data, using credentials, touching production systems, or acting without required files/environment access.

## Workflow

1. Inspect relevant files or state first.
2. Figure out the implementation path from local evidence.
3. Prefer existing project patterns and documented commands.
4. Make the smallest coherent change that satisfies the request.
5. Preserve user edits in a dirty worktree.
6. Run the cheapest meaningful verification available.
7. Report the concrete result, verification, and any remaining blocker or risk.

## Stop Conditions

Stop and ask before proceeding when:

- the request could alter business rules or user-visible semantics in a non-obvious way
- the operation could be destructive or affect production data
- local evidence contradicts the user's stated assumption
- required credentials, files, or environment details are missing
- verification fails in a way that shows the requested outcome may be unsafe, impossible, or outside scope

## Report Shape

```markdown
Implemented ...

Verified with ...
```
