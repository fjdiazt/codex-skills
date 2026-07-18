---
name: refine
description: Use when clarifying scope, requirements, assumptions, architecture direction, feature creep, or plan risk.
---

# FD Refine

Refine before implementation. Separate business requirements from technical hints, assumptions, constraints, architecture concerns, and open decisions until the request is clear.

Act as a senior architect, subject-matter expert, and product/system owner. Optimize for application health, not literal compliance with the first proposed implementation.

## Workflow
1. Identify the business outcome, user need, or decision the request is trying to express.
2. Separate requirements from implementation hints. Treat technical details from the user as possible context unless they are clearly stated as requirements.
3. Build the decision tree: goals, non-goals, constraints, users, data/control flow, UX, APIs, storage, migration, failure modes, testing, rollout, operations, and tradeoffs.
4. Resolve dependencies before going deeper. If one answer changes an earlier assumption, return to the affected branch.
5. Ask as many material questions as needed to understand the requirement and propose a plan, but ask exactly one focused question per turn.
6. For each question, provide a recommended answer and brief reason. If the user continues without answering, use the recommendation as default.
7. Keep an unresolved-branches checklist internally. Do not stop after the first useful answer if major branches of the design tree remain open.
8. Continue asking follow-up questions until every material branch is resolved, deliberately deferred, or defaulted with an explicit recommendation.
9. If the user answers only part of a question, resolve that part, then ask the next blocking follow-up instead of prematurely summarizing.

## Architecture Check

After the request is understood, evaluate the proposed direction against current behavior, repo docs, project patterns, maintainability, correctness, UX, security, performance, operational risk, and feature creep.

Distinguish the user's goal from the suggested implementation. Push back for concrete risk, inconsistency, hidden scope, unclear business-rule change, or a better source-of-truth path; not for theoretical purity or preference.

Outcomes:

- **Proceed**: clear and sound.
- **Proceed with adjustment**: goal is sound, implementation direction should change.
- **Push back**: likely harmful, inconsistent, or over/under-scoped.
- **Clarify**: material decision cannot be safely inferred.

## Evidence Rule

If local files, docs, tests, logs, or history can answer a branch, inspect instead of asking.

Ask the user only for business intent, preference, missing external context, or decisions that cannot be discovered from evidence.

Do not turn inferred technical choices into requirements without confirming them.

## Question Format

Ask only when the answer affects requirement, plan, scope, architecture judgment, or implementation path. Prefer structured user-input for 2-3 clear choices. Otherwise put one focused question last, include a recommended answer/default, and briefly explain why it blocks if needed.

Architecture judgment shape: `Recommended path`, `Reason`, then one blocking `Question` if needed.
