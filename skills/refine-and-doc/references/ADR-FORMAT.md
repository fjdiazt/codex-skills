# ADR Format

An ADR is an Architecture Decision Record: a short durable note explaining a significant technical
or architectural decision, the context that made it necessary, and why this path was chosen over
real alternatives. ADRs help future reviews avoid re-litigating decisions whose reasons are not
obvious from code alone.

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

- Architectural shape: monorepo vs split repos, event-sourced write model plus projected read model,
  or a deliberate module/seam layout.
- Integration patterns between contexts: domain events instead of synchronous HTTP, shared IDs only,
  or one context owning data that others reference.
- Technology choices that carry real lock-in: database, message bus, auth provider, deployment
  target, or another choice that would take meaningful work to replace.
- Seam and scope decisions: customer data owned by one context, other contexts reference it by ID
  only, or a chosen interface that deliberately hides internal adapters.
- Deliberate deviations from the obvious path: manual SQL instead of an ORM, no caching despite
  repeated reads, or a synchronous path where async would normally be expected.
- Constraints not visible in code: compliance limits, partner latency contracts, deployment
  restrictions, licensing, or operational constraints.
- Rejected alternatives when the rejection is non-obvious: REST over GraphQL for a specific contract
  reason, Postgres over a document database for transaction guarantees, or declining a refactor
  because an ADR-protected ownership rule matters more.
