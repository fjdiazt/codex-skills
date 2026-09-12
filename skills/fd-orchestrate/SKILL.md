---
name: fd-orchestrate
description: Use when the user requests supervised implementation by cheaper worker models, with efficient delegation, integrated code review, and final testing.
---

# FD Orchestrate

Delegate implementation to user-selected cheaper models. Optimize total effort, roundtrips, elapsed time, and cost while completing the requested scope correctly.

## Model Selection

- Use the current model as orchestrator unless the user specifies another. Use worker models specified in the request or already selected in the session; otherwise ask which worker model(s) to use before spawning.
- Check available delegation and model-selection capabilities. Never claim to switch models or silently substitute an unavailable model. If the requested setup is unsupported, explain the limitation and ask for an available alternative.
- Invocation authorizes worker delegation for the requested task, within its existing permissions and scope.

## Delegate

- Inspect enough context to define clear assignments. Reuse an existing implementation plan; write a short one only when needed to resolve scope or dependencies.
- Give workers self-contained outcomes, relevant paths, ownership boundaries, constraints, acceptance criteria, and any applicable plan. Request a concise completion report covering changes, blockers, and verification performed or deferred.
- Delegate substantial implementation; avoid duplicating worker investigation or prescribing every edit. Workers may add needed tests during implementation.
- Spawn parallel workers only for independent assignments that can proceed immediately without waiting for each other's output and without conflicting edits. Shared contracts must be settled first. Otherwise use one worker or sequential assignments; do not spawn idle dependents.
- Use the fewest workers that provide useful concurrency. Workers must not spawn additional agents without orchestrator coordination.

## Supervise

- Wait for the entire assigned implementation to complete before code review, including sequential dependent assignments. Use completion notifications or reasonable bounded waits; avoid frequent polling and progress-only messages to workers.
- Intervene early only for blockers, stalled progress, scope violations, or conflicting changes. Resolve the dependency or adjust the assignment without starting a premature review loop.
- When a worker repeatedly makes mistakes, repeats a corrected error, or cannot progress after clear guidance, take over the affected work. Do not continue an unproductive retry loop.
- Before takeover or reassignment, stop the original worker's edits and inspect its partial work. Preserve useful changes and unrelated user work; ensure only one owner edits the affected files.

## Review And Verify

- Integrate completed work, then review the whole resulting diff for correctness, regressions, scope, and test gaps.
- Batch actionable findings into one correction request. Reuse the responsible worker for substantial fixes; fix small issues directly when cheaper than another roundtrip. Review corrections after they finish.
- Run required tests and appropriate integrated verification at the end, not after every turn or worker response. Workers should defer broad suites to this final pass.
- Allow focused checks needed for debugging, explicit TDD, or required repository gates during implementation. Avoid repeating checks without changed code or new evidence.
- If final checks fail, correct the failures and rerun affected checks before completion. Report unresolved failures or unavailable verification honestly.

## Report

Briefly report delivered changes, actual models used, review/test results, and any takeover or remaining blockers. Claim measured cost savings only when usage data supports them.
