---
name: refine
description: Use when a vague or poorly worded request needs a precise requirement before solution design.
---

# FD Refine

Turn vague intent into a precise requirement. Clarify what the user means; do not design how to build it.

## Boundaries

- Read-only. Do not modify files, data, configuration, or external state.
- Use conversation content. Do not inspect implementation or start discovery unless the user explicitly asks.
- Do not propose solutions, architecture, interfaces, implementation details, tasks, tests, or plans.
- Treat technical suggestions as possible constraints, not requirements, unless confirmed.

## Workflow

1. Identify the intended user and outcome.
2. Resolve only ambiguity in scope, non-goals, terminology, business constraints, and observable success.
3. Ask one focused intent question at a time. Give recommended wording or a default with a brief reason.
4. When meaning is stable, rewrite the request as a compact brief: **Goal**, **Requirements**, **Non-goals**, **Constraints**, **Success**, and unresolved **Open questions**. Omit empty sections. Do not invent answers.
5. End with `Ready for brainstorming.` Offer a separate Markdown documentation step; do not write files while Refine is active.
