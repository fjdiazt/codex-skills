---
name: state
description: Use when saving, loading, or updating durable session context, handover notes, or findings in repository docs.
---

# FD State

Manage context and logs.

## Modes

1. **Save**: Append to `docs/handover.md`. Include: Goal, State, Files, Verification, Next Actions.
2. **Update**: Merge info into latest `docs/handover.md` entry.
3. **Load**: Read `docs/handover.md` and `docs/findings.md`. Verify facts against repo. Summarize resume point.
4. **Finding**: Append to `docs/findings.md`. Update `## Index` TOC. Style: `Finding -> Evidence (path:line)`.

## Rules

- Bullet points. No filler.
- Durable log entries, not chat transcripts.
- Preserve anchors and structure; rewrite minimally.

## Report Shapes

- **Save/Update/Finding**: `Updated [filename].`
- **Load**: `Loaded [filename]. Next: [action].`
