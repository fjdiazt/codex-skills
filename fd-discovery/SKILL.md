---
name: fd-discovery
description: Read-only codebase discovery, root-cause investigation, and evidence checking. Use when Codex is asked to scan, inspect, trace, locate, understand, map, validate or falsify a theory, double-check prior reasoning, or find how something works in a repository without editing files. Prioritize existing Markdown documentation, README files, AGENTS instructions, architecture notes, findings docs, and then focused source searches; report back with evidence, call chains, root-cause candidates, and file references.
---

# Discovery

Explore first, edit nothing.

## Rules

- Do not modify files.
- Do not run formatters, generators, migrations, cleanup scripts, or commands that write outputs.
- Prefer read-only commands: `rg`, `rg --files`, `Get-Content`, `git grep`, `git status`, `git diff`, `git log`, `git show`, `Select-String`.
- Read available Markdown before deep source tracing: `README*`, `AGENTS.md`, `docs/**/*.md`, `docs/findings.md`, architecture notes, troubleshooting notes, and local runbooks.
- Treat generated files, stale checkouts, backups, and hidden files as lower-confidence unless the user explicitly asks about them.
- If the workspace is dirty, do not infer that all changes are yours.

## Workflow

1. Identify the exact question, the current theory or assumption being checked, and the likely subsystem terms.
2. Read repo guidance first:
   - `AGENTS.md`
   - root `README*`
   - relevant `docs/**/*.md`
   - `docs/findings.md` when present
3. Search source with focused terms from the user request, previous discussion, docs, logs, and visible behavior.
4. Follow call chains from entry point to behavior. Look one layer past the obvious symptom when root cause is unclear.
5. Try to falsify the current theory before accepting it. Prefer evidence that proves how the system actually behaves.
6. Check nearby tests, configs, scripts, generated outputs, and logs only when they help answer the question.
7. Stop when the answer or root-cause boundary is supported by enough evidence. Do not broaden into unrelated refactors or nice-to-have analysis.

## Report Shape

Start with the answer. Then include evidence.

Use this shape for most reports:

```markdown
Finding: ...

Evidence:
- `path/file.cs:123` ...
- `path/README.md:45` ...

Call chain:
`A()` -> `B()` -> `C()`

Notes:
- Confirmed: ...
- Likely: ...
- Unknown: ...
```

For bug/risk discovery, list the highest-confidence issue first. For exploratory maps, lead with the shortest useful call chain.

## Evidence Standards

- Include clickable file references when possible.
- Quote only small log or code snippets needed to identify the behavior.
- Distinguish current live code from stale paths or backups.
- Mark anything inferred from naming or control flow as inference.
- If no answer is found, say what was searched and where the trail ended.

## Common Searches

Use `rg --files` to map the repo quickly.

Use targeted searches like:

```powershell
rg -n "MethodName|Log Prefix|Error text|SettingName" .
rg -n "class .*Name|void MethodName|public .* MethodName" src
rg -n "TODO|FIXME|HACK|workaround" docs src
```

Avoid broad full-repo dumps unless the repo is small.
