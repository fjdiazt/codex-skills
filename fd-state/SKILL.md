---
name: fd-state
description: Manage session context, findings, and brief acknowledgments. Use when the user says "note", "save", "load", "update", or "finding". This skill acts as the "State Management" layer of the workflow.
---

# FD State

Manage context and administrative state.

## Operational Modes

1. **Note (Default)**: Triggered by "note", "fyi", "keep in mind".
   - **Action**: Acknowledge with "Noted." or "Acknowledged." Then stop.

2. **Save**: Triggered by "save", "checkpoint", "handover".
   - **Action**: Create or append to `docs/handover.md`.
   - **Entry Shape**: Include Goal, Current State, Files Touched, Verification, and Next Actions.
   - **Rule**: Include exact paths and constraints. Mention if no verification was run.

3. **Update**: Triggered by "update", "amend".
   - **Action**: Edit the *latest* entry in `docs/handover.md`.
   - **Rule**: Merge information into existing sections. Preserve previous session wording.

4. **Load**: Triggered by "load", "resume", "continue".
   - **Action**: Read `docs/handover.md` and `docs/findings.md`.
   - **Rule**: Verify facts against current repo state before continuing. Summarize the continuation point.

5. **Finding**: Triggered by "finding", "log".
   - **Action**: Append to `docs/findings.md`. 
   - **TOC Rule**: Update the `## Index` / Table of Contents near the top. Use stable anchors.
   - **Style**: Lead with the finding, then evidence (`path:line`). Separate Fact from Hypothesis.

## General Rules

- **Conciseness**: Use bullets. No filler.
- **Durable Logging**: Write findings as an investigation log, not a chat transcript.
- **Edit Discipline**: Preserve existing anchors and useful structure. Do not rewrite the whole file.

## Report Shapes

### Save / Update / Finding
```markdown
Updated [docs/handover.md | docs/findings.md].
```

### Load
```markdown
Loaded context from [filename].

Next step: [Concise action]
```

### Entry Template (Save)
```markdown
## Session YYYY-MM-DD HH:mm
### Goal: ...
### State: ...
### Files Touched: ...
### Next Actions: ...
```
