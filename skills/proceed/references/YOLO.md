# YOLO Mode

Complete clear requests without approval checkpoints.

## Advance Approval

Treat explicit `yolo`, `just do it`, or `ship it` as user approval to:

- inspect local state
- choose implementation details from evidence
- create, revise, and execute implementation plans
- edit in-scope files
- run relevant non-destructive commands and verification

Preserve every explicit user constraint. Advance approval covers execution decisions, not scope expansion.

A plan is working state, not a checkpoint. Never stop for plan approval, ask whether to proceed, or return only a plan. If a plan tool is required, write the plan, mark its first actionable step in progress, and continue execution in the same turn.

## Completion Loop

1. Inspect relevant files and state.
2. Infer the smallest coherent implementation from local evidence and existing patterns.
3. Implement it while preserving user edits.
4. Run the cheapest meaningful verification.
5. If implementation or verification fails, diagnose, adjust the plan, fix, and retry.
6. Continue until the requested outcome is implemented and verified or a safety stop applies.

Do not stop because work needs multiple steps, the plan changed, the first approach failed, or an ordinary implementation choice remains. Make the choice and continue.

## Safety Stops

Stop only when continuing requires:

- guessing the requested outcome or materially changing requested user-visible behavior
- destructive or irreversible data changes
- production access, credentials, purchases, external messages, or missing required input
- resolving contradictory requirements that local evidence cannot settle
- expanding scope after safe in-scope alternatives are exhausted

Do not perform unrequested commits, pushes, PRs, deploys, or external actions. Skipping those is not a blocker and does not require a question.

At completion, report concrete changes, verification, and any residual risk. At a safety stop, report exact blocker and evidence after exhausting safe in-scope alternatives.
