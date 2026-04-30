---
name: fd-improve-architecture
description: Find deepening opportunities in a codebase, informed by domain language in CONTEXT.md and decisions in docs/adr/. Use when the user wants to improve architecture, find refactoring opportunities, consolidate tightly-coupled modules, or make a codebase more testable and AI-navigable.
---

# FD Improve Architecture

Surface architectural friction and propose deepening opportunities: refactors that turn shallow modules into deep ones.

The goal is testability and AI-navigability.

## Vocabulary

Use the terms in `references/LANGUAGE.md` exactly in every suggestion.

Core terms:

- **Module**: anything with an interface and an implementation.
- **Interface**: everything a caller must know to use the module, including invariants, error modes, ordering, config, and performance characteristics.
- **Implementation**: the code inside a module.
- **Depth**: leverage at the interface. Deep means high leverage. Shallow means the interface is nearly as complex as the implementation.
- **Seam**: where an interface lives; a place behavior can be altered without editing in place.
- **Adapter**: a concrete thing satisfying an interface at a seam.
- **Leverage**: what callers get from depth.
- **Locality**: what maintainers get from depth.

Key principles:

- Apply the deletion test: if deleting a module makes complexity vanish, it was pass-through; if complexity reappears across many callers, it was earning its keep.
- The interface is the test surface.
- One adapter means a hypothetical seam. Two adapters mean a real seam.

## Process

1. Read the project's domain glossary first when present: `CONTEXT.md`, README files, and domain docs near the target area.
2. Read relevant ADRs when present: `docs/adr/`, `docs/ADRs/`, `adr/`, or equivalent project decision records.
3. Explore the codebase organically. Note where understanding one concept requires bouncing between many small modules, where modules are shallow, where tests exist only around extracted pure functions, where tightly-coupled modules leak across seams, and where behavior is hard to test through the current interface.
4. Apply the deletion test to suspected shallow modules.
5. Present a numbered list of deepening opportunities.

For each candidate, include:

- **Files**: involved files or modules.
- **Problem**: why the current architecture causes friction.
- **Solution**: plain-English change.
- **Benefits**: locality, leverage, and test improvement.

Use project domain vocabulary from `CONTEXT.md` when it exists, and architecture vocabulary from `references/LANGUAGE.md`.

If a candidate conflicts with an ADR, surface it only when the friction is real enough to consider reopening the decision. Mark it clearly.

Do not propose final interfaces in the first pass. End by asking: "Which of these would you like to explore?"

## Grilling Loop

Once the user picks a candidate, walk the design tree with them:

- constraints
- dependencies
- deepened module shape
- what sits behind the seam
- which tests survive
- rollout and migration

Ask one question at a time. If the codebase can answer the question, inspect the codebase instead of asking the user.

When decisions crystallize:

- If a deepened module needs a domain term not present in `CONTEXT.md`, offer to add it or create `CONTEXT.md`.
- If a fuzzy term becomes precise, offer to update `CONTEXT.md`.
- If the user rejects a candidate with a load-bearing reason, offer to record it as an ADR so future architecture reviews do not re-suggest it.
- If the user wants alternative interface designs, use `references/INTERFACE-DESIGN.md`.

## References

- `references/LANGUAGE.md`: required vocabulary and principles.
- `references/DEEPENING.md`: dependency categories and testing strategy for deepening work.
- `references/INTERFACE-DESIGN.md`: process for comparing alternative interfaces.
