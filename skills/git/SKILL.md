---
name: git
description: Use when initializing, committing, syncing, or renaming a Git repo, starting feature or complex work in a worktree, or completing, closing, or finishing a worktree.
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

3. **Worktree**: Start new features and complex tasks in a dedicated branch and linked worktree by default; explicit user instructions override this default.
   - **Inspect**: Read repo guidance; inspect status, `git worktree list --porcelain`, branches, remotes, and the intended base. Reuse the task's existing worktree rather than creating duplicates. Preserve unrelated work.
   - **Location**: Use `<primary-checkout>/.worktrees/<task>`; do not nest another `.worktrees` inside a linked worktree. Surface conflicting repo conventions or submodule/tooling constraints before choosing another location.
   - **Ignore**: Add `/.worktrees/` to the primary checkout's root `.gitignore` before creation. Verify with `git check-ignore -v .worktrees/<task>` and confirm `git ls-files -- .worktrees` is empty. If already tracked, stop and explain; ignore rules do not untrack files. Keep exclusion effective when switching older branches; use the shared Git exclude file if needed.
   - **Create**: Use `git worktree add -b <task-branch> <path> <base>`. Keep one branch per worktree; never bypass checkout protection with `--force`. Report actual path and branch.
   - **Isolation**: Check build/watch exclusions, Windows path limits, and shared ports/output paths as relevant. Install dependencies and configure local files per repo guidance; preserve secrets and useful ignored files.

4. **Close worktree**: When the user says "complete", "close", "finish", "wrap up", or equivalent about a task/worktree, default to the entire closeout below, unless explicitly instructed otherwise. This authorizes the task's merge and safe local worktree/branch removal; do not ask again for those routine steps.
   - **Identify**: Resolve the task branch/worktree and `main` checkout. If the target is ambiguous, `main` is absent, or another session owns the checkout, state the issue and required decision. Do not guess or disturb other tasks.
   - **Account for work**: Inspect tracked, untracked, and ignored files and branch divergence. Commit all durable changes within the task scope. If any uncommitted work remains beyond confirmed task-generated artifacts, leave the worktree in place and ask how to handle it. Closeout creates zero archives or backup copies.
   - **Integrate**: Run relevant checks, then merge the task into `main` using repo conventions. Preserve existing `main` changes; resolve only conflicts whose intended result is clear. Verify the merged result before cleanup. Failed checks, uncertain conflicts, protected-branch/PR requirements, or unpublished commits that could be lost require a clear blocker report and next action.
   - **Delivery**: Follow existing push instructions and authorization. If remote delivery is required, verify it before cleanup. Delete published task branches only when remote deletion is authorized and the corresponding remote `main` contains their work; otherwise report retained remote refs.
   - **Remove**: From outside the task folder, verify the resolved removal path is the intended linked worktree and task work is integrated. Discard confirmed task-generated scratch files, logs, build output, and caches without asking. Clear any transient files that block removal using verified paths and junction targets. Use `git worktree remove <path>`, then `git branch -d <task-branch>`. Avoid forced worktree or branch removal and manual deletion of the worktree folder. Preserve unrelated worktrees, branches, and stashes.
   - **Verify done**: Confirm folder absent, worktree registration absent, task branch absent, and `main` status understood. Report merge commit, checks, push state, and any retained refs/files or blockers. Partial closeout is not complete; do not silently leave stale folders or branches.

## Rules

- Confirm destructive operations outside the user's existing authorization; safe closeout above needs no repeat approval.
- Match existing commit style and branching.
- Unless the user specifies destinations, `push` means push the current branch to every configured `origin` push URL. If destinations use separate remotes, push each destination remote. Explicit exclusions override this default.
- Run `git status` after repo operations.
