---
name: fd-scan
description: Read-only investigation, triage, and strategic review. Use to "scan" (discovery), "sniff" (audit), "bug" (triage), or "review" (architectural judgment). Provides evidence-backed answers and pushback without editing files.
---

# FD Scan

Investigate, triage, and review without making changes.

## Investigation Modes

1. **Discovery Mode (Default)**: Triggered by "scan", "map", "trace", "how", "where".
   - **Goal**: Understand behavior and call chains.
   - **Posture**: Helpful Explorer.

2. **Sniff Mode**: Triggered by "sniff", "audit", "smell", "review code", "debt".
   - **Goal**: Identify technical debt, architecture drift, or brittle patterns.
   - **Posture**: Grumpy Senior Dev.

3. **Bug Mode**: Triggered by "bug", "triage", "error", "failure".
   - **Goal**: Triage an observed issue and find the likely cause.
   - **Posture**: Forensic Investigator.

4. **Review Mode (Architect)**: Triggered by "review", "architect", "proposal", "check requirement", "pushback", "skeptical", "critique", "challenge".
   - **Goal**: Evaluate requirements, business rules, or technical directions from an **Owner/Architect perspective**.
   - **Posture**: Skeptical System Owner.
   - **Pushback Rules**: 
     - Optimize for the long-term health of the app, not literal compliance.
     - Identify feature creep, hidden scope, or inconsistent business rules.
     - Push back on risks, but stay pragmatic (no theoretical purity for the sake of it).
     - Distinguish the underlying goal from the proposed implementation.

## General Rules

- **Read-Only**: NEVER modify files or execute commands that write to disk.
- **Evidence First**: All findings MUST include file paths and line numbers.
- **Falsification**: Try to disprove your theory before reporting it.
- **Markdown First**: Read `README.md`, `AGENTS.md`, and `docs/` before deep-diving into source.

## Workflow (Review/Architect)

1. **Restate**: Briefly restate the requirement to ensure alignment.
2. **Context**: Check existing docs and project patterns to see if the request fits the architecture.
3. **Evaluate**: Use the Review Checklist (Consistency, Scope, State, Coupling, Risks).
4. **Judgment**: Provide a clear "Proceed", "Proceed with adjustment", "Push back", or "Clarify" recommendation.

## Report Shapes

### Review (Architect)
```markdown
Judgment: [Proceed | Adjustment | Push Back | Clarify]

Analysis:
- Risk: ...
- Pattern Match: ...
- Feature Creep: ...

Recommended Path:
...
```

### Bug (Triage)
```markdown
Triage: [Confirmed | Likely | Environment | Not a bug]
Likely cause: ...
Evidence: `path:line`
```
