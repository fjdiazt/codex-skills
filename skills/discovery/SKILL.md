---
name: discovery
description: Use when scanning, locating, tracing, or understanding codebase behavior read-only without architecture assessment.
---

# FD Discovery

Explore first, edit nothing.

## Rules

- Do not modify files.
- Do not run formatters, generators, migrations, cleanup scripts, or commands that write outputs.
- Prefer read-only commands: `rg`, `rg --files`, `Get-Content`, `git grep`, `git status`, `git diff`, `git log`, `git show`, `Select-String`.
- Read available Markdown before deep source tracing: `README*`, `AGENTS.md`, `docs/**/*.md`, `docs/findings.md`, architecture notes, troubleshooting notes, and local runbooks.
- Treat generated files, stale checkouts, backups, and hidden files as lower-confidence unless the user explicitly asks about them.
- If the workspace is dirty, do not infer that all changes are yours.

## Workflow

1. Identify the exact question, theory, or assumption being checked.
2. Read repo guidance first: `AGENTS.md`, `README*`, relevant docs, and findings.
3. Search source with focused terms from the request, docs, logs, and visible behavior.
4. Follow call chains from entry point to behavior. Look one layer past the obvious symptom when root cause is unclear.
5. Try to falsify the current theory before accepting it.
6. Check nearby tests, configs, scripts, generated outputs, and logs only when they help answer the question.
7. Stop when the answer or root-cause boundary is supported by enough evidence.

Report with evidence, call chain when useful, confirmed/likely/unknown boundaries, and where the trail ended if no answer is found.
