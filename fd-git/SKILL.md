---
name: fd-git
description: Repository operations and lifecycle management. Use for "init" (setup), "commit", "sync", or other Git workflow macros. Enforces project-specific safety checks (e.g., nested repos, specific README formats).
---

# FD Git

Manage repo lifecycle.

## Modes

1. **Init**: Setup new repo.
   - **Check**: Fail if `.git` exists or nested.
   - **Input**: Prompt for origin URL/README content.
   - **Exec**: `git init`, add standard `.gitignore`, initial commit.

2. **Maintenance**: (Future).

## Rules

- **Safety**: Confirm before destructive ops (e.g. `reset --hard`).
- **Standard**: Match existing commit style/branching.
- **Verify**: Run `git status` after ops.
- **Style**: Respect active persona (e.g. caveman). If active, use ultra-terse prompts/status.
