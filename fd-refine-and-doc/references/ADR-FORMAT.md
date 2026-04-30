# ADR Format

ADRs live in `docs/adr/` by default and use sequential numbering:

```text
0001-slug.md
0002-slug.md
```

Create the ADR directory lazily only when the first ADR is needed.

## Template

```md
# {Short title of the decision}

{One to three sentences: context, decision, and why.}
```

That is enough. The value is recording that a decision was made and why.

## Optional Sections

Only include these when they add genuine value:

- Status frontmatter: `proposed`, `accepted`, `deprecated`, or `superseded by ADR-NNNN`
- Considered Options: only when rejected alternatives are worth remembering
- Consequences: only when non-obvious downstream effects matter

## Numbering

Scan the ADR directory for the highest existing number and increment by one.

## When To Offer An ADR

Offer an ADR only when all are true:

1. **Hard to reverse**: changing course later has meaningful cost.
2. **Surprising without context**: a future reader will wonder why the code does this.
3. **Real tradeoff**: there were genuine alternatives and one was chosen for specific reasons.

Skip the ADR if the decision is easy to reverse, unsurprising, or obvious.

## What Qualifies

- Architectural shape.
- Integration patterns between contexts.
- Technology choices that carry real lock-in.
- Seam and scope decisions.
- Deliberate deviations from the obvious path.
- Constraints not visible in code.
- Rejected alternatives when the rejection is non-obvious.
