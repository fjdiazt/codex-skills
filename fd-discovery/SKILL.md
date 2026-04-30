---
name: fd-discovery
description: Read-only codebase discovery, root-cause investigation, and evidence checking. Use when Codex is asked to scan, inspect, trace, locate, understand, map, validate or falsify a theory, double-check prior reasoning, or find how something works in a repository without editing files. Prioritize existing Markdown documentation, README files, AGENTS instructions, architecture notes, findings docs, and then focused source searches; report back with evidence, call chains, root-cause candidates, and file references.
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

## Report Shape

```markdown
Finding: ...

Evidence:
- `path/file.ext:123` ...

Call chain:
`A()` -> `B()` -> `C()`

Notes:
- Confirmed: ...
- Likely: ...
- Unknown: ...
```

If no answer is found, say what was searched and where the trail ended.
