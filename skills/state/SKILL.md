---
name: state
description: Use when saving, loading, or updating durable session context, handover notes, or findings that future agents cannot reconstruct from repo files, git history, tests, logs, or existing docs.
---

# FD State

Save only non-obvious state. Do not duplicate facts future agents can recover from repo/git.

## Modes

1. **Save**: Append a new final `##` entry to `docs/handover.md` only when there is durable, non-reconstructable context.
2. **Update**: Merge non-reconstructable context into the final `##` entry only; preserve earlier entries. If no entry exists, use Save.
3. **Load**: Read existing `docs/handover.md` and `docs/findings.md`; do not create or modify files. Verify repo-checkable claims; flag stale, conflicting, or unverifiable claims. Report missing files. Summarize resume point without inventing one.
4. **Finding**: Append only qualifying new findings to `docs/findings.md`. Update `## Index` TOC. Style: `Finding -> Evidence (source or observation; path:line when applicable)`.

## Rules

- Bullet points. No filler.
- Durable log entries, not chat transcripts.
- Before Save/Update/Finding, read existing handover/findings and relevant repo docs. Save only new or changed context; reference existing detail instead of copying it.
- Candidates: decisions, user preferences, external constraints, unresolved questions, hidden environment facts, manual verification results, reproduction artifacts, and why a path was rejected. Keep only what affects future work and passes the redundancy check.
- Do not save file lists, diffs, commit hashes, test commands, obvious next steps, or implementation summaries when repo/git/tests/docs already show them.
- Internally check: `Could the next agent readily recover this from persistent repo files, git history, tests, logs, or existing docs?` If yes, skip it. Temporary output or inaccessible external evidence may need a concise observation saved.
- Keep minimal source references when needed to interpret saved context. Label hypotheses as unconfirmed; include observation date/environment when results depend on them. Never save secrets.
- If nothing worth saving remains, do not edit files. Report `Nothing durable to save.`
- Preserve anchors and structure; rewrite minimally.

## Save Shape

Use short sections only when they contain non-reconstructable information:

- **Goal**: user intent not obvious from commits or issues.
- **State**: current unresolved state, blocker, or branch decision.
- **Context**: external facts, preferences, environment constraints, manual observations.
- **Next**: next action that depends on this saved context.

## Report Shapes

- **Save/Update/Finding**: `Updated [filename].`
- **Load**: `Loaded [files]. State: [resume point]. Next: [action].`
