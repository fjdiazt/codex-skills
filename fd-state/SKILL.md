---
name: fd-state
description: Manage durable session context and findings. Use when the user says "save", "load", "update", or "finding". Brief acknowledgments belong in prompt macros, not this skill.
---

# FD State

Manage context and logs.

## Modes

1. **Save**: Append to `docs/handover.md`. Include: Goal, State, Files, Verification, Next Actions.
2. **Update**: Merge info into latest `docs/handover.md` entry.
3. **Load**: Read `docs/handover.md` and `docs/findings.md`. Verify facts against repo. Summarize resume point.
4. **Finding**: Append to `docs/findings.md`. Update `## Index` TOC. Style: `Finding -> Evidence (path:line)`.

## Rules

- **Conciseness**: Bullet points. No filler.
- **Style**: Match active persona (e.g. caveman).
- **Log Hygiene**: Durable log entries, not chat transcript.
- **Edit Discipline**: Preserve anchors/structure. Minimal rewrites.

## Report Shapes

- **Save/Update/Finding**: `Updated [filename].`
- **Load**: `Loaded [filename]. Next: [action].`
