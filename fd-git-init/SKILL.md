---
name: fd-git-init
description: Initialize a Git repository for a project folder with safe nested-repo detection, project-type-aware .gitignore setup, optional README generation, optional origin configuration, initial commit, and optional push. Use when Codex is asked to create/init a repo, add .gitignore, generate repo setup docs, set git origin, or prepare a project folder for source control. Stop before destructive actions, ambiguous nested repo boundaries, remote creation, replacing README content, or pushing unless explicitly authorized.
---

# FD Git Init

Initialize Git deliberately. Preserve boundaries.

## Rules

- Do not run destructive Git commands.
- Do not overwrite an existing `.gitignore`; inspect and augment it.
- Do not run `git init` blindly if already inside a Git worktree.
- Do not create remote repositories unless the user explicitly asks and the required tooling/auth is available.
- Do not add an `origin` unless the user provides or confirms the URL.
- Do not push unless the user explicitly asked to push to the configured remote.
- Do not replace an existing `README.md`; inspect it and ask before changing it.
- Preserve existing user files and uncommitted changes.

## Decision Gates

Ask only for missing decisions that cannot be safely inferred:

- Origin URL: ask if the user wants a remote but did not provide a URL.
- Push: ask before pushing unless the user explicitly requested push to the configured origin.
- Nested repo: ask before initializing inside an existing parent repo unless the user clearly requested a nested repo.
- README: ask whether to generate `README.md` when no README exists and the user did not explicitly request docs.
- Existing README: ask before replacing; prefer updating or leaving it alone.

## Workflow

1. Resolve the target folder and inspect it before changing anything.
2. Check Git state:
   - `git rev-parse --show-toplevel`
   - `git rev-parse --is-inside-work-tree`
   - `git status --short`
3. If the target is already inside a parent repo, stop unless the user clearly asked for a nested repo. Explain the parent repo boundary and the nested repo implication.
4. Identify project type from files and folders, such as:
   - Node/npm: `package.json`, lockfiles, `node_modules`
   - Python: `pyproject.toml`, `requirements*.txt`, `.venv`, `__pycache__`
   - .NET/C#: `*.sln`, `*.csproj`, `bin`, `obj`
   - C/C++: `CMakeLists.txt`, build folders, generated binaries
   - DAZ/script/plugin projects: `out`, generated scripts, build/deploy artifacts, local tool caches
5. Create or update `.gitignore` for the detected project types. Keep entries practical and avoid ignoring source files, lockfiles, project files, or docs unless the repo convention says so.
6. If README generation is requested or confirmed, inspect project files and generate a concise `README.md` from real codebase evidence: purpose, setup, common commands, project layout, and notes from existing docs/config.
7. Run `git init` only after the repo boundary is clear.
8. Inspect `git status --short` before staging. Stage intentional project files only.
9. Make an initial commit if the user asked for a commit or if repo initialization was requested end-to-end.
10. If an origin URL was provided or confirmed, run `git remote add origin <url>` or update only when explicitly requested.
11. Push only when explicitly authorized after origin is configured.

## .gitignore Guidance

Prefer small, project-specific ignores:

- Ignore dependency folders and local caches: `node_modules/`, `.venv/`, `__pycache__/`.
- Ignore build outputs: `dist/`, `build/`, `out/`, `bin/`, `obj/`, `*.user`.
- Ignore local environment files: `.env`, `.env.*`, except documented examples such as `.env.example`.
- Ignore editor/OS noise when appropriate: `.DS_Store`, `Thumbs.db`, local `.vscode/` only when it contains user-specific settings.
- Keep lockfiles tracked by default for applications and independently published packages unless the repo convention says otherwise.

## Report Shape

Report the boundary, files changed, and any remote action:

```markdown
Initialized Git in: ...
Repo boundary: ...
.gitignore: ...
README: ...
Commit: ...
Origin: ...
Push: ...
```
