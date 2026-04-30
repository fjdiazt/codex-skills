# Language

Shared vocabulary for every suggestion this skill makes. Use these terms exactly. Do not substitute "component", "service", "API", or "boundary".

## Terms

**Module**

Anything with an interface and an implementation. Deliberately scale-agnostic: applies to a function, class, package, or tier-spanning slice. Avoid: unit, component, service.

**Interface**

Everything a caller must know to use the module correctly. Includes the type signature, invariants, ordering constraints, error modes, required configuration, and performance characteristics. Avoid: API, signature.

**Implementation**

What is inside a module: its body of code. Distinct from **Adapter**. A thing can be a small adapter with a large implementation, or a large adapter with a small implementation. Use "adapter" when the seam is the topic; use "implementation" otherwise.

**Depth**

Leverage at the interface: the amount of behavior a caller or test can exercise per unit of interface it must learn. A module is **deep** when a large amount of behavior sits behind a small interface. A module is **shallow** when the interface is nearly as complex as the implementation.

**Seam**

A place where behavior can be altered without editing in that place. The location at which a module's interface lives. Choosing where to put the seam is separate from choosing what goes behind it. Avoid: boundary.

**Adapter**

A concrete thing that satisfies an interface at a seam. Describes role, not substance.

**Leverage**

What callers get from depth. More capability per unit of interface they must learn. One implementation pays back across many call sites and tests.

**Locality**

What maintainers get from depth. Change, bugs, knowledge, and verification concentrate in one place instead of spreading across callers. Fix once, fixed everywhere.

## Principles

- **Depth is a property of the interface, not the implementation.** A deep module can be internally composed of small, swappable parts; those parts just are not part of the interface.
- A module can have **internal seams** private to its implementation and **external seams** at its interface.
- **The deletion test.** Imagine deleting the module. If complexity vanishes, the module was not hiding anything. If complexity reappears across many callers, the module was earning its keep.
- **The interface is the test surface.** Callers and tests cross the same seam.
- **One adapter means a hypothetical seam. Two adapters mean a real seam.** Do not introduce a seam unless something actually varies across it.

## Relationships

- A **Module** has exactly one **Interface**: the surface it presents to callers and tests.
- **Depth** is a property of a **Module**, measured against its **Interface**.
- A **Seam** is where a **Module**'s **Interface** lives.
- An **Adapter** sits at a **Seam** and satisfies the **Interface**.
- **Depth** produces **Leverage** for callers and **Locality** for maintainers.

## Rejected Framings

- **Depth as ratio of implementation lines to interface lines**: rewards padding the implementation. Use depth-as-leverage instead.
- **Interface as a language keyword or public methods only**: too narrow. Interface includes every fact a caller must know.
- **Boundary**: overloaded with DDD bounded context. Say **seam** or **interface**.
