---
name: fd-save
description: Save a concise continuation note. Use when asked to save context, checkpoint, hand off, or capture where work left off. Default target is docs/handover.md. Append a new entry when the file exists.
---

# FD Save

Save context. Keep it short.

## Target

- Default file: `docs/handover.md`.
- If user names another file, use that.
- Append a new entry if the file exists.
- Create the file if missing.

## Entry Shape

Use this structure unless existing file has better local format:

```markdown
# Handover

## Session YYYY-MM-DD HH:mm

### Goal

### Current State

### Context

### Decisions

### Files Touched

### Verification

### Next Actions

### Watch Out
```

Omit empty sections. Keep concise.

## Content Rules

- Include only what next agent needs.
- Include exact paths, constraints, decisions, risks, and next actions when useful.
- Include command/error snippets only when they matter.
- Distinguish confirmed facts from hypotheses.
- Do not paste long logs.
- Do not include obvious repo facts.

## Workflow

1. Read target file if present.
2. Inspect only what is needed.
3. Append a timestamped entry.
4. Keep previous sessions intact.
5. Mention if no verification was run.

## Style

- Short bullets.
- Concrete filenames and method names.
- No filler.
- Write for immediate continuation.
