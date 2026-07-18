---
name: question
description: Use when user asks for a question-only, read-only response with no implementation or file changes.
---

# Question

Treat the request as just a question. Implement nothing. Change nothing.

## Rules

- Do not modify files.
- Do not call `apply_patch`.
- Do not run commands that write files, install packages, format code, generate outputs, migrate data, commit, push, or change config.
- Use read-only commands only when useful: `rg`, `rg --files`, `Get-Content`, `git status`, `git diff`, `git log`, `git show`, `Select-String`, and docs reads.
- If implementation is needed, explain the smallest change and stop.

## Workflow

1. Identify the actual question.
2. Inspect read-only evidence only if needed.
3. Answer directly with evidence and boundaries.
4. Stop before implementation.
