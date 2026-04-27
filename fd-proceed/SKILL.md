---
name: fd-proceed
description: Continue with an already-discussed plan, approach, or next step while keeping guardrails. Use when the user says proceed, go ahead, continue, do it, implement the plan, or similar after Codex has proposed a plan or path; treat that as approval to execute the immediately preceding concrete plan or proposal. Execute the agreed work, but stop and ask before handling unforeseen issues, out-of-scope changes, risky operations, materially different choices, or ambiguous deviations.
---

# FD Proceed

Proceed with the agreed plan. Stop on surprises.

## Proposal Approval

If the user says only `proceed`, `go ahead`, `continue`, `do it`, `implement the plan`, or similar after a concrete agent plan or proposal, treat it as approval to execute that plan.

Do not ask what to proceed with unless:

- there is no clear preceding plan or proposal
- multiple plans or materially different options are still open
- the plan is ambiguous, unsafe, or out of scope
- a gate or guardrail applies

## Gate

Before acting, confirm there is an established plan, approach, or next step in the current conversation.

If no plan exists, do not invent one under this skill. Ask what to proceed with, or use a more appropriate skill if the user gave a clear direct request.

## Guardrails

Stay inside the accepted plan:

- Do the planned steps in a practical order.
- Keep changes scoped to the agreed goal.
- Use existing project patterns and documented commands.
- Preserve user edits in a dirty worktree.
- Run the cheapest meaningful verification available.

Stop and ask first when:

- the plan's assumption is wrong
- multiple materially different paths become plausible
- a required change is outside the agreed scope
- the work would alter business rules or user-visible semantics not covered by the plan
- the operation could delete data, overwrite user work, affect production paths, or require credentials
- verification reveals a new failure that is not part of the agreed work
- continuing would require guessing the user's preference

## Workflow

1. Briefly identify the accepted plan only when useful.
2. Inspect the relevant files or state before editing.
3. Execute the plan with minimal ceremony.
4. Pause for user input if a guardrail trips.
5. Verify the completed work.
6. Report what was done, what was verified, and any remaining issue.

## Communication

- Keep updates short and operational.
- Do not re-litigate the plan unless new evidence changes it.
- Do not bury surprises inside the final answer after acting on them.
- If stopping, state the specific unforeseen or out-of-scope issue and the decision needed.

## Report Shape

For completed work:

```markdown
Proceeded with the agreed plan and implemented ...

Verified with ...
```

For a stopped plan:

```markdown
Stopped before proceeding further: ...

Need your call on ...
```
