---
name: fd-rapid-fire
description: Use when the user wants back-to-back code or content changes with lightweight verification only, says "rapid fire", "quick iteration", "no heavy testing", "skip heavy checks", or asks to defer commits until "wrap it up" or "commit".
---

# FD Rapid Fire

Make fast consecutive changes while preserving enough discipline to avoid obvious breakage.

## Intent

Use this mode for active iteration where the user expects multiple changes in a row and does not want the usual heavy validation or git hygiene after every edit.

Default stance:

- implement the next requested change directly when scope is clear
- keep edits small and reversible
- run only cheap verification when useful
- do not commit, push, or prepare PRs
- defer cleanup, broad checks, and diff review until the user says `wrap it up`, `commit`, or asks for a review

## Allowed Verification

Use fast checks that directly protect the current edit:

- compile a single touched target when it is cheap
- run focused unit tests or smoke tests
- run a formatter only on touched files when it is already standard
- inspect a specific error message or log needed to continue

Keep verification proportional. If the check takes more than a few minutes, touches external systems, launches full integration workflows, or blocks the iteration loop, skip it and say it was deferred.

## Deferred Until Wrap-Up

Do not do these during rapid-fire iteration unless the user explicitly asks:

- full integration tests
- broad test suites unrelated to the touched files
- release builds
- deploys
- git diff audits/checkups
- staged-scope reviews
- commits
- pushes
- PR creation
- documentation polish not needed for the current behavior

## Workflow

1. Read only the files needed for the next change.
2. Patch the requested behavior using existing local patterns.
3. Run a cheap targeted check only if it is likely to catch immediate mistakes.
4. Report the changed behavior and any skipped verification in one short update.
5. Keep going on the next user request without asking for a plan.

## Wrap-Up Trigger

When the user says `wrap it up`, `commit`, `push`, `final check`, or asks to finish the batch:

1. Stop rapid-fire shortcuts.
2. Inspect git status and staged/unstaged scope.
3. Separate unrelated user edits from rapid-fire edits.
4. Run the cheapest meaningful broader verification for the accumulated changes.
5. Run `git diff --check` only during this wrap-up phase.
6. If asked to commit, stage only the intended files, commit with the repo's style, and push only if requested.

## Stop Conditions

Stop and ask before continuing if:

- the requested change is destructive or security-sensitive
- local evidence contradicts the requested behavior
- the change would require a migration, production data access, or credentials
- skipped verification would make the next step blind or unsafe
- repeated rapid-fire edits create conflicting assumptions that need a decision

## Reporting Style

Keep updates brief:

- what changed
- what cheap check ran, if any
- only concrete blockers or user-requested omissions

Do not append a boilerplate `Deferred:` block. In rapid-fire mode, skipped full tests, diff audits, and commits are already implied by the mode unless the user asks for wrap-up or asks what remains.
