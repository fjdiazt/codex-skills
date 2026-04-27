---
name: fd-git
description: Repository operations and lifecycle management. Use for "init" (setup), "commit", "sync", or other Git workflow macros. Enforces project-specific safety checks (e.g., nested repos, specific README formats).
---

# FD Git

Manage repository state and lifecycle.

## Operational Modes

1. **Init Mode**: Triggered by "init", "setup", "start repo".
   - **Action**: Initialize a new Git repository.
   - **Safety**: Stop and report if an existing `.git` folder is found or if inside a nested repository structure.
   - **Procedure**: Ask for README/origin choices before writing files. Create standard `.gitignore` if missing.

2. **Maintenance Mode**: (Placeholder for future macros like "cleanup", "sync", "pr").

## General Rules

- **Safety First**: Never perform destructive operations (like `git reset --hard`) without explicit confirmation.
- **Standards**: Follow the repository's existing commit message style and branching strategy.
- **Reporting**: Always run `git status` after an operation to confirm success.

## Workflow (Init)

1. **Check Environment**: Scan for existing `.git` or parent repositories.
2. **Consult User**: Confirm the remote origin URL and initial README content.
3. **Execute**: `git init`, create files, `git add`, and initial commit.
4. **Report**: Show the final state of the repo.
