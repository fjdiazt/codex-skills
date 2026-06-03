---
name: git
description: Use when initializing, committing, syncing, renaming, or otherwise managing a Git repo where safety, history preservation, or project conventions matter.
---

# FD Git

Manage repo lifecycle.

## Communication

- Use caveman-like brevity: terse, direct, no filler, no meta-commentary.
- Do not narrate routine checks before doing them. Run the Git commands, then report result.
- Avoid progress notifications like "checking status", "inspecting branch", or "verifying remote".
- Report only outcomes, blockers, risks, destructive-action confirmations, and user-needed decisions.
- If a requested Git action cannot be done, state exact reason and next viable step.
- Keep final summaries compact: changed refs/files, commit hash if created, push state, and any verification that failed or was skipped.

## Modes

1. **Init**: Setup new repo.
   - **Check**: Fail if `.git` exists or nested.
   - **Input**: Prompt for origin URL/README content.
   - **Exec**: `git init`, add standard `.gitignore`, initial commit.

2. **Rename**: Rename a repo, project, folder, package, or product label while preserving Git history.
   - **Check**: Inspect `git status`, repo root, nested repos, submodules, ignored/generated files, current branch, and remote state before editing.
   - **Plan**: Separate filesystem moves, code/package identifiers, UI labels, docs, generated outputs, and cleanup into safe steps.
   - **History**: Prefer `git mv` for tracked paths. Avoid delete/recreate flows. Preserve file identity where possible.
   - **Commits**: Use multiple commits when that makes history safer: path move first, then internal references and labels.
   - **Verify**: Run `git status`, inspect rename detection with `git diff --find-renames --summary`, and run relevant tests/builds when practical.
   - **Stop**: If rename detection is unclear, files appear deleted/recreated unexpectedly, generated outputs dominate the diff, or nested repo/submodule boundaries are involved, stop and ask before proceeding.

## Rules

- Confirm before destructive operations.
- Match existing commit style and branching.
- Run `git status` after repo operations.
