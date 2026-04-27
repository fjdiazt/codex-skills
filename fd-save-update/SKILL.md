---
name: fd-save-update
description: Update the latest saved note. Use when asked to add late findings, corrections, verification, or context after a checkpoint already exists. Default target is docs/handover.md. Do not append a new entry unless asked.
---

# FD Save Update

Update latest entry. Do not append by default.

## Target

- Default file: `docs/handover.md`.
- If user names another file, use that.
- If the file does not exist, stop.
- If the file exists but has no recognizable session entry, ask whether to add a first entry or edit the file in place.

## Latest Entry Rule

Latest entry is the last session-like section, such as:

- `## Session YYYY-MM-DD HH:mm`
- `## YYYY-MM-DD ...`
- `## Checkpoint ...`
- the final comparable entry used by the file

Only edit that latest entry unless the user explicitly points to another section.

## Content Rules

- Add only late findings, corrections, verification, constraints, or next-step changes.
- Merge information into the relevant existing section when possible.
- Add a subsection only when no existing section fits.
- Preserve previous entries and existing wording unless it is being corrected.
- Mark corrected stale information clearly instead of leaving contradictions.
- Include exact files, commands, errors, paths, and evidence when useful.
- Distinguish confirmed facts from hypotheses.
- Do not paste long logs.
- Do not add obvious repo facts.

## Workflow

1. Read target file.
2. Identify latest entry and matching section.
3. Inspect only if needed.
4. Edit the latest entry in place.
5. Keep older entries intact.
6. Report what changed.

## Style

- Short bullets.
- Concrete filenames and method names.
- No filler.
- Write for immediate continuation.

## Report Shape

For completed updates:

```markdown
Updated latest entry in `docs/handover.md`.
```

For missing handovers:

```markdown
No existing note found at `docs/handover.md`.
```

For ambiguous files:

```markdown
I found `docs/handover.md`, but no clear latest entry. Need confirmation before editing: ...
```
