---
name: prototype
description: Use when building a small functional POC inside an existing app to validate an interaction or behavior before approval.
---

# FD Prototype

Build the smallest functional app slice that answers one approval question. Prototype means working enough to judge the idea, not fully materialized product code.

## Use When

- user asks for a quick POC, prototype, spike, trial, or "show it in the app"
- brainstorming needs a real interaction instead of more discussion
- approval depends on behavior, layout, state flow, or data feel

Do not use for production fixes, migrations, durable architecture, auth/security changes, or anything that touches real external data without explicit approval.

## Prototype Contract

- One question only: "Does this direction feel right?"
- Local/dev only unless user says otherwise.
- Prefer existing app seams: route, page, component, fixture, feature flag, mock service.
- Keep it rough but usable: enough interaction, state, and sample data to judge.
- Do not polish, generalize, document deeply, or refactor unrelated code.
- Do not commit, push, or promote prototype code unless user asks.

## Workflow

1. Name the approval question in one sentence.
2. Inspect only the app area needed.
3. Add the smallest isolated working slice.
4. Use mock/fixture data when backend work is not the point.
5. Run the cheapest check that proves it loads or compiles.
6. Start/reuse dev server when useful and give URL.
7. Ask user to approve, reject, or promote.

## Boundaries

Stop before editing if prototype requires:

- schema/data migrations
- production credentials/config
- destructive file or DB actions
- broad shared architecture changes
- unrelated visual polish
- test suite or release pipeline work beyond a cheap smoke check

## If During Brainstorming

Keep brainstorming alive. Prototype is evidence, not final implementation. After showing it, return to the design decision:

- keep direction
- revise direction
- discard
- promote into real spec/plan

## Common Mistakes

| Mistake | Fix |
| --- | --- |
| Building full feature | Cut to one approval question. |
| Making static mockup | Use `fd:mockup` instead, unless interaction must run in the app. |
| Refactoring app first | Use existing seam, even if imperfect. |
| Treating prototype as done | Ask before promotion. |
| Committing by default | Wait for explicit commit request. |
