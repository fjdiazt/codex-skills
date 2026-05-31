# Interface Design

When the user wants alternative interfaces for a chosen deepening candidate, use this process. Based on "Design It Twice": the first idea is unlikely to be the best.

Use the vocabulary in `LANGUAGE.md`: **module**, **interface**, **seam**, **adapter**, **leverage**, and **locality**.

## Process

### 1. Frame the Problem Space

Before comparing interface designs, write a user-facing explanation of the problem space:

- constraints any new interface must satisfy
- dependencies it relies on, including categories from `DEEPENING.md`
- a rough illustrative code sketch to ground the constraints

The sketch is not a proposal. It exists to make constraints concrete.

### 2. Generate Alternative Designs

Create at least three radically different interface designs.

Use these design constraints:

- Design 1: minimize the interface; aim for one to three entry points and maximum leverage per entry point.
- Design 2: maximize flexibility; support many use cases and extension.
- Design 3: optimize for the most common caller; make the default case trivial.
- Design 4, when applicable: design around ports and adapters for cross-seam dependencies.

For each design, include:

1. Interface: types, methods, params, invariants, ordering, and error modes.
2. Usage example showing how callers use it.
3. What the implementation hides behind the seam.
4. Dependency strategy and adapters.
5. Tradeoffs: where leverage is high and where it is thin.

### 3. Present And Compare

Present designs sequentially, then compare them in prose.

Contrast by:

- **Depth**: leverage at the interface.
- **Locality**: where change concentrates.
- **Seam placement**: where behavior can vary.

End with a clear recommendation. If pieces from different designs combine well, propose a hybrid.
