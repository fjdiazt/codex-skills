---
name: fd-refine-and-doc
description: Refine a mixed business and technical request against project domain language and documented decisions, then update CONTEXT.md and ADRs inline as decisions crystallize. Use when the user wants requirements refinement plus durable docs, technical discovery with glossary/ADR updates, or says "refine and doc".
---

# FD Refine And Doc

Refine a request before implementation, while keeping project language and architectural decisions documented as they become clear.

Use this when the request mixes business requirements, technical suggestions, domain terminology, and design choices, and the user wants the refined understanding captured in repo docs.

## Workflow

1. Identify the business outcome, user need, and decision under discussion.
2. Separate requirements from implementation hints. Treat technical details as possible context unless clearly stated as requirements.
3. Read existing domain docs before asking questions:
   - root `CONTEXT.md`
   - root `CONTEXT-MAP.md`
   - relevant nested `CONTEXT.md` files
   - `docs/adr/`, `docs/ADRs/`, `adr/`, or equivalent decision records
4. Explore the codebase instead of asking any question the repo can answer.
5. Ask exactly one question at a time, with a recommended answer.
6. Update docs inline when a term, relationship, ambiguity, or durable decision crystallizes.

## Domain Awareness

Most repos have a single context:

```text
/
  CONTEXT.md
  docs/
    adr/
  src/
```

Repos with multiple contexts may have:

```text
/
  CONTEXT-MAP.md
  docs/
    adr/
  src/
    ordering/
      CONTEXT.md
      docs/adr/
    billing/
      CONTEXT.md
      docs/adr/
```

If `CONTEXT-MAP.md` exists, read it to locate the relevant context. If no context doc exists, create one lazily only when the first project-specific term is resolved.

## During Refinement

Challenge against the glossary. If the user uses a term that conflicts with `CONTEXT.md`, call it out immediately and ask which meaning is intended.

Sharpen fuzzy language. If the user uses vague or overloaded terms, propose a precise canonical term.

Discuss concrete scenarios. Use specific edge cases to force clarity around relationships and scope.

Cross-reference with code. When the user states how something works, check whether the code agrees. If code and statement conflict, surface the mismatch.

Do not turn inferred technical choices into requirements without confirming them.

## Documentation Updates

Update `CONTEXT.md` inline when:

- a project-specific term is resolved
- an overloaded term gets a canonical meaning
- a relationship between domain concepts becomes clear
- an ambiguity is resolved

Use `references/CONTEXT-FORMAT.md`.

Do not put general programming concepts or implementation details in `CONTEXT.md`. Include only terms meaningful to domain experts.

Offer ADRs sparingly. Offer an ADR only when all are true:

1. The decision is hard to reverse.
2. The decision is surprising without context.
3. The decision came from a real tradeoff.

Use `references/ADR-FORMAT.md`.

## Question Format

Use this shape:

```text
Question: <one focused question>
Recommended answer: <recommended answer with brief rationale>
```

When the repo can answer a branch, inspect it and report the answer instead of asking.

## References

- `references/CONTEXT-FORMAT.md`: domain glossary format.
- `references/ADR-FORMAT.md`: concise ADR format and when to offer one.
