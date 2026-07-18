---
name: init
description: Use when initializing repo-local FD workflow, GitHub issue/project defaults, domain docs, AGENTS.md, or CLAUDE.md.
---

# FD Init

Initialize repo-local FD workflow context. Do not assume global GitHub or project defaults.

## Goal

Create or update repo-local agent workflow guidance that agent skills can read before acting. The
guidance should capture only conventions that affect behavior: issue tracker, GitHub project
metadata, status flow, custom fields, domain docs, concurrent-agent safety, and any repo-specific
workflow stops.

## Files

Prefer a centralized `## Agent workflow` block in the root `AGENTS.md`.

If `AGENTS.md` does not exist but `CLAUDE.md` exists, update `CLAUDE.md`. If neither exists, ask
before creating one. Use `docs/agents/agent-profile.md` only when the workflow guidance is too long
for a compact root block or the user explicitly wants a separate shared profile.

## Idempotency

Treat reruns as audits and refreshes.

- Do not duplicate `## Agent workflow`, subsection headings, or bullets.
- If `## Agent workflow` exists, merge missing or stale subsections into it.
- Preserve unrelated guidance, comments, formatting, and user-written sections.
- If requested guidance is already present, make no file changes and report the existing path.
- When adding safety rules, detect equivalent wording instead of inserting duplicate bullets.
- Stop and ask when existing guidance conflicts with the requested workflow and the correct merge is
  unclear.

## Process

1. Inspect the repo:
   - `git remote -v`
   - root `AGENTS.md` and `CLAUDE.md`
   - `docs/agents/agent-profile.md`
   - `CONTEXT.md`, `CONTEXT-MAP.md`, and ADR directories
   - existing project docs that mention issue workflow, labels, statuses, or GitHub Projects
   - existing concurrency, worktree, destructive-command, or rollback guidance
2. Present what is known and missing.
3. Ask only for conventions that cannot be inferred safely.
4. Draft the `## Agent workflow` block and any optional overflow profile.
5. Get user approval before writing or changing repo guidance.
6. Update the chosen guidance file in place.
7. Report the guidance path and any unresolved conventions.

## Agent Workflow Shape

Use this structure in `AGENTS.md` or `CLAUDE.md`, omitting sections that do not apply:

```markdown
## Agent workflow

### Issue tracker

- Provider: GitHub
- Repository: owner/name

### GitHub project

- Owner: user-or-org
- Project: project name or URL
- Create real repository issues by default: yes/no
- Draft project items allowed: only with explicit approval
- New item position: top when supported

### Status flow

- Initial:
- In progress:
- Blocked:
- Review:
- Done owner: user/human/project

### Custom fields

- Feature: when applicable

### Labels and metadata

- Required labels:
- Optional labels:
- Milestone rules:
- Assignee rules:

### Domain docs

- Context: single-context or multi-context
- Glossary:
- ADRs:

### Concurrent agent safety

- Other agents may be editing this repo at the same time.
- Do not revert, overwrite, delete, or reformat changes you did not make.
- Check current Git/worktree state before editing.
- Re-read files immediately before patching if they may have changed.
- Preserve unrelated user/agent changes, even when working in the same files.
- If conflict scope is unclear or broad, stop and report exact files before continuing.
- Never run destructive Git/file commands unless explicitly requested.

### Workflow stops

- Stop when project/repository/field metadata is missing or ambiguous.
- Stop before falling back to body-only metadata.
```

If a separate profile is needed, put this same content under `docs/agents/agent-profile.md` and add
a short `## Agent workflow` block in `AGENTS.md` that points to it.

## GitHub Defaults

When initializing GitHub workflow, ask for or infer:

- target repository
- project owner and project URL/name
- whether issues must be real repository issues
- whether draft project items are allowed
- whether project items should be positioned at the top
- status names for planning, in progress, blocked, and review
- whether humans own the final `Done` transition
- useful custom fields such as `Feature`

Do not bake these values into `fd:github`; record them in repo-local agent workflow guidance.

## Overflow Profile Block

Use this block only when the details live in `docs/agents/agent-profile.md`:

```markdown
## Agent workflow

This repo has agent workflow guidance in `docs/agents/agent-profile.md`.
Read it before using `fd:github`, `fd:triage`, `fd:diagnose`, `fd:refine-and-doc`,
or `fd:improve-architecture` when repo-local issue, project, status, label, glossary,
or ADR conventions matter.
```
