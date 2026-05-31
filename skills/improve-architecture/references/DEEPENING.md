# Deepening

How to deepen a cluster of shallow modules safely, given its dependencies. Assumes the vocabulary in `LANGUAGE.md`.

## Dependency Categories

### 1. In-Process

Pure computation, in-memory state, no I/O.

Always deepenable. Merge modules and test through the new interface directly. No adapter needed.

### 2. Local-Substitutable

Dependencies with local test stand-ins, such as an in-memory filesystem or local database substitute.

Deepenable if the stand-in exists. Test the deepened module with the stand-in running in the test suite. The seam is internal; no port at the module's external interface.

### 3. Remote But Owned

Owned services across a network seam, such as internal HTTP, gRPC, or queue dependencies.

Define a port at the seam. The deep module owns the logic; transport is injected as an adapter. Tests use an in-memory adapter. Production uses the network adapter.

Recommendation shape:

```text
Define a port at the seam, implement an HTTP adapter for production and an in-memory adapter for testing, so the logic sits in one deep module even though it is deployed across a network.
```

### 4. True External

Third-party dependencies the project does not control.

The deepened module takes the external dependency as an injected port. Tests provide a mock adapter.

## Seam Discipline

- **One adapter means a hypothetical seam. Two adapters mean a real one.** Do not introduce a port unless at least two adapters are justified, typically production and test.
- **Internal seams vs external seams.** A deep module can have internal seams private to its implementation. Do not expose internal seams through the external interface just because tests use them.

## Testing Strategy

Replace, do not layer.

- Old unit tests on shallow modules become waste once tests at the deepened module's interface exist. Delete them.
- Write new tests at the deepened module's interface.
- The interface is the test surface.
- Tests assert observable outcomes through the interface, not internal state.
- Tests should survive internal refactors. They describe behavior, not implementation.
- If a test must change when the implementation changes, it is testing past the interface.
