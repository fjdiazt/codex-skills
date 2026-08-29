# YOLO Modes

Complete clear requests without approval checkpoints.

## Mode Selection

| Trigger | Mode | Authority |
| --- | --- | --- |
| `yolo`, `just do it`, or `ship it` | YOLO | Local implementation and verification |
| Exact phrase `yolo end to end` or `yolo all the way` | YOLO Delivery | Local work plus established commit, push, PR/release, deploy, and delivery verification steps |

The longer delivery phrase wins when it contains `yolo`.

## Local Authority

Both modes authorize:

- inspect local state
- choose implementation details from evidence
- create, revise, and execute implementation plans
- edit in-scope files
- run relevant non-destructive commands and verification

Preserve every explicit user constraint. Advance approval covers execution decisions, not scope expansion.

## Delivery Authority

YOLO Delivery additionally authorizes every applicable step already defined by the repository's delivery workflow:

- commit only in-scope changes while preserving unrelated user work
- push the current branch to its configured destinations
- create or update a PR when the established branch workflow requires one
- create a release and deploy through existing documented scripts, CI/CD, targets, accounts, and credentials
- run available post-deployment verification

Do not invent a branch, remote, release process, deployment target, account, credential, or production workflow. Missing or ambiguous delivery configuration is a safety stop.

A plan is working state, not a checkpoint. Never stop for plan approval, ask whether to proceed, or return only a plan. If a plan tool is required, write the plan, mark its first actionable step in progress, and continue execution in the same turn.

## Completion Loop

1. Inspect relevant files and state.
2. Infer the smallest coherent implementation from local evidence and existing patterns.
3. Implement it while preserving user edits.
4. Run the cheapest meaningful verification.
5. If implementation or verification fails, diagnose, adjust the plan, fix, and retry.
6. In YOLO Delivery, execute each applicable delivery step after local verification succeeds and verify its result.
7. Continue until the requested outcome is verified locally, and in YOLO Delivery through deployment/release, or a safety stop applies.

Do not stop because work needs multiple steps, the plan changed, the first approach failed, or an ordinary implementation choice remains. Make the choice and continue.

## Safety Stops

Stop only when continuing requires:

- guessing the requested outcome or materially changing requested user-visible behavior
- destructive or irreversible data changes
- an unknown or ambiguous branch, remote, delivery workflow, account, or deployment target
- missing credentials, missing access, purchases, unrelated external messages, or missing required input
- resolving contradictory requirements that local evidence cannot settle
- expanding scope after safe in-scope alternatives are exhausted

Plain YOLO does not authorize commits, pushes, PRs, releases, deploys, or other external actions unless separately requested. YOLO Delivery is explicit authorization for the delivery steps listed above, including use of already-configured production access; do not pause for separate confirmation.

At completion, report concrete changes, verification, and, for YOLO Delivery, commit, push, release, and deployment results. At a safety stop, report exact blocker and evidence after exhausting safe in-scope alternatives.
