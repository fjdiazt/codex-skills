---
name: council
description: Use when the user asks multiple agents to examine the same problem independently, compare conclusions, or reach an evidence-backed recommendation.
---

# FD Council

Convene the requested number of agents. Default to 3; minimum 2. Invocation authorizes those agents for this council, not edits, deployment, restarts, or other mutations.

## Ground Rules

- Give every member the same self-contained task, evidence, constraints, and output contract. Do not assign different lenses unless the user asks.
- Members investigate read-only and never edit the shared workspace. If implementation is authorized, the orchestrator acts only after the verdict.
- If capacity is lower than requested count, use batches. Keep earlier conclusions hidden from later members.
- Orchestrator withholds its recommendation until independent reports arrive.

## 1. Independent Reports

No cross-talk. Each member returns:

- conclusion or proposed solution
- supporting evidence
- assumptions and unknowns
- risks
- verification needed

Independent convergence strengthens a candidate; it does not prove it.

## 2. Discussion

Circulate all reports to every completed member. Each member critiques competing claims, answers challenges, and may revise its proposal. Orchestrator joins discussion by testing evidence, exposing unsupported assumptions, and keeping debate on the original task.

After independent reporting closes, compile all completed reports into one packet, then fan it out to every completed member concurrently. Each member receives one discussion request containing the full collection. Do not send reports incrementally, start discussion member-by-member, or wait for one discussion response before dispatching the others.

Strong disagreement may indicate missing logs, incompatible assumptions, multiple root causes, or patch stacking. Seek the smallest discriminating evidence instead of stacking patches.

## 3. Vote

Each completed member votes once for the best solution, with a reason and `low`, `medium`, or `high` confidence. Orchestrator does not cast a normal vote.

When votes tie, orchestrator chooses the solution best supported by evidence. Report the tie, chosen solution, supporting evidence, and rejected alternative. If evidence cannot break the tie, report it unresolved and name the missing evidence.

## Stalled Members

- Use bounded waits; never wait indefinitely.
- When a member stops making progress, request concise final findings once.
- If still stalled, interrupt it. Do not enter a retry or replacement loop.
- Stalled members do not vote.
- Continue with at least 2 completed members. Otherwise stop the council.
- Disclose interrupted members and reduced vote count.

## Scope Violations

If a member edits shared files or exceeds authorization, interrupt it. Inspect and report its changes, preserve pre-existing user work, and exclude contaminated work and its vote. Never discard shared-workspace changes without clear attribution and authority.

## Final Report

Report proposals, decisive evidence, discussion changes, vote tally, orchestrator tie-break when used, dissent, confidence, and next verification or implementation step.

Example:

```text
$fd:council 5 agents: independently investigate this intermittent failure, discuss the evidence, and recommend the best solution.
```
