---
name: fd-yolo
description: Use when the user wants hands-off implementation of a clear build, change, patch, prototype, or wiring request, or says "yolo", "just do it", "ship it", or similar.
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

Report concrete result, verification, and remaining blocker or risk.
