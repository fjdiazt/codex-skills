---
name: question
description: Use when the user says "this is just a question, don't implement or change anything", asks question-only/no edits/do not implement/no changes, or wants a read-only answer.
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
