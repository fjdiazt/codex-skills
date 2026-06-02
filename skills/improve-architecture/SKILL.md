---
name: improve-architecture
description: Use when finding architecture refactors, deepening opportunities, module-boundary issues, testability gaps, or AI-navigability improvements.
---

# FD Improve Architecture

Find architectural friction and refactors that turn shallow modules into deep ones.

## Vocabulary

Use `references/LANGUAGE.md` vocabulary:

- **Module**: interface plus implementation.
- **Interface**: caller knowledge: invariants, errors, ordering, config, performance.
- **Implementation**: code inside a module.
- **Depth**: leverage at the interface; shallow means interface nearly matches implementation complexity.
- **Seam**: interface location where behavior can change without editing in place.
- **Adapter**: concrete thing satisfying an interface at a seam.
- **Leverage**: what callers get from depth.
- **Locality**: what maintainers get from depth.

Principles:

- Deletion test: if deleting a module makes complexity vanish, it was pass-through; if complexity reappears across many callers, it earned its keep.
- The interface is the test surface.
- One adapter means a hypothetical seam. Two adapters mean a real seam.
- Use SOLID and named patterns as diagnostic lenses, not checklists. Prefer project-local patterns; name a pattern only when it reduces interface complexity or improves locality/testability.

## Process

1. Check uncommitted changes first. If present, focus changed files and nearby modules unless scoped elsewhere.
2. If no changes and no target, ask whether to review the whole project or a specific area.
3. Read domain glossary first when present: `CONTEXT.md`, README files, nearby domain docs.
4. Read relevant ADRs when present: `docs/adr/`, `docs/ADRs/`, `adr/`, or equivalent project decision records.
5. Note shallow modules, concept-chasing across many files, tests only around extracted pure functions, leaky seams, and hard-to-test behavior.
6. Apply the deletion test to suspected shallow modules.
7. Consider existing project patterns, SOLID principles, or named patterns only when they clarify a candidate.
8. Present a numbered list of deepening opportunities.

For each candidate: **Status** (`open`, `grilling`, `ready`, `rejected`, `deferred`, `done`), **Strength** (`strong`, `worth exploring`, `speculative`), **Files**, **Problem**, **Solution**, **Benefits** for locality/leverage/tests.

Use project domain vocabulary and `references/LANGUAGE.md`. Surface ADR conflicts only when friction may justify reopening the decision. Do not propose final interfaces in the first pass. End by asking whether to refine one candidate, proceed, or add another angle.

## Optional HTML Report

Default to the numbered list. Offer an HTML report only when the architecture review has enough
complexity that visual before/after diagrams would materially improve the user's decision:

- three or more candidates with cross-cutting dependencies
- call flow, ownership, or deployment shape is difficult to explain in text
- the user needs to compare candidates with different dependency categories or rollout risk
- the user explicitly asks for a visual/report artifact

If offering the report, ask before creating it. If the user accepts, write a self-contained HTML file
to the OS temp directory, not the repo, and use `references/HTML-REPORT.md`.

## Candidate Continuity

Keep the original numbered list stable. Track each candidate status. Do not silently drop, renumber, or replace candidates; append new ones. When pausing or finishing one candidate, return to the list and ask what to do next.

## Grilling Loop

Once the user picks a candidate, walk constraints, dependencies, deepened module shape, seam internals, surviving tests, rollout, and migration.

Ask one question at a time. If code can answer, inspect instead. After resolving or pausing, update status and return to the remaining list.

When decisions crystallize:

- If a needed/fuzzy domain term crystallizes, offer to update or create `CONTEXT.md`.
- If the user rejects a candidate with a load-bearing reason, offer an ADR so future reviews do not re-suggest it.
- If the user wants alternative interface designs, use `references/INTERFACE-DESIGN.md`.

## References

- `references/LANGUAGE.md`: required vocabulary and principles.
- `references/DEEPENING.md`: dependency categories and testing strategy for deepening work.
- `references/INTERFACE-DESIGN.md`: process for comparing alternative interfaces.
- `references/HTML-REPORT.md`: optional visual report format for complex candidate sets.
