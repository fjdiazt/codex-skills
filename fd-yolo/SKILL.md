---
name: fd-yolo
description: Implement the user's clear request, idea, or instructions directly with minimal ceremony and keep going until the task is complete. Use when Codex is asked to build, change, patch, prototype, wire up, or execute a concrete request and the user wants hands-off implementation. Also use when the user says yolo, just do it, ship it, send it, or similar after Codex has proposed a concrete change; treat that as approval to implement the immediately preceding concrete proposal. Make implementation decisions independently and do not ask implementation-choice questions unless the request is unsafe, impossible, missing required credentials/files, or would require changing the requested behavior or scope.
---

# YOLO

Move directly from clear request to implementation.

## Proposal Approval

If the user says only `yolo`, `just do it`, `ship it`, `send it`, or similar after a concrete agent proposal, treat it as approval to implement that proposal.

Do not ask what to implement unless:

- there is no clear preceding proposal
- multiple proposals or materially different options are still open
- the proposal is ambiguous, unsafe, or out of scope
- a gate or stop condition applies

## Gate

Before editing or taking irreversible action, confirm these are clear from the request, conversation, or local evidence:

- the requested outcome
- the intended behavior after the change
- the acceptable scope of change
- any safety constraints, such as destructive operations, production data, credentials, or user-owned edits

If the implementation path is unclear, inspect, infer, and choose. Do not ask questions about file choice, architecture shape, library use, test location, naming, or other implementation details when local evidence can support a reasonable decision.

Ask only when proceeding would require guessing the requested outcome, changing scope or user-visible behavior, deleting data, using credentials, touching production systems, or acting without required files/environment access.

## Workflow

1. Inspect the relevant files or state first.
2. Figure out the implementation path from local evidence.
3. Prefer existing project patterns and documented commands.
4. Make the smallest coherent change that satisfies the request.
5. Preserve user edits in a dirty worktree.
6. Run the cheapest meaningful verification available.
7. Report the concrete result, verification, and any remaining blocker or risk.

## Persistence

Do not stop at a plan, partial implementation, or unverified edit.

Keep working until one of these is true:

- the requested task is implemented
- meaningful verification has run, or a clear reason verification cannot run is known
- a hard blocker prevents further progress
- a safety stop requires user input

If a command fails, inspect the failure and try the next reasonable local fix when it remains inside scope. Keep going through implementation uncertainty. Stop only when continuing would require changing the requested behavior or scope, deleting/overwriting user work, using missing credentials, touching production systems, or acting without required files/environment access.

## Communication

Keep progress updates short and operational:

- Say what is being inspected, changed, or verified.
- Skip validation language, motivational framing, and unnecessary permission checks.
- Do not ask implementation-choice questions; make the call from local evidence.
- Ask only when a safety stop applies.
- When blocked, state exactly what is missing.

## Stop Conditions

Stop and ask before proceeding when:

- the request could alter business rules or user-visible semantics in a non-obvious way
- the operation could be destructive or affect production data
- local evidence contradicts the user's stated assumption
- required credentials, files, or environment details are missing
- verification fails in a way that shows the requested outcome may be unsafe, impossible, or outside scope

## Report Shape

For completed work:

```markdown
Implemented ...

Verified with ...
```

For unclear requests:

```markdown
Need one clarification before editing: ...
```

For blocked work:

```markdown
Blocked by ...

I verified ...
```
