---
name: rapid-fire
description: Use for back-to-back code/content changes with lightweight verification only. Triggers include rapid fire, quick iteration, no heavy testing, skip heavy checks, defer commits until wrap it up/commit, rapid-fire testing, or rapid-fire tdd.
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

## Testing Modes

Plain `rapid-fire` keeps testing lightweight and opportunistic.

`rapid-fire testing` means run a focused check after each relevant change when a cheap one exists:

- touched-file unit test
- narrow smoke test
- single target compile
- small repro script
- focused lint/typecheck for the edited area

`rapid-fire tdd` means write or update the smallest focused test first when practical:

1. Add the focused test or repro.
2. Watch it fail, or explain why failure proof is impractical.
3. Patch the behavior.
4. Run the focused test.

Still defer broad suites, full integration workflows, release builds, diff audits, commits, and pushes
until wrap-up unless the user explicitly asks for them.

If a requested bug fix needs a real reproduction loop, ranked hypotheses, or regression coverage
outside cheap rapid iteration, switch to `fd:diagnose` unless the user explicitly keeps it in
rapid-fire mode.

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
2. If in `rapid-fire tdd`, add or update the smallest focused test first when practical.
3. Patch the requested behavior using existing local patterns.
4. Run a cheap targeted check only if it is likely to catch immediate mistakes, or when `rapid-fire testing` / `rapid-fire tdd` requested it.
5. Report the changed behavior and any skipped verification in one short update.
6. Keep going on the next user request without asking for a plan.

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
